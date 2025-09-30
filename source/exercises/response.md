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

# 去仪器响应

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）
- 最近更新日期: 2025-09-14
- 预计花费时间: 15 分钟

---

仪器响应是地震仪系统（包括传感器和记录器）将真实地表运动信号转换为数字记录的传递函数，反映了仪器对输入信号的系统性滤波效应。在数学上，记录波形 D(t)  是真实地表运动 G(t) 与仪器响应函数 I(t) 的卷积，即

$$D(t) = G(t) * I(t)$$

其中，I(t) 描述了仪器如何根据信号频率改变振幅和相位。因此，观测到的波形  D(t) 并非真实的地表运动 G(t) ，而是经过仪器响应“调制”后的结果，需通过反卷积校正以恢复真实信号。

---

显而易见，去除仪器响应的方法就是反卷积同样，我们使用前几节一样的数据，但是不同的是，我们需要同时获取其对应的仪器元数据。以便可以进行去除仪器响应并绘图对比。

```{code-cell} ipython3
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
import numpy as np
import matplotlib.pyplot as plt

client = Client("IRIS") 

# 定义时间范围（2022年墨西哥Mw 6.8 级地震）
starttime = UTCDateTime("2022-09-22T06:18:00")
endtime = starttime + 720  # 下载12分钟数据

# 下载地震数据
st = client.get_waveforms(
    network="IU",
    station="ANMO", 
    location="00", 
    channel="BHZ",
    starttime=starttime, 
    endtime=endtime,
)    

# 获取对应的仪器元数据
# 使用与波形数据相同的参数来获取元数据
# level='response' 是获取完整仪器响应信息的关键
inventory = client.get_stations(
    network="IU",
    station="ANMO",
    location="00",
    channel="BHZ",
    starttime=starttime,
    level="response",  # 必须指定此参数以获取响应数据
)
```

获得数据后，我们仍然按照之前的步骤进行去均值，去线性趋势以及波形尖灭。

```{code-cell} ipython3
st_previous = st[0].copy()
st_processed = st[0].copy()

# 去均值 + 去线性趋势 + 尖灭
st_previous.detrend("demean")
st_previous.detrend("linear")
st_previous.taper(max_percentage=0.05, type="cosine")  

st_processed.detrend("demean")
st_processed.detrend("linear")
st_processed.taper(max_percentage=0.05, type="cosine")  
```
---

处理完成后，我们使用使用 ObsPy 的{meth}`obspy.core.trace.Trace.remove_response`方法进行去除仪器响应。

```{code-cell} ipython3
# 定义一个预滤波器，这对于稳定反卷积过程至关重要
# 频带应选择在仪器的平坦响应区内
pre_filt = (0.005, 0.01, 1.0, 5.0)

# 去除仪器响应
st_processed.remove_response(
    inventory=inventory,
    pre_filt=pre_filt,
    output="VEL",       # 指定输出为速度 (m/s)
    water_level=60,     # 设置水准则为60 dB
    plot=False,          # 设置为True可以显示反卷积过程的频谱图
)
```
完成后，便可以进行绘图对比去除仪器响应前后的波形。

```{code-cell} ipython3
# 绘图对比结果
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 8), sharex=True)

# 绘制去除仪器响应前的波形
ax1.plot(st_previous.times(), st_previous.data, "k-", label="Previous Waveform")
ax1.set_title(f"Previous Waveform - {st_previous.id}")
ax1.set_ylabel("Counts")
ax1.legend(loc='upper right')
ax1.grid(True)

# 绘制去除仪器响应后的波形
ax2.plot(st_processed.times(), st_processed.data, "r-", label="Processed Waveform") 
ax2.set_title(f"After Instrument Response Removal - {st_processed.id}")
ax2.set_xlabel("Time (s)")
ax2.set_ylabel("Velocity (m/s)")
ax2.legend(loc='upper right')
ax2.grid(True)

fig.suptitle("Response Removal Comparison (2022 Mexico Earthquake, IU.ANMO.BHZ)", fontsize=16)
plt.tight_layout()
plt.show()
```

---

从图上可以去除前的波形单位是未经校正的仪器记录到的原始数字振幅，其振幅和形态均受到仪器自身频率响应的严重影响，因此不具备直接的物理意义和可比性。而去除仪器响应后的波形单位已成功转换为 $Velocity (m/s)$ ，恢复了地面的真实运动速度。