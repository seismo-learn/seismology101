zsh 及其配置
============

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-01-21
:预计阅读时间: 20 分钟

Linux 下有很多 Shell，最常见的是 bash，此外还有 zsh、csh、ksh。推荐使用 zsh。

zsh 有如下特点：

- 语法基本完全兼容于 bash，一般用户完全体会不到其区别
- zsh 提供命令补全特性，比 bash 的补全要更好用
- 可配置性强

安装 zsh
---------

在终端键入 ``zsh --version``，若显示 zsh 版本号，则表示 zsh
已安装。否则需要安装 zsh。

Fedora 用户::

    $ sudo dnf install zsh

CentOS 用户::

    $ sudo yum install zsh

Ubuntu/Debian 用户::

    $ sudo apt install zsh

自 macOS Catalina (10.15) 开始，系统默认的 Shell 已由 bash 变为 zsh。

通过如下命令设置默认 Shell 为 zsh::

    $ chsh -s $(which zsh)

``chsh`` 命令修改的是登陆后的 Shell，因而需要退出当前用户并重新登陆，
用户的默认 Shell 就从 bash 变成了 zsh 了。打开新的终端键入
``echo $SHELL``\ ，查看当前 Shell，会显示 :file:`/bin/zsh`\ 。

zsh 的配置文件为 :file:`~/.zshrc`\ 。因而切换到 zsh 后，
所有的 Shell 配置都不用写到 :file:`~/.bashrc`\ ，而要写到 :file:`~/.zshrc` 中。

Oh My Zsh
----------

zsh 稍作配置会更加方便好用，`Oh My Zsh <https://ohmyz.sh/>`__ 是由 Oh My Zsh 社区
维护的一套 zsh 配置文件，使用起来非常方便。一般用户直接使用该配置即可。

安装 Oh My Zsh::

    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

该命令会下载 Oh My Zsh 到 :file:`~/.oh-my-zsh` 目录下，生成默认的 zsh 配置文件 :file:`~/.zshrc`\ ，
并备份老的配置到类似 :file:`.zshrc.pre-oh-my-zsh` 的文件中。

之后可以根据个人习惯修改配置文件 :file:`.zshrc`\ ，如\
`设置主题 <https://github.com/ohmyzsh/ohmyzsh#themes>`__\ 
（如 bira）、\ `启用插件 <https://github.com/ohmyzsh/ohmyzsh#plugins>`__\
等。

设置主题
^^^^^^^^^

修改配置文件 :file:`.zshrc` 便可以使用不同的主题::

    ZSH_THEME="bira"

打开新的终端，查看主题效果。

Oh My Zsh 自带了很多主题，位于 :file:`~/.oh-my-zsh/themes`\ 目录下，可以在线\
`预览主题效果 <https://github.com/ohmyzsh/ohmyzsh/wiki/Themes>`__\ 。
用户也可以启动\ `外部主题 <https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes>`__\ 。

启用插件
^^^^^^^^^

一般直接修改配置文件 :file:`.zshrc` 便可启用插件::

    plugins=(
      sudo
      extract
      autojump
      zsh-autosuggestions
      zsh-syntax-highlighting
    )

Oh My Zsh 自带了很多插件，位于 :file:`~/.oh-my-zsh/plugins`\ 目录下，也可以\
`在线查询 <https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins>`__\ 。
这里推荐几个常用的自带插件。

- `sudo 插件 <https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo>`__\ ：
  按两下 :kbd:`ESC` 即可在当前命令前加上 ``sudo``

- `extract 插件 <https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract>`__\ ： 
  使用 ``x abc.zip`` 语法即可解压几乎所有压缩文件，如 ``.tar.gz``、``.tar.bz2``、``.zip``、
  ``.7z``、``.rar`` 等

- `autojump 插件 <https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autojump>`__\ ：
  非常智能的目录快速切换的工具

  ::

      $ pwd
      /home/seismo-learn
      $ cd Desktop
      $ cd /opt
      $ cd /usr/local

      # 用 j 命令迅速从 /usr/local 跳转到与 des 匹配的目录，这里只有 Desktop 可以匹配
      $ j des
      $ pwd
      /home/seisman/Desktop

  启用 autojump 插件前，需提前安装 `autojump <https://github.com/wting/autojump>`__::

      # Fedora 用户
      $ sudo dnf install autojump-zsh

      # CentOS 用户
      $ sudo yum install autojump-zsh

      # Ubuntu/Debian 用户
      $ sudo apt install autojump
      # 安装后，还要根据 /usr/share/doc/autojump/README.Debian 里的要求做进一步设置

      # macOS 用户
      $ brew install autojump

  .. note::
    
     插件 ``git`` 为 git 的众多常用命令提供了更简单的别名。
     其中，插件 ``git mergetool --no-prompt`` 的别名是 ``gmt``，
     与地学软件 GMT 冲突，建议在 ``.zshrc`` 中不启用插件 ``git``\ 。

除了 Oh My Zsh 自带的插件，还可以安装其他插件。这里推荐几个常用的。

- `zsh-autosuggestions 插件 <https://github.com/zsh-users/zsh-autosuggestions>`__\ ：
  命令自动补全插件，当输入命令的几个字母，它会自动根据历史输入进行自动补全

  启用该插件前，需提前安装::

      $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

- `zsh-syntax-highlighting 插件 <https://github.com/zsh-users/zsh-syntax-highlighting>`__\ ：
  高亮 zsh 可用命令

  启用该插件前，需提前安装::

      $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  该插件需要位于配置文件 :file:`.zshrc` 中的插件列表的最后一位::

      plugins=([plugins...] zsh-syntax-highlighting)
