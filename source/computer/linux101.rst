Linux 入门
==========

:本节贡献者:
:最近更新日期:
:预计花费时间:


.. warning::

   本章正在编写中，尚未完成。

----

命令行
-------

命令行与图形界面
^^^^^^^^^^^^^^^^

地震学日常科研中，大部分时间使用的是命令行界面（CLI：Cammand Line Interface），
有时也使用图形界面（GUI：Graph User Interface）。命令行基本以操作键盘为主，图形界面
一般同时操作鼠标和键盘。图形界面上手简单，各种常用功能显式可见，但是我们推荐在日常科研中
使用和掌握命令行，原因如下：

- 命令行更加高效。操作键盘比操作鼠标快；图形界面的操作重复的时间成本较高，而直接运行使用
  命令行编写的脚本即可重复之前的操作。
- 命令行有时候是唯一的选择。例如，登录远程服务器时，很少有图形化界面可供使用。
- 图形界面占用更多的系统资源。

近几年，一些图形界面工具发展迅速，有时使用图形界面会更方便。例如，Visual Studio Code
是当前最流行的图形界面编辑器之一，使用其进行编程或编辑文本十分高效。

终端
^^^^^

命令行一般需使用终端（Terminal）输入指令。日常使用的终端更确切的称谓应该是终端模拟器（Terminal Emulator）。
我们可以在桌面或菜单栏中，找到并点击“Terminal”图标启动终端，然后就可以输入各种命令来操作计算机了::

   # 使用 echo（回声）命令输出 Hello World!
   $ echo "Hello World"
   
   # 退出终端
   $ exit

文件管理
---------

熟悉 Linux 文件系统
^^^^^^^^^^^^^^^^^^^

Linux 文件系统就像一颗树一样，从 :file:`/` 目录开始，这个特殊的目录称为根目录。
根目录下一般有 :file:`/home`\ 、\ :file:`/root`\ 、\ :file:`/bin`\ 、
:file:`/usr`\ 、\ :file:`/lib`\ 、\ :file:`/opt` 等目录。

-  :file:`/home` 目录：用户的家目录，存储用户自己的文件
-  :file:`/bin` 目录：存储必须的程序和命令，所有用户都可用
-  :file:`/usr` 目录：大多数软件的安装位置
-  :file:`/opt` 目录：某些闭源或商业软件（如 Matlab、Google Chrome、Google Earth）
   默认将软件安装到此目录下

日常科研中，我们大多数情况下只在 :file:`/home` 目录下工作。假设用户名是 seismo-learn，
该用户的家目录便是 :file:`/home/seismo-learn`\ 。macOS 下的家目录是 :file:`/Users/seismo-learn`\ 。
在 Linux/macOS 系统下，可用 :file:`~` 代表家目录。Linux 系统安装后，自动创建的家目录下的目录有
:file:`~/Desktop`\ 、\ :file:`~/Downloads`\ 、\ :file:`~/Documents` 等。熟悉 Linux 文件系统后可以参考\
:doc:`《文件管理实践经验》<best-practices/file-organization>`\ 和\
:doc:`《软件安装实践经验》<best-practices/software-installation>`\
进一步组织与管理家目录，以提高工作效率。

操作文件与目录
^^^^^^^^^^^^^^

打开终端，使用以下命令熟悉和掌握 Linux 系统下文件和目录的常用操作。假设用户名是 seismo-learn。

查看文件和目录::

    # 使用 pwd（print working directory，即打印当前工作目录）命令查看当前所在目录
    # 可以看出启动终端后，默认进入家目录
    $ pwd
    /home/seismo-learn

    # 使用 ls（list，即列表）命令显示当前所在目录（即家目录）含有的子目录和文件
    $ ls
    Desktop    Documents    Downloads
    # 查看 ~/Desktop 目录和 /etc/passwd 文件
    $ ls Desktop
    $ ls /etc/passwd

切换目录::

    # 使用 cd（change directory，即切换目录）命令进入根目录
    $ cd /
    # 查看根目录中的子目录和文件
    $ ls
    bin   etc   lib    mnt  proc  run   srv  tmp  var
    boot  dev   home  lib64  media   opt  root  sbin  sys  usr
    # 切换回家目录（以下任一操作均可）
    $ cd /home/seismo-learn
    $ cd ~
    $ cd

    # 确认已经切换回家目录下
    $ pwd
    /home/seismo-learn

新建文件和目录::

    # 进入家目录
    $ cd ~
    # 使用 mkdir（make directory，即创建目录）命令新建以下目录
    $ mkdir codes software workspace
    $ ls
    codes  Desktop  Documents  Downloads  software  workspace
    # 在 workspace 目录中新建 source 目录
    $ mkdir workspace/source
    $ ls workspace/
    source

    # 进入 workspace 目录
    $ cd workspace
    # 使用 touch 命令创建新文件 hello-world.txt 和 seiso-learn.txt
    $ touch hello-world.txt seiso-learn.txt
    $ ls
    hello-world.txt  seiso-learn.txt  source

以下所有操作都假设读者已经切换到 :file:`~/workspace` 目录下了，即::

    # 进入 ~/workspace 目录
    $ cd ~/workspace

复制文件和目录::

    # 使用 cp（copy，即复制）命令复制 hello-world.txt 文件到同一目录下，并重命名为 hello-world-cp.txt
    $ cp hello-world.txt hello-world-cp.txt
    $ ls
    hello-world-cp.txt  hello-world.txt  seiso-learn.txt  source
    # 复制 hello-world.txt 和 seiso-learn.txt 文件到 source 目录下
    $ cp hello-world.txt seiso-learn.txt source
    $ ls source
    hello-world.txt  seiso-learn.txt

    # 复制 source 目录为同一目录下的 destination 目录（目标目录不存在）
    $ cp -r source destination
    $ ls
    destination  hello-world-cp.txt  hello-world.txt  seiso-learn.txt  source
    $ ls destination
    hello-world.txt  seiso-learn.txt
    # 复制 source 目录到同一目录下的 destination 目录下（目标目录已存在）
    $ cp -r source destination
    $ ls destination
    hello-world.txt  seiso-learn.txt  source

移动文件和目录::

    # 使用 mv（move，即移动）命令移动 hello-world.txt 文件同一目录下，并重命名为 hello-world-mv.txt
    $ mv hello-world.txt hello-world-mv.txt
    $ ls
    destination  hello-world-cp.txt  hello-world-mv.txt  seiso-learn.txt  source
    # 移动 hello-world-cp.txt 和 hello-world-mv.txt 文件到 source 目录下
    $ mv hello-world-cp.txt hello-world-mv.txt source
    ls
    destination  seiso-learn.txt  source
    $ ls source
    hello-world-cp.txt  hello-world.txt  hello-world-mv.txt  seiso-learn.txt

    # 移动 source 目录为同一目录下的 source-mv 目录（相当于重命名）
    $ mv source source-mv
    ls
    destination  seiso-learn.txt  source-mv
    # 移动 source-mv 目录到同一目录下的 destination 目录下
    $ mv source-mv destination
    $ ls
    destination  seiso-learn.txt
    $ ls destination
    hello-world.txt  seiso-learn.txt  source  source-mv

删除文件和目录::

    # 使用 rm（remove，即删除）命令删除 seiso-learn.txt 文件
    $ rm seiso-learn.txt
    $ ls
    destination
    # 删除 destination 目录
    $ rm -r destination
    $ ls

    # 新建 tmp 目录
    $ mkdir tmp
    $ ls
    tmp
    # 使用 rmdir（remove directory，即删除目录）命令删除空目录 tmp。目录不为空时则不删除
    $ rmdir tmp
    $ ls

.. warning::

   使用 ``rm`` 命令时一定要小心再小心，不要误删重要文件。可以先把要删除的文件移动到
   某目录下（如 :file:`~/trash`\ ），再删除。

建立文件和目录的链接::

    # 新建 hello-world.txt 文件和 source 目录
    $ touch hello-world.txt
    $ mkdir source
    $ ls
    hello-world.txt  source

    # 使用 ln（link，即链接）命令建立 hello-world.txt 的硬链接 hello-world-hard.txt
    $ ln hello-world.txt hello-world-hard.txt

    # 建立 hello-world.txt 的软链接（也叫符号链接）hello-world-soft.txt
    $ ln -s hello-world.txt hello-world-soft.txt

    # 建立 source 目录的软链接
    $ ln -s source source-soft
    
    # 使用 ls 命令的 -l 选项可以查看文件和目录的详细信息
    $ ls -l
    total 0
    -rw-r--r-- 2 seismo-learn seismo-learn  0 Feb  8 14:55 hello-world-hard.txt
    -rw-r--r-- 2 seismo-learn seismo-learn  0 Feb  8 14:55 hello-world.txt
    lrwxrwxrwx 1 seismo-learn seismo-learn 14 Feb  8 14:57 hello-world-soft.txt -> hello-world.txt
    drwxr-xr-x 2 seismo-learn seismo-learn  6 Feb  8 14:55 source
    lrwxrwxrwx 1 seismo-learn seismo-learn  6 Feb  8 14:58 source-soft -> source

    # 可以像删除文件一样删除硬链接和软链接
    $ rm hello-world-hard.txt hello-world-soft.txt source-soft

.. admonition:: 硬链接与软链接的区别

   硬链接和源文件指向的是同一存储区。删除硬链接，仍可通过源文件访问；删除源文件，
   仍可通过硬链接访问。只有同时删除硬链接和源文件，文件实体才会被删除。因此，其实
   本质上硬链接和源文件互为对方的硬链接。通过给文件设置硬链接，可以防止重要文件被误删。
   目录无法建立硬链接。一般设置硬链接后，源文件和硬链接都会高亮显示。

   软链接（也叫符号链接）类似 Windows 系统的快捷方式，是一个\ **文件**\ ，里面存放的
   是源文件（或目录）的路径。删除软链接，对源文件（或目录）没有任何影响。
   删除源文件（或目录），软链接依然存在，但无法通过其访问源文件（或目录）了。
   软链接一般会高亮显示。

文件路径
^^^^^^^^^

访问文件或目录需要指定文件或目录的路径。Linux 下有两种表示路径的方式：绝对路径和相对路径。

顾名思义，绝对路径是从根目录 :file:`/` 开始算起的路径。例如，家目录是 :file:`/home`，
用户 seismo-learn 的家目录是 :file:`/home/seismo-learn`，该用户的桌面目录的路径是
:file:`/home/seismo-learn/Desktop`\ 。日常科研中，用户的计算机一般只有用户自己在使用，
因此提到家目录是其时特指 :file:`/home/seismo-learn`\，而不是指 :file:`/home`。
因为大多数情况下，我们都在用户的家目录下操作计算机，因此就给这个目录一个特殊的别称
:file:`~`，其和 :file:`/home/seismo-learn` 是一回事。

当我们进入到某个目录中时，有时使用绝对路径并不方便。例如，我们现在位于 :file:`~/projects/NorthChina-MTZ/data`
目录中，如果想进入 :file:`~/projects/NorthChina-MTZ/figures` 目录下，使用绝对路径要
输入很多字母。在当前目录下，Linux 文件系统定义了两个特殊的路径：

-  :file:`.`\ ：当前路径
-  :file:`..`\ ：当前目录的上一级目录

利用这两个特殊路径，可以使用相对路径访问其他目录下的文件和目录。例如，

-  :file:`./Beijing`\ ：当前目录下的 :file:`Beijing` 目录，即 :file:`~/projects/NorthChina-MTZ/data/Beijing`\ 。
   当前路径也可以省略，即 :file:`Beijing`
-  :file:`./Beijing/IC-BJI.sac`\ ：当前目录下的 :file:`Beijing` 目录下的 :file:`IC-BJI.sac` 文件，
   即 :file:`~/projects/NorthChina-MTZ/data/Beijing/IC-BJI.sac`\ 。
   当前路径也可以省略，即 :file:`Beijing/IC-BJI.sac`
-  :file:`..`\ ：上一层目录，即 :file:`~/projects/NorthChina-MTZ` 目录
-  :file:`../..`\ ：上一层的上一层目录，即 :file:`~/projects` 目录
-  :file:`../figures`\ ：上一层目录下的 :file:`figure` 目录，即 :file:`~/projects/NorthChina-MTZ/figures` 目录
-  :file:`../figures/fig1.pdf`\ ：上一层目录下的 :file:`figure` 目录下的 :file:`fig1.pdf` 文件，
   即 :file:`~/projects/NorthChina-MTZ/figures/fig1.pdf`

.. note::

   可以使用 ``ls`` 命令的 ``-a`` 选项查看某目录下的所有文件和目录（含以 ``.`` 开头的隐藏文件和目录）。例如，查看家目录::

       $ ls -a ~
       .     .bash_profile    Downloads   .vscode
       ..    Desktop          Documents

   可以看出，其实家目录下存在 :file:`.` 和 :file:`..` 这两个特殊的路径。

文件权限
^^^^^^^^

Linux 下每个文件和目录都有自己的权限，使用以下命令查看文件或目录的权限::

    # 进入 ~/workspace 目录，并新建 hello-world.sh 文件和 source 目录
    $ cd ~/workspace
    $ touch hello-world.sh
    $ mkdir source

    # 使用 ls 命令的 -l 选项可以查看 ~/workspace 目录下的所有文件和目录的详细信息
    $ ls -l
    total 0
    -rw-r--r-- 1 seismo-learn seismo-learn 0 Feb  7 22:07 hello-world.sh
    drwxr-xr-x 2 seismo-learn seismo-learn 6 Feb  7 22:07 source

第一列字符串（如 ``-rw-r--r--``\ ）从左到右意义分别是：

-  第一位：文件类型，其中\ ``-`` 表示普通文件，\ ``d`` 表示目录
-  第二到第四位：文件所属用户的权限
-  第五到第七位：文件所属用户组的权限
-  第八到第十位：其他人的权限

第三和第四列分别表示文件所属用户和用户组（如 ``seismo-learn seismo-learn``\ ）

可以看出 :file:`hello-world.txt` 是一个普通文件，所属用户权限（即 seismo-learn）是
``rw-``\ （可读、可写、不可执行），所属用户组（即 seismo-learn）的权限是 ``r--``
（可读、不可写、不可执行），其他人的权限是 ``r--``\ （可读、不可写、不可执行）。

每个权限，第一位 ``r`` 代表可读取 (read)，第二位 ``w`` 代表可写入（write），
第三位 ``x`` 代表可执行（execute），\ ``-`` 代表没有对应的权限。例如，seismo-learn 用户
对 :file:`hello-world.sh` 文件拥有可读、可写、不可执行的权限，对 :file:`source` 目录
拥有可读、可写、可执行的权限。目录的可执行权限代表可以进入该目录。

还可以用数字表示权限，4 代表可读，2 代表可写，1 代表可执行。因为 :math:`4+2+1=7`\ ，所以 7
代表可读、可写、可执行。以此类推，6 代表可读、可写、不可执行，5 代表可读、不可写、可执行，
4 代表可读、不可写、不可执行。

使用 ``chmod``\ （change mode，即变更模式）命令可以修改文件或目录的权限，可以参考
`Linux chmod命令 <https://www.runoob.com/linux/linux-comm-chmod.html>`__ 了解该命令
详细用法。以下只展示常用用法::

    # 修改 hello-world.sh 权限
    # 所属用户可读可写不可执行、所属用户组可读可写不可执行、其他人所属用户可读不可写不可执行
    $ chmod 664 hello-world.sh
    $ ls -l hello-world.sh
    -rw-rw-r-- 1 seismo-learn seismo-learn 0 Feb  7 22:37 hello-world.sh

    # 增加 hello-world.sh 的可执行属性
    $ chmod +x hello-world.sh
    -rwxrwxr-x 1 seismo-learn seismo-learn 0 Feb  7 22:37 hello-world.sh

有时候我们使用 Linux 的命令或安装程序时，可能由于没有读写某些文件的权限，而无法运行命令或
安装程序。这时可以使用 ``sudo`` 命令临时获得 root 用户的权限。例如，在 Fedora 下安装
GNU Fortran::

    $ sudo dnf install gcc-gfortran

Shell 基础
----------

什么是 Shell
^^^^^^^^^^^^^

Shell（壳）其实就是一个程序，它可以接受键盘输入的命令，然后把命令交给系统执行。上面所说的命令行
实际上指的就是 Shell，终端就是用户和 Shell 交互的程序。几乎所有的 Linux 发行版都提供了一个叫
Bash 的 shell，此外还有Zsh、csh、ksh 等 Shell。熟悉 Linux 系统后可以参考\
:doc:`《Zsh 及其配置实践经验》<best-practices/zsh>`\ 安装和使用 Zsh。

打开终端后，会看到类似以下的 Shell 提示符::

   [seismo-learn@earth ~] $

上例中的提示符由 seismo-learn（用户名）、@、earth（主机名）、家目录以及美元符号组成。
在不同的 Linux 发行版或不同的用户设置下，该提示符的样式有所不同。

接着我们就可以像上文所示，在终端中输入各种命令，Shell 会获取命令并交给系统执行::

    # 查看当前 Shell 路径
    [seismo-learn@earth ~] $ echo $SHELL
    /bin/bash

为了简洁，本教程只用最后的 ``$`` 表达 Shell 提示符。

.. tip::

   借助向上向下箭头按键可以获得之前输入的命令。
   按下鼠标左键拖动选中文本，或直接双击一个单词，那么选中的文本或单词就被拷贝了。
   随后按下鼠标中键，就可以粘贴拷贝到光标所在的位置。
   
   .. table:: 键盘快捷键
      :align: center

      ======================= ================
      按键                     作用
      ======================= ================
      :kbd:`Ctrl` + :kbd:`a`  移动光标到行首
      :kbd:`Ctrl` + :kbd:`e`  移动光标到行尾
      :kbd:`Ctrl` + :kbd:`k`  剪切从光标位置到行尾的文本
      :kbd:`Ctrl` + :kbd:`u`  剪切从光标位置到行首的文本
      :kbd:`Ctrl` + :kbd:`y`  粘贴到光标位置
      :kbd:`Tab`              输入命令后或输入部分命令时自动补全
      ======================= ================

扩展
^^^^^

Shell 接收到用户输入的命令以后，会根据空格将用户的输入，拆分成一个个词元（token）。
如果词元中存在特殊字符，Shell 会先扩展这些特殊字符。扩展完成后，Shell 才会把命令交给系统执行。
需要注意，\ **扩展是由 Shell 负责的，与所执行的命令无关**\ 。命令本身并不扩展参数，收到什么参数就原样执行。
本文只介绍 Shell 扩展的一些常见用法，可以参考
`Bash 的模式扩展 <https://wangdoc.com/bash/expansion.html#startend-%E6%89%A9%E5%B1%95>`__
学习详细用法。

例如，用户在终端键入 ``cd ~`` 后，Shell 先将该命令拆分成 ``cd`` 和 ``~`` 两个词元，
然后把 ``~`` 这个特殊字符扩展成用户的家目录（如 ``/home/seismo-learn``\ ），最后交给系统执行，
即 ``cd /home/seismo-learn``。系统执行完命令后，用户所在目录就切换到家目录下了。

.. note::

   Shell 扩展在网上有很多教程和说明，但是一些名词的定义和说法不一。比如有人将扩展称为模式扩展，
   有人将扩展的英文写为 globbing 并称通配符叫 globbing patterns，有人将扩展和通配符等价，
   有人将扩展特指文件名扩展，有人将通配符特指为 ``?``\ 、\ ``*``\ 以及\ ``[]``\ 等等。

   笔者使用 ``man sh`` 命令在 CentOS 7 系统下查看了 Bash 这一常见 Shell 的手册，并未搜索到
   wildcards 和 globbing 这两个单词。可能由于多种原因（历史原因、不同程序原因等），这些名词被保留下来
   并常使用。在本教程中，我们不想（其实也是不能）区分这些名词的详细定义，而是参考
   `GNU Bash Reference Manual: 3.5 Shell Expansions <https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Expansions>`__
   直接使用“扩展”这一词语指代 Shell 扩展特殊字符的全部过程，并将这些特殊字符都广义地称为通配符（wildcards）。
   毕竟日常科研中，我们主要是使用这些功能，而不是去深究这些功能背后的历史和定义。
   但是需要注意，这些特殊字符作用的顺序是不同的；狭义的通配符一般可能只指 ``?``\ 、\ ``*``\ 以及\ ``[]``\ 。

.. table:: Bash 常见特殊字符（本教程也称为通配符）
   :align: center

   =============== ===================================================== ============
   特殊字符	        作用                                                   例子
   =============== ===================================================== ============
   ~               匹配当前用户的家目录                                     例如 /home/seismo-learn
   ?	           匹配任意单个字符（不能匹配零个字符）                       ?.txt 匹配 a.txt、b.txt 等文件名
   \*	           匹配任意数量字符（能匹配零个字符）                         \*.txt 匹配 a.txt、b.txt、ab.txt 等文件名
   [...]           匹配方括号中的任意一个字符                               [abc].txt 匹配 a.txt、b.txt 以及 c.txt 文件名
   [start-end]     方括号扩展的简写模式，匹配一个连续的范围                   [a-z] 表示所有小写字母，[0-9] 等同于 [0123456789]
   [^...]          匹配不在方括号里面的任意一个字符                          [^ab]c.txt 匹配 cc.txt、dc.txt 等文件名
   [!...]          与 [^...] 等价                                         [!ab]c.txt 匹配 cc.txt、dc.txt 等文件名
   {...}           扩展大括号里面的所有值，各个值之间使用逗号分隔              s{e,i,s}m 扩展成 sem sim ssm
   {start..end}    大括号扩展的简写模式，扩展一个连续的范围                   s{a..c}m 扩展成 sam sbm scm
   =============== ===================================================== ============


匹配任意单个字符::

    # 若当前目录下存在文件 a.txt 和 b.txt
    $ ls ?.txt
    a.txt b.txt
    # 若当前目录下存在文件 a.txt、b.txt 和 ab.txt
    $ ls ??.txt
    ab.txt

匹配任意数量字符::

    # 若当前目录下存在文件 a.txt、b.txt 和 ab.txt
    $ ls *.txt
    a.txt b.txt ab.txt
    # 若当前目录下存在文件 a.txt、b.txt 和 ab.txt
    $ ls a*.txt
    a.txt ab.txt
    $ ls *b*
    b.txt ab.txt

使用方括号匹配字符::

    # 若当前目录下存在文件 a.txt 和 b.txt
    $ ls [ab].txt
    a.txt b.txt
    # 若当前目录下只存在文件 a.txt
    $ ls [ab].txt
    a.txt

    # 若当前目录下存在文件 a.txt b.txt c.txt
    $ ls [a-c].txt
    a.txt b.txt c.txt

    # 若当前目录下存在文件 aaa.txt bbb.txt aba.txt
    $ ls ?[^a]?.txt
    aba.txt bbb.txt

使用大括号匹配字符（大括号内部的逗号前后不能有空格）::

    $ echo s{e,i,s}m
    sem sim ssm
    # 逗号前面可以没有值，表示扩展的第一项为空
    $ echo seismo-learn{,.md,.txt}
    seismo-learn seismo-learn.md seismo-learn.txt

    $ echo d{a..d}g
    dag dbg dcg ddg

    $ echo {3..1}
    3 2 1

.. warning::

   其他 Shell （如 Zsh, csh, ksh）的扩展语法可能稍微不同，以上示例可能不适用。

.. admonition:: Shell 扩展和正则表达式的区别


   读者可能以后会常接触到正则表达式（regular expression），需要强调的是正则表达式
   和 Shell 扩展是有区别：

   .. table:: 正则表达式 和 Shell 扩展的主要区别
      :align: center

      =================================== ===================================
      Shell 扩展                           正则表达式
      =================================== ===================================
      由 Shell 处理                         由 Linux 命令处理，如 ``awk``\ 、\ ``grep``
      在 Shell 把命令交给系统执行前扩展       在 Shell 把命令交给系统后，命令执行时使用
      匹配目录和文件名，而不是文件内容         匹配文件内容（text）
      =================================== ===================================

   此外，扩展和正则表达式都会用到特殊字符，但是有些特殊字符的含义是完全不同的。

输入输出的重定向
^^^^^^^^^^^^^^^^

一般情况下，命令从标准输入（stdin）读取输入，输出到标准输出（stdout），
标准输入和标准输出默认都是终端。使用重定向可以从文件中读取输入（\ ``<``\ ），
以及输出到文件（\ ``>``\ 、\ ``>>``\ ）。

以 ``echo`` 命令为例的重定向输出到文件::

    # 使用 echo 命令输出 Hello World 到终端
    $ echo "Hello World"
    Hello World
    # 输出 Hello World 到 output_file 文件中（文件不存在则新建该文件）
    $ echo "Hello World" > output_file
    # 使用 cat 命令查看 output_file 的内容
    $ cat output_file
    Hello World

    # 输出 Rewrite it 到 output_file 文件中（文件存在则覆盖该文件原有内容）
    $ echo "Rewrite it" > output_file
    $ cat output_file
    Rewrite it

    # 输出 Append it 到 output_file 文件中（文件不存在则新建该文件；存在则添加到文件末尾）
    $ echo "append it" >> output_file
    $ cat output_file
    Rewrite it
    Append it

以 ``cat`` 命令为例的从文件中读取输入::

    # 键入 cat 命令
    $ cat

    # 没指定任何参数时，该命令会从标准输入读入数据，即正在等待我们从终端输入中
    # 在终端输入 Hello World 并按 Enter键，最后按 Ctrl + D 结束输入
    $ cat
    Hello World
    Hello World

    # 重定向标准输入从 output_file 读如内容
    $ cat < output_file
    Rewrite it
    Append it

从文件中读如输入，并输出到文件::

    # 查看 output_file 文件内容，并输出到 output_file2 文件中
    $ cat < output_file > output_file2
    $ cat output_file2
    Rewrite it
    Append it

上例子中 ``cat`` 命令后面直接跟文件名时，跟加 ``<`` 和文件名，结果一样。

除了标准输入和标准输出之外，还有标准错误（stderr），用于输出命令运行的状态和错误信息，
其默认也是终端。一般用 0、1、2 分别表示标准输入、标准输出和标准错误。
标准错误可以用 ``2>`` 和 ``2>>`` 重定向输出到文件中，数字 2 和 ``>`` 与 ``>>``
之间没有空格。

::

    # 使用 cat 命令查看 out_file 的内容。该文件不存在，因此会输出出错信息到终端
    $ cat out_file
    cat: out_file: No such file or directory

    # 输出出错信息到 err_file（文件不存在则新建该文件；存在则覆盖该文件原有内容）
    $ cat out_file 2> err_file
    $ cat err_file
    cat: out_file: No such file or directory

    # 输出出错信息到 err_file（文件不存在则新建该文件；存在则添加到文件末尾）
    $ cat out_file 2>> err_file
    $ cat err_file
    cat: out_file: No such file or directory
    cat: out_file: No such file or directory

使用 ``2>&1`` 可以将标准错误合并到标准输出（注意重定向的顺序非常重要，标准错误的重定向
``2>&1``\ 必须总是出现在标准输出重定向之后，否则不起作用）::

    # 将命令输出和出错信息都写入到 out_err_file 文件中
    $ cat out_file > out_err_file 2>&1
    cat: out_file: No such file or directory
    # 将命令输出和出错信息以追加的形式都写入到 out_err_file 文件中
    $ cat out_file >> out_err_file 2>&1
    cat: out_file: No such file or directory
    cat: out_file: No such file or directory

可以使用 ``&>`` 和 ``&>>`` 这以精简方法来执行这种联合的重定向::

    # 将命令输出和出错信息都写入到 out_err_file 文件中
    $ cat out_file &> out_err_file
    cat: out_file: No such file or directory
    # 将命令输出和出错信息以追加的形式都写入到 out_err_file 文件中
    $ cat out_file &>> out_err_file
    cat: out_file: No such file or directory
    cat: out_file: No such file or directory

.. tip::

   有时，我们不想要命令的输出结果。此时可以将输出重定向到 :file:`/dev/null` 文件。
   此文件是系统设备，叫做位存储桶，可以接受输入，并且对输入不做任何处理::

       $ cat out_file 2> /dev/null

管道
^^^^

管道（pipe）操作符 ``|`` 可以将一个命令的标准输出送至另一个命令的标准输入。管道不会处理标准错误。

::

    # echo 命令输出的 Hello World 被管道操作符交给 wc 命令当作输入来统计字数
    $ echo "Hello World" | wc -w
    2

    # 可以无限多次使用管道。使用 cat 命令将上例的输出重定向写入 pipe.dat 文件中
    echo "Hello World" | wc -w | cat > pipe.dat

环境变量
--------


编辑器
------
