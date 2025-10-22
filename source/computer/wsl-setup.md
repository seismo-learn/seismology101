# WSL 配置指南

- 本节贡献者: {{赵志远}}、{{田冬冬}}、{{姚家园}}
- 最近更新日期: 2025-10-11
- 预计花费时间: 120 分钟

---

## 简介

[WSL](https://docs.microsoft.com/zh-cn/windows/wsl/)
（Windows Subsystem for Linux，适用于 Linux 的 Windows 子系统）
可以让用户直接在 Windows 10/11 上运行 Linux 环境（包括大多数命令行工具和应用程序），
且不会产生传统虚拟机或双系统的开销。

:::{note}
接下来的大部分命令是在命令行中执行的。

使用 Windows 系统时，同时按下 {kbd}`win` + {kbd}`R` 键，在打开的运行对话框中
输入 “cmd” 以启动“命令提示符”（即 CMD）。在 CMD 中输入命令并按下 {kbd}`Enter` 键
即可执行相应的命令。

使用 Linux 系统时，在桌面或菜单栏中找到并点击 “Terminal” 图标以启动终端，
然后在终端中输入命令并按下 {kbd}`Enter` 键即可执行相应的命令。
:::

## 安装

### 检查 Windows 版本

WSL 只能在 Windows 10 的较高版本或 Windows 11 上安装。因而，在安装 WSL 前，需要
先检查当前 Windows 系统的版本号是否满足 WSL 的要求。

按下 {kbd}`win` + {kbd}`R` 键，在打开的运行对话框中键入 `winver`，然后选择“确定”，
则会弹出“关于 Windows”对话框，会看到类似“版本 21H2 （OS 内部版本 19044）”的字样。
其中，21H2 是 Windows 版本号，19044 是系统内部版本号。

:::{note}
本配置指南的内容仅适用于 Windows 10 版本 21H2 及更高版本（内部版本 19044 及更高
版本）或 Windows 11。低版本 Windows 用户请自行升级到更高版本。
:::

### 安装 WSL

1.  在 Windows 系统的搜索框中直接输入命令 `cmd`
2.  在打开的“命令提示符”窗口中，输入如下命令：
    ```
    $ wsl --install
    ```
    此命令将启动 WSL 并默认安装 Ubuntu 24.04 LTS
3.  待安装完成后，重启计算机

更详细的安装步骤、常见问题的解决办法以及旧版本 Windows 下的安装方法可以参考
[官方安装指南](https://docs.microsoft.com/zh-cn/windows/wsl/install)。

:::{note}
WSL 默认安装的 Linux 发行版是 Ubuntu，但也支持安装其它 Linux 发行版。可以使用如下命令
查看可安装的 Linux 发行版列表：
```
$ wsl --list --online
```
可以使用如下命令安装指定的 Linux 发行版（其中 `<Distribution Name>` 为要安装的 Linux 发行版的
名称）：
```
$ wsl --install <Distribution Name>
```

例如，如果想安装 Fedora 发行版，则可以使用：
```
$ wsl --install FedoraLinux-42
```
安装完成后可以使用如下命令启动 Fedora：
```
$ wsl -d FedoraLinux-42
```
:::

## 配置 Linux

打开 CMD，运行 `bash` 命令即可启动并进入 WSL 提供的 Linux 环境：
```
$ bash
```

通过 WSL 安装 Linux 系统后，还需要对 Linux 系统进行配置。
Ubuntu 和 Fedora 用户可以分别参考《[](/computer/ubuntu-setup)》和
《[](/computer/fedora-setup)》对系统进行配置，以满足科研工作的需求。

:::{warning}
配置 Linux 系统时，切记要跳过“安装系统”一节，只需配置**系统软件**和**编程开发环境**。
否则，整个电脑的 Windows 系统将会被覆盖。
:::

使用 `exit` 命令可以退出 Linux 环境：
```
$ exit
```

:::{note}
新版本 Windows 中安装的 WSL 已经直接支持图形界面，无需做额外配置。
如果无法正常启动图形界面，则可能需要先安装与显卡匹配的驱动程序。
详情参考[在 WSL 上运行 Linux GUI 应用](https://learn.microsoft.com/zh-cn/windows/wsl/tutorials/gui-apps)。
:::

## WSL 常用命令

WSL 提供了命令 `wsl` 来管理 WSL。打开 CMD 后，即可在 CMD 中执行 `wsl` 命令。
下面的命令假定已通过 WSL 安装 Ubuntu 24.04 LTS，且其名称为 Ubuntu。

查看 `wsl` 命令的完整帮助文档：
```
$ wsl --help
```

列出所有已安装的 Linux 发行版的状态：
```
$ wsl --list
```

检查 WSL 状态：
```
$ wsl --status
```

停止正在运行的 Linux 发行版：
```
$ wsl --terminate Ubuntu
```

注销并卸载某个 Linux 发行版：
```
$ wsl --unregister Ubuntu
```

:::{dropdown} 将 WSL 从 C 盘移动到其它盘
:color: info
:icon: info

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
# 此例中选择在 D 盘中新建还原目录，命名为 Ubuntu24.04
$ mkdir D:\WSLDIR\Ubuntu24.04
# 导入并还原之前的备份，将此发行版命名为 Ubuntu24.04
$ wsl --import Ubuntu24.04 D:\WSLDIR\Ubuntu24.04 D:\WSLBAK\20210117bak.tar
# 删除 C 盘里名为 Ubuntu 的发行版，以释放 C 盘空间
$ wsl --unregister Ubuntu
```
:::

## 跨系统文件互访

WSL 有 WSL1 和 WSL2 两个版本。WSL2 是安装 Linux 发行版时的默认版本，其在各方面都优于 WSL1。
但在跨系统访问文件方面（即在 Windows 下访问 WSL 中的文件或在 WSL 下访问 Windows 中的文件），
WSL1 的速度要远远快于 WSL2。因而，在使用 WSL2 时，建议尽量将处理的文件放在 WSL 中，
以避免跨系统访问文件。

对于有经常跨系统操作文件的需求，可以使用如下命令将 Linux 发行版（假定名为 Ubuntu）从 WSL2 转换为 WSL1：
```
$ wsl --set-version Ubuntu 1
```
同样的，也可以使用如下命令将 Linux 发行版（假定名为 Ubuntu）从 WSL1 转换为 WSL2：
```
$ wsl --set-version Ubuntu 2
```

### WSL 访问 Windows

Windows 系统的硬盘挂载在 WSL 的 `/mnt` 路径下，用户可以在 WSL 终端中
输入 `cd /mnt/d` 命令进入 Windows 系统的 D 盘，然后便可编辑和运行 D 盘中的文件。

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

## 扩展阅读

-  [比较 WSL2 和 WSL1](https://learn.microsoft.com/zh-cn/windows/wsl/compare-versions)
