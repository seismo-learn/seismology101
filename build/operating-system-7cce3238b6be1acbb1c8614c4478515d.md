# 选择操作系统

- 本节贡献者: {{田冬冬}}、{{姚家园}}
- 最近更新日期: 2026-06-11
- 预计阅读时间: 5 分钟

----

个人电脑有三种常见的操作系统：Microsoft Windows、macOS 和 Linux。
从市场占有率上看，Microsoft Windows 用户数目远远多于 macOS 和 Linux 用户。
但对地震学科研工作而言，Linux 和 macOS 往往更适合作为日常科研的主要操作系统。
主要原因有：

1. Linux/macOS 上可以更容易地获取和使用编程所需的开发工具
2. 大多数地震学相关的程序/代码都是在 Linux/macOS 上编写的，且通常优先支持 Linux/macOS
3. Linux/macOS 自带了常用的命令行工具，比如 `grep`、`sed`、`awk`
4. Linux/macOS 上也更容易安装 Python、Conda、编译器等科研工具链
5. 高性能计算服务器几乎都只使用 Linux 系统，因此在本机使用类似环境更方便迁移工作流

对于地震学初学者，**更推荐使用 Linux 或 macOS 系统**。这样更容易复用他人提供的脚本和工具，
也更容易直接照着教程完成数据处理与分析。只有在非常确定自己的科研工作
不依赖他人提供的代码，或者已经具备在 Windows 系统下编译、安装和使用相关程序的经验时，
才建议将 Windows 作为主要科研环境。

## Linux

Linux 有[上百个不同的发行版](https://distrowatch.com/)，
绝大多数都可以免费获取与安装。比较流行的发行版有
[Ubuntu](https://ubuntu.com/)、[Debian](https://www.debian.org/)、
[Fedora](https://getfedora.org/) 等。
有经验的读者可以根据自己的喜好自行选择合适的 Linux 发行版。

对于刚接触 Linux 的读者，**推荐使用 Fedora 或 Ubuntu**。这两个发行版的资料多、社区活跃，
也更适合作为入门时的参考环境。
如果你已经在 Linux 上有一些经验，也可以选择 Debian、Arch Linux 等其他发行版。
可以分别参考《[Fedora 配置指南](/computer/fedora-setup)》和《[Ubuntu 配置指南](/computer/ubuntu-setup)》
来安装和配置系统，以满足科研工作的需求。

## macOS

Mac 笔记本（MacBook Air、MacBook Pro）或台式机（iMac、Mac mini、Mac Pro）自带的
macOS 系统可以满足科研工作的大部分需求。
**如果读者的科研主力机器是 Mac 笔记本或 Mac 台式机，建议直接使用 macOS 系统**。
macOS 的一个优势是日常使用和科研使用可以比较自然地合并到同一台机器上，减少设备切换的成本。
可以参考《[macOS 配置指南](/computer/macos-setup)》对 macOS 系统进行配置，以满足科研工作的需求。

## Microsoft Windows

如前所述，Windows 通常不是地震学科研工作的首选系统。
对于日常办公依赖 Windows、但科研工作又需要 Linux 环境的情况，通常有如下几种
解决办法：

1. 在电脑上同时安装 Windows 和 Linux 双系统
2. 在 Windows 系统中安装虚拟机软件（如 VMware Workstation 或 VirtualBox），并在虚拟机中
   安装和使用 Linux 系统
3. 在 Windows 系统中使用“适用于 Linux 的 Windows 子系统”（Windows Subsystem for Linux，
   即 WSL）

**对于 Windows 10/11 用户，最推荐的方案是使用 WSL**。
WSL 是微软官方开发的一个在 Windows 10/11 上运行原生 Linux 二进制可执行文件的兼容层。
通过 WSL，可以在 Windows 10/11 上安装主流 Linux 发行版，并原生运行 Linux 下的
大多数命令行工具和应用程序。

与安装双系统相比，WSL 安装简便且可以无缝切换；与使用虚拟机相比，WSL 启动更快、资源占用更少。
因此，对于绝大多数 Windows 10/11 用户，WSL 是比双系统和虚拟机更好的选择。
可以参考《[WSL 配置指南](/computer/wsl-setup)》来安装并配置 WSL，以满足科研工作的需求。
