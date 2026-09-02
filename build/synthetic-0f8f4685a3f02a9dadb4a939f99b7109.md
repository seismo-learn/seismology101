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
# Syngine 服务端当前对所有合成波形请求返回 HTTP 204（无内容），
# 导致构建失败。本节仍在编写中，暂时跳过执行。
execute:
  skip: true
---

# 合成地震波形

:::{page-meta}
:authors: 田冬冬
:updated: 2025-02-27
:reading-time: 60 分钟
:::


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

```{code-cell} ipython3
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
