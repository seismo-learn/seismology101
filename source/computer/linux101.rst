Linux 入门
==========

本章主要介绍 Linux 系统的入门级基础。

.. toctree::
   :maxdepth: 2

   command-line 
   file-operations

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

当用户登录 Linux 系统后，Shell 程序启动并读取一系列启动文件，这些文件定义了可供所有用户共享 Shell 环境。
然后，Shell 会读取一些位于家目录下的启动文件，这些启动文件定义了用户个人的 Shell 环境。
这些启动文件的名字和启动顺序在在不同的 Shell 中或不同情况的 Shell 会话下，有所区别。Bash 常见的启动文件有
:file:`/etc/profile`\ 、\ :file:`~/.bash_profile`\ 、\ :file:`~/.bashrc` 等。
我们一般通过修改 :file:`~/.bashrc` 文件来设置个人的 Shell 环境。Shell 环境由环境变量、
Shell 变量、Shell 函数和别名等组成，这一节我们主要介绍环境变量。

.. table:: Shell 的常见环境变量
   :align: center

   ================== =======================================
   变量                内容    
   ================== =======================================
   SHELL              Shell 程序的名字
   HOME               当前用户的家目录
   LD_LIBRARY_PATH    程序加载运行期间，动态链接库的查找路径
   PATH               由冒号分开的用于搜索可执行程序名的目录列表
   PS1                Shell 提示符
   PWD                当前工作目录
   USER               当前用户的用户名
   ================== =======================================

例如，\ :file:`~/.bash_profile` 或其他启动文件中可能含有以下一行::

    export PATH=$PATH:$HOME/bin

这里面出现了两个环境变量，即\ ``HOME`` 和 ``PATH``\ ：

- ``HOME`` 表示用户的家目录，如 :file:`/home/seismo-learn`
- ``PATH`` 表示由冒号分开的目录列表。当输入可执行程序名后，Shell 会搜索这个目录列表来寻找可执行程序。

变量前加美元符号 ``$`` 表示读取变量值。因此，这一行的意思是将 :file:`/home/seismo-learn/bin` 目录
加入可执行程序的搜索目录列表。这也是之前示例中我们直接在终端输入命令后，Shell 能正确找到命令所在位置的原因。
若某一可执行程序所在目录不在 ``PATH`` 中，则 Shell 无法将其找到交给系统执行。

可以使用 ``which`` 或 ``whereis`` 命令查询命令所在目录::

    $ which cd
    /usr/bin/cd
    $ whereis cd
    cd: /usr/bin/cd /usr/share/man/man1/cd.1.gz /usr/share/man/man1p/cd.1p.gz /usr/share/man/mann/cd.n.gz

可以使用以下命令查看环境变量::

    # 使用 printenv 命令查看 SHELL 变量，即 Shell 程序的名字
    $ printenv SHELL
    /bin/bash
    # 也可以使用 echo 命令查看
    $ echo ${SHELL}

    # 查看所有环境变量，并使用管道和 sort 命令将他们按照字符顺序排列
    $ printenv | sort
    SHELL=/bin/bash
    USER=seismo-learn
    # 也可以使用 set 命令，不过 Shell 变量 和 Shell 函数也同时会被显示
    $ set

日常科研中，我们一般修改 :file:`~/.bashrc` 文件来修改环境变量以配置个人的 Shell 环境。

编辑器
------
