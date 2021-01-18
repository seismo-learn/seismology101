macOS 配置指南
==============

:本节贡献者: |王亮|\（作者）、
             |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-01-17
:预计花费时间: 120 分钟

.. note::

   本节内容适用于 macOS Catalina（10.15）和 macOS Big Sur（11.x）。
   对于其他 macOS 版本不一定适用。

----

安装系统
--------

第一次启动 Mac 电脑后，经过简单的设置，就得到了一个可供日常使用的 macOS 系统。

macOS 系统的更新也十分简单。当有新版本发布以后，可以直接在“系统偏好设置”的“软件更新”中直接更新即可。

.. table:: 近几年的 macOS 系统版本号
   :align: center

   ==================== ====================  ======================
   版本号                代号                   发布日期
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
比如 C 编译器、\ ``make``\ 、\ ``git`` 等，是 macOS 下编程开发的必需软件。

按下 :kbd:`Command + 空格`\ ，搜索“Terminal”并按下 :kbd:`Enter` 键以打开 Terminal 应用。
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

打开 Terminal，将如下命令复制到 Terminal 中并按下 :kbd:`Enter` 键即可安装 Homebrew::

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

安装好 Homebrew 后，即可以使用 Homebrew 提供的 ``brew`` 命令。
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

   使用 Homebrew 时会碰到很多名词。这里做简单解释，
   更详细的解释请查看\ `官方文档 <https://docs.brew.sh/Formula-Cookbook#homebrew-terminology>`__\ 。

   ``brew``
      Homebrew 提供的命令，用于查询、安装、卸载、升级以及管理软件包。

   Formula
      软件的描述文件，包含了软件的基本信息和编译安装方法。
      Homebrew 根据 Formula 提供的信息，即可编译或安装软件。
      每个软件对应一个 Formula。例如，git 对应的 Formula 是
      :file:`/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/git.rb`\ 。

   Bottle
      预先编译好的二进制软件包。使用 Bottle 安装软件，
      比从源码编译和安装更快。如果一个软件仓库包含预编译的软件包，使用 ``brew install``
      时会自动使用它。

   Tap
      一个含有一系列软件的 git 仓库。使用
      `brew tap <https://docs.brew.sh/Taps#the-brew-tap-command>`__
      命令查看已启用的仓库列表或启用仓库。已启用的仓库位于
      :file:`/usr/local/Homebrew/Library/Taps/homebrew/` 目录。
      常见软件仓库有 `homebrew-core <https://github.com/Homebrew/homebrew-core>`__
      和 `homebrew-cask <https://github.com/Homebrew/homebrew-cask>`__。
      其中，homebrew-core 是内置核心仓库，
      homebrew-cask 仓库则含有各种 macOS 系统下带图形界面的应用程序。

   Cask
      Homebrew 的扩展功能，用于安装 macOS 下的图形界面应用程序。
      使用 ``brew list --cask`` 命令可以查看已安装的 casks。

   Cellar
      所有软件的安装目录，即 :file:`/usr/local/Cellar`\ 。

   Keg
      某一软件的安装目录，如 :file:`/usr/local/Cellar/git/2.30.0`\ 。

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
Python 3.x。建议通过 :doc:`Anaconda <software:anaconda/index>`
来安装最新版 Python。

git
^^^

`git <https://git-scm.com/>`__ 是最流行的版本控制工具，也是科研过程中编写代码
以及项目管理推荐使用的软件。Command Line Tools for Xcode 中已经安装了 Apple 版
的 git，其与原版 git 有一些区别。可以用如下命令安装原版的 git::

    $ brew install git

.. note::

   Homebrew 安装的 ``git`` 位于 :file:`/usr/local/bin/` 目录下，而
   Command Line Tools for Xcode 安装的 ``git`` 位于 :file:`/usr/bin/`
   目录下。在环境变量 **PATH** 中，:file:`/usr/local/bin/` 一般在 :file:`/usr/bin/` 前。
   因此，我们使用的 ``git`` 其实是通过 Homebrew 安装的版本。

X11
^^^

X11（也称 X Window System）是 UNIX 系统下常用的一种视窗系统。某些软件（如 SAC 和 CPS330）需要使用它。
在 macOS 下，需要安装 `XQuartz <https://www.xquartz.org/>`__::

   $ brew install --cask xquartz

.. note::

   1. 与其他通过 Homebrew 安装的软件不同，X11 被安装到了 :file:`/opt/X11` 目录下
   2. 需要重启电脑后 X11 才能生效，可以等配置完 macOS 系统后再重启
   3. 重启电脑后，打开 Terminal，执行命令 ``/opt/X11/bin/xclock``\ 。若出现一个
      带时钟的窗口，则表明 X11 正常安装与运行

其他命令行工具
^^^^^^^^^^^^^^

这里推荐一些常用的命令行工具。

Windows 和 Linux/macOS 系统下，`文本文件的换行符 <https://www.ruanyifeng.com/blog/2006/04/post_213.html>`__\ 是不同的。
``dos2unix`` 可以将 Windows 系统下的换行符转换为 Linux/macOS 系统下的换行符。
``unix2dos`` 则反之::

    $ brew install dos2unix unix2dos

`gawk <https://www.gnu.org/software/gawk/>`__ 是用于文本处理的命令行工具。
macOS 自带的 awk 语法上与 gawk 有所不同。推荐安装并使用 ``gawk``::

    $ brew install gawk

`wget <https://www.gnu.org/software/wget/>`__ 是用于下载文件的命令行工具::

    $ brew install wget

日常软件
--------

以下软件均为可选，有需要的用户可以作为自己的需求选择是否安装。

iTerm2
^^^^^^

macOS 系统自带了 Terminal 应用，但 `iTerm2 <https://iterm2.com/>`__ 相比于自带的
Terminal 具有更多有用的功能，比如支持水平和垂直分隔窗格、强大的终端搜索功能、
更好用的复制粘贴功能等。

::

    $ brew install --cask iterm2

文本编辑器
^^^^^^^^^^

macOS 系统自带的文本编辑器只具有最基本的文本编辑功能。无法满足日常编程需求。
推荐安装更强大的文本编辑器 `Visual Studio Code <https://code.visualstudio.com/>`__::

    $ brew install --cask visual-studio-code

解压软件
^^^^^^^^

macOS 系统自带的解压工具可以支持 ``.tar.gz``、``.zip`` 等格式，但不支持 ``.rar`` 格式。
推荐安装解压软件 `The Unarchiver <https://theunarchiver.com/>`__\ ，其支持
几乎所有压缩格式::

    $ brew install --cask the-unarchiver

QuickLook 插件
^^^^^^^^^^^^^^

macOS 下空格键具有强大的功能。在文件浏览器 Finder 中，按下空格键，会调用
QuickLook 以预览文件的内容，非常方便。QuickLook 默认支持 PDF 以及图片等格式。
可以为 QuickLook 安装更多的插件以支持预览其他文件格式::

    # 预览源码时加上语法高亮
    $ brew install --cask qlcolorcode

    # 预览无后缀的纯文本文件，比如 README，HISTORY 等
    $ brew install --cask qlstephen

    # 预览渲染后的markdown文件
    $ brew install --cask qlmarkdown

.. note::

   安装这些插件以后，调用 QuickLook 预览文件时，可能会显示这些插件无法打开。
   这是因为系统默认不信任这些第三方插件。可以在“系统偏好设置”的“安全性与隐私”
   中点击“总是打开”来使用这些插件。这一操作可能需要重启电脑才会生效。

虚拟机
^^^^^^

如果在使用 macOS 的同时，偶尔需要使用 Windows 或 Linux 系统，可以考虑使用虚拟机。
macOS 下最常用的虚拟机软件有
`Parallels Desktop <https://www.parallels.com/>`__\、
`VMware Fusion <https://www.vmware.com/products/fusion.html>`__ 和
`VirtualBox <https://www.virtualbox.org/>`__\ 。
其中 VirtualBox 是免费软件；Parallel Desktop 和 VMware Fusion 是收费软件，
但 VMware Fusion 为个人用户提供了免费的 License。

推荐使用 VMware Fusion。安装 VMware Fusion的命令很简单::

    $ brew install --cask vmware-fusion

启动后在弹出的界面有“Get a Free License”按钮，点击跳转到 VMware 网站，注册后
即可获取秘钥，输入秘钥则成功注册。
