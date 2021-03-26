Bash 脚本
=========

Bash（全称 **B**\ ourne-\ **A**\ gain **SH**\ ell）是 Linux 系统的一种 Shell。它是
目前绝大多数 Linux 发行版的默认 Shell。

::

    # 查看本机的 Bash 版本
    $ bash --version
    GNU bash，version 5.0.3(1)-release (x86_64-pc-linux-gnu)

脚本（script）是包含一系列命令的文本文件。Shell 读取这个文件，依次执行里面的所有命令，
就好像这些命令直接输入到命令行一样。所有能够在命令行完成的任务，都能够用脚本完成。
脚本的好处是可以重复使用，也可以指定在特定场合自动调用，比如系统启动或关闭时自动执行脚本。
按照 Bash 语法编写的脚本即是 Bash 脚本，本节只是介绍其基本语法，经常使用 Bash 脚本的读者
可以参考 `Bash 脚本教程 <https://wangdoc.com/bash/>`__ 学习更全面的语法。

Hello World
-----------

让我们运行第一个 Bash 脚本 :download:`hello-world.sh`\ 。

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2

   脚本源码
   ^^^^^^^^

   .. include:: hello-world.sh

   ---

   运行结果
   ^^^^^^^^

   ::

       $ bash hello-world.sh
       Hello world~

脚本的第一行通常是指定解释器，即这个脚本必须通过什么解释器执行。这一行以 ``#!`` 字符开头，
该字符称为 Shebang，所以这一行就叫做 Shebang 行。``#!`` 后面就是脚本解释器的位置，
二者之间有没有空格都可以。Shebang 行之后的行都是 Bash 脚本的实际代码，其中 # 表示注释，
可以放在行首，也可以放在行尾。

Bash 脚本的解释器一般是 :file:`/bin/bash`。但如果 Bash 解释器不在目录 :file:`/bin`
中，而 Shebang 行却是 :file:`#!/bin/bash`，脚本就无法执行了。所以为了保险起见，一般按照
:file:`hello-world.sh` 中的方式来写 Shebang 行，即使用 ``env`` 命令
（此命令总在 :file:`/usr/bin` 目录中）返回 ``bash`` 可执行文件的位置。

Shebang 行不是必需的，但是建议加上这行::

    # 如果缺少该行，运行脚本时就需要显式地指定解释器
    $ bash hello-world.sh

    # 如果有该行，同时脚本文件具有可执行权限，可以直接调用运行该脚本
    $ ./hello-world.sh

    # 直接点击下载的 hello-world.sh 脚本并没有可执行权限，执行以下命令增加可执行属性
    $ chmod +x hello-world.sh

拥有 Shebang 行和可执行权限的脚本，在调用时还需要指定脚本的路径，如 ``./hello-world.sh``
代表该脚本位于当前目录。如果将脚本放在环境变量 **PATH** 指定的目录中，就不需要指定路径了，
因为 Bash 会自动到这些目录中寻找是否存在同名的可执行文件。可以参考\ :doc:`/computer/environment-variable`\
一节设置环境变量 **PATH**。

数据结构
--------

变量
^^^^^

变量声明：Shell 变量分成四种形式：用户自定义、环境变量、位置变量和预定义特殊变量。

数组
^^^^


算术运算
--------


流程控制
--------

逻辑运算
^^^^^^^^

条件判断
^^^^^^^^^

for 循环
^^^^^^^^

while 循环
^^^^^^^^^^^


输入输出
--------



Bash 进阶
----------

脚本调试
^^^^^^^^

学习资料
^^^^^^^^

