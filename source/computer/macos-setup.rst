macOS 配置指南
==============

:本节贡献者: |王亮|\（作者）、
             |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-10-02
:预计花费时间: 120 分钟

----

.. note::

   本节内容适用于 macOS Catalina（10.15）和 macOS Big Sur（11.x），
   不一定适用于其他 macOS 版本。

   .. table:: 近几年的 macOS 系统版本号
      :align: center

      ==================== ====================  ======================
      版本号                代号                   发布日期
      ==================== ====================  ======================
      macOS 10.14          Mojave                2018 年 9 月 24 日
      macOS 10.15          Catalina              2019 年 10 月 7 日
      macOS 11             Big Sur               2020 年 9 月 12 日
      ==================== ====================  ======================

.. note::

   本节大部分软件都通过命令行安装。按下 :kbd:`Command` + :kbd:`空格`，
   输入 “Terminal” 并按下 :kbd:`Enter` 键以启动终端，
   然后在终端中输入命令并按下 :kbd:`Enter` 键即可执行相应的命令。

.. note::

   本配置指南包含如下五小节。部分小节的配置是非必须的，读者可以自行选择是否执行
   相关配置。

   #. `安装系统`_ [**必须**]
   #. `系统软件`_ [**必须**]
   #. `编程开发环境`_ [**强力推荐**]
   #. `命令行工具`_ [**推荐**]
   #. `日常软件`_ [**可选**]

----

安装系统
--------

第一次启动 Mac 电脑后，经过简单的设置，就得到了一个可供日常使用的 macOS 系统。

macOS 系统的更新也十分简单。当有新版本发布以后，可以直接在“系统偏好设置”的
“软件更新”中直接更新即可。

.. warning::

   更新系统前，特别是大版本更新（如 10.15 更新为 11.0），
   最好先备份一下（可以参考\ :doc:`/best-practices/backup`）。

系统软件
--------

经过简单设置后的 macOS 系统，尚不能满足日常科研与编程开发的需求，还需要做
进一步的配置。

Command Line Tools for Xcode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`Xcode <https://developer.apple.com/cn/xcode/>`__ 是 macOS 下的集成开发环境（IDE），
类似于 Windows 下的 `Microsoft Visual Studio <https://visualstudio.microsoft.com/>`__。
Command Line Tools for Xcode 是 Xcode 的一部分，其包含了常用的命令行开发工具，
比如 C/C++ 编译器（``gcc``、``g++``）、``make``、``git`` 等，是 macOS 下编程开发的必需软件。

执行如下命令，并在弹出的窗口中点击 “Install” 以安装 Command Line Tools for Xcode::

   $ xcode-select --install

此处安装的 Command Line Tools for Xcode 可能不是最新版。点击桌面左上角的 Apple 图标，
在“系统偏好设置”的“软件更新”中查看是否有相关更新。如果有，则升级到最新版。
macOS 系统更新后，有时需重新安装 Command Line Tools for Xcode，再次执行以上命令即可。

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

执行如下命令以安装 Homebrew::

    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.. note::

   Homebrew 的安装脚本托管在 `GitHub <https://github.com/>`__ 上，
   国内可能由于网络问题导致 GitHub 访问不畅，因而以上安装命令可能失败。
   若以上命令失败，国内用户可以使用如下命令安装 Homebrew::

        $ /bin/bash -c "$(curl -fsSL https://cdn.jsdelivr.net/gh/ineo6/homebrew-install/install.sh)"

   该安装脚本同时还将默认源设置为中科大源以加速 Homebrew 包的下载。
   详情见 https://github.com/ineo6/homebrew-install 和 https://brew.idayer.com/。

.. note::

   Homebrew 以及通过 Homebrew 安装的所有软件包都会被安装到特定目录下，
   通常是 :file:`/usr/local/` 目录。而在最新的 Apple M1 芯片的 Mac 下，
   这一目录为 :file:`/opt/homebrew/`。

.. note::

   在最新的 Apple M1 芯片的 Mac 下安装 Homebrew 后，还需要设置环境变量::

       $ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
       $ source ~/.zshrc

使用
""""

安装好 Homebrew 后，即可以使用 Homebrew 提供的 ``brew`` 命令。
``brew`` 的详细用法见\ `官方文档 <https://docs.brew.sh/Manpage>`__。此处仅列出一些常用的用法::

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

.. tip::

    Homebrew 用户也可以访问网站 https://formulae.brew.sh/ 查看软件包。

.. dropdown:: :fa:`exclamation-circle,mr-1` Homebrew 相关名词解释
   :container: + shadow
   :title: bg-info text-white font-weight-bold

   使用 Homebrew 时会碰到很多名词。这里做简单解释，
   更详细的解释请查看\ `官方文档 <https://docs.brew.sh/Formula-Cookbook#homebrew-terminology>`__。

   ``brew``
      Homebrew 提供的命令，用于查询、安装、卸载、升级以及管理软件包。

   Formula
      软件的描述文件，包含了软件的基本信息和编译安装方法。
      Homebrew 根据 Formula 提供的信息，即可编译或安装软件。
      每个软件对应一个 Formula。例如，git 对应的 Formula 是
      :file:`/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/git.rb`。

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
      所有软件的安装目录，即 :file:`/usr/local/Cellar`。

   Keg
      某一软件的安装目录，如 :file:`/usr/local/Cellar/git/2.30.0`。

编程开发环境
------------

C/C++
^^^^^

Command Line Tools for Xcode 已经提供了 C/C++ 编译器和相关工具，因而无需单独安装
C/C++ 编译器。

.. dropdown:: :fa:`exclamation-circle,mr-1` GCC 编译器
   :container: + shadow
   :title: bg-info text-white font-weight-bold

    Command Line Tools for Xcode 提供的 C/C++ 编译器本质上是
    `Apple Clang <https://opensource.apple.com/source/clang/clang-23/clang/tools/clang/docs/UsersManual.html>`__ 编译器，
    其与 `GCC <https://gcc.gnu.org/>`__ 编译器有差异，但足以满足日常科研中编译 C/C++ 程序的需求。
    因而一般用户无需再安装 GCC 编译器。

    由于特殊原因（例如需要使用 GCC 特有的功能和选项）需要安装 GCC 编译器的用户，
    可以使用如下命令安装::

        $ brew install gcc

    通过 Homebrew 安装的 GCC 提供了命令 ``gcc-11`` 和 ``g++-11``
    （``11`` 是 GCC 的主版本号）以避免替换 Command Line Tools for Xcode 提供的 ``gcc`` 和 ``g++`` 命令。
    用户如果想使用 GCC 编译器，可以在编译代码时显式指定使用 ``gcc-11`` 和 ``g++-11`` 命令，
    或者在 Homebrew 的 bin 目录下创建软链接::

        $ cd $(brew --prefix)/bin/
        $ ln -s gcc-11 gcc
        $ ln -s g++-11 g++

    打开一个新终端后，使用的 ``gcc`` 和 ``g++`` 命令则默认是 GCC 编译器。
    删除软链接后，默认使用的又是 Apple Clang 编译器了。

Fortran
^^^^^^^

`GNU Fortran <https://gcc.gnu.org/fortran/>`__ 编译器是 macOS 下最常用的
Fortran 编译器，其提供了 ``gfortran`` 命令::

    $ brew install gfortran

Intel 软件开发工具包
^^^^^^^^^^^^^^^^^^^^

`Intel oneAPI <https://software.intel.com/content/www/us/en/develop/tools/oneapi.html>`__
是 Intel 公司开发的软件开发工具包。其提供了 C/C++ 编译器（``icc`` 命令）和 Fortran 编译器（``ifort`` 命令），
以及 MKL 数学库、MPI 并行库等众多软件开发工具。该工具包是免费的，不需要许可证。

.. note::

   地震学新手可以先不安装此工具包，等日常科研中确实需要使用时再安装。

在 macOS 下，官方手册提供了\
`多种安装方式 <https://software.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-macos/>`__，
如在线安装、本地安装、使用 ``conda`` 安装等。这里，我们推荐使用本地安装方式。

根据自己的需要，从官网下载
`C/C++ 编辑器 <https://software.intel.com/content/www/us/en/develop/articles/oneapi-standalone-components.html#compilerclassic>`__
或 `Fortran 编译器 <https://software.intel.com/content/www/us/en/develop/articles/oneapi-standalone-components.html#fortran>`__
的离线安装包（Offline），然后直接双击安装。默认安装目录是 :file:`/opt/intel/oneapi`。

安装完成后还需要配置环境变量::

    $ echo "source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1" >> ~/.zshrc

.. dropdown:: :fa:`exclamation-circle,mr-1` Intel 软件开发工具列表
   :container: + shadow
   :title: bg-info text-white font-weight-bold

   Intel oneAPI 提供了众多软件开发工具，用户可以根据需要到
   `Intel 官网 <https://software.intel.com/content/www/us/en/develop/articles/oneapi-standalone-components.html>`__
   下载其他 macOS 离线安装包并安装。

Java
^^^^

运行 Java 程序需要安装 Java 运行环境，即 OpenJDK::

    $ brew install openjdk
    $ sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

Python
^^^^^^

macOS 默认的 Python 版本为 Python 2.7，而目前主流的 Python 版本为
Python 3.x。建议通过 :doc:`Anaconda <software:anaconda/index>`
来安装最新版 Python。

git
^^^

`git <https://git-scm.com/>`__ 是目前最流行的版本控制工具，推荐在科研过程中使用
git 管理自己编写的代码和文件。Command Line Tools for Xcode 中已经安装了 Apple 版
的 git，其与原版 git 有一些区别。可以用如下命令安装原版的 git::

    $ brew install git

命令行工具
----------

macOS 系统默认安装了日常科研所需的大多数命令行工具。这里推荐一些其它有用的命令行工具。

dos2unix & unix2dos
^^^^^^^^^^^^^^^^^^^

Windows 和 Linux/macOS 系统下，`文本文件的换行符 <https://www.ruanyifeng.com/blog/2006/04/post_213.html>`__\ 是不同的。
``dos2unix`` 可以将 Windows 系统下的换行符转换为 Linux/macOS 系统下的换行符，
``unix2dos`` 则反之::

    $ brew install dos2unix unix2dos

wget
^^^^

`wget <https://www.gnu.org/software/wget/>`__ 是用于下载文件的命令行工具::

    $ brew install wget

tldr
^^^^

`tldr <https://tldr.sh/>`__ 是一个提供命令的常用用法和示例的命令行工具，
其功能与 UNIX 下的 ``man`` 命令相似，但其提供的输出更简单、更易读。
安装 ``tldr``::

    $ brew install tldr

ack
^^^

`ack <https://beyondgrep.com/>`__ 是一个字符搜索工具，与 ``grep`` 命令类似。
其专为搜索源代码设计，因而在日常编程中更加简单易用。安装 ``ack``::

    $ brew install ack

GNU 实用工具
^^^^^^^^^^^^

macOS 下自带了很多实用工具，如 ``sed``、``grep`` 等（位于 :file:`/usr/bin/` 目录下）。
需要注意，这些实用工具是由 BSD 提供的，而 Linux 系统下的实用工具则是由 GNU 提供的。
BSD 和 GNU 实用工具的命令行语法有相似之处，但也有差异。二者之间的常见差异可以参考
此\ `博文 <https://ponderthebits.com/2017/01/know-your-tools-linux-gnu-vs-mac-bsd-command-line-utilities-grep-strings-sed-and-find/>`__。
由于网络上的大部分文档介绍的都是 GNU 实用工具的用法，因而 macOS 用户在使用网络上的
命令时可能会出现错误。这一点可以通过安装 GNU 实用工具来解决::

    # 此处仅安装常用的 GNU 实用工具
    $ brew install findutils gawk gnu-sed gnu-tar grep

Homebrew 将 GNU 实用工具安装在 :file:`/usr/local/bin` 目录下，但在所有工具的名称前
加上了前缀 ``g``，以避免替换 macOS 系统自带的 BSD 实用工具，即 ``sed`` 是 BSD 提供的，
而 ``gsed`` 是 GNU 提供的。一般情况下，建议使用 BSD 工具（无前缀 ``g``），
在遇到不兼容的情况下，可以考虑使用 GNU 工具（有前缀 ``g``），但在写脚本时，
要额外注意脚本的可移植性。

日常软件
--------

以下软件均为可选，有需要的用户可以根据自己的需求选择是否安装。

iTerm2
^^^^^^

macOS 系统自带了 Terminal 应用，但 `iTerm2 <https://iterm2.com/>`__ 相比于自带的
Terminal 具有更多有用的功能，比如支持水平和垂直分割窗格、强大的终端搜索功能、
更好用的复制粘贴功能等。

::

    $ brew install --cask iterm2

文本编辑器
^^^^^^^^^^

macOS 系统自带的文本编辑器只具有最基本的文本编辑功能。无法满足日常编程需求。
推荐安装并使用更强大的文本编辑器 `Visual Studio Code <https://code.visualstudio.com/>`__::

    $ brew install --cask visual-studio-code

解压软件
^^^^^^^^

macOS 系统自带的解压工具可以支持 ``.tar.gz``、``.zip`` 等格式，但默认不支持 ``.rar`` 格式。
推荐安装解压软件 `The Unarchiver <https://theunarchiver.com/>`__，其支持
几乎所有压缩格式。安装后即可通过双击直接解压 ``.rar`` 文件::

    $ brew install --cask the-unarchiver

Google Earth
^^^^^^^^^^^^

Google Earth 是 Google 公司开发的虚拟三维地球软件，其提供了高精度的卫星图像，
并允许用户添加 KML 或 KMZ 格式的自定义数据。
非重度用户可以使用 `Google Earth 网页版 <https://earth.google.com/web>`__，
重度用户可以执行如下命令安装桌面版::

    $ brew install --cask google-earth-pro

浏览器
^^^^^^

macOS 自带了 Safari 浏览器，用户也可以安装 Google Chrome 浏览器::

    $ brew install --cask google-chrome

或 Microsoft Edge 浏览器::

    $ brew install --cask microsoft-edge

QuickLook 插件
^^^^^^^^^^^^^^

macOS 下空格键具有强大的功能。在文件浏览器 Finder 中，按下空格键，会调用
QuickLook 以预览文件的内容，非常方便。QuickLook 默认支持 PDF 以及图片等格式。
可以为 QuickLook 安装更多的插件以支持预览其他文件格式::

    # 预览源码时加上语法高亮
    $ brew install --cask qlcolorcode

    # 预览无后缀的纯文本文件，比如 README，HISTORY 等
    $ brew install --cask qlstephen

    # 预览渲染后的 Markdown 文件
    $ brew install --cask qlmarkdown

.. note::

   安装这些插件以后，调用 QuickLook 预览文件时，可能会显示这些插件无法打开。
   这是因为系统默认不信任这些第三方插件。可以在“系统偏好设置”的“安全性与隐私”
   中点击“总是打开”来使用这些插件。这一操作可能需要重启电脑才会生效。

虚拟机
^^^^^^

如果在使用 macOS 的同时，偶尔需要使用 Windows 或 Linux 系统，可以考虑使用虚拟机。
macOS 下最常用的虚拟机软件有
`Parallels Desktop <https://www.parallels.com/>`__、
`VMware Fusion <https://www.vmware.com/products/fusion.html>`__ 和
`VirtualBox <https://www.virtualbox.org/>`__。
其中 VirtualBox 是免费软件；Parallel Desktop 和 VMware Fusion 是收费软件，
但 VMware Fusion 为个人用户提供了免费的 License。

推荐使用 VMware Fusion。安装 VMware Fusion的命令很简单::

    $ brew install --cask vmware-fusion

启动后在弹出的界面有“Get a Free License”按钮，点击跳转到 VMware 网站，注册后
即可获取秘钥，输入秘钥则成功注册。
