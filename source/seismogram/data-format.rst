波形数据格式
============

日常科研中，我们会接触不同的波形数据文件格式，最常见的是 SAC、SEED、以及 miniSEED。

SAC
---

SAC 格式由 `SAC <https://ds.iris.edu/ds/nodes/dmc/software/downloads/SAC/>`__
（Seismic Analysis Codes）软件定义，但许多其他软件也支持该格式。每个 SAC 文件包含头段区
和时间序列数据区，其中头段区定义了与台站、事件、走时、以及用户自定义信息等相关的变量。
该格式有利于数据处理和分析，因此是日常科研中常用的数据格式。
但是，若选择该格式来存储数据，则需要很大的磁盘空间。

SEED
----

SEED 格式全称 Standard for the Exchange of Earthquake Data（地震数据交换标准），
主要用于地震学时间序列数据和相关元数据的归档和交换。最新的 SEED 标准是 2012 年发布的
`SEED 2.4 <http://www.fdsn.org/pdf/SEEDManual_V2.4.pdf>`__。
虽然该格式包含了完备的地震学观测数据，但是在存储和交换时存在一些冗余的信息。
近年来，一些时间序列数据格式（如 miniSEED）和元数据格式
（如 `stationXML <https://www.fdsn.org/xml/station/>`__）
的组合正逐渐代替 SEED 格式。

miniSEED
--------

miniSEED 是 SEED 格式的子集，其包含的时间序列的元数据非常有限，
一般只有时间序列标识和简单的运行状况标志，不包含台站地理坐标，
仪器响应以及其他解释数据所需的信息。

该格式一般用于地震学时间序列数据的归档和交换。
但近几年，由于地震学数据处理和分析软件的快速发展
（如 `ObsPy <https://github.com/obspy/obspy/wiki>`__），
miniseed 格式也常用于数据处理和分析，此时台站元数据和事件信息需要从其他格式
文件中提取。

格式转换
--------

不同波形数据格式经常要互相转换，以实现不同的目的。
`ObsPy <https://github.com/obspy/obspy/wiki>`__ 软件几乎可以实现目前所有的\
`波形数据格式的互相转换 <https://docs.obspy.org/master/packages/index.html>`__。

其他常用的格式转换工具有：

- `rdseed <https://github.com/iris-edu-legacy/rdseed>`__：SEED 转 SAC、AH、CSS、SEGY 等
- `mseed2sac <https://github.com/iris-edu/mseed2sac>`__：miniSEED 转 SAC
- `sac2mseed <https://seiscode.iris.washington.edu/projects/sac2mseed>`__： SAC 转 miniSEED

参考文档
--------

- https://ds.iris.edu/ds/nodes/dmc/data/formats/
