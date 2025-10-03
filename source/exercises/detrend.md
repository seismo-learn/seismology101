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

- 本节贡献者: {{何星辰}}（作者）、{{田冬冬}}（审稿）、{{姚家园}}（审稿）
- 最近更新日期: 2025-09-07
- 预计花费时间: 10 分钟

---

去线性趋势是指计算能够最佳拟合整个波形数据的一条直线（即趋势线），并从每个数据点中减去该直线对应的值，使波形在一个水平的零基线附近振动。这一操作旨在消除更复杂的长周期趋势，例如由仪器温度变化引起的缓慢漂移，或是大地震后地表永久变形导致的基线跳变。

在此我们同样使用上一节中的 2022 年墨西哥地震波形数据

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
```

去线性趋势之前要先进行去均值操作。这里我们复制两份原始波形数据，`st_previous`只进行上一节的去均值操作，而`st_processed`则额外进行去线性趋势，同时计算处理前后的波形斜率。以此为后续对比作图准备。

```{code-cell} ipython3
tr = st[0]
st_previous = tr.copy()
st_processed = tr.copy()

# 去均值+线性去趋势
st_previous.detrend("demean")
st_processed.detrend("demean")
st_processed.detrend("linear")

time_array = st_previous.times()
# 计算处理前后的斜率和均值
p_before = np.polyfit(time_array, st_previous.data, 1)
p_after = np.polyfit(time_array, st_processed.data, 1)

## 处理前后绘图对比
fig, axes = plt.subplots(nrows=2, ncols=1, figsize=(15, 8), sharex=True)
fig.suptitle('Linear Detrend Comparison (2022 Mexico Earthquake, IU.ANMO.BHZ)', fontsize=16)

# (处理前)
ax1 = axes[0]
ax1.plot(st_previous.times(), st_previous.data, color='blue', label='Previous(demean)')
ax1.text(0.02, 0.95, f'Slope Before: {p_before[0]:.2e}', transform=ax1.transAxes, color='blue')
ax1.set_title('Previous Waveform')
ax1.set_ylabel('Amplitude')
ax1.legend(loc='lower left')
ax1.grid(True)

#  (处理后)
ax2 = axes[1]
ax2.plot(st_processed.times(), st_processed.data, color='red', label='Processed(demean + linear)')
ax2.text(0.02, 0.95, f'Slope After: {p_after[0]:.2e}', transform=ax2.transAxes, color='red')
ax2.set_title('Detrended Waveform')
ax2.set_xlabel('Time (s)')
ax2.set_ylabel('Amplitude')
ax2.legend(loc='lower left')
ax2.grid(True)

plt.tight_layout() 
plt.show()
```

可以看到，通过 ObsPy 的{meth}`obspy.core.trace.Trace.detrend`方法拟合并移除线性趋势后，处理后斜率降至 4.26e-15 ，成功校正基线而不改变地震信号形态。