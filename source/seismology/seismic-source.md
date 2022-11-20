# 震源

- 本节贡献者: {{姚家园}}（作者）、{{田冬冬}}（作者）
- 最近更新日期: 2022-07-17
- 预计阅读时间: 5 分钟

---

任何产生能被地震仪记录到的地球机械振动的源都可以称为震源（seismic source）。
震源可以是地震、火山喷发、海浪、台风或飓风、人工爆炸、交通活动等。本节介绍震源的基础概念。

## 地震三要素

对于地震，人们最关心的基本参数有三个（俗称**地震三要素**），即时间、地点、强度（简称**时空强**）：

- 时间：地震发震时刻（origin time）
- 地点：地震震源位置（hypocenter），即地震发生位置的经纬度和深度。震源位置（hypocenter）
  向上垂直投影到地面的位置称为震中（epicenter）
- 强度：地震的大小，常用震级（magnitude）度量

:::{figure} epicenter-hypocenter.gif
:align: center
:alt: 震源位置（hypocenter）与震中（epicenter）的区别
:width: 40%

震源位置（hypocenter）与震中（epicenter）的区别。
图片引自 [USGS](https://www.usgs.gov/media/images/epicenter-hypocentergif)。
:::

空间上看，地震大部分发生在不同板块的边界处。板块内部也有一些地震发生。

:::{figure} earthquake-distribution.jpg
:align: center
:alt: "五年内 4 级以上地震的全球分布"
:width: 70%

五年内 4 级以上地震的全球分布。
引自 [Why Do Earthquakes Happen?](https://www.iris.edu/hq/inclass/fact-sheet/why_do_earthquakes_happen)。
:::

深度方向上看，地震主要发生在脆性地壳中。在 300 公里以上，地震数目整体上随着深度增加而减少。
300 公里以下，地震数目略有增加。最大的地震深度约为 700 多公里。

:::{figure} earthquake-depth.jpg
:align: center
:alt: "1964-2001 年全球 5.2 级以上地震的年发生率和震源深度的关系"
:width: 70%

1964-2001 年全球 5.2 级以上地震的年发生率和震源深度的关系。
引自《[Deep Earthquakes](https://doi.org/10.1017/CBO9781107297562)》图 4.3。
:::

震级越大的地震，数目越少。在地震学中，有一个著名的定律，叫 Gutenberg–Richter 定律（简称 GR law），
该定律描述了震级与某一地区大于等于该震级的地震数量之间的关系。该定律的表达式是：

$$
\log_{10} N = a - b M
$$

其中，$M$ 表示震级，$N$ 表示震级大于等于 $M$ 的地震数量，$a$ 和 $b$ 是常数。
一般 $b$ 的值接近 1。若取 $b=1$，则地震级数每降低一级，地震的数目就会增加 10 倍。

:::{figure} earthquake-gr-law.jpg
:align: center
:alt: "GCMT 地震目录中 1976-2005 年间全球地震的震级与频次关系"
:width: 70%

GCMT 地震目录中 1976-2005 年间全球地震的震级与频次关系。图中圆点为观测数据，
实线为 GR 定律中 b = 1 的理论曲线。
引自《Introduction to Seismology》图 9.27。
:::

地震释放的能量与地震震级之间的关系为{cite}`Gutenberg1956`：

$$
\log E = 1.5 M + 11.8
$$

可以看出，震级增加一级，地震释放的能量增加 32 倍。

:::{figure} earthquake-energy.jpg
:align: center
:alt: "地震的震级、频率以及释放能量的经验关系"
:width: 90%

地震的震级、频率以及释放能量的经验关系。
引自 [How Often Do Earthquakes Occur?](https://www.iris.edu/hq/inclass/fact-sheet/how_often_do_earthquakes_occur)。
:::

## 地震目录

将大量地震事件的参数进行汇总整理得到的目录资料，称之为地震目录。地震目录对于研究
地震活动性、地震灾害评估等具有重要的意义。

地震目录至少应包含地震的时空强信息，即：

- 发震时刻
- 震中经纬度
- 地震深度
- 地震震级

除此之外，有些地震目录还提供了地震的破裂时间和震源机制等其他参数。

根据所包含地震的区域范围，地震目录可以分成两类：全球地震目录和区域地震目录。
顾名思义，全球地震目录包含了全球范围内的地震，但通常只包含比较大的地震，小地震多有遗漏；
区域地震目录则只关注某个特定区域内的地震，通常包含更多的小地震。

常见的全球地震目录包括：

[International Seismological Center 地震目录](http://www.isc.ac.uk/iscbulletin/)
: ISC 地震目录是全球地震的最终版本，涵盖了
  1900 年至今的地震信息。所有地震信息通过程序自动确定，并由 ISC 的分析人员对其
  进行人工检查和重定位。经过人工审核的 ISC 地震目录通常有 24 个月的延迟。

[ANSS ComCat 地震目录](https://earthquake.usgs.gov/data/comcat/)
: ANSS Comprehensive Earthquake Catalog (ComCat) 是 ANSS (Advanced National Seismic System)
  制作的地震目录。该目录专注于提供全球 5.0 级以上地震事件的权威、近实时信息。
  地震位置和震级的初始报告通常可在地震发生后 10 到 30 分钟内获得，并在几天、几周和
  几个月后进一步修订。

区域地震目录有很多，通常由各个国家或区域的地震相关机构维护，比如：

- 中国: [中国台网正式地震目录](https://data.earthquake.cn/datashare/report.shtml?PAGEID=earthquake_zhengshi)
- 日本: [JMA 地震目录](https://www.data.jma.go.jp/svd/eqev/data/bulletin/hypo_e.html)
- 美国南加州: [SCSN 地震目录](https://scedc.caltech.edu/eq-catalogs/)
- 美国北加州: [NCSN 地震目录](https://ncedc.org/ncedc/catalog-search.html)

在使用地震目录时，应根据自己的需求选择合适的地震目录。
