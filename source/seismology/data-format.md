# 波形数据格式

- 本节贡献者: {{ 田冬冬 }}（作者）、{{ 姚家园 }}（作者）、{{何星辰}}（作者）
- 最近更新日期: 2025-10-03
- 预计阅读时间: 30 分钟

---

日常科研中，经常会接触不同格式的波形数据，最常见的是 SAC 、 miniSEED 、segy 和 hdf5 格式。
每种数据格式都有各自的优点和缺点。例如，SAC 格式有利于数据处理和分析，
但不利于大批量数据的存储和交换。miniSEED 格式有利于波形数据的存档和交换，
近几年也常用于数据处理和分析。segy格式在工业界广泛使用，但是不太适用于天然地震学中常见的、时序连续且台站分布不规则的波形数据。HDF5适用于存储和组织大规模复杂科学数据。
因此，miniSEED 格式是目前地震学领域**最流行**的波形数据格式。

## SAC

SAC 格式由 [SAC](https://ds.iris.edu/ds/nodes/dmc/software/downloads/SAC/)
（Seismic Analysis Codes）软件定义，但许多其他软件也支持该格式。每个 SAC 文件包含头段区
和时间序列数据区，其中头段区定义了与台站、事件、走时以及用户自定义信息等相关的变量。

SAC 是一款常用的地震学波形处理和分析软件，同时，SAC 格式的数据中可以保存一些元数据和事件信息，
使得 SAC 格式是日常科研中的常用数据格式。但若选择该格式来存储数据，则需要很大的硬盘空间。

## miniSEED

SEED 全称 Standard for the Exchange of Earthquake Data（地震数据交换标准），
主要用于地震学时间序列数据和相关元数据的归档和交换。最新的 SEED 标准是 2012 年发布的
[SEED v2.4](http://www.fdsn.org/pdf/SEEDManual_V2.4.pdf)。
虽然该格式包含了完备的地震学观测数据，但一般需要利用
[rdseed](https://github.com/iris-edu-legacy/rdseed) 软件
转换成其他格式，再进行数据处理和分析。
IRIS 自 2020 年 1 月开始不再提供 SEED 格式的数据下载支持，
详情可阅读 [IRIS 数据服务通讯](http://www.iris.washington.edu/ds/newsletter/vol21/no1/509/retirement-of-full-seed-data-volumes-from-iris-dmc/)。
IRIS 也已[不再维护 rdseed 软件](https://ds.iris.edu/ds/nodes/dmc/manuals/rdseed/)。

:::{note}
除了 rdseed 外，ObsPy 也可以将 SEED 格式转换成其他格式。
其 [read](https://docs.obspy.org/packages/autogen/obspy.core.stream.read.html) 函数
可以读取 SEED 里的时间序列数据，然后利用 [write](https://docs.obspy.org/packages/autogen/obspy.core.stream.Stream.write.html)
方法转换成其他格式。
其 [xseed](https://docs.obspy.org/master/packages/obspy.io.xseed.html) 模块的
[Parser](https://docs.obspy.org/master/packages/autogen/obspy.io.xseed.parser.Parser.html) 类
可以读取 SEED 里的元数据，并转换成其他格式。
:::

miniSEED 是 SEED 格式的子集，一般用于地震学时间序列数据的归档和交换。
其包含的时间序列的元数据非常有限，一般只有时间序列标识和简单的运行状况标识，
不包含台站地理坐标、仪器响应以及其他解释数据所需的信息。

近几年，由于地震学数据处理和分析软件的快速发展
（如 [ObsPy](https://github.com/obspy/obspy/wiki)），
miniseed 格式也常用于数据处理和分析。此时，所需的元数据要从一定格式的
元数据文件中提取。例如，目前比较流行的组合方式是 miniSEED 格式的时间序列数据和
[StationXML](https://www.fdsn.org/xml/station/) 格式的元数据。

## SEGY

[SEGY](https://woodshole.er.usgs.gov/pubs/of01-97/01-97_1/htmldocs/segy.htm) 格式由勘探地球物理学家学会（Society of Exploration Geophysicists）定义，是主动源地震勘探、石油和天然气工业中的标准数据格式。它主要用于存储和交换大规模的2D或3D地震勘测数据，如炮集、共中心点道集和叠加剖面等。

一个 SEGY 文件主要由以下几部分组成：

* **文本文件头**: 一个3200字节的头部，通常使用 EBCDIC 编码，记录了测线、勘测区域等基本信息。
* **二进制文件头**: 一个400字节的头部，定义了数据的基本参数，如采样间隔、道数等。
* **道头和数据体**: 每个地震道（trace）都有一个240字节的道头，包含了该道的详细元数据（如震源和接收点的坐标、偏移距等），其后紧跟着该道的振幅数据。

SEGY 格式的优点是其在工业界的标准化和广泛应用。然而，其结构非常固定，且头部格式较为古老，这使得它不太适用于天然地震学中常见的、时序连续且台站分布不规则的波形数据。

## HDF5

[HDF5](https://woodshole.er.usgs.gov/pubs/of01-97/01-97_1/htmldocs/segy.htm) (Hierarchical Data Format version 5) 不是一个地震学专用格式，而是一种通用的、为存储和组织大规模复杂科学数据而设计的格式。它在众多科学计算领域（包括地震学）中越来越受欢迎。

HDF5 文件的特性是其层次化和自描述性，可以将其理解为一个“文件内部的文件系统”：

* **组 (Groups)**: 类似于文件夹，可以将相关的数据集组织在一起。
* **数据集 (Datasets)**: 类似于文件，是存储数据的多维数组（如波形数据、模型参数等）。
* **属性 (Attributes)**: 附着在组或数据集上的元数据，用于描述数据（如台站名、采样率、单位等）。

在地震学中，HDF5 因其灵活性和高性能而被广泛应用。

* **大规模数据集的存储**: 特别适用于分布式声学传感（DAS）等产生海量（TB级）数据的场景。
* **深度学习**: 常用于打包地震波形和其对应的标签（如震相拾取、事件类型），深度学习中的 [STEAD](https://github.com/smousavi05/STEAD) 与 [DiTing](https://data.earthquake.cn/datashare/report.shtml?PAGEID=datasourcelist&dt=ff8080828b238a7a018b40eac2790006) 数据集就是使用HDF5格式。
* **复杂数据产品**: 存储地震目录、速度模型、接收函数等多种类型的数据。

HDF5 的主要优点是**灵活性高、可扩展性强、I/O性能优越**，并且有 `h5py` 等成熟的 Python 库支持。其缺点在于，由于内部结构没有统一标准，不同项目或组织产出的 HDF5 文件可能结构各异，读取时需要编写针对性的代码。


## 格式转换

不同波形数据格式经常要互相转换，以实现不同的目的。

- [ObsPy](https://github.com/obspy/obspy/wiki) 软件提供的[波形数据读写模块](https://docs.obspy.org/master/packages/index.html)几乎可以实现目前所有波形数据格式的互相转换。
- [mseed2sac](https://github.com/iris-edu/mseed2sac) 软件可以
  将 miniSEED 格式转成 SAC 格式。

- [Seismic Unix](https://wiki.seismic-unix.org/start) 是一个经典的命令行工具集，提供了丰富的模块用于处理和转换 SEGY 及 SU 格式数据。

-   Python 库如 [segyio](https://github.com/equinor/segyio) 和 [segpy](https://segpy.readthedocs.io/en/latest/) 提供了读取、操作和写入 SEGY 文件的能力。

-  HDF5 文件可以直接通过 python 库 [h5py](https://github.com/h5py/h5py) 读取为`numpy`或者`pandas`格式。随即便可以将其写入为任意的文件格式


## 参考文档

- <https://ds.iris.edu/ds/nodes/dmc/data/formats/>
- <https://segyio.readthedocs.io/en/stable/>
- <https://woodshole.er.usgs.gov/pubs/of01-97/01-97_1/htmldocs/segy.htm>
- <https://docs.h5py.org/en/stable/>