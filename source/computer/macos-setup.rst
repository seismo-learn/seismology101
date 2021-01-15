macOS 配置指南
==============

:本节作者: `王亮 <https://github.com/wangliang1989>`__\ （作者）、
           `田冬冬 <https://me.seisman.info/>`__\ （作者）、
           `姚家园 <https://github.com/core-man>`__\ （作者）
:最近更新日期: 2021-01-15

.. note::

   本节内容适用于 macOS Catalina（10.15）和 macOS Big Sur（11.x）。
   对于其他 macOS 版本不一定适用。

----

安装系统
--------

第一次启动 Mac 电脑后，经过简单的设置，就得到了一个可供日常使用的 macOS 系统。

设置的过程很直观，唯一需要注意的是，在为电脑创建一个账户时，账户名应避免中文和空格。

macOS 系统的更新也十分简单。当有新版本发布以后，可以直接在“系统偏好设置”的“软件更新”中直接更新即可。

.. table:: 近几年的 macOS 系统版本号
   :align: center  

   ==================== ====================  ======================
    版本号               代号                  发布日期
   ==================== ====================  ======================
   macOS 10.13          High Sierra           2017 年 9 月 25 日
   macOS 10.14          Mojave                2018 年 9 月 24 日
   macOS 10.15          Catalina              2019 年 10 月 7 日
   macOS 11             Big Sur               2020 年 9 月 12 日
   ==================== ====================  ======================

系统工具
--------

经过简单设置后的 macOS 系统，尚不能满足日常科研与编程开发的需求，还需要做
进一步的配置。

Command Line Tools for Xcode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Xcode <https://developer.apple.com/cn/xcode/>`__ 是 macOS 下的集成开发环境（IDE），
类似于 Windows 下的 `Microsoft Visual Studio <https://visualstudio.microsoft.com/>`__\ 。
Command Line Tools for Xcode 是 Xcode 的一部分，其包含了常用的命令行开发工具，
比如 C 编译器、\ ``make``\ 、\ ``git`` 等，是 macOS 下编程开发的必须软件。

按下 :kbd:`Command+空格`\ ，搜索“Terminal”并按下 :kbd:`Enter` 键以打开 Terminal 应用。
在 Terminal 中执行如下命令以安装 Command Line Tools for Xcode::

   $ xcode-select --install

在弹出的窗口中点击“Install”即可。

此处安装的 Command Line Tools for Xcode 可能不是最新版。点击左上角的 Apple 图标，
在“系统偏好设置”的“软件更新”中查看是否有相关更新。如果有，则升级到最新版。

.. note::

   Command Line Tools for Xcode 会被安装到 :file:`/Library/Developer/CommandLineTools/`
   目录，其提供的命令行工具位于 :file:`/Library/Developer/CommandLineTools/usr/bin` 目录，
   包括 ``gcc``、``make``、``git`` 等。

Homebrew
^^^^^^^^

`Homebrew <https://brew.sh/index_zh-cn.html>`__ 是 macOS 下最流行的第三方软件包管理器，
类似于 Linux 系统下的 ``apt``、``yum``、``dnf`` 等包管理器。
其可以用于安装各种常见的软件包、库文件以及字体。日常及科研工作中所需的大多数软件、
库文件以及字体都可以通过 Homebrew 安装。

安装
""""

要安装 Homebrew，需要将如下命令复制到终端中并执行::

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Homebrew 会被安装到 :file:`/usr/local/` 目录下。通过 Homebrew 安装的所有软件包
也都将被安装到该目录下。

.. note::

   GitHub 在国内访问不畅，以上安装命令可能会由于网络问题而失败。
   若以上命令失败，可参考 https://github.com/ineo6/homebrew-install 的
   解决办法。

   同样由于网络的原因，Homebrew 在国内可能下载速度较慢。建议参照
   https://github.com/ineo6/homebrew-install 教程设置中科大源或清华大学源。

使用
""""

安装好 Homebrew 后，打开新的 Terminal 便可以使用 Homebrew 提供的 ``brew`` 命令。
``brew`` 的详细用法见\ `官方文档 <https://docs.brew.sh/Manpage>`__\ 。此处仅列出一些常用的用法::

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

   ``brew``\ ：Homebrew 用于安装各种软件包、库文件以及字体等的命令。

   ``Formula``\ ：一个软件的描述文件，包含了如何安装此软件等信息。``Formulae`` 是其复数。
   每个软件对应一个 ``Formula``\ 。例如，git 对应 ``Formula`` 是
   :file:`/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/git.rb`\ 。
   使用 ``brew ls --formula`` 命令可以查看已安装的 ``Formulae``。

   ``Tap``\ ：一个含有一系列软件（即 ``Formulae``\ ）的 git 仓库。使用
   `brew tap <https://docs.brew.sh/Taps#the-brew-tap-command>`__
   命令查看已启用的仓库列表或启用仓库。已启用的仓库位于
   :file:`/usr/local/Homebrew/Library/Taps/homebrew/` 目录。
   常见软件仓库有 ``homebrew-core`` 和 ``homebrew-cask``\ 。其中，\ ``homebrew-core`` 是内置
   核心仓库，\ ``homebrew-cask`` 仓库则含有各种 macOS 系统下的应用程序。

   ``Bottle``\ ：预先编译好的二进制软件包。使用 ``Bottle`` 安装软件，
   比从源码编译和安装更快。如果一个软件仓库包含预编译的软件包，使用 ``brew install``
   时会自动使用它。

   ``Cask``\ ：Homebrew 的扩展（extension ），用来安装 macOS 的图形界面应用程序。
   使用 ``brew ls --cask`` 命令可以查看已安装的 ``casks``。

   ``Cellar``\ ：所有软件的安装目录，即 :file:`/usr/local/Cellar`\ 。

   ``Keg``\ ：某一软件的安装目录，如 :file:`/usr/local/Cellar/git/2.30.0`\ 。

   更详细的解释请查看\ `官方文档 <https://docs.brew.sh/Formula-Cookbook#homebrew-terminology>`__\ 。


编程开发环境
------------

C
^

Command Line Tools for Xcode 已经提供了 C 编译器和相关工具，因而无需单独安装
C 编译器。

Fortran
^^^^^^^

若需要编译 Fortran 程序，则可以安装 `GNU Fortran <https://gcc.gnu.org/fortran/>`__
编译器（即 ``gfortran``\ ）::

    $ brew install gfortran

Java
^^^^

若要运行 Java 程序，则需要安装 Java 开发环境::

    $ brew install openjdk
    $ sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

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
