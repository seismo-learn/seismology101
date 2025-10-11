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

去均值是从每个数据点中减去所有数据点的平均值（也称直流分量）。
这一操作旨在消除仪器零点漂移，一般是数据处理的第一步。

首先，我们以 2022 年 9 月 22 日发生在墨西哥的一个 Mw 6.8 级地震为例，申请该地震相关的
波形数据。该地震的基本信息为：

- 发震时刻：2022-09-22 06:16:09 UTC
- 经度：102.9518° W
- 纬度：18.247° N
- 深度：20.0 km
- 震级：mww 6.8

该地震的详细信息见 <https://ds.iris.edu/ds/nodes/dmc/tools/event/11600859>。

```{code-cell} ipython3
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
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
st.plot()
tr = st[0]
#计算处理前后波形均值
mean_before=tr.data.mean()
print(f"处理前均值: {mean_before}")
```

ObsPy 提供了 {meth}`obspy.core.trace.Trace.detrend` 方法可以实现去均值操作。

```{code-cell} ipython3
# 去均值处理
tr.detrend("demean")  
#计算处理前后波形均值
mean_after = tr.data.mean()
print(f"处理后均值: {mean_after}")
```

从前后结果可以看出，虽然原始波形在视觉上不能看到显著的直流分量，但是去均值（demean）操作成功的将原始波形的均值从1060.42变为4e-12，表明已经成功的完成了去均值操作。
