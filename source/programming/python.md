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

:::{dropdown} Python、Anaconda 和 Miniconda 的区别与联系
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

下面展示了如何在 Linux 系统下安装 Miniconda。其它操作系统下的安装说明以及具体使用方法可以参考 {doc}`Anaconda <software:anaconda/index>`。

1. 下载 Miniconda

   下载地址：[Miniconda3-latest-Linux-x86_64.sh](https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh)

2. 安装 Miniconda

   ```
   $ bash Miniconda3-latest-Linux-x86_64.sh
   ```

   Miniconda 默认会安装到 {file}`${HOME}/miniconda3` 下，在安装过程中可以
   设置为其他路径。

   安装通常只需要十几秒，在安装的最后会出现：

        Do you wish the installer to initialize Miniconda3
        by running conda init? [yes|no]
        [no] >>>

   输入 `yes` 则安装包会向当前 SHELL 的配置文件写入 `conda` 初始化语句。

3. 测试安装

   打开一个新的终端，在终端中输入 `python`，输出中看到 **Anaconda, Inc.**
   字样即代表成功安装 Miniconda 并启动了 Python 解释器：

        $ python
        Python 3.9.12 (main, Apr  5 2022, 01:53:17)
        [GCC 7.5.0] :: Anaconda, Inc. on linux
        Type "help", "copyright", "credits" or "license" for more information.
        >>>

   在提示符 `>>>` 后输入 `quit()` 后按下 {kbd}`Enter` 键退出 Python 解释器。

## 初识 Python

打开终端，输入 `python` 就会进入 Python 解释器的交互模式：

```
$ python
Python 3.9.12 (main, Apr  5 2022, 01:53:17)
[GCC 7.5.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

进入 Python 解释器后，首先会显示 Python 版本信息、版权声明以及帮助信息，
然后会显示符号 `>>>`。`>>>` 是 Python 解释器在交互模式下的主提示符，提示用户
可以在 `>>>` 后输入 Python 指令。

在 `>>>` 提示符后输入 `1 + 2` 并按下 {kbd}`Enter` 键将指令 `1 + 2` 传给 Python
解释器。解释器接收指令后会执行指令，输出结果 `3`，并再次显示主提示符
`>>>` 等待用户的下一次输入。
```python
>>> 1 + 2
3
>>>
```
:::{tip}
Python 解释器可以当做一个快捷的计算器来使用！
:::

下面继续看一个稍复杂点的例子。给变量 `x` 赋值，然后紧跟着一个判断语句
“如果 x 的值大于 0，则打印字符串 Hello world!”。
```python
>>> x = 5
>>> if x > 0:
...     print("Hello world!")
...
Hello world!
>>>
```
这个判断语句无法在一行写完，因而需要写成多行语句。
在主提示符后输入 `if x > 0:` 并按下 {kbd}`Enter` 键，会显示符号 `...`。
`...` 是 Python 解释器在交互模式下的次提示符，用于表明多行语句还没写完，需要继续输入。
在次提示符 `...` 后不输入指令而直接键入 {kbd}`Enter`，表示该代码块已结束。
Python 解释器会对输入的多行语句进行解释，并输出字符串“Hello world!”。
:::{note}
C 语言使用大括号 `{ }` 划分代码块，而 Python 中使用缩进划分代码块！
因而上面的例子中 `print` 前需要用空格缩进（通常是 4 个空格）。
:::

在主提示符 `>>>` 后输入 `quit()` 或者按下 {kbd}`Ctrl` + {kbd}`D` 键
即可退出 Python 解释器的交互模式。
```python
>>> quit()
```

## 安装 Python 包

Python 语言的一大特色是其众多功能丰富的标准库和第三方包（也称为模块或库）。
Python 解释器中已经内置了所有标准库，因而安装解释器后就可以直接使用所有标准库。
想要使用第三方包，首先要学会如何安装。

**推荐使用 [`mamba`](https://mamba.readthedocs.org/) 和 [`pip`](https://pip.pypa.io/) 安装 Python 包。**

:::{dropdown} pip、conda 与 mamba
:color: info
:icon: info

在学习如何安装 Python 包之前，读者有必要了解 pip、conda 和 mamba 的区别与联系:

[`pip`](https://pip.pypa.io/)
: `pip` 是 Python 官方提供的包管理器，可以用于安装 [Python 包索引网站 PyPI](https://pypi.org/)
  上的几十万个 Python 包，也可以从源码安装 Python 包。

[`conda`](https://docs.conda.io/)
: `conda` 是 Anaconda/Miniconda 提供的包管理器，其不仅可以安装 Python 包，还可以
  安装非 Python 包（理论上可以安装任何软件！）。
  `conda` 可安装的包位于 https://anaconda.org/。
  `pip` 与 `conda` 的详细对比，可以参考
  [Anaconda 官方博文](https://www.anaconda.com/blog/understanding-conda-and-pip)。

[`mamba`](https://mamba.readthedocs.org/)
: `conda` 虽然好用，但有一个最大的缺点：慢

  1. 安装软件前需要先解析软件之间的版本依赖关系，这一步骤很慢
  2. 下载、安装软件包的过程很慢

  `mamba` 是 `conda` 的替代品，其核心代码是用 C 写的，因而解析软件的版本依赖关系
  非常快，且可以并行下载和安装软件包，可以极大减少安装软件的等待时间。
  `mamba` 的用法与 `conda` 几乎完全一致，网络上看到的 `conda` 命令，将 `conda`
  替换为 `mamba` 即可直接执行。
:::

Miniconda 中提供了 `conda` 命令，所以安装 Miniconda 后就可以直接使用 `conda`
命令了。先对 `conda` 做一些简单的配置：

```
# 增加 conda-forge 通道，可以安装更多的软件
$ conda config --add channels conda-forge
# 显示通道的 URL
$ conda config --set show_channel_urls true
# 配置使用国内清华源以加快软件下载速度
$ conda config --add default_channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
$ conda config --set 'custom_channels.conda-forge' https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

为了使用 `mamba`，需要通过 `conda` 安装 `mamba`：
```
$ conda install 'mamba>=0.16'
```

安装 `mamba` 后，执行如下初始化命令：
```
$ mamba init bash
```

从此之后，就可以告别 `conda`，只使用 `mamba` 即可完成所有任务了。
使用 `mamba` 安装软件很简单，直接 `mamba install` 加上一堆软件包的名字即可。

读者可以执行如下命令，安装接下来需要用到的几个 Python 包。
```
$ mamba install numpy matplotlib jupyterlab
```

## Python 脚本

## 执行 Python 脚本

## Jupyter Notebook

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
