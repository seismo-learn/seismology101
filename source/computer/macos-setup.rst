macOS 配置指南
==============

:本节作者: `王亮 <https://github.com/wangliang1989>`__\ （作者）、
           `田冬冬 <https://me.seisman.info/>`__\ （作者）、
           `姚家园 <https://github.com/core-man>`__\ （审稿）
:最近更新日期: 2021-01-14

----

第一次启动 Mac 电脑后，经过简单的设置，就得到了一个可供日常使用的 macOS 系统，
但这样的 macOS 系统尚不能满足日常科研与编程开发的需求，还需要做进一步的配置。

Command Line Tools for Xcode
----------------------------

Xcode 是 macOS 下的集成开发环境（IDE），类似于 Windows 下的 Microsoft Visual Studio。
Command Line Tools for Xcode 是 Xcode 的一个子集，其包含了常用的命令行开发工具，
比如 C 编译器、make、git 等，是安装很多其他软件的基础。

按下 :kbd:`Command+空格`\ ，搜索并打开“Terminal”。在 Terminal 中执行如下命令
以安装 Command Line Tools for Xcode::

   $ xcode-select --install

在弹出的窗口点击“Install”即可。

此处安装的 Command Line Tools 可能不是最新版，可以到“App Store”的“更新”中或
“设置”的“软件更新”中查看是否有相关更新。如果有，则升级到最新版。

.. note::

   可以查看 ``/Library/Developer/CommandLineTools/usr/bin`` 目录，
   了解安装的所有命令，如 ``gcc``\ 、``make``\ 、``git``\ 。使用这些命令
   时，其环境变量路径时 ``/usr/bin``\ 。
   

Homebrew
--------

`Homebrew <https://brew.sh/index_zh-cn.html>`__ 是 macOS 下的第三方软件包管理器。
可以用于安装各种常见的软件包、库文件以及字体。日常及科研工作中所需的大多数软件、
库文件以及字体都可以通过 Homebrew 安装。

要安装 Homebrew，需要将如下命令复制到终端中并执行::

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

安装好以后，打开新的 Terminal 便可以使用 ``brew`` 命令。
Homebrew 的详细用法见官方文档。此处仅列出一些常用的用法::

    # 模糊搜索与 wget 相关的软件
    $ brew search wget

    # 安装 wget 软件包
    $ brew install wget

    # 安装 Visual Studio Code
    # 由于 Visual Studio Code 是带图形界面的软件，因而这里需要使用 --cask 选项
    $ brew install --cask visual-studio-code

    # 升级某个软件
    $ brew upgrade xxx

    # 卸载某个软件
    $ brew uninstall xxx

.. note::

   Homebrew 可能在国内下载速度较慢，可以考虑使用中科大 LUG 提供的 Homebrew 镜像。
   详细使用方法见：

   - Homebrew 源镜像：http://mirrors.ustc.edu.cn/help/brew.git.html
   - Homebrew Bottles 源镜像：http://mirrors.ustc.edu.cn/help/homebrew-bottles.html
   - Homebrew Core 源镜像：http://mirrors.ustc.edu.cn/help/homebrew-core.git.html
   - Homebrew Cask 源镜像：http://mirrors.ustc.edu.cn/help/homebrew-cask.git.html

编程开发环境
------------

C
^

Command Line Tools for Xcode 已经提供了 C 编译器和相关工具，因而无需单独安装
C编译器。

Fortran
^^^^^^^

若需要编译 Fortran 程序，则可以安装 `GNU Fortran <https://gcc.gnu.org/fortran/>`__
编译器（即 ``gfortran``\ ）::

    $ brew install gfortran

Java
^^^^

若要运行 Java 程序，则需要安装 Java 开发环境::

    $ brew install openjdk
    $ sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

Python
^^^^^^

macOS 默认的 Python 版本为 Python 2.7，而目前主流的 Python 版本为
Python 3.x。建议通过 `Anaconda <https://seismo-learn.org/software/anaconda/>`__
来安装最新版 Python。

git
^^^

`git <https://git-scm.com/>`__ 是最流行的版本控制工具，也是科研过程中编写代码
以及项目管理推荐使用的软件。使用如下命令安装 git::

    $ brew install git

.. note::

   使用 ``brew`` 命令安装的 git 位于 ``/usr/local/bin/`` 目录下，而
   Command Line Tools for Xcode 携带的 git 位于 ``/usr/bin/``
   目录下。我们使用 ``echo $PATH`` 命令查看环境变量 ``$PATH`` 会发现，
   一般情况下，\ ``/usr/local/bin/`` 位于 ``/usr/bin/`` 前。因此，
   此时我们使用的 git 其实是通过 ``brew`` 安装的版本。

其他命令行工具
--------------

这里推荐一些常用的命令行工具。

Windows 和 Linux/macOS 系统下，文本文件的换行符时不同的。
dos2unix 可以将 Windows 系统下的换行符转换为 UNIX 系统下的换行符。
unix2dos 则反之::

    $ brew install dos2unix unix2dos

`gawk <https://www.gnu.org/software/gawk/>`__ 是用于文本处理的命令行工具。
macOS 自带的 awk 语法上与 gawk 有所不同。推荐安装并使用 gawk::

    $ brew install gawk

`wget <https://www.gnu.org/software/wget/>`__ 是用于下载文件的命令行工具::

    $ brew install wget

其他效率软件
------------

如上所说，Homebrew 可以用于安装日常及科研的大部分软件。这里推荐一些可以提升
效率的 macOS 软件。

解压软件 `The Unarchiver <https://theunarchiver.com/>`__::

    $ brew install --cask the-unarchiver

文本编辑器 `Visual Studio Code <https://code.visualstudio.com/>`__::

    $ brew install --cask visual-studio-code

macOS 自带了 Terminal，但 `iTerm2 <https://iterm2.com/>`__ 更好用::

    $ brew install --cask iterm2

macOS 下空格键具有强大的功能。在文件浏览器 Finder 中，按下空格键，会调用
QuickLook 以预览文件的内容，非常方便。QuickLook 默认支持 PDF 以及图片等格式。
可以为 QuickLook 安装更多的插件以支持预览其他文件格式::

    # 预览源码时加上语法高亮
    $ brew install --cask qlcolorcode

    # 预览无后缀的纯文本文件，比如README, HISTORY等
    $ brew install --cask qlstephen

    # 预览渲染后的markdown文件
    $ brew install --cask qlmarkdown

.. note::

   安装这些插件以后，调用 QuickLook 预览文件时，可能会显示这些插件无法打开，
   因为苹果无法判断其是否是恶意软件。可以在 ``System Preferences`` 的
   ``Security & Privacy`` 中点击 ``Open Anyway`` 使用这些插件。
