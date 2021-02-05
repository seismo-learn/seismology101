Fedora 配置指南
===============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（审稿）
:最近更新日期: 2021-01-25
:预计花费时间: 120 分钟

.. note::

   本节内容适用于 **Fedora 33 Workstation**\，对其他 Fedora 版本不一定适用。
   建议用户安装时总是选择 Fedora 最新版本。如遇到问题，欢迎反馈。

----

安装系统
--------

.. note::

   安装 Fedora 也可以参考 https://techz.io/how-to-install-fedora/
   给出的详细步骤与图解。

下载系统镜像
^^^^^^^^^^^^

访问 `Fedora 官网 <https://getfedora.org/>`__ 并下载 Fedora Workstation 镜像，
一般选择 x86_64 版本。

**Fedora 33 Workstation x86_64** 的 ISO 文件（约 2 GB）下载链接：

- `官方镜像 <https://download.fedoraproject.org/pub/fedora/linux/releases/33/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-33-1.2.iso>`__
- `中科大镜像 <http://mirrors.ustc.edu.cn/fedora/releases/33/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-33-1.2.iso>`__ [**推荐国内用户使用**]

制作 USB 启动盘
^^^^^^^^^^^^^^^

准备一个 4 GB 以上容量的 U 盘，利用 USB 启动盘制作工具和 ISO 镜像文件
制作 USB 启动盘。

USB 启动盘制作工具有很多，推荐使用 `Rufus <https://rufus.ie/zh_CN.html>`__\ （仅限 Windows）、\
`UNetbootin <https://unetbootin.github.io/>`__\ （跨平台）
或 `balenaEtcher <https://www.balena.io/etcher/>`__\ （跨平台）。

.. warning::

   制作 USB 启动盘时会格式化 U 盘！请确保 U 盘中无重要文件！

进入 Live 系统
^^^^^^^^^^^^^^

将制作好的 USB 启动盘插入要安装 Fedora 系统的计算机上，开机启动，
按下 :kbd:`F10` 或 :kbd:`F12` 进入 BIOS，并使计算机优先从 USB 盘启动。
正确启动后，则会进入 GRUB，按向上向下键选中“Start Fedora-Workstation-Live 33”
以进入 Fedora 的 Live 系统。

.. note::

    Live 系统是指安装在 USB 启动盘中的操作系统。用户可以在 Live 系统中进行
    任何操作以体验该系统。

.. tip::

    1.  不同型号的电脑进入 BIOS 的方法可能不同，请自行查询。
    2.  若计算机无法从 USB 盘启动，则可能是由于计算机的“安全启动”设置导致的，
        可以尝试进入 BIOS 设置，并在 BIOS 设置内关闭“安全启动”。
    3.  如果尝试多次都无法正确从 USB 启动，则可能是 USB 启动盘制作失败，请尝试重新制作启动盘。

开始安装
^^^^^^^^

进入 Live 系统之后，选择 “Install to Hard Drive” 即开始安装。

安装程序会首先要你选择安装过程中的语言，可以选择“中文”->“简体中文（中国）”
或 “English”->“English (Unite States)”，然后点击下方的“继续”按钮。
接着选择键盘布局（汉语或 “English(US)”）、时区和时间（例如“亚洲-上海”）。

点击“安装目的地”，选择要将系统安装到哪一块硬盘以及如何分区。

在“设备选择”中，选择要使用哪些硬盘安装系统。如果计算机有多个硬盘，可以
将多个硬盘都选中，被选中的硬盘会有一个“对号”符号。需要注意，不要选中 USB 启动盘。

在“存储设置”中，选择“自动”让安装程序进行自动分区。也可以选择“自定义”，
但需要你了解 Linux 的分区操作。由于 Fedora 33 采用了最新的 btrfs 文件系统，
所以对于 Fedora 33 而言，使用默认的“自动”分区即可。

点击“开始安装”即进入正式安装过程。

等待安装完成，点击“完成安装”，并重启计算机。
重启计算机时，记得拔出 USB 启动盘，以免计算机再次进入 Live 系统。

重启后会进入欢迎页面，需要添加账户。注意用户名只能是英文。

更新系统
^^^^^^^^

当已安装的软件有可用的更新，或 Fedora 系统可升级至新版本时，
Fedora 会弹出提醒通知。建议用户及时更新系统及已安装的软件。

系统软件
--------

Fedora 使用包管理器 ``dnf`` 来安装、卸载和管理软件包。

.. note::

   国内用户可以参考 http://mirrors.ustc.edu.cn/help/fedora.html 将软件源镜像替换
   为中科大镜像，以加快软件下载速度。

   注意：在替换软件源后要执行 ``sudo dnf makecache`` 更新本地缓存的软件包元数据。

``dnf`` 的详细用法请阅读 `dnf 参考文档 <https://dnf.readthedocs.io/en/latest/index.html>`__\ ，
这里只介绍一些常用命令::

    # 更新本地软件包元数据缓存
    $ sudo dnf makecache

    # 检查并升级所有已经安装的软件
    $ sudo dnf upgrade

    # 检查并升级某软件
    $ sudo dnf upgrade xxx

    # 搜索软件
    $ dnf search xxx

    # 安装软件
    $ sudo dnf install xxx

    # 卸载软件
    $ sudo dnf remove xxx

.. tip::

    Linux 用户也可以访问 https://pkgs.org/ 网站查询软件包。
    该网站支持多种 Linux 发行版和多个官方及第三方软件仓库，
    且为每个软件包提供了丰富的元信息、依赖和被依赖关系、包含的文件、
    安装方式以及更新历史等信息。

编程开发环境
------------

C/C++
^^^^^

`GCC <https://gcc.gnu.org/>`__ 系列的 C/C++ 编译器是 Linux 下最常用的
C/C++ 编译器，其提供了 ``gcc`` 和 ``g++`` 命令::

    $ sudo dnf install gcc gcc-c++

`Clang <https://clang.llvm.org/>`__ 系列是 GCC 系列的一大竞争者。与 GCC
编译器相比，Clang 编译器提供了更友好的报错信息，方便在报错时尽快找到错误。Clang
编译器提供了 ``clang`` 和 ``clang++`` 命令::

    $ sudo dnf install clang

Fortran
^^^^^^^

`GNU Fortran <https://gcc.gnu.org/fortran/>`__ 编译器是 Linux 下最常用的
Fortran 编译器，其提供了 ``gfortran`` 命令::

    $ sudo dnf install gcc-gfortran

Intel 软件开发工具包
^^^^^^^^^^^^^^^^^^^^

`Intel oneAPI Toolkits <https://software.intel.com/content/www/us/en/develop/tools/oneapi.html>`__
是英特尔最新的软件开发工具包。它也提供了 C/C++ 编译器和 Fortran 编译器（``icc`` 和 ``ifort`` 命令）。
此外还有 MKL 数学库、MPI 并行库等。该工具包是免费的，不需要许可证。

在 Fedora 系统下，官方手册提供了多种\
`安装方式 <https://software.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-linux/top.html>`__\ ，
如在线安装、本地安装、使用 ``dnf`` 安装、使用 ``conda`` 安装等。这里，我们选择使用 ``dnf`` 安装。

下载 :file:`.repo` 文件 :download:`oneAPI.repo`\ ，并将其放在 :file:`/etc/yum.repos.d` 目录下::

    $ sudo mv oneAPI.repo /etc/yum.repos.d/

日常科研安装 Base Toolkit 和 HPC Toolkit 两个工具包即可。默认安装目录是 :file:`/opt/intel/oneapi`::

    $ sudo dnf install intel-basekit
    $ sudo dnf install intel-hpckit

配置环境变量::

    $ echo "source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1" >> ~/.bashrc

更多设置可以参考\ `官方手册 <https://software.intel.com/content/www/us/en/develop/documentation/get-started-with-intel-oneapi-base-linux/>`__\ 。

.. include:: intel-oneAPI-warning.rst_

Java
^^^^

运行 Java 程序需要安装 Java 运行环境，即 OpenJDK::

    $ sudo dnf install java-latest-openjdk

Python
^^^^^^

Fedora 33 自带了 Python 3.9，足够日常使用，但强烈建议不要使用系统自带的 Python，
而建议通过 :doc:`Anaconda <software:anaconda/index>` 来安装和管理 Python。

git
^^^

`git <https://git-scm.com/>`__ 是目前最流行的版本控制工具，是科研过程中编写代码
与项目管理推荐使用的软件。一般情况下系统已经安装了该软件。如果没安装，
可以使用如下命令安装::

    $ sudo dnf install git

命令行工具
----------

日常科研所需的大多数命令行工具已经默认安装在 Fedora 系统里了。这里额外推荐一些
有用的命令行工具。

tldr
^^^^

`tldr <https://tldr.sh/>`__ 是一个提供命令的常用用法和示例的命令行工具，
其功能与 UNIX 下的 ``man`` 命令相似，但其提供的输出更简单、更易读。
安装 ``tldr``::

    $ sudo dnf install tldr

ack
^^^

`ack <https://beyondgrep.com/>`__ 是一个字符搜索工具，与 ``grep`` 命令类似。
其专为搜索源代码设计，因而在日常编程中更加简单易用。安装 ``ack``::

    $ sudo dnf install ack

日常软件
--------

文本编辑器
^^^^^^^^^^

Fedora 系统自带的文本编辑器 Gedit 只具有最基本的文本编辑功能，无法满足日常编程需求。
推荐安装并使用更强大的文本编辑器 `Visual Studio Code <https://code.visualstudio.com/>`__\ 。
根据\ `官方安装说明 <https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions>`__\
安装即可。

解压软件
^^^^^^^^

Fedora 的归档管理器可以识别并打开 Linux 下的常见压缩格式（如 ``.tar.gz``\ 、
``.tar.bz2`` 等），也支持 Windows 和 macOS 下的常见压缩格式（如 ``.zip`` 和 ``.7z``\ ），
但默认不支持 ``.rar`` 格式。安装 `unar <https://theunarchiver.com/command-line>`__
后即可通过双击 ``.rar`` 文件直接解压::

    $ sudo dnf install unar

终端
^^^^^

Fedora 自带的终端模拟器是 GNOME Terminal，使用起来中规中矩。
日常科研经常需要开好几个终端，切换和管理起来比较麻烦。

`Terminator <https://gnome-terminator.org/>`__
是一个功能强大的终端模拟器，最常用的功能应该是终端分割和终端切换。
使用如下命令安装::

    $ sudo dnf install terminator

以下介绍几个常用快捷键，详细用法见\ `官方文档 <https://gnome-terminator.readthedocs.io/>`__：

- :kbd:`Ctrl` + :kbd:`Shift` + :kbd:`O`\ : 水平分隔终端
- :kbd:`Ctrl` + :kbd:`Shift` + :kbd:`E`\ :  垂直分隔终端
- :kbd:`Alt` + :kbd:`上下左右`\ :  切换子终端

Google Earth
^^^^^^^^^^^^

非重度用户可以直接使用 `Google Earth 网页版 <https://earth.google.com/web>`__\，
重度用户可以按照如下步骤安装桌面版。

1. 下载 64 位 RPM 包：https://www.google.com/earth/versions/#download-pro
2. 双击下载的 RPM 安装包即可安装

浏览器
^^^^^^

Fedora 自带了 Firefox 浏览器，用户也可以安装 Google Chrome 浏览器::

    # 添加第三方源
    $ sudo dnf install fedora-workstation-repositories
    # 启用 google-chrome 源
    $ sudo dnf config-manager --set-enabled google-chrome
    # 安装 Google Chrome
    $ sudo dnf install google-chrome-stable

WPS Office
^^^^^^^^^^

Fedora 自带的 LibreOffice 具有简单的文档查看和编辑功能，但其兼容性一般。
兼容性更好的是 WPS Office。

1.  下载 64位 RPM 格式的安装包：`WPS Office for Linux 官网 <https://linux.wps.cn/>`__
2.  双击下载的 RPM 安装包即可安装
