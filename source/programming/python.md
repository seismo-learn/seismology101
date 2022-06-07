# Python 语言

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（审稿）
- 最近更新日期: 2022-06-06
- 预计花费时间: 30 分钟

---

## 简介

[Python](https://www.python.org/) 是一种广泛使用的通用编程语言，其具有语法简单、
功能强大等优点，是目前地震学科研最常用的编程语言之一。

## 安装 Miniconda

Python 是一种解释型语言，需要专门的解释器去执行 Python 代码。
尽管 Linux/macOS 系统内置了 Python 解释器，但是建议用户不要使用它，
以免误操作破坏系统内置 Python， 造成系统出现问题。
**建议用户安装 Miniconda， 使用其提供的 `conda` 命令管理和安装 Python 及其模块。**

:::{dropdown} Python vs Anaconda vs Miniconda
:color: info
:icon: info

在安装和使用 Miniconda 前，读者有必要了解 Python、Anaconda 和 Miniconda 三者
之间的区别与联系：

Python 解释器
: 从 [Python 官方网站](https://www.python.org/downloads/) 下载的 Python 安装包
  只提供了一个 Python 解释器，仅包含 Python 的核心模块和库，是运行 Python
  脚本所必需的。安装 Python 解释器相当于安装了 Python 解释器 + 核心模块/库。

Anaconda
: [Anaconda](https://www.anaconda.com/) 是一个 Python **发行版**，不仅提供了
  Python 解释器，还内置了很多 Python 开发工具与众多科学计算相关的库，形成了
  一个可以开箱即用的 Python 科学计算环境，省去了自行配置科学计算环境的麻烦。
  Anaconda 还提供了强大的软件包管理工具 `conda`，可以方便地安装模块和管理环境。
  安装 Anaconda 相当于安装了 Python 解释器 + 核心模块/库 + 数百个科学计算相关模块 + 包管理器 `conda`。

  尽管 Anaconda 有很多优点，其也有明显的缺点：
  - 安装包非常大（超过 500 MB）
  - 安装过程耗时长（一般超过 5 分钟）
  - 安装后占用大量硬盘空间（一般超过 3 GB）
  - 安装了很多平时用不到的模块，进而导致安装新模块时会可能出现版本冲突

Miniconda
: [Miniconda](https://docs.conda.io/en/latest/miniconda.html) 是 Anaconda 的精简版。
  它继承了 Anaconda 的优点，同时避免了 Anaconda 的臃肿。其安装包只有约 50 MB，安装
  通常也只需要数十秒。安装 Miniconda 相当于安装了 Python 解释器 + 核心模块/库 + 包管理器 `conda`。
:::

下面展示了如何在 Linux 系统下安装 Miniconda：

1. 下载 Miniconda

   下载地址：[Miniconda3-latest-Linux-x86_64.sh](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh)

2. 安装 Miniconda

   ```
   $ bash Miniconda3-latest-Linux-x86_64.sh
   ```

   Miniconda 默认会安装到 {file}`${HOME}/miniconda3` 下，在安装过程中可以
   设置为其他路径。

   安装通常只需要十几秒，在安装的最后会出现：

        Do you wish the installer to initialize Miniconda3 by running conda init? [yes|no]
        [yes] >>>

   建议输入 `yes`，此时安装包会向当前 SHELL 的配置文件写入 `conda` 初始化语句。

3. 测试安装

   打开一个新的终端，在终端中输入 `python`，输出中看到 **Anaconda, Inc.**
   字样即代表安装完成：

        $ python
        Python 3.9.12 (main, Apr  5 2022, 01:53:17)
        [Clang 12.0.0 ] :: Anaconda, Inc. on darwin
        Type "help", "copyright", "credits" or "license" for more information.
        >>>

   在提示符 `>>>` 后输入 `quit()` 后按下 {kbd}`Enter` 键退出 Python。

## Python 脚本

## 执行 Python 脚本

## Jupyter Notebook

## 如何安装模块

## 科学计算相关模块

以下是日常科研中经常需要使用的基础 Python 科学计算模块：

- [NumPy](https://numpy.org/)
- [Matplotlib](https://matplotlib.org/)
- [pandas](https://pandas.pydata.org/)
- [SciPy](https://scipy.org/)

## 学习资源

- [官方文档](https://docs.python.org/zh-cn/3/)、[官方入门教程](https://docs.python.org/zh-cn/3/tutorial/index.html)（全面、系统）
- [Python 教程](https://www.liaoxuefeng.com/wiki/1016959663602400)（较全面、系统）
- [Scipy Lecture Notes](https://scipy-lectures.org/index.html)（较全面、系统）
- [X 分钟速成 Python](https://learnxinyminutes.com/docs/zh-cn/python-cn/)（简要）
- [A Visual Intro to NumPy and Data Representation](https://jalammar.github.io/visual-numpy/)（简要、形象地介绍 NumPy 数据结构）
