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

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）
- 最近更新日期: 2025-09-12
- 预计花费时间: 30 分钟

---



波形尖灭是一种信号处理方法，具体操作是在一段有限长度的时间序列（如地震记录）的起始和结束部分，应用一个窗函数（例如余弦窗），使其振幅平滑地过渡至零。执行此操作的根本目的在于抑制因信号截断而引起的频谱泄漏。当对这类时间序列进行离散傅里叶变换（DFT）时，其两端的突变边界会被视为不连续点，从而在频率域中引入并非信号本身固有的虚假高频成分。因此，尖灭处理通过有效减弱这种边界效应，成为确保频率域分析准确性的关键预处理步骤。


在进行波形尖灭之前，我们仍然采用前两节去均值与去线性趋势的2010智利地震数据。

```{code-cell} ipython3
import obspy
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt

client = Client("IRIS")
starttime = obspy.UTCDateTime("2010-02-27T06:30:00")
endtime = starttime + 300

st = client.get_waveforms(
    network="IU",
    station="ANMO", 
    location="00", 
    channel="BHZ",
    starttime=starttime, 
    endtime=endtime)
```


需要注意的时，波形尖灭处理之前要先进行去均值与去线性趋势操作。

```{code-cell} ipython3
st_original = st.copy()
st_processed = st.copy()

#去均值和去线性趋势
st_processed.detrend('demean')
st_processed.detrend('linear')

```

这里我们使用`taper`，参数选择5%余弦窗口。因为其是一种经验成熟的做法，可以兼顾平滑抑制频谱泄漏与保持波形主要信息的平衡。

```{code-cell} ipython3
# 5%的余弦波形尖灭
st_processed.taper(max_percentage=0.05, type='cosine')
```

最后为了清晰地展示尖灭的作用，我们在图上放大波形的起始和结束部分，以直观地看到振幅是如何被平滑地衰减至零的。

```{code-cell} ipython3
tr_orig = st_original[0]
tr_proc = st_processed[0]
# 尖灭窗口的持续时间（总时长的5%）
times = tr_orig.times()
taper_duration = times[-1] * 0.05

# 绘图对比
fig = plt.figure(figsize=(15, 10))
ax1 = plt.subplot(2, 1, 1)
ax1.plot(times, tr_orig.data, 'k-', label='Original Waveform')
ax1.plot(times, tr_proc.data, 'r-', label='Processed (Detrend + Taper)', alpha=0.8)
ax1.set_title('Full Waveform Comparison')
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
ax2.plot(times, tr_orig.data, 'k-', label='Original')
ax2.plot(times, tr_proc.data, 'r-', label='Tapered')
ax2.set_title('Zoom-in: Start of Waveform')
ax2.set_xlabel('Time (s)')
ax2.set_ylabel('Amplitude')
ax2.set_xlim(0, taper_duration * 1.5) # 显示尖灭区域及稍后部分
ax2.legend()
ax2.grid(True)

# 结束段
ax3 = plt.subplot(2, 2, 4)
ax3.plot(times, tr_orig.data, 'k-', label='Original')
ax3.plot(times, tr_proc.data, 'r-', label='Tapered')
ax3.set_title('Zoom-in: End of Waveform')
ax3.set_xlabel('Time (s)')
ax3.set_ylabel('Amplitude')
ax3.set_xlim(times[-1] - (taper_duration * 1.5), times[-1]) # 显示尖灭区域及稍前部分
ax3.legend()
ax3.grid(True)

plt.suptitle("Waveform Tapering", fontsize=16)
plt.tight_layout()
plt.show()

```



可以看到，底部两张放大图中原始波形（黑线）在记录的起始和结束处都是一个突变的、非零的“硬边界”，而经过尖灭处理的波形（红线）则被平滑地塑造为从零“淡入”并最终“淡出”至零的“软边界”。从而有效抑制了频谱泄漏。