# 地震波

- 本节贡献者: {{ 姚家园 }}（作者）、{{ 田冬冬 }}（审稿）
- 最近更新日期: 2022-08-16
- 预计阅读时间: 20 分钟

---

震源激发的机械振动以地震波的形式在地球内部传播。地震波分为体波（body wave）
和面波（surface wave）。体波是指在地球内部传播的地震波，而面波指在地球表面附近
传播的地震波。本节将介绍最基础的地震波理论。

## 体波

体波分为 P 波（**p**rimary wave 或 P-wave）和 S 波（**s**econdary wave 或 S-wave）。
P 波比其他地震波传播速度快，最先传播到达台站；S 波的传播速度比 P 波慢，在 P 波后传播到台站。
上述 P 波和 S 波的命名源由主要基于他们到达台站的时间。
从物理属性上来说，P 波是压缩波（compressional wave），这是因为 P 波在介质中传播时，
会造成介质的交替压缩和膨胀，介质的体积发生变化（如下图示）；S 波是剪切波（**s**hear wave），
这是因为 S 波在介质中传播时，会造成介质的剪切变形，但介质的体积没有变化（如下图示）。

P 波之所以会造成介质的交替压缩和膨胀，是由于介质的运动方向与波传播的方向相同或相反。
因此，P 波是一种纵波（longitudinal wave），即介质的运动方向与波传播的方向相同或相反的波。
S 波之所以会造成介质的剪切变形，是由于介质的运动方向与波传播的方向垂直。
因此，S 波是一种横波（transverse wave），即介质的运动方向与波传播的方向垂直的波。

:::{figure} body-wave-propagation.jpg
:align: center
:alt: "体波的介质运动方向以及波传播方向"
:width: 80%

体波的介质运动方向以及波传播方向。引自《[Introduction to Seismology]》（第三版）图 3.2。
:::

## 面波

沿着地球表面附近传播的面波也有两种，即瑞利波（Rayleigh wave）和勒夫波（Love wave）。
Rayleigh 波在地表传播时，介质的运动既有与波传播方向相同或相反的分量，又有与波传播方向垂直
的分量（如下图示）。Love 波在地表传播时，介质的运动方向与波传播方向垂直（如下图示）。
面波的振幅随着深度增加会剧烈减少。

:::{figure} surface-wave-propagation.jpg
:align: center
:alt: "面波的介质运动方向以及波传播方向"
:width: 50%

基阶 Love 波（上）和 Rayleigh 波（下）的介质运动方向（假设面波沿着页面从左向右传播）。
引自《[Introduction to Seismology]》（第三版）图 8.5。
:::

[an introduction to seismology, earthquakes, and earth structure]: https://www.wiley.com/en-us/An+Introduction+to+Seismology%2C+Earthquakes%2C+and+Earth+Structure-p-9780865420786
[an introduction to the theory of seismology]: https://academic.oup.com/gji/article/86/1/215/636222
[introduction to seismology]: https://www.cambridge.org/us/academic/subjects/earth-and-environmental-science/solid-earth-geophysics/introduction-seismology-3rd-edition?format=HB&isbn=9781316635742
