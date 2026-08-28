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

- 本节贡献者: {{何星辰}}、{{田冬冬}}
- 最近更新日期: 2025-12-22
- 预计花费时间: 10 分钟

---

在地震学中，滤波是一种信号处理技术，目的是从原始信号中选择性地保留或移除特定频率范围的成分。因为地震记录中不仅包含我们感兴趣的地震波信号，还混杂着各种噪声。

我们以前一节使用的 2022 年 9 月 22 日墨西哥 Mw 6.8 地震在 ANMO 台站的波形为例。

```{code-cell} ipython3
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt

client = Client("IRIS") 

# 下载 2022 年墨西哥 Mw 6.8 级地震在 ANMO 台站的波形数据(选择 400–700 s 时间窗)
origin_time = UTCDateTime("2022-09-22T06:18:00")
starttime = origin_time + 400
endtime = origin_time + 700
st = client.get_waveforms(
    network="IU",
    station="ANMO", 
    location="00", 
    channel="BHZ",
    starttime=starttime, 
    endtime=endtime,
)
st.plot();
```

进行滤波处理之前，通常先进行去均值、去线性趋势和尖灭操作。

```{code-cell} ipython3
tr = st[0]

# 去均值 + 去趋势 + 尖灭
tr.detrend("demean")
tr.detrend("linear")
tr.taper(max_percentage=0.1, type="hann")

tr_origin = tr.copy()   # 备份原始波形
```

滤波可以使用 ObsPy 的 {meth}`obspy.core.trace.Trace.filter`函数实现。由于远震数据中体波频段位于 `0.03 Hz - 2.0 Hz` ，所以我们将带通频率段设置为`0.05 Hz -2.0 Hz`。

```{code-cell} ipython3
#滤波
tr.filter("bandpass", freqmin=0.05, freqmax=2.0)
```

滤波后的波形有效去除了低频漂移和高频抖动，将信号能量集中在目标的 `0.05 Hz – 2.0 Hz`频带内，提升了信噪比。

```{code-cell} ipython3
plt.figure(figsize = (10, 4))
plt.plot(tr_origin.times(), tr_origin.data, 'k-', label='Original')
plt.plot(tr.times(), tr.data, 'r-', label='Filtered', alpha=0.85)
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.title('Filtering Comparison')
plt.legend()
plt.show()
```