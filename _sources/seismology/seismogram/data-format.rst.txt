波形数据格式
============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-01-05
:预计阅读时间: 10 分钟

----

日常科研中，经常会接触不同格式的波形数据，最常见的是 SAC 和 miniSEED 格式。
每种数据格式都有各自的优点和缺点。例如，SAC 格式有利于数据处理和分析，
但不利于大批量数据的存储和交换。miniSEED 格式有利于波形数据的存档和交换，
近几年也常用于数据处理和分析，因此，miniSEED 格式是目前地震学领域\ **最流行**\ 的波形数据格式。

SAC
---

SAC 格式由 `SAC <https://ds.iris.edu/ds/nodes/dmc/software/downloads/SAC/>`__
（Seismic Analysis Codes）软件定义，但许多其他软件也支持该格式。每个 SAC 文件包含头段区
和时间序列数据区，其中头段区定义了与台站、事件、走时以及用户自定义信息等相关的变量。

SAC 是一款常用的地震学波形处理和分析软件，同时，SAC 格式的数据中可以保存一些元数据和事件信息，
使得 SAC 格式是日常科研中的常用数据格式。但若选择该格式来存储数据，则需要很大的硬盘空间。

miniSEED
--------

SEED 全称 Standard for the Exchange of Earthquake Data（地震数据交换标准），
主要用于地震学时间序列数据和相关元数据的归档和交换。最新的 SEED 标准是 2012 年发布的
`SEED v2.4 <http://www.fdsn.org/pdf/SEEDManual_V2.4.pdf>`__。
虽然该格式包含了完备的地震学观测数据，但一般需要利用
`rdseed <https://github.com/iris-edu-legacy/rdseed>`__ 软件
转换成其他格式，再进行数据处理和分析。
IRIS 自 2020 年 1 月开始不再提供 SEED 格式的数据下载支持，
详情可阅读 `IRIS 数据服务通讯 <http://www.iris.washington.edu/ds/newsletter/vol21/no1/509/retirement-of-full-seed-data-volumes-from-iris-dmc/>`__。
IRIS 也已\ `不再维护 rdseed 软件 <https://ds.iris.edu/ds/nodes/dmc/manuals/rdseed/>`__。

.. note::

   除了 rdseed 外，ObsPy 也可以将 SEED 格式转换成其他格式。
   其 `read <https://docs.obspy.org/packages/autogen/obspy.core.stream.read.html>`__ 函数
   可以读取 SEED 里的时间序列数据，然后利用 `write <https://docs.obspy.org/packages/autogen/obspy.core.stream.Stream.write.html>`__
   方法转换成其他格式。
   其 `xseed <https://docs.obspy.org/master/packages/obspy.io.xseed.html>`__ 模块的
   `Parser <https://docs.obspy.org/master/packages/autogen/obspy.io.xseed.parser.Parser.html>`__ 类
   可以读取 SEED 里的元数据，并转换成其他格式。



miniSEED 是 SEED 格式的子集，一般用于地震学时间序列数据的归档和交换。
其包含的时间序列的元数据非常有限，一般只有时间序列标识和简单的运行状况标识，
不包含台站地理坐标、仪器响应以及其他解释数据所需的信息。

近几年，由于地震学数据处理和分析软件的快速发展
（如 `ObsPy <https://github.com/obspy/obspy/wiki>`__\ ），
miniseed 格式也常用于数据处理和分析。此时，所需的元数据要从一定格式的
元数据文件中提取。例如，目前比较流行的组合方式是 miniSEED 格式的时间序列数据和
`StationXML <https://www.fdsn.org/xml/station/>`__ 格式的元数据。

格式转换
--------

不同波形数据格式经常要互相转换，以实现不同的目的。

- `ObsPy <https://github.com/obspy/obspy/wiki>`__ 软件提供的\
  `波形数据读写模块 <https://docs.obspy.org/master/packages/index.html>`__\
  几乎可以实现目前所有波形数据格式的互相转换。
- `mseed2sac <https://github.com/iris-edu/mseed2sac>`__ 软件可以
  将 miniSEED 格式转成 SAC 格式。

参考文档
--------

- https://ds.iris.edu/ds/nodes/dmc/data/formats/
