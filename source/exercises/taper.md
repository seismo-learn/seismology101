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

# 波形尖灭

- 本节贡献者: {{何星辰}}、{{田冬冬}}、{{姚家园}}
- 最近更新日期: 2025-10-22
- 预计花费时间: 20 分钟

---
波形尖灭是指在信号首尾施加平滑衰减窗函数，使振幅在两端平滑过渡至零，从而减少截断引起的频谱泄漏。设原始信号为 $x(j)$、窗函数为 $w(j)$，则尖灭后的信号可表示为：

$$
x'(j) = w(j)*x(j),
$$

其中 $w(j)$ 在信号首尾逐渐从 0 过渡到 1，并在中间区域保持为 1，实现波形的尖灭。


下表给出了常用的三种尖灭窗函数及其参数：

| 类型 | $\omega$ | $F_0$ | $F_1$ |
|:----:|:----------:|:-----:|:-----:|
| HANNING | $\frac{\pi}{N}$ | 0.50 | 0.50 |
| HAMMING | $\frac{\pi}{N}$ | 0.54 | 0.46 |
| COSINE  | $\frac{\pi}{2N}$ | 1.00 | 1.00 |

:::{figure} taper-functions.png
:align: center
:alt: "taper 衰减函数曲线"
:width: 95%

taper 衰减函数曲线。
引自[SAC中文手册](https://seisman.github.io/SAC_Docs_zh/commands/taper/)
图 25。
:::

图中可以看出，hamming 窗实际上并没有完全实现尖灭

我们以前一节使用的 2022 年 9 月 22 日墨西哥 Mw 6.8 地震在 ANMO 台站的波形为例。

```{code-cell} ipython3
from obspy import UTCDateTime
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt
from numpy.polynomial import polynomial as P

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

进行去波形尖灭处理之前，通常需要先进行去均值、去线性趋势操作。

```{code-cell} ipython3
tr = st[0]

# 去均值 + 去趋势
tr.detrend("demean")
tr.detrend("linear")

# 创建副本
tr_prev = tr.copy()  # 尖灭前波形
tr_proc = tr.copy()  # 尖灭后波形
```

波形尖灭使用 ObsPy 的{meth}`obspy.core.trace.Trace.taper`方法，参数选择 5% 余弦窗口以用作示例。

```{code-cell} ipython3
# 5%的余弦波形尖灭
tr_proc.taper(max_percentage=0.05, type='cosine')
```

最后为了清晰地展示尖灭的作用，我们在图上放大波形的起始和结束部分，以直观地看到振幅是如何被平滑地衰减至零的。

```{code-cell} ipython3
# 尖灭窗口的持续时间（总时长的5%）
times = tr_prev.times()
taper_duration = times[-1] * 0.05

# 绘图对比
fig = plt.figure(figsize=(15, 10))
ax1 = plt.subplot(2, 1, 1)
ax1.plot(times, tr_prev.data, 'k-', label='Previous Waveform(demean + linear)')
ax1.plot(times, tr_proc.data, 'r-', label='Processed (demean + linear + Taper)', alpha=0.8)
ax1.set_xlabel('Time (s)')
ax1.set_ylabel('Amplitude')
ax1.legend()
ax1.grid(True)

# 标记出将要放大的区域
ax1.axvspan(0, taper_duration, color='blue', alpha=0.2, label='Zoom Area')
ax1.axvspan(times[-1] - taper_duration, times[-1], color='blue', alpha=0.2)

# 放大波形两端，突出尖灭效果
# 起始段
ax2 = plt.subplot(2, 2, 3)
ax2.plot(times, tr_prev.data, 'k-', label='Previous')
ax2.plot(times, tr_proc.data, 'r-', label='Tapered')
ax2.set_title('Zoom-in: Start of Waveform')
ax2.set_xlabel('Time (s)')
ax2.set_ylabel('Amplitude')
ax2.set_xlim(0, taper_duration * 1.5) # 显示尖灭区域及稍后部分
ax2.legend()
ax2.grid(True)

# 结束段
ax3 = plt.subplot(2, 2, 4)
ax3.plot(times, tr_prev.data, 'k-', label='Previous')
ax3.plot(times, tr_proc.data, 'r-', label='Tapered')
ax3.set_title('Zoom-in: End of Waveform')
ax3.set_xlabel('Time (s)')
ax3.set_ylabel('Amplitude')
ax3.set_xlim(times[-1] - (taper_duration * 1.5), times[-1]) # 显示尖灭区域及稍前部分
ax3.legend()
ax3.grid(True)

plt.suptitle("Tapering Comparison (2022 Mexico Earthquake, IU.ANMO.BHZ)", fontsize=16)
plt.tight_layout()
plt.show()
```

可以看到，底部右侧放大图中经过去均值与去线性趋势的波形数据（黑线）在记录的结束处是一个突变的、非零的“硬边界”，而经过尖灭处理的波形（红线）则被平滑地塑造为从零“淡入”并最终“淡出”至零的“软边界”。从而有效抑制了频谱泄漏。

