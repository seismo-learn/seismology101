波形数据格式
============

日常科研中，我们会接触许多不同的波形数据格式，最常见的是 SAC、miniSEED、以及 SEED 格式。

- **SAC**：该格式由 SAC（Seismic Analysis Codes）软件定义，许多其他软件都支持该格式。
  SAC 格式一般用于数据处理和分析，若用于存储数据，则需要很大的磁盘空间。
- **SEED**:全称 Standard for the Exchange of Earthquake Data（地震数据交换标准），
  主要用于地震学时间序列数据和相关元数据的归档和交换。最新的 SEED 是 2012 年发布的
  `SEED 2.4 <http://www.fdsn.org/pdf/SEEDManual_V2.4.pdf>`__。
- **miniSEED**：SEED 的子集，用于地震学时间序列数据的归档和交换。
  miniSEED 包含的时间序列的元数据非常有限，一般只有时间序列标识和简单的运行状况标志，
  不包含台站地理坐标，仪器响应以及其他解释数据所需的信息。
