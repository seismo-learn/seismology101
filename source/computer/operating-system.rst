选择操作系统
============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-01-10
:预计阅读时间: 5 分钟

----

个人电脑有三种常见的操作系统：Microsoft Windows、macOS 和 Linux。
从市场占有率上看，Microsoft Windows 用户数目远远多于 macOS 和 Linux 用户。
然而，大多数地震学科研工作者都选择 Linux 或 macOS 作为日常研究的主要操作系统。
主要原因有如下几点：

1. Linux 和 macOS 上可以更容易地获取和使用编程所需的开发工具
2. 大多数地震学相关的程序/代码都是在 Linux 上编写的，且仅在 Linux 和 macOS 下可以使用
3. Linux 和 macOS 自带了可以对数据做基本处理的命令行工具
4. 高性能计算服务器几乎都只使用 Linux 系统

对于初学者，我们\ **建议使用 Linux 或 macOS 系统**\ ，除非你非常确定自己的科研
工作并不需要用到别人提供的代码，或者你有足够的知识和能力在 Windows 系统下
编译和使用别人的代码。

Linux
-----

Linux 有很多不同的发行版，几乎所有 Linux 发行版都可以免费获取与安装。
比较流行的发行版有
`Ubuntu <https://ubuntu.com/>`__\ 、\
`Debian <https://www.debian.org/>`__\ 、\
`Fedora <https://getfedora.org/>`__\ 、\
`CentOS <https://www.centos.org/>`__ 等。
读者可以根据自己的喜好自行选择合适的 Linux 发行版。

对于不了解 Linux 的用户，我们\ **推荐安装和使用 Fedora 或 Ubuntu 系统**\ 。
Fedora 和 Ubuntu 用户可以分别参考 《\ :doc:`/computer/fedora-setup`\ 》和
《\ :doc:`/computer/ubuntu-setup`\ 》对系统进行安装和配置，以满足科研工作的需求。

.. note::

   选择 **CentOS** 的用户推荐使用 `CentOS Stream <https://www.centos.org/centos-stream/>`__，
   而非 `CentOS Linux <https://www.centos.org/centos-linux/>`__。
   Red Hat 在 2020 年 12 月宣布将停止 CentOS Linux 项目。CentOS Linux 8 和
   CentOS Linux 7 将分别于 2021 年末和 2024 年 6 月 30 日停止更新。
   详情请阅读 `CentOS 博客 <https://blog.centos.org/2020/12/future-is-centos-stream/>`__。

macOS
-----

Mac 笔记本或台式机（如 MacBook Air、MacBook Pro、iMac）自带的 macOS 系统
可以满足科研工作的大部分需求。对于拥有 macOS 系统的用户，我们建议直接使用
macOS 系统。可以参考《\ :doc:`/computer/macos-setup`\ 》对 macOS 系统进行
进一步配置，以满足科研工作的需求。

Microsoft Windows
-----------------

如前所述，不建议地震学科研工作者使用 Windows 系统，而建议 Windows 用户
安装并使用 Linux 系统。Windows 用户使用 Linux 系统的方式有很多，
比如安装双系统、使用虚拟机安装 Linux
以及使用“适用于 Linux 的 Windows 子系统”（Windows Subsystem for Linux，即 WSL）。

WSL 是一个在 Windows 10 上运行原生 Linux 二进制可执行文件的兼容层。
启用 WSL 功能后，就可以在 Windows 上安装 Linux 发行版，原生运行 Linux 下的大多数
命令行工具和应用程序。

WSL 可以同时安装多个不同的 Linux 发行版，并且随时进行切换。
与安装双系统相比，WSL 安装简便且切换方便。与使用虚拟机相比，WSL 在启动速度、
消耗资源以及性能利用上有较大优势。因此，对于不想安装双系统或者虚拟机的用户来说，
WSL 是个不错的选择。

Windows 10 用户推荐使用 WSL 方式安装 Linux 系统。读者可以进一步参考
《\ :doc:`/computer/wsl-setup`\ 》来安装并配置 WSL，以满足科研工作的需求。
