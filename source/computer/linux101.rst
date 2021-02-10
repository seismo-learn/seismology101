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

    # 删除 source 目录的软链接
    $ rm source-soft
    $ ls
    hello-world-hard.txt  hello-world.txt  hello-world-soft.txt  source
    # 删除 hello-world.txt 文件的软链接
    $ rm hello-world-soft.txt
    $ ls
    hello-world-hard.txt  hello-world.txt  source
    # 删除 hello-world.txt 文件的硬链接
    $ rm hello-world-hard.txt
    $ ls
    hello-world.txt  source

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

重定向
^^^^^^

管道
^^^^

通配符
^^^^^^

正则表达式
^^^^^^^^^^

环境变量
--------


编辑器
------
