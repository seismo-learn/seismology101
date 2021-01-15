zsh 配置
=========

自 macOS Catalina 开始，系统默认的 Shell 由 bash 变为 zsh。
`Oh My Zsh <https://github.com/ohmyzsh/ohmyzsh>`__ 一套 zsh 配置文件，
非常方便使用。使用如下命令安装::

    $ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

该命令下载 Oh My Zsh 到 ``~/.oh-my-zsh`` 目录下，生成默认的 zsh 配置文件 ``.zshrc``\ ，
并备份配置文件老的配置文件到 ``.zshrc.pre-oh-my-zsh``\ 。

根据自身习惯，修改 ``.zshrc``\ 。比如设置喜欢的主题，如 ``bira``，安装喜欢的插件，
如 ``sudo``\ 、``extract``\ 、``autojump``\ 、``zsh-autosuggestions``\ 、
``zsh-syntax-highlighting`` 等。

.. note::

   插件 ``git`` 为 git 的众多常用命令提供了更简单的别名。
   其中，插件 ``git mergetool --no-prompt`` 的别名是 ``gmt``，
   与地学软件 GMT 冲突，建议在 ``.zshrc`` 中不启用插件 ``git``\ 。
