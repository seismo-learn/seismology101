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

操作文件与目录
^^^^^^^^^^^^^^

文件路径
^^^^^^^^^

文件权限
^^^^^^^^

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

.. tip::

   借助向上向下箭头按键可以获得之前输入的命令。如果按下鼠标左键沿着文本拖动鼠标
   选中一些文本，或者直接双击一个单词，那么这些选中的文本或单词就被拷贝了。
   随后然后按下鼠标中键，就可以粘贴拷贝到光标所在的位置。

重定向
^^^^^^

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

通配符
^^^^^^

Shell 提供了特殊字符来帮助用户快速指定字符，这些特殊字符叫做通配符（wildcards）。

=============== ================================================================
通配符	         作用
=============== ================================================================
\*	            匹配任意数量字符（包括零个）
?	            匹配任意一个字符（不包括零个，即不能匹配空字符）
[...]           匹配方括号之中的任意一个字符。例如，[abcde]、[0-9]。:kbd:`-` 表示一个连续的范围
[!...]          匹配不在方括号里面的字符（不包括空字符）。例如，[!abcde]、[!0-9]。
[^...]          与 [!...] 等价
{...}           匹配大括号里面的所有模式，模式之间使用逗号分隔。
{start..end}    匹配连续范围的字符
=============== ================================================================

通配符有一些使用注意点：

- 通配符是先解释，再执行
- 通配符不匹配，会原样输出
- 只适用于单层路径
- 可用于文件名

正则表达式
^^^^^^^^^^

正则表达式（regular expression）描述了一种字符串匹配的模式，可以用来检查一个串
是否含有某种子串、将匹配的子串做替换或者从某个串中取出符合某个条件的子串等。

可以通过 https://regex101.com/ 在线检查正则表达式

环境变量
--------


编辑器
------
