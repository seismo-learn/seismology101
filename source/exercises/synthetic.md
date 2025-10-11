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

# 合成地震波形

- 本节贡献者: {{田冬冬}}
- 最近更新日期: 2025-02-27
- 预计花费时间: 60 分钟


:::{warning}
WIP (Work in Progress).
:::

---

Links

- https://docs.obspy.org/packages/obspy.clients.syngine.html
- https://docs.obspy.org/packages/autogen/obspy.clients.syngine.client.Client.get_waveforms.html
- https://ds.iris.edu/ds/products/syngine/
- https://service.iris.edu/irisws/syngine/docs/1/builder/
- https://service.iris.edu/irisws/syngine/1/

```
from obspy.clients.syngine import Client
client = Client()

st = client.get_waveforms(
    model="ak135f_5s",
    sourcelatitude=0,
    sourcelongitude=0,
    sourcedepthinmeters=200000,
    sourcemomenttensor=[1.0e22, 1.0e22, 1.0e22, 0, 0, 0],
    receiverlatitude=0,
    receiverlongitude=50,
    components="RTZ",
    units="velocity",
    format="miniseed"
)
```