---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.13.0
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# 分量旋转

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）
- 最近更新日期: 2025-09-17
- 预计花费时间: 20 分钟

---

地震仪通常记录地震波在三个正交方向上的运动：垂直（Z）、北南（N）和东西（E）。但是在野外大多数情况下，由于地形等诸多因素，地震仪的水平分量（如BH1, BH2）在现场安装时只是要求他们正交，所以通常不与正北、正东方向对齐，因此必须首先利用记录在台站元数据中的仪器方位角，将原始的水平分量（$H_1(t), H_2(t)$）旋转到标准的地理坐标系，即南北（$N(t)$）和东西（$E(t)$）方向。

完成这一步校准后，才进行旋转，将地理坐标系转换为更能揭示波动物理性质的ZRT系统。在此系统中，垂直分量（Z）保持不变，而水平分量则根据从台站指向震源的反方位角（baz）旋转为径向（R）和横向（T）分量，其数学变换关系为：

$$
\begin{pmatrix} R(t) \\ T(t) \end{pmatrix} = \begin{pmatrix} \cos(\text{baz}) & \sin(\text{baz}) \\ -\sin(\text{baz}) & \cos(\text{baz}) \end{pmatrix} \begin{pmatrix} N(t) \\ E(t) \end{pmatrix}
$$ 

最终得到的径向分量主要反映P波和SV波的能量，而横向分量则主要包含SH波和Love波的能量，从而实现了不同震相在空间上的分离。

---

首先，我们依旧采用2010年的智利地震数据进行处理。与之前不同的是这里还需要使用`get_events`获取当前地震事件的目录信息，比如发震时刻、震中位置（经纬度）、震源深度和震级等。

```{code-cell} ipython3
import obspy
from obspy.clients.fdsn import Client
from obspy.geodetics import gps2dist_azimuth
import matplotlib.pyplot as plt

# 获取波形数据
client = Client("IRIS")
starttime = obspy.UTCDateTime("2010-02-27T06:30:00")
endtime = starttime + 300 

st = client.get_waveforms(
    network="IU",
    station="ANMO",
    location="00",
    channel="BH*", # 获取BH下的所有分量
    starttime=starttime,
    endtime=endtime
)

# 获取仪器元数据
inventory = client.get_stations(
    network="IU",
    station="ANMO",
    location="00",
    channel="BH*",
    starttime=starttime,
    level="response"
)

# 获取地震事件的目录信息
# 智利地震准确发震时刻
event_time = obspy.UTCDateTime("2010-02-27T06:34:14") 
event = client.get_events(
    starttime=event_time - 3600,
    endtime=event_time + 3600,
    minmagnitude=8.5
)[0]

# 得到台站经纬度等信息
event_origin = event.preferred_origin()
event_lat = event_origin.latitude
event_lon = event_origin.longitude

station_lat = inventory[0][0].latitude
station_lon = inventory[0][0].longitude
```

然后仍然需要延续之前的预处理步骤，完成去均值，去线性趋势，波形尖灭，去除仪器响应和滤波操作。

```{code-cell} ipython3
st_processed.detrend("demean")   # 去均值
st_processed.detrend("linear")   # 去线性趋势
st_processed.taper(max_percentage=0.05, type="cosine")  # 5%余弦尖灭

# 去除仪器响应
pre_filt = (0.005, 0.01, 8.0, 10.0)
st_processed.remove_response(
    inventory=inventory,
    pre_filt=pre_filt,
    output="VEL",
    water_level=60
)

# 带通滤波
freq_min, freq_max = 0.1, 2.0
st_processed.filter(
    "bandpass",
    freqmin=freq_min,
    freqmax=freq_max,
    corners=4,
    zerophase=True
)

```

最后，我们进行分量旋转。首先使用obspy的`gps2dist_azimuth`函数通过震源和台站的坐标，计算出执行旋转所必需的角度。然后使用`rotate`将分量校准到标准地理坐标系后使用`rotate`完成分量旋转。

```{code-cell} ipython3
# 计算旋转角度
dist_m, az, baz = gps2dist_azimuth(
    lat1=event_lat, lon1=event_lon,
    lat2=station_lat, lon2=station_lon
)

# 旋转到 ZNE 
st_processed.rotate(method="->ZNE", inventory=inventory)
st_zne = st_processed.copy()

# 旋转到 ZRT 
st_processed.rotate(method="NE->RT", back_azimuth=baz)

```

最终，我们进行绘图对比分析分量旋转前后的波形。

```{code-cell} ipython3
# 对比旋转前 (ZNE) 和旋转后 (ZRT) 的分量
# 创建一个 3x2 的子图网格
fig, axes = plt.subplots(3, 2, figsize=(18, 12), sharex=True, sharey=True)

# 第1行: Z -> Z
# 第2行: N -> R
# 第3行: E -> T

plot_map = [
    {'before_comp': 'Z', 'before_title': 'Before: Vertical (Z)', 'after_comp': 'Z', 'after_title': 'After: Vertical (Z) - Unchanged'},
    {'before_comp': 'N', 'before_title': 'Before: North (N)',    'after_comp': 'R', 'after_title': 'After: Radial (R)'},
    {'before_comp': 'E', 'before_title': 'Before: East (E)',     'after_comp': 'T', 'after_title': 'After: Transverse (T)'}
]

for i, pmap in enumerate(plot_map):
    # 旋转前 (ZNE) 
    tr_before = st_zne.select(component=pmap['before_comp'])[0]
    axes[i, 0].plot(tr_before.times(reftime=starttime), tr_before.data, "k-", label=pmap['before_comp'])
    axes[i, 0].set_title(pmap['before_title'])
    axes[i, 0].set_ylabel("Velocity (m/s)")
    axes[i, 0].legend(loc='upper right')
    axes[i, 0].grid(True)

    # 旋转后 (ZRT)
    tr_after = st_processed.select(component=pmap['after_comp'])[0]
    axes[i, 1].plot(tr_after.times(reftime=starttime), tr_after.data, "r-", label=pmap['after_comp'])
    axes[i, 1].set_title(pmap['after_title'])
    axes[i, 1].legend(loc='upper right')
    axes[i, 1].grid(True)

# 轴标签
axes[2, 0].set_xlabel(f"Time since {starttime.strftime('%Y-%m-%d %H:%M:%S')} (s)")
axes[2, 1].set_xlabel(f"Time since {starttime.strftime('%Y-%m-%d %H:%M:%S')} (s)")

# 标题
fig.suptitle(f"Component Rotation Comparison: Before (ZNE) vs. After (ZRT)\nFiltered {freq_min}-{freq_max} Hz", fontsize=16)
plt.tight_layout(rect=[0, 0.03, 1, 0.95])
plt.show()
```
从结果对比图上可以看到。旋转前，水平能量混杂在 N、E 分量中，难以区分；旋转后，能量被重新分配到与传播路径对齐的坐标系：绝大部分集中在径向 (R)，横向 (T) 几乎消失。
