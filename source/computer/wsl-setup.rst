WSL 配置指南
============

:本节贡献者: |赵志远|\（作者）、
             |田冬冬|\（审稿）
:最近更新日期: 2021-01-17
:预计花费时间: 120 分钟

WSL 是什么?
-------------

Windows Subsystem for Linux（简称 WSL）是一个在 Windows 10 上能够运行原生
Linux 二进制可执行文件（ ELF 格式）的兼容层，也被称为“适用于 Linux 的 Windows 子系统”。

简单来说，在 Windows 10 上启用 WSL 功能后，就可以在 Windows 上安装 Linux 发行版，
原样运行 Linux 下的大多数命令行工具、实用工具和应用程序。对于不想安装双系统或者虚拟机的
用户来说是个不错的选择。

WSL 可以同时安装多个不同的 Linux 发行版，并且随时进行切换，支持利用 ``wsl --export`` 
命令将整个子系统随时打包备份，并在之后利用 ``wsl --import`` 命令进行还原。与虚拟机相比，
在启动速度、消耗资源以及性能利用上有较大优势。

WSL 分为 WSL1 和 WSL2 两个发行版本。由于底层原理不同，在大多数情况下，建议使用 WSL2，
因为它提供更快的性能和 100% 的系统调用兼容性。仅当你的项目需要经常从 Linux 上访问存储
在 Windows 系统上的文件或者利用 Windows 软件对 Linux 上的文件进行处理时，通过 WSL1 可实现更快的性能。

官方目前没有弃用 WSL1 的计划，并且支持将任何一个已经安装的 Linux 发行版更改为 WSL1 或者 WSL2。

安装 WSL
---------------

目前官方无 Fedora 发行版，推荐使用 Ubuntu20.04LTS。

WSL 的安装方式可以参考官方文档：

- 中文指南：https://docs.microsoft.com/zh-cn/windows/wsl/install-win10
- 英文指南：https://docs.microsoft.com/en-us/windows/wsl/install-win10

官方文档对 WSL 安装配置中可能遇到的常见问题都给出了详细的解决方案，请认真阅读。

配置 Linux
-----------

按照官方文档安装 WSL 之后，就可以根据你的 Linux 发行版进行配置使用了。

如果你安装了 Ubuntu，可以参考 《\ :doc:`/computer/ubuntu-setup` 》进行配置。

图形界面显示
---------------

由于 WSL 本身不支持图形界面，我们需要额外安装 X Server 并指定图形输出位置，使得带有图形界面的
桌面程序可以被显示和运行。

Windows 上多种可选的 X Server 软件，`VcXsrv <https://sourceforge.net/projects/vcxsrv/>`__ 
作为开源免费软件，使用方式简单，本文以此软件为例进行介绍。

1. 下载 `VcXsrv <https://sourceforge.net/projects/vcxsrv/>`__\ ，默认安装即可；

2. 运行 XLaunch，除了在 ``Extra settings`` 界面勾选 ``Disable access control`` 之外，其它选项无需更改；

3. 在 Linux 的 ``~/.bashrc`` 文件中添加如下命令后执行 ``source ~/.bashrc``：
   
::    

    # Vcxsrv Display
    # Windows 每次重启后 WSL2 namesever 的 IP 可能发生变化，如下设置保证能够连接到 XServer
    export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    export LIBGL_ALWAYS_INDIRECT=1

4、打开图形界面进行测试。

.. note::

   安装并配置好 XServer 之后，切记先运行 XLaunch 再进入 Linux 环境打开图形界面。
   
WSL 重要命令
---------------
  
以下命令均在 PowerShell 的管理员模式下运行，并且已安装 WSL2 版本的 Ubuntu20.04LTS，名称为 Ubuntu

::    

    # 查看 wsl 命令帮助
    $ wsl -h
    
    # 列出所有已安装的 Linux 发行版的状态，并显示是 wsl1 还是 wsl2
    $ wsl -l -v
    
    # 停止正在运行的 Linux 发行版，假设其名字为 Ubuntu
    $ wsl -t Ubuntu
    
    # 将 Ubuntu 由 wsl2 更改为 wsl1
    $ wsl --set-version Ubuntu 1
    
    # 将 Ubuntu 由 wsl1 改回 wsl2
    $ wsl --set-version Ubuntu 2
    
    # 进入 Linux 环境
    $ bash
    
    # 退出 Linux 环境
    $ exit
    
    # 将名字为 Ubuntu 的 Linux 发行版导出备份
    $ mkdir -p D:\WSLBAK  # 创建备份文件夹
    $ wsl --export Ubuntu D:\WSLBAK\20210117bak.tar   # 备份 wsl 
    
    # 将之前备份的 Linux 发行版 Ubuntu 导入还原
    # 默认的 Linux 发行版都安装在 C 盘，导入还原的时候可以选择其它位置避免 C 盘空间不够
    $ mkdir -p D:\WSLDIR\Ubuntu20.04  # 创建还原的位置
    # 还原 wsl 到 D 盘，并命名为 Ubuntu20.04
    $ wsl --import Ubuntu20.04 D:\WSLDIR\Ubuntu20.04 D:\WSLBAK\20210117bak.tar  
    
    # 设置默认发行版
    # 因为现在有不止一个 Linux 发行版存在，所以需要选择键入 bash 的时候激活哪个
    $ wsl -s Ubuntu20.04   
    
    # 删除某个发行版
    $ wsl --unregister Ubuntu  # 删除名为 Ubuntu 的发行版

    
其它
---------------

开启 WSL 后 Linux 发行版的默认安装位置在 C 盘，当你安装多个发行版的时候显然会占用 C 盘大量的空间，
我们可以选择将一个全新安装的 Linux 发行版先导出备份，然后再还原到其它的位置，
然后将 C 盘上的发行版删除，以保证 C 盘有足够的空间。

WSL1 版本的 Linux 发行版可以和 Windows 系统互相访问文件，而 WSL2 则不行。因此，如果想查看
某个 Linux 发行版的安装位置，可以先切换到 WSL1 版本，进入 Linux 后新建一个名字很特别的文件夹，
然后在 Windows 中查找其位置。

由于 PowerShell 实在难用，推荐使用 VScode 安装 ``Remote - WSL`` 插件，可以实现
在 Windows 的 VScode 中对 Linux 的项目文件进行创作、编辑或运行，
而不会造成任何与跨 Linux 和 Windows 文件系统工作相关联的性能下降。
