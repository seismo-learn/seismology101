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

震中距、方位角和反方位角是由地震和台站位置决定的参数，其在地震数据筛选和分析中
经常会用到。

## 震中距

一般来说，球面上任意两点都可以和球心确定唯一的大圆（*great circle*）。
在大圆上，连接这两点的弧有两条，较短的叫优弧（*minor arc*），较长的叫
劣弧（*major arc*）。

震中距是震中与台站位置沿大圆弧的连线的优弧的长度。

```{note}
震中距的单位一般为 km 或度（°）。km 常用于近震，度常用于远震。

假设地球是完美球体，半径 $R_0$ 为 6371 km：

$$ 1° = \frac{\pi*R_0}{180} km \approx 111.19492 km $$

$$ 1 km = \frac{180}{\pi*R_0}° \approx 0.00899° $$
```

## 方位角和反方位角

方位角（azimuth，常简写为 az）是震中到台站的连线与地理北向的顺时针夹角，而反方位角
（back azimuth，常简写为 baz）指台站到震中的连线与地理北向的顺时针夹角。

```{figure} az-baz.*
:alt: 震中距、方位角、反方位角示意图
:width: 50.0%
:align: center

震中距、方位角、反方位角示意图
```

需要注意的是，由于地球是个球体，方位角和反方位角一般并不是相差 180°。
例如，地震和台站分别位于（0°N，0°E）和（40°N，120°E）时，方位角约为 46°，
反方位角约为 290°，二者相差 244°。

## 使用 ObsPy 计算

ObsPy 提供了若干个函数，用于计算震中距、方位角和反方位角等参数。

假定地震位于 (0°, 0°) 处，台站位于 (20°, 10°) 处：
```{code-cell} ipython3
evla, evlo, stla, stlo = 0, 0, 20, 10
```

ObsPy 的 {func}`obspy.geodetics.base.locations2degrees` 函数可以用于计算完美球体
地球表面任意两点的距离，其返回值单位为度。
```{code-cell} ipython3
from obspy.geodetics import locations2degrees

dist = locations2degrees(0, 0, 20, 10)
print(dist)
```

{func}`obspy.geodetics.base.gps2dist_azimuth` 函数可以计算震中距、方位角和反方位角，
且其计算时采用的是 WGS84 椭球，因而具有更高的准确性：
```{code-cell} ipython3
from obspy.geodetics import gps2dist_azimuth

dist, az, baz = gps2dist_azimuth(evla, evlo, stla, stlo)
print(dist, az, baz)
```

{func}`obspy.geodetics.base.gps2dist_azimuth` 函数返回的距离以米为单位，可使用
{func}`obspy.geodetics.base.kilometers2degrees` 函数将其转换成以度为单位：
```{code-cell} ipython3
from obspy.geodetics import kilometers2degrees

gcarc = kilometers2degrees(dist / 1000.0)
print(gcarc)
```
