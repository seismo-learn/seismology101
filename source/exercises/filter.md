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

# 滤波

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）
- 最近更新日期: 2025-09-17
- 预计花费时间: 10 分钟

---

在地震学中，滤波是一种信号处理技术，目的是从原始信号中选择性地保留或移除特定频率范围的成分。因为地震记录中不仅包含我们感兴趣的地震波信号，还混杂着各种噪声。

这里数据让人选择 2022 年墨西哥地震波形，其中还包括其仪器响应。

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

然后，按照前几节的步骤，我们进行去均值，去线性趋势，波形尖灭以及去除仪器响应。

```{code-cell} ipython3
st_previous = st[0].copy()
st_processed = st[0].copy()

# 去均值 + 去线性趋势 + 尖灭 + 去响应
st_previous.detrend("demean")
st_previous.detrend("linear")
st_previous.taper(max_percentage=0.05, type="cosine")  
st_previous.remove_response(
    inventory=inventory,
    pre_filt=(0.005, 0.01, 1.0, 5.0),
    output="VEL",       
    water_level=60,     
    plot=False,          
)

st_processed.detrend("demean")
st_processed.detrend("linear")
st_processed.taper(max_percentage=0.05, type="cosine")  
st_processed.remove_response(
    inventory=inventory,
    pre_filt=(0.005, 0.01, 1.0, 5.0),
    output="VEL",       
    water_level=60,     
    plot=False,          
)
```
最后，我们使用 ObsPy 的 {meth}`obspy.core.trace.Trace.filter`函数进行滤波操作。定义一个带通滤波作为例子，由于远震数据中体波频段位于 `0.03 Hz - 2.0 Hz` 。于是我们将带通频率段设置为`0.05 Hz -2.0 Hz`。

```{code-cell} ipython3
# 带通滤波器
# 定义目标频带，例如体波频段
freq_min = 0.05
freq_max = 2
st_processed.filter(
    "bandpass",
    freqmin=freq_min,
    freqmax=freq_max,
    corners=4,
    zerophase=True,
)
```

最后，我们进行绘图对比滤波前后波形。

```{code-cell} ipython3
# 绘图对比结果
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 10), sharex=True)

# 原始波形
ax1.plot(st_previous.times(), st_previous.data, "k-", label="Previous Waveform")
ax1.set_title(f"Previous Waveform - {st_previous.id}")
ax1.set_ylabel("Amplitude")
ax1.legend(loc='upper right')
ax1.grid(True)


# 最终滤波后的波形
ax2.plot(st_processed.times(), st_processed.data, "r-", label="Filtered Waveform")
ax2.set_title(f"Waveform After Bandpass Filter ({freq_min}-{freq_max} Hz)")
ax2.set_xlabel("Time (s)")
ax2.set_ylabel("Velocity (m/s)")
ax2.legend(loc='upper right')
ax2.grid(True)

fig.suptitle("Filtering Comparison (2022 Mexico Earthquake, IU.ANMO.BHZ)", fontsize=16)
plt.tight_layout()
plt.show()
```

滤波后的波形有效去除了低频漂移和高频抖动，将信号能量集中在目标的 `0.1 Hz – 2.0 Hz`频带内，提升了信噪比。
