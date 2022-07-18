---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.13.0
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# 地震目录

- 本节贡献者: {{田冬冬}}（作者）
- 最近更新日期: 2022-07-17
- 预计花费时间: 30 分钟

---

这一节将介绍如何下载并分析地震目录。

## 在线搜索和查看地震目录

USGS 网站提供了在线搜索和查看地震目录的功能，既可以手动下载地震目录，也可以
方便地查看地震目录中的地震分布情况。下面演示如何使用 USGS 网站在线搜索和查看
地震目录。

1. 访问 USGS 地震目录网站: https://earthquake.usgs.gov/earthquakes/search/\。
   会看到如下搜索界面：

   :::{figure} usgs-catalog-1.jpg
   :align: center
   :alt: "USGS 地震目录基本选项"
   :width: 100%
   :::

   搜索界面分为左中右三栏：

   - 左侧栏设置震级搜索范围，可以选择 2.5 级以上或 4.5 级以上地震，也可以自定义
     地震震级最小值和最大值
   - 中间栏设置发震时刻搜索范围，可以选择最近 7 天或最近 30 天，也可以自定义
     发震时刻范围的开始时间和结束时间（UTC 时间）
   - 右侧栏设置震中区域范围，可以选择全球地震、美国及周边地震，也可以在地图上
     选中一个矩形区域

2. 在“高级选项”中可进一步对地震目录做筛选：

   :::{figure} usgs-catalog-2.jpg
   :align: center
   :alt: "USGS 地震目录高级选项"
   :width: 100%
   :::

   - **Geographic Region** 可以设置地震震中的范围。设置方式有两种：
     1. 通过指定经纬度范围限定一个矩形区域。North 必须大于 South，East 必须大于 West
     2. 通过指定一个中心点的经纬度和一个半径值（单位为 km）限定一个圆形区域
   - **Depth (km)** 用于限定地震的深度范围，深度单位为 km。
   - **Review Status** 用于限定地震信息的审核状态。一般来说，经人工审核的地震信息
     更加准确，但由于人工审核需要一定的时间，因而最近几小时或几天的地震信息可能
     没有被人工审核过。而自动确定的地震信息实时性更好，但地震位置和震级等信息可能
     不太准确。

   除此之外，还可以进一步限制事件类型、事件影响力、地震目录来源、地震信息贡献者以及地震产品
   类型等。读者可以自行探索。

3. 在“输出选项”中可以设置要以什么格式输出地震目录：

   :::{figure} usgs-catalog-3.jpg
   :align: center
   :alt: "USGS 地震目录输出选项"
   :width: 50%
   :::

   USGS 网站支持输出多种格式的地震目录：

   - **Map & List**：在地图中显示地震目录，适合直观地查看地震分布情况
   - **CSV**：CSV 格式，可以用 Excel 打开，也可以用 Python 的 [pandas](https://pandas.pydata.org/)
     模块处理
   - **KML**：Google Earth KML 格式，可以在 Google Earth 中直接打开
   - **QuakeML**: 地震学领域定义的标准地震目录格式，ObsPy 可以直接读取
   - **GeoJSON**: 一种地理空間数据交换格式，多种软件和 Python 模块均可读取

4. 所有选项选择完毕后，点击”Search“按钮，即可以根据指定的格式输出地震目录。

读者可以尝试筛选出 2022 年上半年（1 月 - 6 月）全球震级大于 5.0 级、深度大于 70 km 的地震，并选择
以“Map & List”的方式输出。点击“Search”按钮后，会在浏览器中打开如下地震分布图。左侧为地震列表，右侧
为地震分布。读者可自行探索该界面中的各个按钮，以了解其更多功能。

:::{figure} usgs-catalog-4.jpg
:align: center
:alt: "USGS 地震目录在线地图"
:width: 100%
:::

## 使用 ObsPy 下载地震目录

## 使用地震目录绘图

### 地震分布图

### 地震深度分布直方图

### 地震震级直方图

### 地震震级-频度关系
