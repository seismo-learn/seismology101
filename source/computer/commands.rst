常用命令
========

Linux 下有成百上千个命令，每个命令都有众多选项。这一节介绍一些常用命令的常用用法。


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

