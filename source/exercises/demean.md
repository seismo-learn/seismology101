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

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）
- 最近更新日期: 2025-09-06
- 预计花费时间: 10 分钟

去均值是指计算波形数据的平均值（即直流分量或DC offset），
并从每个数据点中减去该平均值，使波形围绕零点振动。
这一操作旨在消除仪器零点漂移，
为后续处理（如傅里叶变换、滤波或积分）奠定基础，
避免因直流分量导致的失真或错误




首先，我们使用ObsPy 下载一个2010年智利地震波形数据作为示例。

```{code-cell} ipython3
import obspy
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt

client = Client("IRIS") 

# 定义时间范围（2010年智利地震）
starttime = obspy.UTCDateTime("2010-02-27T06:30:00")
endtime = starttime + 300  # 下载5分钟数据

# 下载地震数据
# 以IU网络的ANMO台站为例
st = client.get_waveforms(
    network="IU",
    station="ANMO", 
    location="00", 
    channel="BHZ",
    starttime=starttime, 
    endtime=endtime)
    
# 保存波形图片
st.plot(outfile="demean-1.png")
```


---

接下来，我们使用ObsPy的 `demean` 方法进行去均值操作。

```{code-cell} ipython3
tr = st[0]
tr_original = tr.copy()

tr.detrend("demean")  # 去均值处理

# 创建图形以供对比
plt.figure(figsize=(10, 6))

# 绘制去均值前的波形
plt.subplot(2, 1, 1)
plt.plot(tr_original.times(), tr_original.data, color='blue', label='Before Demean')
plt.title('Seismic Waveform Before Demean (2010 Chile Earthquake)')
plt.ylabel('Amplitude')
plt.legend()
plt.grid(True)

# 绘制去均值后的波形
plt.subplot(2, 1, 2)
plt.plot(tr.times(), tr.data, color='red', label='After Demean')
plt.title('Seismic Waveform After Demean')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.legend()
plt.grid(True)

# 调整布局并显示图形
plt.savefig("demean-2.png")
plt.tight_layout()
plt.show()
```

去均值操作的结果如图所示：
原始地震波形（蓝色）存在显著的负向直流分量，
整体振动围绕约-49000的基线，而非零点。
经过ObsPy的`detrend("demean")`处理后，
红色波形显示直流分量被完全移除，
波形以零点为中心上下振动，成功校正基线，
同时保留了地震信号的原始形态。