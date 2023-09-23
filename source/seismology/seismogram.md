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

# 地震图

- 本节贡献者: {{ 田冬冬 }}（作者）、{{ 姚家园 }}（作者）
- 最近更新日期: 2023-03-01
- 预计阅读时间: 30 分钟

---

地震图（seismogram）是指地震仪记录到的带有计时信息的地面质点运动（位移、速度、加速度、转动等），
一般也称为地震波形（seismic waveform）或波形（waveform）。

地震图本质上是一个时间序列。一般有三个正交分量，如南北、东西和垂直分量。

从信号处理的角度来说，整个地球可以当做一个线性时不变系统。地震仪记录到的地震图 $U(t)$
可以视作震源项 $S(t)$、结构项 $G(t)$ 和仪器项 $I(t)$ 卷积得到，即

$$
U(t) = S(t)*G(t)*I(t)
$$

因此，地震图中包含了震源、结构以及仪器的信息。一般而言，仪器项（即仪器响应）是已知的，
地震学通过解读地震图即可获得震源属性和地下结构的相关信息。

```{code-cell} ipython3
from obspy.clients.syngine import Client
client = Client()
```

## 地方震地震图

## 近震地震图

## 远震地震图

```{code-cell} ipython3
st = client.get_waveforms(
        model="ak135f_1s",
        sourcelatitude=0,
        sourcelongitude=0,
        sourcedepthinmeters=100*1000,
        receiverlatitude=0,
        receiverlongitude=50,
        sourcedoublecouple=(30, 50, 70),
        starttime="P-50"
)
st.plot();
```


:::{figure} teleseismic-waveform.png
:align: center
:alt: "远震地震图示例"
:width: 95%

远震地震图中的地震震相及射线路径。
引自《[An Introduction to Seismology, Earthquakes, and Earth Structure]》
图 1.1-3。
:::

[An Introduction to Seismology, Earthquakes, and Earth Structure]: https://www.wiley.com/en-us/An+Introduction+to+Seismology%2C+Earthquakes%2C+and+Earth+Structure-p-9780865420786
