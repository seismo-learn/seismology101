Ubuntu 配置指南
===============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-01-19

.. note::

   本节内容适用于 **Ubuntu 20.04.1 LTS Desktop**\，对其他 Ubuntu 版本不一定适用。
   建议用户安装 Ubuntu 20.04.1 LTS（长期支持版）或 Ubuntu 20.10（最新版）。

   本文尚未经过除作者外的其他用户验证，欢迎用户测试和反馈。

----

安装系统
--------

下载 ISO 镜像
^^^^^^^^^^^^^

访问\ `Ubuntu 官网 <https://ubuntu.com/>`__\ 并下载 Ubuntu Desktop 镜像，
一般选择 AMD64（x86_64）版本。

**Ubuntu 20.04.1 LTS Desktop AMD64** 的 ISO 文件下载链接：

- `官方镜像 <https://ubuntu.com/download/desktop/thank-you?version=20.04.1&architecture=amd64>`__
- `国内中科大镜像 <https://mirrors.ustc.edu.cn/ubuntu-releases/20.04.1/ubuntu-20.04.1-desktop-amd64.iso>`__

制作 USB 启动盘
^^^^^^^^^^^^^^^

在 Windows 下，可以使用 `Rufus <https://rufus.ie/zh_CN.html>`__ 制作
USB 启动盘。

从 USB 启动盘进入 Live 系统
^^^^^^^^^^^^^^^^^^^^^^^^^^^

将制作好的 USB 启动盘插入要安装 Linux 的计算机上，开机启动，进入 BIOS 设置
使计算机从 USB 盘启动。具体如何进入 BIOS 不同电脑不同，请自行查询。

若计算机无法从 USB 盘启动，则可能是由于计算机的“安全启动”设置导致的，可以尝试：

1. 进入 BIOS 设置
2. 在 BIOS 设置内关闭安全启动

如果尝试多次都无法正确从 USB 启动，则可能是 USB 启动盘制作失败，请尝试重新制作启动盘。

开始安装
^^^^^^^^



系统软件
--------

Ubuntu 使用 ``apt`` 包管理器来安装、卸载和管理软件包。常用命令有::

    # 搜索软件
    $ apt search xxx

    # 安装软件
    $ sudo apt install xxx

    # 卸载软件
    $ sudo apt remove xxx  （保留配置文件）
    $ sudo apt purge xxx  （删除配置文件）

    # 更新本地报数据库
    $ sudo apt update

    # 检查并升级所有已经安装的软件
    $ sudo apt upgrade

国内用户可以参考 https://mirrors.ustc.edu.cn/help/ubuntu.html 将软件源镜像替换
为中科大镜像，以加快软件下载速度。

编程开发环境
------------

C/C++
^^^^^

`GCC <https://gcc.gnu.org/>`__ 系列的 C/C++ 编译器是 Linux 下最常用的
C/C++ 编译器，其提供了 ``gcc`` 和 ``g++`` 命令::

    $ sudo apt install gcc g++

`Clang <https://clang.llvm.org/>`__ 系列是 GCC 系列的一大竞争者。相比于 GCC
编译器，Clang 编译器提供了更友好的报错信息，方便在报错时尽快找到错误。Clang
编译器提供了 ``clang`` 和 ``clang++`` 命令::

    $ sudo apt install clang

Fortran
^^^^^^^

若需要编译 Fortran 程序，则可以安装 `GNU Fortran <https://gcc.gnu.org/fortran/>`__
编译器（即 ``gfortran``\ ）::

    $ sudo apt install gfortran

Java
^^^^

要运行 Java 程序，需要安装 Java 运行环境，即 OpenJDK::

    $ sudo apt update
    $ sudo apt install default-jdk

Python
^^^^^^

Ubuntu 20.04.1 自带了 Python 3.8，足够日常使用，但强烈建议不要使用系统自带的 Python，
而建议通过 :doc:`Anaconda <software:anaconda/index>` 来安装和管理 Python。

git
^^^

`git <https://git-scm.com/>`__ 是最流行的版本控制工具，也是科研过程中编写代码
以及项目管理推荐使用的软件。一般情况下这个软件系统里已经装了。如果没安装，
可以使用如下命令安装::

    $ sudo apt install git


命令行工具
----------

Ubuntu 系统默认已经安装了日常科研所需的大多数命令行工具。

这一部分暂无推荐。

日常软件
--------

文本编辑器
^^^^^^^^^^

Ubuntu 系统自带的文本编辑器 Gedit 只具有最基本的文本编辑功能，无法满足日常编程需求。
推荐安装更强大的文本编辑器 `Visual Studio Code <https://code.visualstudio.com/>`__\ 。
根据\ `官方安装说明 <https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions>`__
安装即可。

解压软件
^^^^^^^^

Ubuntu 的归档管理器可以识别并打开 Linux 下的常见压缩格式（如 ``.tar.gz``\ 、
``.tar.bz2`` 等），也支持一些 Windows 和 macOS 下常见的压缩格式（如 ``.zip`` 和 ``.7z``\ ），
但默认不支持 ``.rar`` 格式。需要安装 `unar <https://theunarchiver.com/command-line>`__
才能够直接解压 ``.rar`` 格式::

    $ sudo apt install unar

Google Earth
^^^^^^^^^^^^

非重度用户可以直接使用 `Google Earth Web 版 <https://earth.google.com/web>`__\，
重度用户可以安装桌面版应用。

1. 到 https://www.google.com/earth/versions/#download-pro 下载 64 位 deb 包
2. 下载完成后双击 deb 安装包即可安装

Chrome 浏览器
^^^^^^^^^^^^^

Ubuntu 20.04.1 自带了 Firefox 浏览器，用户也可以安装 Google Chrome 浏览器::

    # 下载 Google Chrome 的 deb 软件包
    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    # 安装 Google Chrome
    $ sudo apt install ./google-chrome-stable_current_amd64.deb

WPS Office
^^^^^^^^^^

Ubuntu 自带了 LibreOffice，可完成简单的查看和编辑文档的功能，但其兼容性一般。
兼容性更好的是 WPS Office。

1.  访问 `WPS Office for Linux 官网 <https://linux.wps.cn/>`__
2.  下载 64位 deb 格式的安装包
3.  双击下载的 deb 安装包即可安装
