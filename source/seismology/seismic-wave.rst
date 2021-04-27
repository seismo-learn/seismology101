地震波
======

地震波（seismic wave）是在地球内部传播的机械波，由地震、火山喷发、山体滑坡或人为爆炸等震源激发。
地震波分为体波（body wave）和面波（surface wave）。
体波是指在地球内部传播的地震波，而面波指在地球表面附近传播的地震波。
本节将介绍最基础的地震波知识。

体波
-----

P 波与 S 波
^^^^^^^^^^^^

体波分为 P 波（\ **p**\ rimary wave 或 P-wave）和 S 波（\ **s**\ econdary wave 或 S-wave）。
P 波比其他地震波传播速度快，最先传播到达台站；S 波的传播速度比 P 波慢，在 P 波后传播到台站。
上述 P 波和 S 波的命名源由主要基于他们到达台站的时间。
从物理属性上来说，P 波是压缩波（compressional wave），因为 P 波在地下介质中传播时，
会造成介质的交替压缩和膨胀，介质的体积发生变化（如下图示）；S 波是剪切波（\ **s**\ hear wave），
因为 S 波在地下介质中传播时，会造成介质的剪切变形，但介质的体积没有变化（如下图示）。

P 波之所以会造成介质的交替压缩和膨胀，是由于介质的运动方向与波传播的方向相同或相反。
因此，P 波是一种纵波（longitudinal wave），即介质的运动方向与波传播的方向相同或相反的波。
S 波之所以会造成介质的剪切变形，是由于介质的运动方向与波传播的方向垂直。
因此，S 波是一种横波（transverse wave），即介质的运动方向与波传播的方向垂直的波。

.. figure:: body-wave-propagation.jpg
   :alt: 体波的介质运动方向以及波传播方向
   :width: 80%
   :align: center

   体波的介质运动方向以及波传播方向。
   引自《\ `Introduction to Seismology <https://www.cambridge.org/us/academic/subjects/earth-and-environmental-science/solid-earth-geophysics/introduction-seismology-3rd-edition?format=HB&isbn=9781316635742>`__\ 》（第三版）
   图 3.2。

地球分层与体波波速
^^^^^^^^^^^^^^^^^^

固体地球最外层是较薄的地壳（crust），大洋地壳的平均厚度约为 6 公里，大陆地壳则约为 30-50 公里。
根据地震波速度，地球深部可以分成三层：地幔（mantle）、外核（outer core）、内核（inner core）。
固态地幔的深度约为2891 公里，大约占地球体积的 84%，占地球质量的 68%。
内核半径约 1221 公里，是固态的，由液态外核固化形成。
一般地壳与地幔的边界称为莫霍洛维奇间断面（Mohorovičić discontinuity），或简称 Moho 面，
地幔和外核的边界称为核幔边界（\ **c**\ ore-\ **m**\ antle **b**\ oundary，简写 CMB），
外核与内核的边界称为内核边界（\ **i**\ nner-\ **c**\ ore **b**\ oundary，即 ICB）。

体波的传播速度在地球内部随深部而变化。P 波和 S 波的传播速度也不同，S 波速度大约是 P 波速度的一半。

在 Moho 面附近，地震波猛然增加。
在地幔中，410 公里和 660 公里附近存在两个速度间断面，地震波速度在间断面附近突然增加。
一般分别称这两个间断面为 410 间断面（410-km discontinuity）和 660 间断面（660-km discontinuity），
他们之间的区域称为地幔转换带（mantle transition zone）。
在 660 公里至地幔底部的深部区域，地震波速度平缓增加。
在核幔边界，P 波速度从大约 14 km/s 骤降至大约 8 km/s，S 波速度从大约 7 km/s 降为零，
因为外核是液态的。在外核中，P 波速度再次随着深度逐渐增加。在内核边界，P 波速度突然增加，
同时内核中 S 波速度也不为零了。

.. figure:: prem.jpg
   :alt: 地球内部 P 波速度、S 波速度和密度
   :width: 50%
   :align: center

   地球内部 P 波速度、S 波速度和密度（来自 Preliminary Reference Earth Model (PREM)）。
   引自《\ `Introduction to Seismology <https://www.cambridge.org/us/academic/subjects/earth-and-environmental-science/solid-earth-geophysics/introduction-seismology-3rd-edition?format=HB&isbn=9781316635742>`__\ 》（第三版）
   图 1.1。

震相
^^^^^

地震发生后不久，台站就连续快速关闭了强 P，S 和地面波记录。
较远的台站会在几分钟后记录这些电波的到来，两次到达之间的时间更长。

距地震大约 100 度的距离，P 波和 S 波的传播路径开始接触地球外核的边缘。
超过此距离，第一个到达的波，即 P 波，大小减小，然后消失。穿过外部的 P 波称为 PKP 波。
它们开始出现在 140 度以上。 100 至 140 度之间的距离通常称为“阴影区域”。

我们看不到剪切波（S）穿过外核。因为液体不能被剪切，所以我们推断外核是熔融的。
但是，我们确实看到，波以P波的形式穿过外核，然后在穿过内核时转变为S波。
因为内核确实传递了剪切能，所以我们假设它是固体。

面波
-----

Rayleigh 波和 Love 波
^^^^^^^^^^^^^^^^^^^^^^

沿着地球表面附近传播的面波也有两种，即瑞利波（Rayleigh wave）和勒夫波（Love wave）。
Rayleigh 波在地表传播时，介质的运动既有与波传播方向相同或相反的分量，又有与波传播方向垂直
的分量（如下图示）。Love 波在地表传播时，介质的运动方向与波传播方向垂直（如下图示）。
面波的振幅随着深度增加会剧烈减少。

.. figure:: surface-wave-propagation.jpg
   :alt: 面波的介质运动方向以及波传播方向
   :width: 50%
   :align: center

   基阶 Love 波（上）和 Rayleigh 波（下）的介质运动方向（假设面波沿着页面从左向右传播）。
   引自《\ `Introduction to Seismology（第三版） <https://www.cambridge.org/us/academic/subjects/earth-and-environmental-science/solid-earth-geophysics/introduction-seismology-3rd-edition?format=HB&isbn=9781316635742>`__\ 》（第三版）
   图 8.5。

相速度与群速度
^^^^^^^^^^^^^^



