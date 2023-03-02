# 地震震相

- 本节贡献者: {{ 姚家园 }}（作者）、{{ 田冬冬 }}（作者）
- 最近更新日期: 2023-03-01
- 预计阅读时间: 30 分钟

---

地震体波是在地球内部传播的机械波。与光类似，地震波在遇到介质界面时也会出现反射、
折射和衍射等现象。与光不同的是，地震波既有横波（S 波）又有纵波（P 波），
地震波在介质界面发生反射或折射时还会发生波的转换，即横波可以转换为纵波，纵波也
可以转换为横波。地震波在地球内部传播时，会遇到地球内部的多个界面，并在界面处
发生反射、折射以及横波/纵波的互相转换。因而，震源激发的地震波在地球内部传播时
会有很多可能的传播路径，沿着不同路径传播的地震波走时也不同，在观测记录上表现为
不同特征的信号，称之为地震震相（seismic phase）。

## 地球圈层结构

在介绍地震震相之间，有必要先介绍地球的分层结构。

固体地球的半径约为 6371 公里，具有明显的圈层结构。地球从外到内可以分为如下几个圈层：

- 地壳（crust）：地球的最表层，大陆地壳的平均厚度为 30-50 km，大洋地壳的平均厚度约为 6 km
- 地幔（mantle）：地壳以下的固态岩石层，最大深度为 2891 km
- 外核（outer core）：液态铁合金层，深度范围为 2891 到 5150 km
- 内核（inner core）：固态铁合金层，半径约 1221 km

各个圈层之间的分界面为：

- 地壳与地幔的界面：莫霍洛维奇间断面（**Moho**rovičić discontinuity），或简称莫霍面（Moho discontinuity）
- 地幔和外核的界面：核幔边界（**c**ore-**m**antle **b**oundary，简写 CMB）
- 外核与内核的界面：内核边界（**i**nner-**c**ore **b**oundary，简写 ICB）

不同圈层中，介质的 P 波和 S 波速度以及密度也随着深度而变化：

- 在 Moho 面附近，地震波速度猛然增加
- 在地幔中，410 公里和 660 公里附近存在两个速度间断面，地震波速度在间断面附近突然增加。
  这两个间断面分别称为 410 间断面（410-km discontinuity）和 660 间断面（660-km discontinuity），
  二者之间的区域称为地幔转换带（mantle transition zone）
- 在 660 公里至地幔底部的深部区域，地震波速度平缓增加
- 在核幔边界，P 波速度从大约 14 km/s 骤降至大约 8 km/s，S 波速度从大约 7 km/s 降为零，
  这是因为外核是液态的
- 在外核中，P 波速度再次随着深度逐渐增加
- 在内核边界，P 波速度突然增加，内核中 S 波速度也不为零了

:::{figure} prem.jpg
:align: center
:alt: "地球分层结构及 P、S 波速度和密度"
:width: 50%

地球内部 P 波速度、S 波速度和密度（来自 Preliminary Reference Earth Model (PREM) {cite}`Dziewonski1981`）。
引自《[Introduction to Seismology]》（第三版）图 1.1。
:::

## 地震震相

地震波在地球内部传播时会穿过不同的地球内部结构，相应的地震波射线路径和走时也会不同，
在观测记录上也显示出不同的波形特征，称之为地震震相（seismic phase）。

为了区分不同的地震震相，地震学领域制定了一套标准地震震相命名规则。每条射线路径
都可以对应一个震相名；同样的，每个震相名都可以对应特定的射线路径。

在标准地震震相命名规则中，规定了用以下简写符号分别表示在地壳、地幔、外核以及内核中
传播的 P 波和 S 波：

- **P**：从震源出发向下在地壳和地幔中传播的 P 波
- **p**：从震源出发向上在地壳和地幔中传播的 P 波
- **K**：外核中传播的 P 波
- **I**：内核中传播的 P 波
- **S**：地壳和地幔中传播的 S 波
- **J**：内核中传播的 S 波
- **c**：核幔边界处的反射波
- **i**：内核边界处的反射波

地震波从震源出发，穿过地球内部，并被位于地表的地震仪器记录到。地球内部主要分界面
将地震波走过的射线分割成多个小段，将射线路径里每段对应的简写符号拼接起来，
即得到了射线对应的震相名。以下图中的几个地震震相为例：

- PcP 震相表示震源激发的 P 波从震源向下出发在地壳/地幔中传播（**P**），
  并在核幔边界处反射（**c**），反射 P 波在地幔中向上传播至台站（**P**）
- SKS 震相表示震源激发的 S 波从震源向下出发在地壳/地幔中传播（**S**），
  在核幔边界处转换为 P 波并在外核中传播（**K**），然后再次在核幔边界处转换成
  S 波并在地幔中传播（**S**），最终传播回台站

:::{figure} phase-name.jpg
:align: center
:alt: "全球震相的射线路径及其震相名"
:width: 50%

全球震相的射线路径及其震相名。实线表示 P 波路径，摆动线表示 S 波路径。
引自《[Introduction to Seismology]》（第三版）图 4.16。
:::

```{note}
除了上图展示的全球尺度的震相外，在小震中距范围内沿地壳、上地幔传播的地震震相更为复杂，
且部分震相的命名并未统一。因此，本教程不做介绍，读者可以参考
{doc}`seis:ray-nomenclature/crustal-phases`学习相关震相定义。
```

我们以地震与台站之间的距离为 X 轴，以台站观测到的地震震相走时为 Y 轴，将全球地震的震相走时
画出来，便得到了**走时曲线**。这是我们认识和研究地球深部的速度结构最简单和根本的资料。

:::{figure} travel-time-curve.jpg
:align: center
:alt: "不同体波震相的走时曲线"
:width: 50%

不同体波震相的走时曲线，数据来至 [Kennett and Engdahl (1991)](https://doi.org/10.1111/j.1365-246X.1991.tb06724.x)。
引自《[An Introduction to Seismology, Earthquakes, and Earth Structure]》
图 3.5-3。
:::

[introduction to seismology]: https://www.cambridge.org/us/academic/subjects/earth-and-environmental-science/solid-earth-geophysics/introduction-seismology-3rd-edition?format=HB&isbn=9781316635742
[An Introduction to Seismology, Earthquakes, and Earth Structure]: https://www.wiley.com/en-us/An+Introduction+to+Seismology%2C+Earthquakes%2C+and+Earth+Structure-p-9780865420786

