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
- 最近更新日期: 2025-11-07
- 预计花费时间: 20 分钟

---
波形尖灭是指在信号首尾施加平滑衰减窗函数，使振幅在两端平滑过渡至零，从而减少截断引起的频谱泄漏。设原始信号为 $x(j)$、窗函数为 $w(j)$，则尖灭后的信号可表示为：

$$
x'(j) = w(j)*x(j),
$$

其中 $w(j)$ 在信号首尾逐渐从 0 过渡到 1，并在中间区域保持为 1，实现波形的尖灭。


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

进行尖灭处理之前，通常先进行去均值、去线性趋势。

```{code-cell} ipython3
tr = st[0]

# 去均值 + 去趋势
tr.detrend("demean")
tr.detrend("linear")

# 为了让示例更直观，选取较短的时间窗（400–700 s）
tr = tr.copy()
tr.trim(tr.stats.starttime + 400, tr.stats.starttime + 700)

tr_prev = tr.copy()   # 尖灭前波形（黑）
tr_proc = tr.copy()   # 尖灭后波形（红）
```

波形尖灭可使用 ObsPy 的 {meth}`obspy.core.trace.Trace.taper` 实现。

本例为了演示更明显，使用 10% 的余弦窗（`max_percentage=0.1`）；实际处理中更常用 5%（`0.05`）。

```{code-cell} ipython3
# 为使结果此处演示结果更明显，使用10% 的余弦窗尖灭；实际常用 5%
tr_proc.taper(max_percentage=0.1, type='cosine')
```

接下来，用一张图直接对比尖灭前后的波形：黑色为经过去均值，去趋势后的波形，红色为尖灭操作后的结果。

```{code-cell} ipython3
times = tr_prev.times()

plt.figure(figsize=(10, 4))
plt.plot(times, tr_prev.data, 'k-', label='Original (demean + linear)')
plt.plot(times, tr_proc.data, 'r-', label='Tapered (+ cosine 10%)', alpha=0.85)
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.title('Tapering Comparison (short window 100–200 s)')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
```

可以看到，原始波形（黑）在截断处存在“硬边界”，而尖灭后（红）两端平滑过渡至零，能有效抑制频谱泄漏。

