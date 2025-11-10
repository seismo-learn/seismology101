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

# 去仪器响应

- 本节贡献者: {{何星辰}}、{{田冬冬}}
- 最近更新日期: 2025-11-10
- 预计花费时间: 15 分钟

---

地震仪的仪器响应描述了地面运动信号在经过地震仪各处理环节后频率特性的综合变化。地震信号依次经历模拟信号、模数转换和数字处理三个阶段，每个阶段都有对应的频率响应函数$G_i(f)$，整个仪器的总响应为各阶段响应的乘积 :

$$G(f) = \prod_i G_i(f)$$

以用于表征地震仪从地面运动到数字波形数据的完整传递特性。

而去除仪器响应，即利用已知的$G_i(f)$对观测波形进行校正，从而恢复反映真实地面运动的信号。

---

我们以前一节使用的 2022 年 9 月 22 日墨西哥 Mw 6.8 地震在 ANMO 台站的波形为例。但是不同的是，我们需要同时获取其对应的仪器元数据。以便可以进行去除仪器响应并对比。

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

# 获取对应的仪器响应（level='response'）
inventory = client.get_stations(
    network="IU",
    station="ANMO",
    location="00",
    channel="BHZ",
    starttime=starttime,
    level="response",  # 必须指定此参数以获取响应数据
)
st.plot();
```

进行去除仪器响应之前，通常先进行去均值、去线性趋势、波形尖灭。

```{code-cell} ipython3
tr = st[0]

# 去均值 + 去趋势 + 波形尖灭
tr.detrend("demean")
tr.detrend("linear")
tr.taper(max_percentage=0.05, type="hann")

tr_origin = tr.copy()   # 备份原始波形
```

去除仪器响应可以使用 ObsPy 的 {meth}`obspy.core.trace.Trace.remove_response` 实现。

```{code-cell} ipython3
# 定义一个预滤波器，这对于稳定反卷积过程至关重要
# 频带应选择在仪器的平坦响应区内
pre_filt = (0.005, 0.01, 1.0, 5.0)

# 去除仪器响应
tr.remove_response(
    inventory=inventory,
    pre_filt=pre_filt,
    output="VEL",       # 指定输出为速度 (m/s)
    water_level=60,     # 设置水准则为60 dB
    plot=False,          # 设置为True可以显示反卷积过程的频谱图
)
```
可以看到，下图中去除前的波形为未经校正的原始数字振幅，受仪器频率响应影响较大，缺乏物理意义和可比性；去除仪器响应后，波形被转换为 ( Velocity (m/s) )，恢复了地面的真实运动速度。

```{code-cell} ipython3
# 绘图对比结果
fig, axs = plt.subplots(2, 1, figsize=(10, 6), sharex=True)
axs[0].plot(tr_origin.times(), tr_origin.data, "k-",)
axs[0].set_ylabel("Counts")
axs[0].set_title(f"Before remove_response")
axs[0].grid(True, alpha=0.3)

axs[1].plot(tr.times(), tr.data, "r-")
axs[1].set_xlabel("Time (s)")
axs[1].set_ylabel("Velocity (m/s)")
axs[1].set_title("After remove_response")
axs[1].grid(True, alpha=0.3)

plt.show()
```