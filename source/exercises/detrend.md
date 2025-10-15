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

# 去线性趋势

- 本节贡献者: {{何星辰}}、{{田冬冬}}、{{姚家园}}
- 最近更新日期: 2025-10-15
- 预计花费时间: 20 分钟

---

去线性趋势是指计算出一条最能拟合整个波形数据的直线（即趋势线），并从每个数据点中减去该直线对应的值，
使波形围绕稳定的零基线振动。此操作用于去除由温度变化或地壳形变等因素造成的缓慢漂移与基线偏移。

我们以 2022 年 9 月 22 日发生在墨西哥的一个 Mw 6.8 级地震为例，该地震的详细信息见 <https://earthquake.usgs.gov/earthquakes/eventpage/us7000ia36>。

使用 ObsPy 提供的 {meth}`Client.get_waveforms() <obspy.clients.fdsn.client.Client.get_waveforms>` 方法下载
该地震在 ANMO 台站的事件波形资料。

```{code-cell} ipython3
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt
import numpy as np

client = Client("IRIS") 

# 下载 2022 年墨西哥 Mw 6.8 级地震在 ANMO 台站的波形数据
starttime = UTCDateTime("2022-09-22T06:18:00")
endtime = starttime + 720  # 下载 12 分钟数据
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

ObsPy 提供了 {meth}`obspy.core.trace.Trace.detrend` 方法可以实现去线性趋势操作。
但是在去线性趋势之前要我们需要先进行去均值操作。

```{code-cell} ipython3
tr = st[0]
st_previous = tr.copy()
st_processed = tr.copy()

# 去均值
tr.detrend("demean")

#计算去线性趋势前的斜率
time_array = tr.times()
p_before = np.polyfit(time_array, tr.data, 1)

# 去线性趋势
tr.detrend("linear")

# 计算去线性趋势处理后的斜率
p_after = np.polyfit(time_array, tr.data, 1)
print(f"Slope before linear detrend: {p_before[0]}")
print(f"Slope after linear detrend: {p_after[0]}")
```

可以看到，针对去均值后的波形，其斜率从 -1.15 降至 4.26e-15，说明 detrend 方法已成功校正基线而未改变地震信号的整体形态。
