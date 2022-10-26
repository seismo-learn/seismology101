# WSL 配置指南

- 本节贡献者: {{赵志远}}（作者）、{{姚家园}}（审稿）、{{田冬冬}}（审稿）
- 最近更新日期: 2022-10-26
- 预计花费时间: 120 分钟

---

:::{note}
本节大部分命令是在命令行中执行的。

使用 Windows 系统时，同时按下 {kbd}`win` + {kbd}`R` 键，在打开的运行对话框中
输入 “cmd” 以启动 CMD。在 CMD 中输入命令并按下 {kbd}`Enter` 键即可执行相应的命令。

使用 Linux 系统时，在桌面或菜单栏中找到并点击 “Terminal” 图标以启动终端，
然后在终端中输入命令并按下 {kbd}`Enter` 键即可执行相应的命令。
:::

## 简介

[WSL](https://docs.microsoft.com/zh-cn/windows/wsl/)
（Windows Subsystem for Linux，适用于 Linux 的 Windows 子系统）是一个在
Windows 10/11 上运行原生 Linux 二进制可执行文件的兼容层。
WSL 有 WSL1 和 WSL2 两个发行版本，二者底层原理不同。大多数情况下，建议使用 WSL2，
因为它提供更快的性能和 100% 的系统调用兼容性。涉及到跨系统的文件互访时
（Linux 访问 Windows 里的文件，或 Windows 访问 Linux 里的文件），使用 WSL1 具有
更快的性能。WSL1 和 WSL2 的详细对比见[官方文档](https://docs.microsoft.com/zh-cn/windows/wsl/compare-versions)。

官方目前没有弃用 WSL1 的计划，并且支持将任何一个已经安装的 Linux 发行版转换为 WSL1 或者 WSL2。

:::{dropdown} WSL2 与 VMware/VirtualBox 兼容性警告
:color: info
:icon: info

由于 Hyper-V 兼容性问题，开启 WSL2 功能后，虚拟机软件 VMware/VirtualBox 的老版本
将无法正常使用。
WSL1 和 VMware/VirtualBox 不存在兼容性问题，可同时运行。因此，已开启 WSL2 功能的用户
若需要使用 VMware/VirtualBox，可以先把 Linux 发行版改为 WSL1，然后执行以下操作。

使用管理员模式打开 CMD，使用以下命令关闭 Hyper-V（重启后方能生效）。
此时，Hyper-V 功能关闭，VMware/VirtualBox 可用，WSL2 不可用:

```
$ bcdedit /set hypervisorlaunchtype off
```

使用管理员模式打开 CMD，使用以下命令开启 Hyper-V（重启后方能生效）。
此时，Hyper-V 功能开启，WSL2 可用，VMware/VirtualBox 不可用:

```
$ bcdedit /set hypervisorlaunchtype auto
```

新版本 VMware (≥15.5.5) 和 VirtualBox (≥6.0) 在最新 Windows 系统上
（build number ≥19041）可以正常使用，无兼容性问题。
:::

## 安装

WSL 的安装可以参考[官方安装指南](https://docs.microsoft.com/zh-cn/windows/wsl/install)。
其对 WSL 安装配置中可能遇到的常见问题都给出了详细的解决方案，请认真阅读。

WSL 可以安装不同的 Linux 发行版，但目前官方并未提供 Fedora 发行版的安装。
推荐使用 WSL 安装 Ubuntu 22.04 LTS。

:::{note}
想在 WSL 上安装 Fedora 的读者可以参考[英文指南](https://fedoramagazine.org/wsl-fedora-33/)或[中文指南](https://suiahae.me/Using-Fedora-33-on-Windows-10-WSL2/)。
指南中介绍的是已经过时的 Fedora 33。用户请访问 Fedora 官方仓库下载
[Fedora 36](https://github.com/fedora-cloud/docker-brew-fedora/tree/36/x86_64)（Fedora 最新版本）
镜像文件。

Fedora 只支持 WSL2。
:::

## 常用命令

打开 CMD，可以运行如下命令来使用 WSL。

启动、进入和退出 Linux 环境:

```
# 启动并进入 Linux 环境（进入默认发行版）
$ bash

# 退出 Linux 环境（并不会改变 WSL 的运行状态）
$ exit
```

下面简要介绍 `wsl` 命令的用法。注意以下命令并不是在 Linux 环境中执行的，不需要进入 Linux 环境。
假定已安装 WSL2 版本的 Ubuntu 22.04 LTS，且其名称为 Ubuntu:

```
# 查看 wsl 命令帮助
$ wsl -h

# 列出所有已安装的 Linux 发行版的状态，并显示是 WSL1 还是 WSL2
$ wsl -l -v

# 停止正在运行的 Linux 发行版
$ wsl -t Ubuntu

# 将 Ubuntu 由 WSL2 更改为 WSL1
$ wsl --set-version Ubuntu 1

# 将 Ubuntu 由 WSL1 改回 WSL2
$ wsl --set-version Ubuntu 2

# 设置默认发行版
$ wsl -s Ubuntu22.04

# 删除某个发行版（如名为 Ubuntu）
$ wsl --unregister Ubuntu
```

开启 WSL 后，Linux 发行版的默认安装位置是 C 盘。为了避免占用 C 盘的大量空间，
可以将已安装的 Linux 发行版导出备份，再导入还原到其它盘，最后删除 C 盘上的发行版。
这样做的另一个好处是导入时用户就能得到 WSL 的真实路径。打开 CMD，执行如下命令:

```
# 导出 Linux 发行版，可做为备份
# 在 D 盘中新建备份目录，命名为 WSLBAK
$ mkdir D:\WSLBAK
# 导出到备份目录下，命名为 20210117bak.tar
$ wsl --export Ubuntu D:\WSLBAK\20210117bak.tar

# 导入并还原之前备份的 Linux 发行版
# 此例中选择在 D 盘中新建还原目录，命名为 Ubuntu22.04
$ mkdir D:\WSLDIR\Ubuntu22.04
# 导入并还原之前的备份，将此发行版命名为 Ubuntu22.04
$ wsl --import Ubuntu22.04 D:\WSLDIR\Ubuntu22.04 D:\WSLBAK\20210117bak.tar

# 删除 C 盘里名为 Ubuntu 的发行版，以释放 C 盘空间
$ wsl --unregister Ubuntu
```

## 配置 Linux

安装 WSL 后，还需要对 Linux 系统进行配置。
Ubuntu 和 Fedora 用户可以分别参考《{doc}`/computer/ubuntu-setup`》和
《{doc}`/computer/fedora-setup`》对系统进行配置，以满足科研工作的需求。

:::{warning}
配置 Linux 系统时，切记要跳过“安装系统”一节，只需配置**系统软件**和**编程开发环境**。
否则，整个电脑的 Windows 系统将会被覆盖。
:::

## 安装 X Server

WSL 本身不支持图形界面，需要在 Windows 中安装 X Server
来接收和显示 Linux 中的图形界面。

:::{note}
X Window System（常称为 X11 或 X）是 UNIX 系统下常用的一种视窗系统，
主要由 X Server 和 X Client 两部分组成。其中 X Server 负责接收对图形输出
的请求并反馈用户输入，而 X Client 则是使用图形界面的应用程序。
:::

:::{note}
Windows 11 (版本号大于 22000) 用户或 Windows 11 内测版本号大于 21362 的用户，
可以跳过以下内容，直接试用 Windows 官方正在开发的 WSL 图形界面软件
[WSLg](https://github.com/microsoft/wslg)。
:::

Windows 下常见的 X Server 有 [VcXsrv](https://sourceforge.net/projects/vcxsrv/)、
[Xming](http://www.straightrunning.com/XmingNotes/)、
[Xmanager](https://www.xshellcn.com/) 等。
其中，VcXsrv 是开源免费软件；Xming 和 Xmanager 是收费软件。
Xming 在 2007 年发布了最后一个免费版本（6.9.0.31）。
VcXsrv 的使用方式和界面与 Xming 极为相近。
推荐使用 VcXsrv，本文以此软件为例进行介绍。

1. 下载 [VcXsrv](https://sourceforge.net/projects/vcxsrv/)，默认安装即可

2. 运行 XLaunch，在 **Extra settings** 界面勾选 **Disable access control**，其他选项无需更改

3. Windows 每次重启后，WSL2 nameserver 的 IP 可能发生变化，因而需要配置 Linux
   下的环境变量以保证始终能连接到 X Server。

   启动并进入 Linux 系统:

   ```
   $ bash
   ```

   在 Linux 系统中执行如下命令:

   ```
   $ echo "export DISPLAY=\$(awk '/nameserver / {print \$2; exit}' /etc/resolv.conf 2>/dev/null):0" >> ~/.bashrc
   $ echo "export LIBGL_ALWAYS_INDIRECT=1" >> ~/.bashrc
   $ source ~/.bashrc
   ```

4. 打开图形界面进行测试:

   ```
   # x11-apps 中包含了很多小程序如 xclock、xeyes

   # Ubuntu 用户使用如下命令安装
   $ sudo apt install x11-apps
   # Fedora 用户使用如下命令安装
   $ sudo dnf install xorg-x11-apps

   # 运行 xclock。若能看到一个时钟窗口，则表示图形界面设置成功
   $ xclock
   ```

:::{note}
安装并配置好 X Server 之后，切记先运行 XLaunch 再进入 Linux 环境打开图形界面。
:::

## 跨系统文件互访

WSL1 和 WSL2 都可以和 Windows 系统互相访问文件，但是无论从 WSL 访问 Windows，
还是从 Windows 访问 WSL，WSL1 的速度都要远远快于 WSL2。因此，需要经常跨系统操作文件
时，建议将 Linux 发行版设置为 WSL1。

### WSL 访问 Windows

Windows 系统的硬盘挂载在 WSL 的 `/mnt` 路径下，用户可以在 WSL 终端中
输入 `cd /mnt/d` 命令进入 Windows 系统的 D 盘，然后便可编辑和运行目录中的文件。

### Windows 访问 WSL

在 Windows 下搜索、打开和编辑 WSL 下的文件和目录的方式有以下两种：

1. 在 Windows 资源管理器的地址栏中输入 `\\wsl$`，会显示所有已安装的 WSL 目录，
   然后根据需要找到文件进行操作
2. 进入 WSL，在终端输入 `cd ~ && explorer.exe .`，会在 Windows 下打开
   家目录，根据需要找到文件进行操作

在 Windows 下访问 WSL 文件系统时，文件和目录的路径有两种表示方式：
真实路径和 UNC 路径，后者指类似 `\\wsl$` 这种格式的路径。

WSL1 支持真实路径访问，但 WSL2 不支持真实路径访问。

Windows 的 CMD 不支持 UNC 路径，所以使用 CMD 时，只能用
真实路径访问 WSL1 文件系统，无法用 UNC 路径访问 WSL1 文件系统，也无法用真实路径
和 UNC 路径访问 WSL2 文件系统。

Windows 的应用程序可以使用真实路径访问 WSL1 文件系统，某些支持 UNC 路径的
软件（如 MATLAB）还可以通过 UNC 路径访问 WSL1 或 WSL2 文件系统。

因此，如果想使用 Windows 的 CMD 以及应用程序编译或运行 WSL 中的文件，
需要先把 Linux 发行版切换到 WSL1 版本，进入 WSL 后新建一个名字独特的文件夹，
然后在 Windows 中对该文件夹进行定位，从而确定其真实的路径。

:::{note}
推荐在 Windows 中安装 [Everything](https://www.voidtools.com/zh-cn/)
实现文件夹和文件的快速定位。

推荐使用 [Windows Terminal](https://docs.microsoft.com/zh-cn/windows/terminal/)，
可直接在 Microsoft Store 中安装。界面美观、操作方便，
支持同时开启多个 CMD 以及 WSL，随意切换无卡顿。可完全替代 CMD。

推荐使用 [Visual Studio Code](https://code.visualstudio.com/)，并安装插件
[Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)。
使用 VSCode 可以直接编辑和运行 WSL 里的文件，且不会因为跨文件系统工作使性能下降。
:::
