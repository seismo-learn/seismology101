环境变量
========

当用户登录 Linux 系统后，Shell 程序启动并读取一系列配置文件，这些文件设置了可供所有用户共享的 Shell 环境。
然后，Shell 会读取一些位于家目录下的配置文件，这些配置文件定义了用户个人的 Shell 环境。
这些配置文件的名字和读取顺序在不同的 Shell 中或不同情况的 Shell 会话下，有所区别。
Shell 环境由环境变量、Shell 变量、Shell 函数和别名等组成，这一节我们主要介绍常见环境变量及其常见的配置方法。

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

使用  ``echo`` 命令查看环境变量（变量前加美元符号 ``$`` 表示读取变量值）::

    # 查看 SHELL 变量，即 Shell 程序的名字
    $ echo $SHELL
    /bin/bash

Bash 常见的配置文件有 :file:`/etc/profile`\ 、\ :file:`~/.bash_profile`\ 、\ :file:`~/.bashrc` 等，
一般通过修改 :file:`~/.bashrc` 文件来设置和更新个人的 Shell 环境::

    # 查看 PATH 变量，即可执行程序名的目录列表
    $ echo $PATH
    /usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

    # 在 ~/.bashrc 文件中添加一行命令 export PATH=$PATH:$HOME/bin
    $ echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

    # 打开一个新的终端，查看 PATH 变量
    $ echo $PATH
    /usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/seismo-learn/bin

以上修改会将 :file:`/home/seismo-learn/bin` 目录加入到可执行程序的搜索目录列表中。
这里使用了环境变量 **HOME** 和 **PATH** 以及 ``export`` 命令：

- **HOME** 变量表示用户的家目录，如 :file:`/home/seismo-learn`
- **PATH** 变量表示由冒号分开的目录列表。当输入可执行程序名后，Shell 会搜索这个目录列表来寻找可执行程序。
- ``export`` 命令用于新增、修改或删除环境变量

可以看出系统启动后，**PATH** 变量已经设置了默认值。这也是之前示例中直接在终端输入命令名后，Shell 能找到命令的原因。
若某一可执行程序所在目录不在 **PATH** 变量中，则 Shell 无法将其找到交给系统执行。此时，需将该目录加入到 **PATH** 变量中。

.. dropdown:: :fa:`exclamation-circle,mr-1` 查看命令所在目录
   :container: +shadow
   :title: bg-info text-white font-weight-bold

   可以使用 ``which`` 或 ``whereis`` 命令查询命令所在目录::

       $ which cat
       /usr/bin/cat

       $ whereis cat
       cat: /usr/bin/cat /usr/share/man/man1/cat.1.gz /usr/share/man/man1p/cat.1p.gz

日常科研中，使用 Bash 的读者可以修改 :file:`~/.bashrc`，使用 Zsh 的读者可以修改 :file:`~/.zshrc`\ ，
来配置个人 Shell 环境。修改这些配置文件后，打开新的终端，Shell 环境就会更新。也可以使用 ``source`` 命令
在当前终端中重新加载（即读取并执行）配置文件，更新当前 Shell 环境。例如，使用 ``source`` 重新加载 :file:`~/.bashrc`\ ::

    $ source ~/.bashrc
