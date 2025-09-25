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

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）、[姚家园](https://github.com/core-man)（审稿）
- 最近更新日期: 2025-09-12
- 预计花费时间: 20 分钟

---



波形尖灭是一种信号处理方法，具体操作是在一段有限长度的时间序列（如地震记录）的起始和结束部分，应用一个窗函数（例如余弦窗），使其振幅平滑地过渡至零。执行此操作的目的在于抑制因信号截断而引起的频谱泄漏。当对这类时间序列进行离散傅里叶变换（DFT）时，其两端的突变边界会被视为不连续点，从而在频率域中引入并非信号本身固有的虚假高频成分。


在进行波形尖灭之前，我们仍然采用前两节去均值与去线性趋势的2022年墨西哥地震数据。

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


需要注意的时，波形尖灭处理之前要先进行去均值与去线性趋势操作。这里我们复制两份原始波形数据，`st_previous`只进行前两节的去均值和去线性趋势操作，而`st_processed`则额外进行波形尖灭，以此为后续对比作图准备。

```{code-cell} ipython3
#去均值和去线性趋势
st_previous = st.copy()
st_processed = st.copy()

st_previous.detrend('demean')
st_previous.detrend('linear')

st_processed.detrend('demean')
st_processed.detrend('linear')
```

波形尖灭使用`obspy`的`taper`方法，参数选择5%余弦窗口。因为其是一种经验成熟的做法，可以兼顾平滑抑制频谱泄漏与保持波形主要信息的平衡。

```{code-cell} ipython3
# 5%的余弦波形尖灭
st_processed.taper(max_percentage=0.05, type='cosine')
```

最后为了清晰地展示尖灭的作用，我们在图上放大波形的起始和结束部分，以直观地看到振幅是如何被平滑地衰减至零的。

```{code-cell} ipython3
tr_prev = st_original[0]
tr_proc = st_processed[0]
# 尖灭窗口的持续时间（总时长的5%）
times = tr_prev.times()
taper_duration = times[-1] * 0.05

# 绘图对比
fig = plt.figure(figsize=(15, 10))
ax1 = plt.subplot(2, 1, 1)
ax1.plot(times, tr_prev.data, 'k-', label='Previous Waveform(demean + linear)')
ax1.plot(times, tr_proc.data, 'r-', label='Processed (demean + linear + Taper)', alpha=0.8)
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

plt.suptitle("Waveform Tapering", fontsize=16)
plt.tight_layout()
plt.show()

```



可以看到，底部右侧放大图中经过去均值与去线性趋势的波形数据（黑线）在记录的结束处是一个突变的、非零的“硬边界”，而经过尖灭处理的波形（红线）则被平滑地塑造为从零“淡入”并最终“淡出”至零的“软边界”。从而有效抑制了频谱泄漏。