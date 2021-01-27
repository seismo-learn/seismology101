常用命令
========

Linux/macOS 下有成百上千个命令，每个命令都有众多选项。这一节介绍一些常用命令的常用用法。
用户可以通过如下方式查询更多命令及其用法。

1.  使用 `tldr <https://tldr.sh/>`__ 命令查询 [**推荐**]

    ``tldr`` 是由社区维护的简化版的命令帮助文档。其以实例的方式展示了命令的
    常见用法。例如::

        $ tldr mkdir发ind

        mkdir

        Creates a directory.

        - Create a directory in current directory or given path:
            mkdir directory

        - Create directories recursively (useful for creating nested dirs):
            mkdir -p path/to/directory

2.  使用 UNIX 提供的 ``man`` 命令查询

    ``man`` 提供了命令的完整语法，因而通常比较冗长。例如::

        $ man mkdir

3.  网页搜索相关命令

    - 使用 Google 搜索
    - 在网站 https://man.linuxde.net/ 中查询

.. rubric:: 命令目录

.. hlist::
    :columns: 6

    -   压缩与解压

        - `tar`_

    -   文件查看

        - `cat`_
        - `head`_
        - `tail`_
        - `less`_

    -   文件处理

        - `gawk`_
        - `grep`_
        - `wc`_
        - `sort`_
        - `uniq`_

    -   文件搜索

        - `locate`_
        - `find`_

    -   其他

        - `ssh`_
        - `scp`_
        - `rsync`_

----

cat
---

``cat`` 命令名来源于 con\ **cat**\ enate（即“拼接”）。该命令可以输出某个文件的
内容，或将多个文件\ **拼接**\ 起来。

将一个文件的内容打印到标准输出::

    $ cat file

将文件 :file:`file1` 和 :file:`file2` 合并到一个文件 :file:`target_file` 中::

    $ cat file1 file2 > target_file

打印文件内容并显示行号::

    $ cat -n file

find
----

``find`` 命令用来查找指定目录下的子目录和文件，并显示查找到的子目录和文件。

列出 :file:`~/src` 目录及其子目录下的所有目录和文件::

    $ find ~/src

查找 :file:`~/src` 目录及其子目录下以 :file:`.c` 结尾的目录和文件::

    $ find ~/src -name "*.c"

同上，但忽略大小::

    $ find ~/src -iname "*.c"

gawk
----

``awk`` 命令的命名起源于其三位作者的姓氏首字母。该命令可以选择标准输入、其它命令的输出或文件中
的特定字段并进行操作。它依次扫描每一行，并读取里面的每一个字段。

``gawk`` 是 GNU 版本的 ``awk`` 命令。Linux 系统下的 ``awk`` 命令一般是指向
``gawk`` 命令的软链接，可以使用以下命令查看::

    $ ls -l $(which awk)
    lrwxrwxrwx. 1 root root 4 Aug  4  2018 /usr/bin/awk -> gawk

该命令的基本格式是::

    $ gawk '动作' 文件名

将一个文件的每一行打印到标准输出::

    $ gawk '{print $0}' file

将一个文件的每一行的第 1 个和第 2 个字段打印到标准输出（字段的默认分隔符是空格和制表符）::

    $ gawk '{print $1,$3}' file

同上，但忽略第 1 行和第 2 行，从第 3 行开始::

    $ gawk 'FNR>2 {print $1,$3}' file

将 :file:`/etc/passwd` 每一行的第 1 个和第 3 个字段打印到标准输出，
并设置字段分隔符为冒号 :kbd:`:`\ ）::

    $ gawk -F ':' '{print $1,$3}' /etc/passwd

同上，并打印每一行的行号::

    $ gawk -F ':' '{print NR") " $1,$3}' /etc/passwd

grep
----

``grep`` 命令的命名来自 **g**\ lobally search a **re**\ gular expression and **p**\rint
（以正则表达式进行全局搜索并打印）。它是一个强大的文本搜索工具，可以搜索文件中与指定模式匹配的行并输出。

搜索并打印 :file:`/etc/passwd` 中含有 root 的行::

    $ grep root /etc/passwd

同上，并显示行号::

    $ grep -n root /etc/passwd

搜索并打印 :file:`/etc/passwd` 中不含有 root 的行::

    $ grep -v root /etc/passwd

使用正则表达式搜索并打印 :file:`/etc/passwd` 中含有英文字母的行::

    $ grep -E "[a-zA-Z]+" /etc/passwd

使用正则表达式搜索并打印 :file:`/etc/passwd` 中含有数字的行::

    $ grep -E "[0-9]+" /etc/passwd

使用正则表达式搜索并打印 :file:`/etc/passwd` 中含有英文字母或数字的行::

    $ grep -E "[a-zA-Z]+|[0-9]+" /etc/passwd

head
----

``head`` 命令用于打印文件开头部分的内容。默认打印文件的前 10 行。

打印 :file:`/etc/passwd` 的前 10 行::

    $ head /etc/passwd

打印 :file:`/etc/passwd` 的前 5 行::

    $ head -n 5 /etc/passwd

less
----

``less`` 命令可以用来浏览文件内容。该命令允许用户向前或向后浏览文件。
按 :kbd:`PageUp` 键向上翻页，用 :kbd:`PageDown` 键向下翻页。
按 :kbd:`Enter` 键或向下方向键则向下移动，用向上方向键则向上移动。
按 :kbd:`Q` 键退出浏览。

浏览 :file:`/etc/passwd`::

    $ less /etc/passwd

同上，并显示行号::

    $ less -N /etc/passwd

locate
------

``locate`` 命令可以用于查找目录和文件。该命令比 `find`_ 命令快得多，原因在于它不搜索具体目录，
而是搜索含有本地所有文件信息的数据库。

搜索名称含 :file:`passwd` 的目录或文件::

    $ locate passwd

搜索名称含 :file:`/etc/sh` 的目录或文件（包括了 :file:`/etc` 目录下所有以 sh 开头的目录或文件）::

    $ locate /etc/sh

搜索名称含 :file:`~/Des` 的目录或文件（包括了 :file:`~` 目录下，所有以 Des 开头的目录或文件）::

    $ locate ~/Des

同上，但忽略大小写::

    $ locate -i ~/des

rsync
-----

scp
---

sort
----

ssh
---

tail
----

``tail`` 命令用于打印文件尾部内容。默认打印文件的后 10 行。

打印 :file:`/etc/passwd` 的后 10 行::

    $ tail /etc/passwd

打印 :file:`/etc/passwd` 的后 5 行::

    $ tail -n 5 /etc/passwd

如果 ``-n`` 选项后的数字（N）前面有加号 :kbd:`+`，则打印的是文件开头的第 N 行到文件末尾，
并不是最后 N 行。例如，打印 :file:`/etc/passwd` 的第 5 行到文件末尾::

    $ tail -n +5 /etc/passwd

tar
---

uniq
----

wc
--


``wc`` 命令的名字来自 **w**\ ord **c**\ ount（字数）。该命令可以打印文件或标准输入的
行数、单词数以及字节数。

打印统计 :file:`/etc/passwd` 的行数、单词数以及字节数::

    $ wc /etc/passwd

使用 ``-l``\ 、\ ``-w``\ 或 ``-c`` 选项，可以分别只打印行数、单词数或字节数。例如，
只打印 :file:`/etc/passwd` 的行数::

    $ wc -l /etc/passwd
