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

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）、[姚家园](https://github.com/core-man)（审稿）
- 最近更新日期: 2025-09-06
- 预计花费时间: 10 分钟

去均值是指计算波形数据的平均值（也称直流分量），
并从每个数据点中减去该平均值。
这一操作旨在消除仪器零点漂移，一般是数据处理的第一步。




首先，我们使用ObsPy 下载一个2022年墨西哥地震波形数据作为示例。

```{code-cell} ipython3
import obspy
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt

client = Client("IRIS") 

# 定义时间范围（2022年墨西哥Mw 6.8 级地震）
starttime=obspy.UTCDateTime("2022-09-22T06:18:00")
endtime = starttime + 720  # 下载12分钟数据

# 下载地震数据
st = client.get_waveforms(
    network="IU",
    station="ANMO", 
    location="00", 
    channel="BHZ",
    starttime=starttime, 
    endtime=endtime)
    
```


---

接下来，我们使用ObsPy的 `demean` 方法进行去均值操作。

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

