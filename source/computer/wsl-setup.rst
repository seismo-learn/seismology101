WSL 配置指南
============

:本节贡献者: |赵志远|\（作者）、
             |姚家园|\（审稿）、
             |田冬冬|\（审稿）
:最近更新日期: 2021-01-18
:预计花费时间: 120 分钟

简介
-----

WSL 有 WSL1 和 WSL2 两个发行版本，二者底层原理不同。大多数情况下，建议使用 WSL2，
因为它提供更快的性能和 100% 的系统调用兼容性。但是，当涉及到跨系统的文件互访时
（Linux 访问 Windows 里的文件，或 Windows 访问 Linux 里的文件），使用 WSL1 具有
更快的性能。

官方目前没有弃用 WSL1 的计划，并且支持将任何一个已经安装的 Linux 发行版转换为 WSL1 或者 WSL2。

安装 WSL
---------------

WSL 的安装方式可以参考官方文档：

- 中文指南：https://docs.microsoft.com/zh-cn/windows/wsl/install-win10
- 英文指南：https://docs.microsoft.com/en-us/windows/wsl/install-win10

官方文档对 WSL 安装配置中可能遇到的常见问题都给出了详细的解决方案，请认真阅读。

WSL 可以安装不同的 Linux 发行版，但目前官方并未提供 Fedora 发行版的安装。
推荐使用 WSL 安装 Ubuntu 20.04 LTS 或 Ubuntu 20.10。

.. note::

   想在 WSL 上安装 Fedora 的读者可以参考以下安装指南：

   - https://fedoramagazine.org/wsl-fedora-33/
   - https://suiahae.me/Using-Fedora-33-on-Windows-10-WSL2/

   需要注意的是，我们尚未验证以上安装指南是否有效。

常用命令
---------
  
我们在已安装 WSL2 版本的 Ubuntu 20.04 LTS（假设名称为 Ubuntu）下，使用 PowerShell 的
管理员模式运行以下命令。

``wsl`` 命令用法::

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
    $ wsl -s Ubuntu20.04

    # 删除某个发行版（如名为 Ubuntu）
    $ wsl --unregister Ubuntu

进入和退出 Linux 环境::

    # 进入 Linux 环境（进入默认发行版）
    $ bash
    
    # 退出 Linux 环境
    $ exit
 
开启 WSL 后，Linux 发行版的默认安装位置是 C 盘。为了避免占用 C 盘的大量空间，
可以将已安装的 Linux 发行版导出备份，再导入还原到其他盘，最后删除 C 盘上的发行版::

    # 导出 Linux 发行版，可做为备份
    # 在 D 盘中新建备份目录，命名为 WSLBAK
    $ mkdir -p D:\WSLBAK
    # 导出到备份目录下，命名为 20210117bak.tar
    $ wsl --export Ubuntu D:\WSLBAK\20210117bak.tar
    
    # 导入并还原之前备份的 Linux 发行版
    # 此例中选择在 D 盘中新建还原目录，命名为 Ubuntu20.04
    $ mkdir -p D:\WSLDIR\Ubuntu20.04
    # 导入并还原之前的备份，将此发行版命名为 Ubuntu20.04
    $ wsl --import Ubuntu20.04 D:\WSLDIR\Ubuntu20.04 D:\WSLBAK\20210117bak.tar  

Windows 和 WSL 文件系统互访
---------------------------

WSL1 版本的 Linux 发行版可以和 Windows 系统互相访问文件，而 WSL2 版本
的 Linux 文件无法被 Windows 访问。因此，如果想查看WSL2 版本的某个 Linux 发行版
的安装位置，可以先切换到 WSL1 版本，进入 Linux 后新建一个名字很特别的文件夹，
然后在 Windows 中查找其位置。

推荐使用 VScode，并安装插件
`Remote - WSL <https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl>`__\ 。
使用 Windows 的 VScode 可以编辑和运行 WSL 的文件，且不会
因为跨文件系统工作使性能下降。

配置 Linux
-----------

安装 WSL 之后，还需要对 Linux 发行版进行一定配置。

如果你安装了 Fedora，可以参考 《\ :doc:`/computer/fedora-setup` 》进行配置。

如果你安装了 Ubuntu，可以参考 《\ :doc:`/computer/ubuntu-setup` 》进行配置。

安装 X Server
--------------

WLS 本身不支持图形界面，需要在 Windows 中安装 X server
来接收和显示 Linux 中的图形界面。

.. note::

   X Window System（常称为 X11 或 X）是 UNIX 系统下常用的一种视窗系统，
   主要由 X Server 和 X Client 两部分组成。其中 X Server 负责接受对图形输出
   的请求并反馈用户输入，而 X Client 则是使用图形界面的应用程序。


Windows 下常见的 X Server 有 `VcXsrv <https://sourceforge.net/projects/vcxsrv/>`__\ 、
`Xming <http://www.straightrunning.com/XmingNotes/>`__\ 、
`Xmanager <https://www.xshellcn.com/>`__ 等。
其中，VcXsrv 是开源免费软件；Xming 和 Xmanager 是收费软件。
Xming 在 2007 年发布了最后一个免费版本（6.9.0.31）。
VcXsrv 的使用方式和界面与 Xming 极为相近。
推荐使用 VcXsrv，本文以此软件为例进行介绍。

1.  下载 `VcXsrv <https://sourceforge.net/projects/vcxsrv/>`__\ ，默认安装即可

2.  运行 XLaunch，在 **Extra settings** 界面勾选 **Disable access control**，其他选项无需更改

3.  Windows 每次重启后，WSL2 nameserver 的 IP 可能发生变化，修改 Linux 的
    环境变量以保证始终能连接到 X Server::

        $ echo "export DISPLAY=\$(awk '/nameserver / {print \$2; exit}' /etc/resolv.conf 2>/dev/null):0" >> ~/.bashrc
        $ echo "export LIBGL_ALWAYS_INDIRECT=1" >> ~/.bashrc
        $ source ~/.bashrc

4.  打开图形界面进行测试

.. note::

   安装并配置好 X Server 之后，切记先运行 XLaunch 再进入 Linux 环境打开图形界面。
