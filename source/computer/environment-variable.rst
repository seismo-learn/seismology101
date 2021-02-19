环境变量
========

当用户登录 Linux 系统后，Shell 程序启动并读取一系列配置文件，这些文件设置了可供所有用户共享的 Shell 环境。
然后，Shell 会读取一些位于家目录下的配置文件，这些配置文件定义了用户个人的 Shell 环境。
这些配置文件的名字和读取顺序在不同的 Shell 中或不同情况的 Shell 会话下，有所区别。
Shell 环境由环境变量、Shell 变量、Shell 函数和别名等组成，这一节我们主要介绍环境变量。

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

使用  ``echo`` 命令查看环境变量::

    # 查看 SHELL 变量，即 Shell 程序的名字
    $ echo ${SHELL}

使用 ``which`` 或 ``whereis`` 命令可查询命令所在目录::

    $ which cat
    /usr/bin/cat

    $ whereis cat
    cat: /usr/bin/cat /usr/share/man/man1/cat.1.gz /usr/share/man/man1p/cat.1p.gz

Bash 常见的配置文件有 :file:`/etc/profile`\ 、\ :file:`~/.bash_profile`\ 、\ :file:`~/.bashrc` 等。
一般通过修改 :file:`~/.bashrc` 文件来设置个人的 Shell 环境。例如，\ :file:`~/.bashrc` 中可能含有以下一行::

    export PATH=$PATH:$HOME/bin

这里使用了两个环境变量（\ ``HOME`` 和 ``PATH``\ ）和一个 ``export`` 命令：

- ``HOME`` 表示用户的家目录，如 :file:`/home/seismo-learn`
- ``PATH`` 表示由冒号分开的目录列表。当输入可执行程序名后，Shell 会搜索这个目录列表来寻找可执行程序。
- ``export`` 命令用于新增、修改或删除环境变量

变量前加美元符号 ``$`` 表示读取变量值。因此，这一行的意思是将 :file:`/home/seismo-learn/bin` 目录
加入可执行程序的搜索目录列表。这也是之前示例中我们直接在终端输入命令后，Shell 能正确找到命令所在位置的原因。
若某一可执行程序所在目录不在 ``PATH`` 所包含的目录中，则 Shell 无法将其找到交给系统执行。

日常科研中，使用 Bash 的读者可以修改 :file:`~/.bashrc`，使用 Zsh（macOS Catalina（10.15）以后的默认 Shell）
的读者可以修改 :file:`~/.zshrc`\ ，来配置个人 Shell 环境。修改配置文件后，需要打开新的终端，或使用 ``source`` 命令
在当前终端中重新加载（即读取并执行）配置文件，配置才会生效。例如使用 ``source`` 重新加载 :file:`~/.bashrc`\ ::

    $ source ~/.bashrc
