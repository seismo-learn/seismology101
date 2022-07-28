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

# 准备工作

- 本节贡献者: {{田冬冬}}（作者）
- 最近更新日期: 2022-06-12
- 预计花费时间: 10 分钟

---

这一章，我们将使用 Python 语言和 [ObsPy 软件包](https://docs.obspy.org/)
学习并掌握地震学数据的获取、处理和分析。在开始本章内容之前，读者应：

- 阅读《{doc}`/programming/python`》一节，并安装 Miniconda 和 `mamba`
- 掌握 Python 的基本语法并了解如何执行 Python 代码

## 安装依赖包

本章中的地震学实践需要使用如下 Python 包：

- [ObsPy](https://docs.obspy.org/): 用于地震数据获取、处理和分析
- [cartopy](https://scitools.org.uk/cartopy/): 用于绘制地图
- [JupyterLab](https://jupyterlab.readthedocs.io/): 基于浏览器的交互式开发环境

通过如下命令安装所需依赖包：

```
$ mamba install obspy cartopy jupyterlab
```

## 检查当前环境

开启一个终端，在终端中键入 `jupyter lab` 命令来启动 JupyterLab。
在 JupyterLab 中新建一个 Notebook，并在 Notebook 中执行如下命令以检查当前环境。

```{code-cell} ipython3
import obspy
import matplotlib
import numpy
import cartopy

print("ObsPy version:", obspy.__version__)
print("Matplotlib version:", matplotlib.__version__)
print("NumPy version:", numpy.__version__)
print("cartopy version:", cartopy.__version__)
```
