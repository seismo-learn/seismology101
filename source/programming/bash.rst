Bash 脚本
=========

.. warning::

    本节正在编写中。

Bash 简介
---------

Bash（全称 **B**\ ourne-\ **A**\ gain **SH**\ ell）是 GNU 开发的一个 Shell，
它是 Bourne Shell 的扩展。Bash 是目前绝大多数 Linux 发行版的默认 Shell。
查看本机的 Bash 版本::

    $ bash --version
    GNU bash，version 5.0.3(1)-release (x86_64-pc-linux-gnu)

我们已经在 :doc:`/computer/linux101` 一节中简要介绍了 Bash，本节不在赘述。

Bash 脚本
---------

按照 Bash 语法编写的脚本即是 Bash 脚本。所有在命令行执行的操作，都能够用脚本完成。
Bash 脚本的解释器（即 Bash）读取脚本，并立即依次执行里面的所有命令、函数以及表达式等，
就好像他们直接输入到命令行一样。

让我们编写第一个 Bash 脚本 :file:`hello-world.sh`。

.. code-block:: bash

    #!/usr/bin/env bash
    #
    # 输出 Hello world~
    #

    # 使用 echo 命令输出 Hello world
    echo Hello world  # 这也是注释

    # 每一句指令以换行或分号隔开
    echo Hello; echo world

    # 有些命令比较长，写成多行会有利于阅读和编辑
    # 每行结尾加上反斜杠，Bash 会将下一行跟当前行一起解释
    echo Hello world~ \
    This is seismo-learn.

脚本的第一行通常是指定解释器，即这个脚本必须通过什么解释器执行。
这一行以 ``#!`` 字符开头，该字符称为 Shebang，所以这一行就叫做 Shebang 行。
``#!`` 后面就是脚本解释器的位置，二者之间有没有空格都可以。
Shebang 行之后的行都是 Bash 脚本的实际代码，其中 # 表示注释，可以放在行首，也可以放在行尾。

Bash 脚本的解释器一般是 :file:`/bin/bash`。但如果 Bash 解释器不在目录
:file:`/bin` 中，而 Shebang 行却是 :file:`#!/bin/bash`，脚本就无法执行了。
所以为了保险起见，一般按照 :file:`hello-world.sh` 中的方式来写 Shebang 行，
即使用 ``env`` 命令（此命令总在 :file:`/usr/bin` 目录中）返回 ``bash`` 可执行文件的位置。
Shebang 行不是必需的，但是建议加上这行。

执行 Bash 脚本
--------------

在终端中执行 Bash 脚本::

    # 如果缺少 Shebang 行，运行脚本时就需要显式地指定解释器 Bash
    $ bash hello-world.sh

    # 如果有 Shebang 行，同时脚本文件具有可执行权限，可以直接调用执行该脚本
    $ ./hello-world.sh

执行结果::

    Hello world
    Hello
    world
    Hello world~ This is seismo-learn.

拥有 Shebang 行和可执行权限的脚本，在调用时还需要指定脚本的路径，如 ``./hello-world.sh``
代表该脚本位于当前目录。如果将脚本放在环境变量 **PATH** 指定的目录中，就不需要指定路径了，
因为 Bash 会自动到这些目录中寻找是否存在同名的可执行文件。
可以参考\ :doc:`/computer/environment-variable`\ 一节设置环境变量 **PATH**\ 。

学习资源
--------

- `Bash 脚本教程 <https://wangdoc.com/bash/>`__\ （全面、系统）
- `Bash 脚本基础 <https://101.lug.ustc.edu.cn/Ch06/#bash-usage>`__\ （简要）
- `X 分钟速成 Bash <https://learnxinyminutes.com/docs/zh-cn/bash-cn/>`__\ （简要）
