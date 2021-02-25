Shell 基础
===========

:本节贡献者: |姚家园|\（作者）、
             |田冬冬|\（审稿）
:最近更新日期: 2021-02-13
:预计花费时间: 120 分钟

----

扩展
-----

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

.. dropdown:: :fa:`exclamation-circle,mr-1` Shell 扩展和正则表达式的区别
   :container: + shadow
   :title: bg-info text-white font-weight-bold 

   读者可能以后会常接触到正则表达式（regular expression），需要强调的是 Shell 扩展
   和正则表达式是有区别：

   .. table:: Shell 扩展和正则表达式的主要区别
      :align: center

      =================================== ===================================
      Shell 扩展                           正则表达式
      =================================== ===================================
      由 Shell 处理                         由 Linux 命令处理，如 ``awk``\ 、\ ``grep``
      在 Shell 把命令交给系统执行前扩展       在 Shell 把命令交给系统后，命令执行时使用
      匹配目录和文件名，而不是文件内容         匹配文件内容（text）
      =================================== ===================================

   此外，Shell 扩展和正则表达式都会用到特殊字符，但是有些特殊字符的含义是完全不同的。

输入输出的重定向
----------------

一般情况下，命令从标准输入（stdin）读取输入，输出到标准输出（stdout），标准输入和标准输出默认都是终端。
此外，还有标准错误（stderr），用于输出命令运行的状态和错误信息，其默认也是终端。一般用 0、1、2 分别表示
标准输入、标准输出和标准错误。

使用重定向可以从文件中读取输入（\ ``<``\ ），以及输出到文件（\ ``>``\ 、\ ``>>``\ ）。

标准输出重定向
^^^^^^^^^^^^^^^

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

标准输入重定向
^^^^^^^^^^^^^^^

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

标准错误重定向
^^^^^^^^^^^^^^^

标准错误可以用 ``2>`` 和 ``2>>`` 重定向输出到文件中，数字 2 和 ``>`` 与 ``>>`` 之间没有空格::

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

   有时，我们不想要命令的输出结果（标准输出或标准错误）。此时可以将输出重定向到 :file:`/dev/null` 文件。
   此文件是系统设备，叫做位存储桶，可以接受输入，并且对输入不做任何处理。例如，::

       $ cat out_file 2> /dev/null

输入多行字符串
^^^^^^^^^^^^^^

Here 文档（here document）是一种输入多行字符串的方法，格式如下::

    << token
    text
    token

它的格式分成开始标记 ``<< token``\ 、字符串 ``text`` 和结束标记 ``token``。
开始标记由两个小于号加上 Here 文档的名称（名称可以随意取，比如 ``EOF``\ 、\ ``token``\ ）组成，
后面必须是一个换行符。结束标记是单独一行且顶格写的 Here 文档名称，若不顶格，结束标记不起作用。
两者之间就是多行字符串的内容。

::

    # 使用 cat 命令输入三行数字
    $ cat << EOF
    1 2
    3 4
    5 6
    EOF
    # 以上命令的输出是
    1 2
    3 4
    5 6

管道
----

管道（pipe）操作符 ``|`` 可以将一个命令的标准输出送至另一个命令的标准输入。管道不会处理标准错误。

::

    # echo 命令输出的 Hello World 被管道操作符交给 wc 命令当作输入来统计字数
    $ echo "Hello World" | wc -w
    2

    # 可以无限多次使用管道。使用 cat 命令将上例的输出重定向写入 pipe.dat 文件中
    echo "Hello World" | wc -w | cat > pipe.dat
