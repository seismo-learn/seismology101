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

This notebook can be downloaded as
            **{nb-download}`distaz.ipynb`** and {download}`distaz.md`.

# 距离和角度

```{code-cell} ipython3
from obspy.geodetics import gps2dist_azimuth, kilometers2degrees

# 事件和台站的经纬度
evla, evlo, stla, stlo = 0, 0, 20, 10

# 计算事件和台站的距离、方位角以及反方位角
dist, az, baz = gps2dist_azimuth(evla, evlo, stla, stlo)  # 距离单位默认是 m
dist /= 1000.0  # 距离单位为 km
gcarc = kilometers2degrees(dist)  # 转换为角度
print(dist, gcarc, az, baz)
```
