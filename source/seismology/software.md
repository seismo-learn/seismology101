# 常用软件

- 本节贡献者: {{ 姚家园 }}（作者）、{{ 田冬冬 }}（审稿）
- 最近更新日期: 2021-05-30
- 预计阅读时间: 30 分钟

______________________________________________________________________

日常地震学科研工作中，经常需要使用他人开发的软件来完成数据处理与分析、绘图以及科学计算等。
本节介绍一些地震学常用软件，读者需要在后面的练习以及日常的科研工作中，反复使用和思考方能完全掌握这些软件。

:::{note}
阅读本教程时，推荐地震学新手先参考以下中文教程中的安装部分在计算机上安装这些软件。
《{doc}`地震学实践 </exercises/intro>`》这一章则会通过简单实例展示一些基本用法。

阅读完本教程后，再详细阅读各软件的中文和官方教程。
一般而言，只需阅读中文教程中的入门教程，即可入门和开展科研工作。
之后可以阅读中文教程中的进阶教程以及官方教程，深入学习和掌握这些软件。
:::

## ObsPy

ObsPy 是地震学数据处理的 Python 软件包，极大促进了地震学应用程序的快速开发。
其可以用来读写多种地震学数据格式，下载地震目录、台站元数据和波形数据，以及处理和分析波形数据等，
满足了日常科研中与地震学数据相关的大部分需求。

可以说正是因为 ObsPy 的出世，地震学科研工作者才可以喊出“**人生苦短，我用 Python！**”。

- 主页：<https://www.obspy.org/>
- 官方教程：<https://docs.obspy.org/>
- 中文教程：<https://seismo-learn.org/software/obspy/>

## SOD

SOD，全称是 Standing Order for Data，可以自动筛选并下载地震目录、台站元数据和波形数据，
并对波形数据做预处理。其具有高度可定制化的特点，可以满足日常科研中地震学数据下载的大部分需求。

虽然从零开始学习 SOD 的语法较难，但中文教程将持续维护开源且易懂的 SOD 脚本，读者一般只需
复制并做简单修改即可使用。

- 主页：<http://www.seis.sc.edu/sod/>
- 中文教程：<https://seismo-learn.org/software/sod/>

## SAC

SAC，全称 Seismic Analysis Code，是天然地震学领域使用最广泛的数据分析软件包之一。
我们推荐使用中文手册学习 SAC。至少在某些章节，中文手册比官方手册更好。
中文手册提供了更多有关数据处理的详细说明，以帮助初学者正确使用 SAC 和学习地震学数据处理基础。

SAC 拥有图形界面，方便实时查看结果。SAC 历史悠久，仍有许多开源代码和用户使用 SAC。
推荐用户学习和掌握 SAC 的基础用法。

- 主页：<http://ds.iris.edu/ds/nodes/dmc/software/downloads/sac/>
- 官方教程：<https://ds.iris.edu/files/sac-manual/>
- 中文教程：<https://seisman.github.io/SAC_Docs_zh/>

## GMT

GMT，全称 Generic Mapping Tools，中文一般译为“通用制图工具”，
是地球科学最广泛使用的制图软件之一，其具有强大的绘图功能和数据处理功能。

[PyGMT](https://www.pygmt.org/latest/) 是 GMT 官方维护的 GMT 的 Python 接口，
目前仍在快速开发中。

- 主页：<https://www.generic-mapping-tools.org/>
- 官方教程：<https://docs.generic-mapping-tools.org/>
- 中文教程：<https://docs.gmt-china.org/>

## TauP

TauP 用于计算一维球状分层模型下地震震相的走时和路径。

- 主页：<https://www.seis.sc.edu/taup/>
- 官方教程：<http://www.seis.sc.edu/downloads/TauP/taup.pdf>
- 中文教程：<https://seismo-learn.org/software/taup/>

:::{note}
TauP 是基于 Linux 命令行的软件，用户直接在终端执行一条命令即可得到结果。
ObsPy 提供了 [TauP 的 Python 接口](https://docs.obspy.org/packages/obspy.taup.html)，
方便用户在自己的 Python 代码中调用。
:::
