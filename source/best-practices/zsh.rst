zsh 配置
=========

Linux 下有很多 shell，最常见的是 bash，此外还有 zsh、csh、ksh。推荐使用 zsh。

zsh 有如下特点：

- 语法基本完全兼容于 bash，一般用户完全体会不到其区别
- zsh 提供命令补全特性，比 bash 的补全要更好用
- 可配置性强

安装 zsh
---------

CentOS 用户::

    $ sudo yum install zsh

Fedora 用户::

    $ sudo dnf install zsh

Ubuntu/Debian 用户::

    $ sudo apt install zsh

自 macOS Catalina 开始，系统默认的 shell 已由 bash 变为 zsh。

配置 zsh
---------

完全不经配置的 zsh 已经很好用了，一般用户也没必要花时间研究配置。

`Oh My Zsh <https://github.com/ohmyzsh/ohmyzsh>`__ 是一群人一起维护的
一套 zsh 配置文件，使用起来非常方便。使用以下命令安装 Oh My Zsh::

    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

该命令会下载 Oh My Zsh 到 :file:`~/.oh-my-zsh` 目录下，生成默认的 zsh 配置文件 :file:`.zshrc`\ ，
并备份老的配置文件到 :file:`.zshrc.pre-oh-my-zsh`\ 。

可以根据习惯修改配置文件 :file:`.zshrc`\ ，如\
`设置主题 <https://github.com/ohmyzsh/ohmyzsh#themes>`__\ 
（如 bira）、\ `启用插件 <https://github.com/ohmyzsh/ohmyzsh#plugins>`__\
等。


常用插件
--------

Oh My Zsh 自带了很多插件，位于 :file:`~/.oh-my-zsh/plugins`\ 目录。

`sudo <>`__

- sudo：按两下 :kbd:`ESC` 即可在当前命令前加上 ``sudo``
- extract：使用 ``x abc.zip`` 语法即可解压几乎所有压缩文件
- autojump:
  非常智能的目录快速切换的工具
- zsh-autosuggestions：
- zsh-syntax-highlighting：

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autojump
brew install autojump
# https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting
# Seems should put at the end of the plugins list
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

.. note::

   插件 ``git`` 为 git 的众多常用命令提供了更简单的别名。
   其中，插件 ``git mergetool --no-prompt`` 的别名是 ``gmt``，
   与地学软件 GMT 冲突，建议在 ``.zshrc`` 中不启用插件 ``git``\ 。

