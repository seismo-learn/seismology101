编辑器
=======

:本节贡献者: |姚家园|\（作者）、
             |田冬冬|\（审稿）
:最近更新日期: 2021-02-13
:预计花费时间: 30 分钟

----

我们可以在终端输入命令交给系统执行，但要编辑文本或者编写代码，则需要使用一个叫做编辑器的程序，
即一个允许移动光标在屏幕上编辑文字的程序。编辑器是科研人员写代码和和管理系统配置文件的重要工具。

日常科研中，我们大部分时间都花在编写代码和普通文件上，所以花点时间掌握某个适合自己的编辑器是
非常值得的。通常学习和掌握一个新的编辑器的步骤如下：

- 阅读教程：例如，官方文档、本教程等
- 坚持使用它来完成所有的编辑工作：一般而言，刚开始会让工作效率降低
- 随时查阅：如果某个操作看起来像是有更方便的实现方法，一般情况下真的会有

如果遵循上述步骤，并且坚持使用新的编辑器完成所有的编辑任务，则学习一个复杂的编辑器的过程
一般是这样的：

- 前两个小时学习编辑器的基本操作。例如，打开和编辑文件、保存与退出等
- 学习时间累计达到一定时间后（如 20 个小时），使用新编辑器的效率应该已经和使用老编辑器一样快
- 此后，新编辑器地益处开始显现，因为有了足够的知识和肌肉记忆后，使用新编辑器将大大节省时间
  
现代编辑器都是一个复杂且强大的工具，永远有新东西可学：学的越多，效率越高。

该学哪个编辑器？这个问题没有标准答案，选择其中一个一直用下去，遇到需要重复劳动或者不顺心的地方
就去找各种配置和插件。笔者在这里只是根据自身经验，做一点总结和推荐。

编辑器按照操作方式可以分为两种类型：基于命令行的和图形化的。例如，`vim <https://www.vim.org/>`__
是一款基于命令行的较为流行的编辑器，`Visual Studio Code <https://code.visualstudio.com/>`__\
（VS Code）是一款图形化的较为流行的编辑器。

编辑器按照功能可以又大致分为三种类型：文本编辑器、代码编辑器以及集成开发环境（Integrated Development Environment，简称 IDE）。
例如，vim 一般算为文本编辑器，VS Code 算为代码编辑器，`PyCharm <https://www.jetbrains.com/pycharm/>`__
是一款主要用于基于 Python 语言的软件开发的集成开发环境。当然，有时候并不能简单地将某一编辑器归属于其中一种。
例如，代码编辑器本身也可以很方便地用于编辑文本，代码编辑器也有集成开发环境地部分功能。
当我们编写代码时，经常在文件间进行切换、阅读、浏览和修改代码，而不是连续编写一大段的文字，
因此代码编辑器和纯文本编辑器是很不同的两种工具。一般而言，文本编辑器启动速度最快，集成开发环境最慢；
开发大型软件时，集成开发环境使用起来会更有效率。

Linux 系统一般自带了一个叫做 gedit 的图形化编辑器，但是使用该编辑器来写程序效率太低，不建议使用。
VS Code 是目前最流行的代码编辑器，用于文本编辑时也非常高效，地震学日常科研中推荐使用 VS Code 编辑
文本和代码。vim 是最流行的基于命令行的编辑器，有时候可能是用户唯一可以使用的编辑器，推荐掌握其基本的
编辑功能，以便在无法使用 VS Code 或简单文本和代码编辑时使用。

Visual Studio Code
-------------------

安装和使用
^^^^^^^^^^

可以参考\ :doc:`setup`\ 中相应操作系统下的“日常软件”安装 VS Code。

刚接触 VS Code 的用户可以参考 VS Code 官方入门教程 `Get Started <https://code.visualstudio.com/docs/getstarted/introvideos>`__
学习常用用法。使用过程中，可以根据个人习惯配置 VS Code，还可以安装和使用扩展包。

日常科研使用 VS Code 编辑文档和代码遇到疑问时，可以随时查阅，如以下方式：

- 点击菜单栏“帮助”，选择相关选项。例如，“交互式演练场”、“文档”（Visual Studio Code 官方文档）、“键盘快捷键参考”等
- 使用 Google 搜索

.. dropdown:: :fa:`exclamation-circle,mr-1` 安装 VS Code 中文语言包
   :container: + shadow
   :title: bg-info text-white font-weight-bold

   VS Code 的界面默认显示语言是英文，可以安装中文语言包。点击菜单栏“查看”后选择“命令面板”
   （快捷键：\ :kbd:`Ctrl` + :kbd:`Shift` + :kbd:`p`\ ），接着输入“configure display language”并按
   :kbd:`Enter` 键，然后选择“安装其他语言”。这时界面会跳转到插件商店自动搜索其他语言，一般第一个就是中文，
   即“Chinese (Simplified) Language Pack for Visual Studio Code”，点击安装就行了。
   安装完之后自动重启，界面就变成中文了。

编辑远程计算机文件
^^^^^^^^^^^^^^^^^^

一般编辑远程计算机中的文件，都是先登录到远程计算机，然后用 vim 编辑。现在，我们也可以借助 VS Code 扩展包
Remote - SSH，使用 VS Code 来编辑，这会极大地提高编辑效率。可以参考VS Code 官方文档
`ssh <https://code.visualstudio.com/docs/remote/ssh>`__
了解详细用法，本文简要介绍如何安装和使用该扩展包。

在“扩展”中，搜索“Remote - SSH”，点击安装。安装完之后，左下角导航栏会多一个类似 ``><`` 的远程连接图标。
之后可以通过点击该图标来使用该扩展包。

接下来需要设置远程计算机的 SSH 主机。远程计算机一般已安装 SSH 服务器，本地计算机一般也已安装 SSH 客户端。
我们还需要配置基于密钥的认证，这也是 VS Code 官方推荐的认证方式。本地计算机下，运行以下命令::

    $ ssh-keygen -t rsa -f ~/.ssh/id_rsa-remote-ssh

该命令会产生一对 SSH 密钥，分别位于 :file:`~/.ssh/id_rsa-remote-ssh` 和 :file:`~/.ssh/id_rsa-remote-ssh.pub` 文件中。
前者是私钥文件，不能泄露；后者是公钥文件，需要告诉远程计算机。假设远程计算机的系统是 Linux 或 macOS，
IP 地址是 192.168.1.100，用户名是 seismo-learn，运行以下命令:::

    $ ssh-copy-id -i ~/.ssh/id_rsa-remote-ssh.pub seismo-learn@192.168.1.100

以上命令要求输入用户在远程计算机的密码，然后就会把本地的公钥以追加的方式复制到远程计算机的 :file:`~/.ssh/authorized_keys` 文件中，
并给远程计算机中的用户家目录、:file:`~/.ssh` 目录以及 :file:`~/.ssh/authorized_keys` 设置合适的权限。
若远程计算机或本地计算机是 Windows 系统，请参考 `Quick start: Using SSH keys <https://code.visualstudio.com/docs/remote/troubleshooting#_quick-start-using-ssh-keys>`__
进行配置。

在终端中输入以下命令，验证是否配置是否成功，即可以登录远程计算机（用户需替换自己的用户名和远程计算机 IP 地址）::

    $ ssh seismo-learn@192.168.1.100

点击左下角的远程连接图标，选择“Remote-SSH: Connect to Host”，输入 seismo-learn@192.168.1.100 便可
使用 VS Code 编辑远程计算机中的文件了。

文件编辑完毕后，选择菜单栏“文件”中的“关闭远程连接”，或者直接关闭 VS Code，就可以退出远程连接。

.. tip::

   如果需要经常连接远程计算机，可以使用 SSH 配置文件。在活动栏，选择“远程资源管理器”，点击“配置”选择
   :file:`~/.ssh/config` 配置文件，按照以下格式添加相关信息到该文件中::

       Host seismology
           User seismo-learn
           HostName 192.168.1.100
           IdentityFile ~/.ssh/id_rsa-remote-ssh

   其中，第一列是关键词，如 Host、User、HostName、IdentityFile，第二列是对应的值。seismology 是
   用户自定义的远程主机标识，其他三个值同上文。可以按照该格式，向该文件中添加多个远程计算机。

   然后点击左下角的远程连接图标，选择“Remote-SSH: Connect to Host”，点击“seismology”就可以登录远程计算机了。
   也可以通过“远程资源管理器”，点击“seismology”登录远程计算机。

.. tip::

   如果远程计算机使用的 Shell 是 Bash，本地计算机是 Zsh，则可能无法启动 VS Code 的终端，
   需要修改一下配置文件。打开命令面板，输入 Remote-SSH: Settings 后，搜索 terminal.integrated.shell.linux。
   然后将 "/bin/zsh" 改为 "/bin/bash" 即可。详情请参考 `microsoft/vscode-remote-release issues #38 <https://github.com/microsoft/vscode-remote-release/issues/38>`__

vim
----

vim 是一款基于命令行的编辑器，拥有以下特点：

- vim 的快捷键和插件配置，可以让我们使用键盘快速地完成文本编辑。vim 避免了使用鼠标，甚至避免用上下左右键，
  因为这些需要太多的手指移动
- vim 轻量级且执行快。对于许多简单任务，启动 vim 比使用图形化编辑器要快地多
- vim 在很多 Linux 发行版都预装了，某些时候可能是我们唯一能使用的编辑器，比如使用远程计算机

在大多数 Linux 发行版中，vim 也可以用 vi 替代。可以使用以下命令查看::

    $ which vim
    /usr/bin/vim
    $ which vi                          
    vi=vim

本文只介绍 vim 的一些基本用法，可以参考\ `简明 VIM 练级攻略 <https://coolshell.cn/articles/5426.html>`__\
学习更多用法。

操作模式
^^^^^^^^^

Vim 的设计以大多数时间都花在阅读、浏览和进行少量编辑改动为基础，因此它具有多种操作模式：

- 正常模式：移动光标、复制、粘贴、删除等
- 插入模式（INSERT）：插入文本
- 命令模式：执行一些指令
- 替换模式（REPLACE）：替换文本
- 可视化模式：用于选中文本块，分为可视化（VISUAL）、可视化行（VISUAL LINE）、可视化块（VISUAL BLOCK）

在不同的操作模式下，键盘敲击的含义也不同。vim 默认会在左下角显示当前的操作模式。启动时的默认模式是正常模式，
可以使用以下方式，在不同模式只见进行切换：

- 按下 :kbd:`Esc` 键可以从任何其他模式返回正常模式
- 在正常模式下，按 :kbd:`i` 键进入插入模式
- 在正常模式下，按 :kbd:`:` 键进入命令模式
- 在正常模式下，按 :kbd:`Shift` + :kbd:`R` 键进入替换模式
- 在正常模式下，按 :kbd:`v` 键进入可视化（一般）模式
- 在正常模式下，按 :kbd:`Shift` + :kbd:`v` 键进入可视化（行）模式
- 在正常模式下，按 :kbd:`Ctrl` + :kbd:`v` 键进入可视化（块）模式

日常科研中大部分时间会花在正常模式和插入模式，所有需要用鼠标做的事，都可以用键盘完成。

基本操作
^^^^^^^^

使用 vim 编辑器打开 :file:`hello-world.txt` 文件，若文件不存在则创建该文件。同时使用以上按键
在不同的操作模式之间进行切换，并观察左下角地显示::

    # 若 vim 后面没有文件名，也会进入 vim
    $ vim hello-world.txt

按 :kbd:`i` 键进入插入模式，输入 Hello World，然后按 :kbd:`Esc` 键回到命令模式。
假设这时文本输入完毕，我们可以进入命令模式（按下 :kbd:`:` 键），这时光标会立即跳到屏幕下方的命令行，
然后输入 :kbd:`wq` 即可保存文件并退出 vim。

命令模式的常用功能包括保存文件、退出 vim 等：

- :kbd:`:q` 退出 vim 并关闭窗口
- :kbd:`:w` 保存文件
- :kbd:`:wq` 保存文件并退出 vim

在正常模式下，可以使用以下常用移动命令在文本中快速移动：

- 基本移动：\ :kbd:`h`\（左）、\ :kbd:`j`\（下）、\ :kbd:`k`\（上）、\ :kbd:`l`\（右）。也可以使用上下左右键
- 词：\ :kbd:`w`\ （下一个词）、\ :kbd:`b`\ （词初）、\ :kbd:`e`\ （词尾）
- 行： \ :kbd:`0`\ （行初）、\ :kbd:`^`\ （第一个非空格字符）、\ :kbd:`$`\ （行尾）
- 屏幕：\ :kbd:`Shift` + :kbd:`h`\ （屏幕首行）、\ :kbd:`Shift` + :kbd:`m`\ （屏幕中间）、\ :kbd:`Shift` + :kbd:`l`\ （屏幕底部）
- 翻页：\ :kbd:`Ctrl` + :kbd:`u`\ （上翻）、\ :kbd:`Ctrl` + :kbd:`d`\ （下翻）
- 文件：\ :kbd:`gg`\ （文件头）、\ :kbd:`Shift` + :kbd:`g`\ （文件尾）
- 行数：{number} + :kbd:`Shift` + :kbd:`g` 会移动至行号为 number（如 20）的行（第 20 行）

在正常模式下，可以使用以下常用编辑命令修改文本：

- :kbd:`i` 进入插入模式，可以输入文本
- :kbd:`Shift` + :kbd:`o` 和 :kbd:`o` 分别在当前行之上和之下插入一行，并进入插入模式
- :kbd:`yy` 复制当前行
- :kbd:`p` 把复制内容粘贴到当前行的下面
- :kbd:`dd` 删除当前行
- :kbd:`u` 撤销上一次修改
- :kbd:`Ctrl` + :kbd:`r` 重做上一次修改
