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


# 去均值

- 本节贡献者: {{何星辰}}、{{田冬冬}}、{{姚家园}}
- 最近更新日期: 2025-10-11
- 预计花费时间: 10 分钟

去均值是从每个数据点中减去所有数据点的平均值（也称直流分量），这一操作旨在消除仪器零点漂移，一般是数据处理的第一步。

我们以 2022 年 9 月 22 日发生在墨西哥的一个 Mw 6.8 级地震为例，该地震的详细信息见 <https://earthquake.usgs.gov/earthquakes/eventpage/us7000ia36>。

使用 ObsPy 提供的 {meth}`Client.get_waveforms() <obspy.clients.fdsn.client.Client.get_waveforms>` 方法下载
该地震在 ANMO 台站的事件波形资料。

```{code-cell} ipython3
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt

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

ObsPy 提供了 {meth}`obspy.core.trace.Trace.detrend` 方法可以实现去均值操作。

```{code-cell} ipython3
tr = st[0]
print(f"Mean value before demean: {tr.data.mean()}")

# 去均值处理
tr.detrend("demean")  

print(f"Mean value after demean: {tr.data.mean()}")
```

虽然原始波形在视觉上观察不到显著的直流分量，但是去均值（demean）操作成功地
将原始波形的均值从 1060.42 变为 4.04e-12，表明已经完成了去均值操作。
