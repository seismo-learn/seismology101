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

# 震中距、方位角与反方位角

## 震中距

一般来说，球面上任意两点都可以和球心确定唯一的大圆（*great circle*）。
在大圆上，连接这两点的弧有两条，较短的叫优弧（*minor arc*），较长的叫
劣弧（*major arc*）。

震中距指连接震中和地面上任意一点的优弧的长度。

```{note}
震中距的单位一般为 km 或度（°）。km 常用于近震，度常用于远震。

假设地球是完美球体，半径 $R_0$ 为 6371 km：

$$
1° = \frac{\pi*R_0}{180} km \approx 111.19492 km
$$

$$
1 km = \frac{180}{\pi*R_0}° \approx 0.00899°
$$
```

## 方位角和反方位角

方位角（azimuth，常简写为 azi）是震中到台站的连线与地理北向的顺时针夹角，而反方位角
（back azimuth，常简写为 baz）指台站到震中的连线与地理北向的顺时针夹角。

```{note}
方位角和反方位角一般并不是相差 180°。例如，地震和台站分别位于（0°N，0°E）和（40°N，120°E）
时，方位角约为 46°，反方位角约为 290°，相差 244°。
```

```{image} az-baz.*
:alt: 震中距、方位角、反方位角示意图
:width: 50.0%
:align: center
```

## 理论计算

点击链接下载源代码：{nb-download}`distaz.ipynb` 或 {download}`distaz.md`.

```{code-cell} ipython3
from obspy.geodetics import gps2dist_azimuth, kilometers2degrees
# 事件和台站的经纬度
evla, evlo, stla, stlo = 0, 0, 20, 10
# 计算事件和台站的距离、方位角以及反方位角
dist, az, baz = gps2dist_azimuth(evla, evlo, stla, stlo)
dist /= 1000.0  # 距离单位默认是 m，转换为 km
gcarc = kilometers2degrees(dist)  # 转换为角度
print(dist, gcarc, az, baz)
```

## 参考文档

- [https://service.iris.edu/irisws/rotation/docs/1/help/](https://service.iris.edu/irisws/rotation/docs/1/help/)
