# 选择操作系统

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（作者）
- 最近更新日期: 2024-06-02
- 预计阅读时间: 5 分钟

----

个人电脑有三种常见的操作系统：Microsoft Windows、macOS 和 Linux。
从市场占有率上看，Microsoft Windows 用户数目远远多于 macOS 和 Linux 用户。
然而，大多数地震学科研工作者都使用 Linux 或 macOS 作为日常科研的主要操作系统。
其原因主要有如下几点：

1. Linux 和 macOS 上可以更容易地获取和使用编程所需的开发工具
2. 大多数地震学相关的程序/代码都是在 Linux 上编写的，且仅在 Linux 和 macOS 上可以使用
3. Linux 和 macOS 自带了对数据做基本处理的命令行工具
4. 高性能计算服务器几乎都只使用 Linux 系统

对于地震学初学者，**建议使用 Linux 或 macOS 系统**，除非非常确定自己的科研工作并不需要用到
别人提供的代码，或者有足够的知识和能力在 Windows 系统下编译和使用别人的代码。

## Linux

Linux 有[上百个不同的发行版](https://distrowatch.com/)，
绝大多数都可以免费获取与安装。比较流行的发行版有
[Ubuntu](https://ubuntu.com/)、[Debian](https://www.debian.org/)、
[Fedora](https://getfedora.org/)、[CentOS](https://www.centos.org/) 等。
有经验的读者可以根据自己的喜好自行选择合适的 Linux 发行版。

对于不了解 Linux 的读者，**推荐使用 Fedora 或 Ubuntu 系统**，可以分别参考
《[](/computer/fedora-setup)》和《[](/computer/ubuntu-setup)》
来安装和配置系统，以满足科研工作的需求。

## macOS

Mac 笔记本（MacBook Air、MacBook Pro）或台式机（iMac、Mac mini、Mac Pro）自带的
macOS 系统可以满足科研工作的大部分需求。
**对于以 Mac 笔记本或 Mac 台式机作为科研主力机器的读者，建议直接使用 macOS 系统**。
可以参考《[](/computer/macos-setup)》对 macOS 系统进行配置，以满足科研工作的需求。

## Microsoft Windows

如前所述，地震学科研工作不建议使用 Windows 系统，而建议使用 Linux 系统。
对于科研工作需要 Linux 系统而日常办公需要 Windows 系统的情况，通常有如下几种
解决办法：

1. 在电脑上同时安装 Windows 和 Linux 双系统
2. 在 Windows 系统中安装虚拟机软件，并在虚拟机中安装和使用 Linux 系统
3. 在 Windows 系统中使用“适用于 Linux 的 Windows 子系统”（Windows Subsystem for Linux，即 WSL）

**推荐 Windows 10/11 用户使用 WSL**。
WSL 是微软官方开发的一个在 Windows 10/11 上运行原生 Linux 二进制可执行文件的兼容层。
通过 WSL，可以在 Windows 10/11 上安装主流 Linux 发行版，并原生运行 Linux 下的
大多数命令行工具和应用程序。

与安装双系统相比，WSL 安装简便且可以在多系统之间无缝切换。
与使用虚拟机相比，WSL 在启动速度、消耗资源以及性能利用上有较大优势。
因此，对于绝大多数 Windows 10/11 用户，WSL 是比双系统和虚拟机更好的选择。
可以参考《[](/computer/wsl-setup)》来安装并配置 WSL，以满足科研工作的需求。
