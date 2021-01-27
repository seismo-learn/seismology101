常用命令
========

Linux/macOS 下有成百上千个命令，每个命令都有众多选项。这一节介绍一些常用命令的常用用法。
用户可以通过如下方式查询更多命令及其用法。

1.  使用 `tldr <https://tldr.sh/>`__ 命令查询 [**推荐**]

    ``tldr`` 是由社区维护的简化版的命令帮助文档。其以实例的方式展示了命令的
    常见用法。例如::

        $ tldr mkdir

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

grep
----

head
----

less
----

locate
------

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

tar
---

uniq
----

wc
--

