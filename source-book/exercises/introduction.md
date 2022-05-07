# 简介

:::{note}
地震学实践的各章节正在全力编写中，计划的实践列表请查看
[seismology101 issue #205](https://github.com/seismo-learn/seismology101/issues/205)
:::

日常地震学科研工作中，使用地震学数据开展研究前，往往需要先获取观测资料，并做预处理和分析。
经处理和分析得到的可靠数据可用于研究震源、地震学成像以及探索地球深部等。因此，这一部分将介绍
日常地震学科研工作中的常用工作流程，主要以实际工作中会用到的代码为主。
目的是帮助地震学新手快速熟悉地震学数据下载、处理以及分析的基础代码，然后直接可以开展实际科研工作。

地震台站记录到的地震图会实时或隔一段时间后传输至数据中心（**Data Center**），
如 [Incorporated Research Institutions for Seismology (IRIS)](https://www.iris.edu/hq/)。
一般情况下，地震学科研工作者直接可以从数据中心下载到公开的波形数据（time series data）。
此外，一些数据中心也会提供地震目录（catalog）和台站元数据（medadata）。

:::{figure} workflow.jpg
:align: center
:alt: "\u5730\u9707\u5B66\u89C2\u6D4B\u7684\u83B7\u53D6\u548C\u5904\u7406\u6D41\u7A0B\
:  \u793A\u610F\u56FE"
:width: 95%

地震学观测的获取和处理流程示意图。
:::

以下是地震学数据实战常见流程：

- 首先，我们可以通过 [FDSN Web Services](https://www.fdsn.org/webservices/)
  向数据中心申请和下载波形资料。得易于 ObsPy、SOD 等软件，现在的资料申请和下载十分简便、易学
- 接着，我们可以利用 ObsPy、SAC 等软件对下载的数据进行预处理，如格式转换、去除仪器响应、滤波等
- 然后，我们可以对处理好的数据进行分析，如拾取震相走时与振幅、分析波形的时频特征等
- 最后，我们就可以利用提取到的数据信息开展深入的地震学研究，如震源定位、体波走时层析成像等
