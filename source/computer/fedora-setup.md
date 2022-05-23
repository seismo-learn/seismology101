# Fedora 配置指南

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（审稿）
- 最近更新日期: 2022-05-23
- 预计花费时间: 120 分钟

---

:::{note}
本节内容适用于 **Fedora 36 Workstation**，不一定适用于其他 Fedora 版本。
建议用户访问 [Fedora 官网](https://getfedora.org/) 下载并安装 Fedora
最新版本，也欢迎用户帮助我们更新本文以适配 Fedora 最新版本。
:::

## 安装系统

:::{note}
安装 Fedora 也可以参考 <https://techz.io/how-to-install-fedora/>
给出的详细步骤与图解。
:::

### 下载系统镜像

访问 [Fedora 官网](https://getfedora.org/) 并下载 Fedora Workstation 镜像文件，
一般选择 x86_64 版本。

**Fedora 36 Workstation x86_64** 的 ISO 镜像文件（约 2 GB）下载链接：

- [官方镜像](https://download.fedoraproject.org/pub/fedora/linux/releases/36/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-36-1.5.iso)
- [中科大镜像](https://mirrors.ustc.edu.cn/fedora/releases/36/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-36-1.5.iso) [**推荐国内用户使用**]

### 制作 USB 启动盘

准备一个 4 GB 以上容量的 U 盘。使用 [Ventoy](https://ventoy.net/cn/) 制作
USB 启动盘，并将 ISO 镜像文件复制到 U 盘的镜像分区中。Ventoy 可以在
Windows 和 Linux 下使用，详细用法见 [官方文档](https://ventoy.net/cn/doc_start.html)。

:::{warning}
制作 USB 启动盘时会格式化 U 盘！请确保 U 盘中无重要文件！
:::

### 进入 Live 系统

将制作好的 USB 启动盘插入要安装 Fedora 系统的计算机上，开机启动，
按下 {kbd}`F10` 或 {kbd}`F12` 进入 BIOS，并使计算机优先从 USB 盘启动。
正确启动后，则会进入 GRUB，按向上向下键选中“Start Fedora-Workstation-Live 36”
以进入 Fedora 的 Live 系统。

:::{note}
Live 系统是指安装在 USB 启动盘中的操作系统。用户可以在 Live 系统中进行
任何操作以体验该系统。
:::

:::{tip}
1. 不同型号的电脑进入 BIOS 的方法可能不同，请自行查询。
2. 若计算机无法从 USB 盘启动，则可能是由于计算机的“安全启动”设置导致的，
   可以尝试进入 BIOS 设置，并在 BIOS 设置内关闭“安全启动”。
3. 如果尝试多次都无法正确从 USB 启动，则可能是 USB 启动盘制作失败，请尝试重新制作启动盘。
:::

### 开始安装

:::{warning}
以下安装步骤假定用户想要将 Fedora 系统作为电脑的**唯一**系统，
电脑中原有的 Windows 或其它 Linux 系统会被彻底覆盖。
如果用户想要安装双系统（即同时安装 Windows + Linux），请参考网络上的
其他文档。
:::

进入 Live 系统之后，选择 “Install to Hard Drive” 即开始安装。

安装程序会首先要你选择安装过程中的语言，可以选择“中文”→“简体中文（中国）”
或 “English”→“English (Unite States)”，然后点击下方的“继续”按钮。
接着选择键盘布局（汉语或 “English(US)”）、时区和时间（例如“亚洲-上海”）。

点击“安装目的地”，选择要将系统安装到哪一块硬盘以及如何分区。

在“设备选择”中，选择要使用哪些硬盘安装系统。如果计算机有多个硬盘，可以
将多个硬盘都选中，被选中的硬盘会有一个“对号”符号。需要注意，不要选中 USB 启动盘。

在“存储设置”中，选择“自动”让安装程序进行自动分区。也可以选择“自定义”，
但需要你了解 Linux 的分区操作。分区时可以选择最新的 btrfs 文件系统或传统的 ext4
文件系统。

点击“开始安装”即进入正式安装过程。

等待安装完成，点击“完成安装”，并重启计算机。
重启计算机时，记得拔出 USB 启动盘，以免计算机再次进入 Live 系统。

重启后会进入欢迎页面，需要添加账户。注意用户名只能是英文。

### 更新系统

当已安装的软件有可用的更新，或 Fedora 系统可升级至新版本时，
Fedora 会弹出提醒通知。建议用户及时更新系统及已安装的软件。

:::{warning}
更新系统前，特别是大版本更新（如 Fedora 35 更新为 Fedora 36），
最好先进行一次备份（可以参考{doc}`/best-practices/backup`）。
:::

:::{note}
本节接下来介绍的大部分软件都通过命令行安装。在桌面或菜单栏中找到并点击
“Terminal” 图标以启动终端，然后在终端中输入命令并按下 {kbd}`Enter` 键
即可执行相应的命令。
:::

## 系统软件

Fedora 系统自带了“软件中心”，可用于查找、安装、卸载和管理软件包，但一般建议使用
命令行工具 `dnf` 安装和管理软件。

:::{note}
`dnf` 会从 Fedora 软件源下载软件包。
国内用户可以参考 <http://mirrors.ustc.edu.cn/help/fedora.html> 将默认软件源镜像
替换为中科大镜像，以加快软件下载速度。

注意：在替换软件源镜像后要执行 `sudo dnf makecache` 更新本地缓存的软件包元数据。
:::

`dnf` 的详细用法请阅读 [dnf 参考文档](https://dnf.readthedocs.io/en/latest/index.html)，
这里只介绍一些常用命令:

```
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
```

:::{tip}
Linux 用户也可以访问 <https://pkgs.org/> 网站查询软件包。
该网站支持多种 Linux 发行版和多个官方及第三方软件仓库，
且为每个软件包提供了丰富的元信息、依赖和被依赖关系、包含的文件、
安装方式以及更新历史等信息。
:::

## 编程开发环境

### C/C++

[GCC](https://gcc.gnu.org/) 系列的 C/C++ 编译器是 Linux 下最常用的
C/C++ 编译器，其提供了 `gcc` 和 `g++` 命令:

```
$ sudo dnf install gcc gcc-c++
```

### Fortran

[GNU Fortran](https://gcc.gnu.org/fortran/) 编译器是 Linux 下最常用的
Fortran 编译器，其提供了 `gfortran` 命令:

```
$ sudo dnf install gcc-gfortran
```

### Java

运行 Java 程序需要安装 Java 运行环境，即 OpenJDK:

```
$ sudo dnf install java-11-openjdk
```

### git

[git](https://git-scm.com/) 是目前最流行的版本控制工具，推荐在科研过程中
使用 git 管理自己编写的代码和文件。一般情况下系统已经安装了该软件。如果没安装，
可以使用如下命令安装:

```
$ sudo dnf install git
```
