Ubuntu 配置指南
===============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-01-21
:预计花费时间: 120 分钟

.. note::

   本节内容适用于 **Ubuntu Desktop 20.04.1 LTS**\，对其他 Ubuntu 版本不一定适用。
   建议用户安装时总是选择 Ubuntu 最新的长期支持版（目前是 Ubuntu 20.04.1 LTS）或最新版本（目前是 Ubuntu 20.10）。
   如遇到问题，欢迎反馈。

----

安装系统
--------

.. note::

   安装 Ubuntu 也可以参考 https://techz.io/how-to-install-ubuntu/
   给出的详细步骤与图解。

下载系统镜像
^^^^^^^^^^^^

访问 `Ubuntu 官网 <https://ubuntu.com/>`__ 并下载 Ubuntu Desktop 镜像，
一般选择 AMD64（x86_64）版本。

**Ubuntu Desktop 20.04.1 LTS AMD64** 的 ISO 文件下载链接：

- `官方镜像 <https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso>`__
- `国内中科大镜像 <https://mirrors.ustc.edu.cn/ubuntu-releases/20.04.1/ubuntu-20.04.1-desktop-amd64.iso>`__

制作 USB 启动盘
^^^^^^^^^^^^^^^

可以使用 `Rufus <https://rufus.ie/zh_CN.html>`__\ （仅限 Windows）、\
`UNetbootin <https://unetbootin.github.io/>`__\ （跨平台）、\
`balenaEtcher <https://www.balena.io/etcher/>`__\ （跨平台）
制作 USB 启动盘。

进入 Live 系统
^^^^^^^^^^^^^^^

将制作好的 USB 启动盘插入要安装 Ubuntu 系统的计算机上，开机启动，
按下 F10 或 F12 进入 BIOS，并使计算机优先从 USB 盘启动。
注意，不同型号的电脑进入 BIOS 的方法可能不同，请自行查询。

若计算机无法从 USB 盘启动，则可能是由于计算机的“安全启动”设置导致的，可以尝试
进入 BIOS 设置，并在 BIOS 设置内关闭“安全启动”。

如果尝试多次都无法正确从 USB 启动，则可能是 USB 启动盘制作失败，请尝试重新制作启动盘。

开始安装
^^^^^^^^

进入引导加载程序之后，选择“Ubuntu”。

引导加载程序首先要你选择安装过程中的语言，可以选择“中文（简体）”
或 “English”，然后点击“Install Ubuntu” 即开始安装。接着选择键盘布局
（汉语或 “English(US)”）。

选择“正常安装”，建议勾选“安装 Ubuntu 时下载更新”和“为图形或无线硬件，以及
其他媒体格式安装第三方软件”。

在“安装类型”中，选择“清除整个硬盘并安装 Ubuntu”。
也可以点击“高级功能”选择启用和配置整个磁盘加密，使用 LVM，
或使用 ZFS 文件系统。用户可选择“其他选项”自定义分区，但需要你了解 Linux 的分区操作。
对于大多数人来说，默认选项可能会很好。

单击“现在安装”，选择“继续”。

选择时区（例如“上海”）。

输入账户信息。注意用户名只能是英文。

等待安装完成，点击“现在重启”。
重启计算机时，记得拔出 USB 启动盘，以免再次进入 USB 安装镜像。

更新系统
^^^^^^^^

当已安装的软件有可用的更新，或 Ubuntu 系统可升级至新版本时，
Ubuntu 会弹出提醒通知。建议用户及时更新系统及安装的软件。

系统软件
--------

Ubuntu 使用包管理器 ``apt`` 来安装、卸载和管理软件包。

.. note::

   国内用户可以参考 https://mirrors.ustc.edu.cn/help/ubuntu.html 将软件源镜像替换
   为中科大镜像，以加快软件下载速度。
   
   注意，在替换软件源后要执行 ``sudo apt update`` 更新本地缓存的软件包元数据。

``apt`` 的详细用法请阅读 `apt 帮助文档 <http://manpages.ubuntu.com/manpages/focal/man8/apt.8.html>`__\ ，
这里只介绍一些常用命令::

    # 更新软件包索引文件
    $ sudo apt update

    # 检查并升级所有已经安装的软件
    $ sudo apt upgrade

    # 搜索软件
    $ apt search xxx

    # 安装或升级软件
    $ sudo apt install xxx

    # 卸载软件
    $ sudo apt remove xxx  （保留配置文件）
    $ sudo apt purge xxx  （删除配置文件）

编程开发环境
------------

C/C++
^^^^^

`GCC <https://gcc.gnu.org/>`__ 系列的 C/C++ 编译器是 Linux 下最常用的
C/C++ 编译器，其提供了 ``gcc`` 和 ``g++`` 命令::

    $ sudo apt install gcc g++

`Clang <https://clang.llvm.org/>`__ 系列是 GCC 系列的一大竞争者。与 GCC
编译器相比，Clang 编译器提供了更友好的报错信息，方便在报错时尽快找到错误。Clang
编译器提供了 ``clang`` 和 ``clang++`` 命令::

    $ sudo apt install clang

Fortran
^^^^^^^

`GNU Fortran <https://gcc.gnu.org/fortran/>`__ 编译器是 Linux 下最常用的
Fortran 编译器，其提供了 ``gfortran`` 命令::

    $ sudo apt install gfortran

Java
^^^^

运行 Java 程序需要安装 Java 运行环境，即 OpenJDK::

    $ sudo apt install default-jdk

Python
^^^^^^

Ubuntu 20.04.1 自带了 Python 3.8，足够日常使用，但强烈建议不要使用系统自带的 Python，
而建议通过 :doc:`Anaconda <software:anaconda/index>` 来安装和管理 Python。

git
^^^

`git <https://git-scm.com/>`__ 是目前最流行的版本控制工具，是科研过程中编写代码
与项目管理推荐使用的软件。一般情况下系统已经安装了该软件。如果没安装，
可以使用如下命令安装::

    $ sudo apt install git

X11
^^^

X11（也称 X Window System 或 X）是 UNIX 系统下常用的一种视窗系统。某些软件
（如 SAC 和 CPS330）::

    $ sudo apt install libx11-dev

命令行工具
----------

日常科研所需的大多数命令行工具已经默认安装在 Ubuntu 系统里了。

这一部分暂无推荐。

日常软件
--------

文本编辑器
^^^^^^^^^^

Ubuntu 系统自带的文本编辑器 Gedit 只具有最基本的文本编辑功能，无法满足日常编程需求。
推荐安装并使用更强大的文本编辑器 `Visual Studio Code <https://code.visualstudio.com/>`__\ 。
根据\ `官方安装说明 <https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions>`__\
安装即可。

解压软件
^^^^^^^^

Ubuntu 的归档管理器可以识别并打开 Linux 下的常见压缩格式（如 ``.tar.gz``\ 、
``.tar.bz2`` 等），也支持 Windows 和 macOS 下的常见压缩格式（如 ``.zip`` 和 ``.7z``\ ），
但默认不支持 ``.rar`` 格式。安装 `unar <https://theunarchiver.com/command-line>`__
后方可通过双击 ``.rar`` 文件直接解压::

    $ sudo apt install unar

Google Earth
^^^^^^^^^^^^

非重度用户可以直接使用 `Google Earth 网页版 <https://earth.google.com/web>`__\，
重度用户可以按照如下步骤安装桌面版。

1. 下载 64 位 deb 包：https://www.google.com/earth/versions/#download-pro
2. 双击下载的 deb 安装包即可安装

Google Chrome 浏览器
^^^^^^^^^^^^^^^^^^^^^

Ubuntu 自带了 Firefox 浏览器，用户也可以安装 Google Chrome 浏览器::

    # 下载 Google Chrome 的 deb 软件包
    $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    # 安装 Google Chrome
    $ sudo apt install ./google-chrome-stable_current_amd64.deb

WPS Office
^^^^^^^^^^

Ubuntu 自带的 LibreOffice 具有简单的文档查看和编辑功能，但其兼容性一般。
兼容性更好的是 WPS Office。

1.  下载 64位 deb 格式的安装包：`WPS Office for Linux 官网 <https://linux.wps.cn/>`__
2.  双击下载的 deb 安装包即可安装
