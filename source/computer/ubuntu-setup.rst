Ubuntu 配置指南
===============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-11-20
:预计花费时间: 120 分钟

----

.. note::

   本节内容适用于 **Ubuntu Desktop 20.04.3 LTS**，不一定适用于其他 Ubuntu 版本。
   建议用户总是选择 Ubuntu 最新的长期支持版（目前是 Ubuntu 20.04 LTS）或最新版本
   （目前是 Ubuntu 21.10），也欢迎用户帮助我们更新本文以适配 Ubuntu 最新版本。

安装系统
--------

.. note::

   安装 Ubuntu 也可以参考 https://techz.io/how-to-install-ubuntu/
   给出的详细步骤与图解。

下载系统镜像
^^^^^^^^^^^^

访问 `Ubuntu 官网 <https://ubuntu.com/>`__ 并下载 Ubuntu Desktop 镜像文件，
一般选择 AMD64（x86_64）版本。

**Ubuntu Desktop 20.04.3 LTS AMD64** 的 ISO 镜像文件（约 2.9 GB）下载链接：

- `官方镜像 <https://releases.ubuntu.com/focal/ubuntu-20.04.3-desktop-amd64.iso>`__
- `中科大镜像 <https://mirrors.ustc.edu.cn/ubuntu-releases/20.04/ubuntu-20.04.3-desktop-amd64.iso>`__ [**推荐国内用户使用**]

制作 USB 启动盘
^^^^^^^^^^^^^^^

准备一个 4 GB 以上容量的 U 盘。使用 `Ventoy <https://ventoy.net/cn/>`__ 制作
USB 启动盘，并将 ISO 镜像文件复制到 U 盘的镜像分区中。Ventoy 可以在
Windows 和 Linux 下使用，详细用法见 `官方文档 <https://ventoy.net/cn/doc_start.html>`__。

.. warning::

   制作 USB 启动盘时会格式化 U 盘！请确保 U 盘中无重要文件！

进入 Live 系统
^^^^^^^^^^^^^^

将制作好的 USB 启动盘插入要安装 Ubuntu 系统的计算机上，开机启动，
按下 :kbd:`F10` 或 :kbd:`F12` 进入 BIOS，并使计算机优先从 USB 盘启动。
正确启动后，则会进入 GRUB，按向上向下键选中“Ubuntu”以进入 Ubuntu 的 Live 系统。

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

安装程序会首先要你选择安装过程中的语言，可以选择“中文（简体）”
或 “English”，然后点击“Install Ubuntu” 即开始安装。接着选择键盘布局
（汉语或 “English(US)”）。

选择“正常安装”，建议勾选“安装 Ubuntu 时下载更新”和“为图形或无线硬件，以及
其他媒体格式安装第三方软件”。

在“安装类型”中，选择“清除整个硬盘并安装 Ubuntu”。
也可以点击“高级功能”选择启用和配置整个硬盘加密，使用 LVM，
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

.. warning::

    更新系统前，特别是大版本更新（如 Ubuntu 20.04 更新为 Ubuntu 20.10），
    最好先进行一次备份（可以参考\ :doc:`/best-practices/backup`）。

.. note::

   本节接下来介绍的大部分软件都通过命令行安装。在桌面或菜单栏中找到并点击
   “Terminal” 图标以启动终端，然后在终端中输入命令并按下 :kbd:`Enter` 键
   即可执行相应的命令。

系统软件
--------

Ubuntu 系统自带了“软件中心”，可用于查找、安装、卸载和管理软件包，但一般建议使用
命令行工具 ``apt`` 安装和管理软件。

.. note::

   ``apt`` 会从 Ubuntu 软件源下载软件包。
   国内用户可以参考 https://mirrors.ustc.edu.cn/help/ubuntu.html 将默认软件源镜像
   替换为中科大镜像，以加快软件下载速度。

   注意：在替换软件源镜像后要执行 ``sudo apt update`` 更新本地缓存的软件包元数据。

``apt`` 的详细用法请阅读 `apt 帮助文档 <http://manpages.ubuntu.com/manpages/focal/man8/apt.8.html>`__，
这里只介绍一些常用命令::

    # 更新本地软件包元数据
    $ sudo apt update

    # 检查并升级所有已经安装的软件
    $ sudo apt upgrade

    # 搜索软件
    $ apt search xxx

    # 安装或升级软件
    $ sudo apt install xxx

    # 检查并升级某软件
    $ sudo apt --only-upgrade install xxx

    # 卸载软件
    $ sudo apt remove xxx  （保留配置文件）
    $ sudo apt purge xxx  （删除配置文件）

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

    $ sudo apt install gcc g++

Fortran
^^^^^^^

`GNU Fortran <https://gcc.gnu.org/fortran/>`__ 编译器是 Linux 下最常用的
Fortran 编译器，其提供了 ``gfortran`` 命令::

    $ sudo apt install gfortran

Intel 软件开发工具包
^^^^^^^^^^^^^^^^^^^^

`Intel oneAPI <https://software.intel.com/content/www/us/en/develop/tools/oneapi.html>`__
是 Intel 公司提供的免费软件开发工具包。该工具包中包含了 C/C++ 编译器（``icc`` 命令）
和 Fortran 编译器（``ifort`` 命令），以及 MKL 数学库、MPI 并行库等众多软件开发工具。

.. note::

   地震学新手可以先不安装此工具包，等日常科研中确实需要使用时再安装。

在 Ubuntu 系统下，官方手册提供了\
`多种安装方式 <https://software.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-linux/>`__。
这里，我们推荐使用 ``apt`` 安装。

添加 Intel 软件仓库::

    # 下载 Intel 仓库公钥并添加到 apt 源密钥环中
    $ wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
    $ sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
    # 删除公钥文件
    $ rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB

    # 添加软件仓库
    $ sudo add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"
    $ sudo apt update

根据自己的需要安装 C/C++ 或 Fortran 编译器，默认安装目录是 :file:`/opt/intel/oneapi`::

    # 安装 C/C++ 编译器
    $ sudo apt install intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic

    # 安装 Fortran 编译器
    $ sudo apt install intel-oneapi-compiler-fortran

安装完成后还需要配置环境变量::

    $ echo "source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1" >> ~/.bashrc

.. dropdown:: 查看 Intel 软件仓库提供的软件列表
    :color: info
    :icon: info

    使用如下命令可以列出 Intel 软件仓库提供的所有软件包::

        $ sudo -E apt-cache pkgnames intel

Java
^^^^

运行 Java 程序需要安装 Java 运行环境，即 OpenJDK::

    $ sudo apt install default-jdk

git
^^^

`git <https://git-scm.com/>`__ 是目前最流行的版本控制工具，推荐在科研过程中
使用 git 管理自己编写的代码和文件。一般情况下系统已经安装了该软件。如果没安装，
可以使用如下命令安装::

    $ sudo apt install git
