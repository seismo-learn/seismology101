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

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）
- 最近更新日期: 2025-09-14
- 预计花费时间: 15 分钟

---

仪器响应是地震仪系统（包括传感器和记录器）将真实地表运动信号转换为数字记录的传递函数，反映了仪器对输入信号的系统性滤波效应。在数学上，记录波形 D(t)  是真实地表运动 G(t)与仪器响应函数 I(t) 的卷积，即

$$D(t) = G(t) * I(t)$$

其中，I(t) 描述了仪器如何根据信号频率改变振幅和相位。因此，观测到的波形  D(t) 并非真实的地表运动 G(t) ，而是经过仪器响应“调制”后的结果，需通过反卷积校正以恢复真实信号。

---

显而易见，去除仪器响应的方法就是反卷积，我们可以使用ObsPy的`remove_response`方法进行处理。

同样，我们使用之前去均值与去线性趋势中一样的数据，但是不同的是，我们需要同时获取其对应的仪器元数据。随机便可以进行去除仪器响应并绘图对比。


```{code-cell} ipython3
import obspy
from obspy.clients.fdsn import Client
import matplotlib.pyplot as plt

# 2010年智利大地震的数据
client = Client("IRIS")
starttime = obspy.UTCDateTime("2010-02-27T06:30:00")
endtime = starttime + 300  

st = client.get_waveforms(
    network="IU",
    station="ANMO",
    location="00",
    channel="BHZ",
    starttime=starttime,
    endtime=endtime
)

# 获取对应的仪器元数据
# 使用与波形数据相同的参数来获取元数据
# level='response' 是获取完整仪器响应信息的关键
inventory = client.get_stations(
    network="IU",
    station="ANMO",
    location="00",
    channel="BHZ",
    starttime=starttime,
    level="response"  # 必须指定此参数以获取响应数据
)




tr = st[0]
tr_corr = tr.copy()

# 定义一个预滤波器，这对于稳定反卷积过程至关重要
# 频带应选择在仪器的平坦响应区内
pre_filt = (0.005, 0.01, 1.0, 5.0)

# 去除仪器响应
tr_corr.remove_response(
    inventory=inventory,
    pre_filt=pre_filt,
    output="VEL",       # 指定输出为速度 (m/s)
    water_level=60,     # 设置水准则为60 dB
    plot=False          # 设置为True可以显示反卷积过程的频谱图
)


# 绘图对比结果
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 8), sharex=True)

# 绘制去除仪器响应前的波形
ax1.plot(tr.times(), tr.data, "k-", label="Original Waveform")
ax1.set_title(f"Original Waveform - {tr.id}")
ax1.set_ylabel("Counts")
ax1.legend(loc='upper right')
ax1.grid(True)

# 绘制去除仪器响应后的波形
ax2.plot(tr_corr.times(), tr_corr.data, "r-", label="Corrected Waveform") 
ax2.set_title(f"After Instrument Response Removal - {tr_corr.id}")
ax2.set_xlabel("Time (s)")
ax2.set_ylabel("Velocity (m/s)")
ax2.legend(loc='upper right')
ax2.grid(True)

fig.suptitle("2010 Chile Earthquake in Removing Response", fontsize=16)
plt.tight_layout()
plt.savefig("response.png")
plt.show()
```


---

从图上可以去除前的波形单位是未经校正的数字量，其振幅和形态均受到仪器自身频率响应的严重影响，因此不具备直接的物理意义和可比性。而去除仪器响应后的波形单位已成功转换为$Velocity (m/s)$，恢复了地面的真实运动速度。