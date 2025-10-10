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
- 最近更新日期: 2025-09-06
- 预计花费时间: 10 分钟

去均值是将每个数据点减去所有数据点的平均值（也称直流分量）。
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
```

接下来，我们使用 ObsPy 的 {meth}`obspy.core.trace.Trace.detrend` 方法进行去均值操作。

```{code-cell} ipython3
tr = st[0]
tr_original = tr.copy()

tr.detrend("demean")  # 去均值处理

# 创建图形以供对比
plt.figure(figsize=(10, 6))

#计算处理前后波形均值
mean_before = tr_original.data.mean()
mean_after = tr.data.mean()

# 绘制去均值前的波形
plt.subplot(2, 1, 1)
plt.plot(tr_original.times(), tr_original.data, color='blue', label='Before Demean')
plt.text(0.5, 0.9, f'Mean Before: {mean_before:.2f}', transform=plt.gca().transAxes, fontsize=10, color='blue')
plt.title('Seismic Waveform Before Demean (2022 Mexico Earthquake)')
plt.ylabel('Amplitude')
plt.legend()
plt.grid(True)

# 绘制去均值后的波形
plt.subplot(2, 1, 2)
plt.plot(tr.times(), tr.data, color='red', label='After Demean')
plt.text(0.5, 0.9, f'Mean After: {mean_after:.2f}', transform=plt.gca().transAxes, fontsize=10, color='red')
plt.title('Seismic Waveform After Demean')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.legend()
plt.grid(True)

# 调整布局并显示图形
plt.tight_layout()
plt.show()
```

从图中可以看出，虽然去均值（demean）操作前后波形几乎没有视觉差异，但是原始波形的均值从1060.42变为0，表明已经成功的完成了去均值操作。
