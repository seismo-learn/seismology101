波形数据格式
============

There are many different seismic data formats in seismology community. The most commonly used formats are SAC, miniSEED and SEED.

- **SAC** is a good format for data analysis, though difficult for storing. This format is defined by the software SAC (Seismic Analysis Codes), although it is supported by many other tools
- **SEED** (Standard for the Exchange of Earthquake Data) is a data format intended primarily for the archival and exchange of seismological time series data and related metadata. The latest `SEED 2.4 <http://www.fdsn.org/pdf/SEEDManual_V2.4.pdf>`__ is published in 2012.
- **miniSEED** is the subset of the SEED standard that is used for time series data. Very limited metadata for the time series is included in miniSEED beyond time series identification and simple state-of-health flags. In particular, geographic coordinates, response/scaling information and other information needed to interpret the data values are not included.

