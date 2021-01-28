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

``rsync`` 命令的命名来自 **r**\ emote **sync**\ hronization（远程同步）。该命名是一个数据同步工具，
可以在两个本地目录之间，或本地计算机与远程计算机之间同步文件。与其他文件传输工具（如 FTP 或 `scp`_\ ）不同，
``rsync`` 命名最大特点是会检查发送方和接收方已有的文件，仅传输有变动的部分（默认规则是文件大小或
修改时间有变动），因此速度较快，且常用于文件备份。

复制本地源目录 :file:`~/Downloads/source` 到目标目录 :file:`~/workspace/destination` 中，
即产生 :file:`~/workspace/source` 目录::

    $ rsync -av ~/Downloads/source ~/workspace/destination

以上命令使用了两个常用选项:

- ``-a`` 选项会以递归方式传输文件，并保持所有文件属性。使用该选项等于使用多种选项
  的组合 ``-rlptgoD``\ ，十分方便。
- ``-v`` 选项表示将同步结果输出到终端，这样就可以看到哪些内容会被同步了。

如果不确定该命令执行后会产生什么结果，可以先用 ``-n`` 选项模拟执行的结果，并不真的执行命令::

    $ rsync -anv ~/Downloads/source ~/workspace/destination

如果只想同步源目录 :file:`~/Downloads/source` 里面的内容到目标目录 :file:`~/workspace/destination` 中，
则需要在源目录后面加上斜杠。此时，目标目录中不会产生 :file:`~/workspace/source` 目录::

    $ rsync -av ~/Downloads/source/ ~/workspace/destination

默认情况下，该命令只确保源目录 :file:`~/Downloads/source/` 里的所有内容都复制到目标目录中。
它不会使两个目录保持相同，并且不会删除目标目录中的文件和目录。如果要使源目录和目标完全同步，
则可以使用 ``--delete`` 选项删除目标目录中不存在于源目录的文件和目录。
此时，目标目录 :file:`~/workspace/destination` 成为源目录 :file:`~/Downloads/source/`
的一个镜像::

    $ rsync -av --delete ~/Downloads/source/ ~/workspace/destination

.. note::

   如果源目录后面没有加斜杠，即::

       $ rsync -av --delete ~/Downloads/source ~/workspace/destination
    
   则 ``--delete`` 选项只会保证目标目录中的 :file:`~/workspace/destination/source` 目录
   与源目录 :file:`~/Downloads/source` 同步。目标目录中的其他目录和文件
   （如 :file:`~/workspace/test`\ 、\ :file:`~/workspace/README.md`\ ）并不会被删除。
   此时，源目录 :file:`~/Downloads/source` 的镜像是 :file:`~/workspace/destination/source`\ 。

使用该命令在本地计算机与远程计算机之间同步文件时，用法相同，只需在源目录或者目标目录前加上
``username@remote_host:`` 表示远程计算机即可。其中 ``username`` 表示用户帐号，``remote_host``
表示远程计算 IP 地址。``rsync`` 默认使用 `ssh`_ 进行远程登录和数据传输。
以下命令假定远程电脑的 IP 地址是 192.168.1.100，用户名是 seismo-learn。

将本地源目录 :file:`~/Downloads/source` 同步到远程计算机的目标目录 :file:`~/destination` 中::

    $ rsync -av --delete ~/Downloads/source seismo-learn@192.168.1.100:~/destination

将远程计算机的源目录 :file:`~/source` 同步到本地目标目录 :file:`~/workspace/destination` 中::

    $ rsync -av --delete seismo-learn@192.168.1.100:~/source ~/workspace/destination

scp
---

``scp`` 命令的命名来源于 **s**\ ecure **c**\ o\ **p**\ ，可用于本地和远程电脑之间传输文件。
该命令基于 `ssh`_ 进行安全的远程文件传输，因此传输是加密的。虽然 ``scp`` 传输速度不如 `rsync`_
命令，但是它不占资源，不会提高多少系统负荷。当有许多小文件需要传输时，使用 `rsync`_ 命名会导致
硬盘 I/O（输入/输出）非常高，而 ``scp`` 基本不影响系统正常使用。

以下命令假定远程电脑的 IP 地址是 192.168.1.100，用户名是 seismo-learn。

复制远程文件 :file:`/home/seismo-learn/fk3.3.tar.gz` 到本地目录 :file:`~/Downloads` 下::

    $ scp seismo-learn@192.168.1.100:/home/seismo-learn/fk3.3.tar.gz ~/Downloads/

复制远程目录 :file:`/home/seismo-learn/folder1` 到本地目录 :file:`~/Downloads` 下::

    $ scp -r seismo-learn@192.168.1.100:/home/seismo-learn/folder1 ~/Downloads/

上传本地文件 :file:`~/Downloads/fk3.3.tar.gz` 到远程目录 :file:`home/seismo-learn/folder2` 下::

    $ scp ~/Downloads/fk3.3.tar.gz seismo-learn@192.168.1.100:/home/seismo-learn/folder2/

上传本地目录 :file:`~/Downloads/folder1` 到远程目录 :file:`home/seismo-learn/folder2` 下::

    $ scp ~/Downloads/folder1 seismo-learn@192.168.1.100:/home/seismo-learn/folder2/

sort
----

``sort`` 命令可以将文件内容进行排序，并打印排序结果。该命令将文件的每一行作为一个单位，相互比较。
默认的比较原则是从首字符向后，依次按 ASCII 码值进行比较，最后将他们按排序结果输出。

我们使用示例文件 :file:`seismo-learn-sort.txt` 展示该命令的主要用法::

    $ cat seismo-learn-sort.txt
    6:software:seisman:-1.3
    1:seismology101:zhaozhiyuan1989:291
    7:software:core-man:101.1
    1:seismology101:zhaozhiyuan1989:291
    2:seismology101:seisman:80
    3:seismology101:wangliang1989:101.2
    8:software:zhaozhiyuan1989:291
    5:seismology:core-man:-81.2
    4:seismology:seisman:91
    1:seismology101:zhaozhiyuan1989:291

按 ASCII 码值进行升序排序::

    $ sort seismo-learn-sort.txt

按 ASCII 码值进行降序排序::

    $ sort -r seismo-learn-sort.txt

按 ASCII 码值进行升序排序，并忽略相同行（即重复行只统计一次）::

    $ sort -u seismo-learn-sort.txt

按 ASCII 码值进行降序排序，并忽略相同行::

    $ sort -u -r seismo-learn-sort.txt
    # 不同选项也可以写在一块
    # sort -ur seismo-learn-sort.txt

按\ **数值大小**\ 进行升序排序::

    $ sort -n seismo-learn-sort.txt

该命令的 ``-k`` 选项可以指定每一行用于排序的具体部分，不使用该选项时默认是整行。
该选项可以指定用每行的一部分、某个字段或某个字段的一部分进行排序。
语法格式为（\ :kbd:`[]` 代表可选选项）::

    -k Fstart[.Cstart][,Fend[.Cend]][Modifier]

其中，\ ``Fstart[.Cstart]`` 为 start 部分，``,Fend[.Cend]`` 为 end 部分，
``Modifier`` 部分是该命令的一些其他选项，如 ``-n`` 和 ``-r``\ 。
在 ``-k`` 选项中使用 ``Modifier`` 时，不加连字符 :kbd:`-`\ 。

start 部分有两个子选项：

- ``Fstart``\ ：表示从第几个字段开始排序。默认的字段分割符是空格，可以使用 ``-t``
  选项重新指定分割符。
- ``Cstart``\ ：表示从 ``Fstart`` 字段的第几个字符开始算排序字符。省略的话表示
  该字段的第一个字符开始。

end 部分也有两个类似的子选项。若省略该部分，则表示每一行用于排序的字符从 start 部分指定的位置开始一直到结尾:

- ``Fends``\ ：表示用于排序的字符到第几个字段结束。
- ``Cend``\ ：表示到 ``Fend`` 字段的第几个字符结束。若省略或设置为 0，则表示到该字段的最后一个字符。

以示例文件的第一行 ``6:software:seisman:-1.3`` 为例:

- ``-k 1``\ ：从第一个字段的首个字符到行末，即 ``6:software:seisman:-1.3``\ 。
  此时，跟不加该选项时效果一样。
- ``-k 2.3``\ ：从第二个字段的第三个字符到行末，即 ``ftware:seisman:-1.3``\ 。
- ``-k 2,2``\ ：从第二个字段的首个字符到第二个字段最后一个字符（整个字段），即 ``software``\ 。
  此时，跟不加该选项时效果一样。
- ``-k 1,3``\ ：从第一个字段的首个字符到第三个字段的最后一个字符，即 ``6:software:seisman``\ 。
- ``-k 2.3,3.4``\ ：从第二个字段的第三字符到第三个字段的第四个字符，即 ``ftware:seis``\ 。

使用冒号 :kbd:`：` 作为字段分隔符，并从第二个字段的首个字符到行末，升序排序 :file:`seismo-learn-sort.txt` ::

    $ sort -t ":" -k 2 seismo-learn-sort.txt

同上，但使用降序排序（以下两种方式均可）::

    $ sort -t ":" -k 2r seismo-learn-sort.txt

同上，但从第二个字段的第三个字符到行末，降序排序::

    $ sort -t ":" -k 2.3r seismo-learn-sort.txt

同上，但从第二个字段的第三个字符开始到第三个字段的第四个字符结束，降序排序::

    $ sort -t ":" -k 2.3,3.4r seismo-learn-sort.txt

只按照第二个字段进行降序排序::

    $ sort -t ":" -k 2,2r seismo-learn-sort.txt

还可以多次使用 ``-k`` 选项，这样会在前一个选项指定的字符范围的排序结果相同时，
接着比较下一个选项指定的字符范围。

按照第二个字段进行降序排序，若相同则按照第三个字段升序排序::

    $ sort -t ":" -k 2,2r -k 3,3 seismo-learn-sort.txt

按照第二个字段进行降序排序，若相同则按照第四个字段的数值大小降序排序::

    $ sort -t ":" -k 2,2r -k 4,4nr seismo-learn-sort.txt

同上，但并忽略相同行::

    $ sort -t ":" -k 2,2r -k 4,4nr -u seismo-learn-sort.txt

ssh
---

``ssh`` 命令的命名源于 **S**\ ecure **Sh**\ ell（安全外壳协议，简称 SSH），该协议是
一种加密的网络传输协议。使用 ``ssh`` 命令可以登录到远程电脑中。常用于登录服务器提交计算任务。

若远程电脑的 IP 地址是 192.168.1.100，用户名是 seismo-learn，执行以下命令可以登录到该
电脑中::

    $ ssh seismo-learn@192.168.1.100

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

``tar`` 命令的名字来自 **t**\ ape **ar**\ chive（磁带存档），因为该命令最初被用来在磁带上
创建档案。该命令可以把一大堆文件和目录打包成一个文件，并且可以选择压缩该文件，这对于备份文件或
将几个文件组合成一个文件以便于网络传输是非常有用的。

首先要弄清两个概念：打包和压缩。打包是指将一大堆文件或目录打包成一个文件，而压缩则是将一个大文件
通过一些压缩算法变成一个小文件。Linux 中的很多压缩程序只能对压缩单个文件，若想压缩一大堆文件，
首先得将这一大堆文件打成一个包（使用 ``tar`` 命令），再用压缩程序进行压缩
（使用 ``gzip`` 或 ``bzip2`` 命令）。使用 ``tar`` 命令时，可以直接选择压缩打包的文件，无需
再单独使用压缩程序进行压缩。

将 :file:`file1` 和 :file:`file2` 文件打包，打包文件命名为 :file:`seismo-learn.tar`
（选项 ``-f`` 后的打包文件名一般用 :file:`.tar` 来作为标识）::

    $ tar -cvf seismo-learn.tar file1 file2

同上，但在打包后用 ``gzip`` 命令进行压缩（一般用 :file:`.tar.gz` 或 :file:`.tgz` 来作标识）::

    $ tar -zcvf seismo-learn.tar.gz file1 file2

打包后，用 ``bzip2`` 命令进行压缩（一般用 :file:`.tar.bz2` 或 :file:`.tbz` 来作标识）::

    $ tar -jcvf seism-learn.tar file1 file2

打包和压缩 :file:`file1` 和 :file:`file2` 文件:

.. tabs::

   .. code-tab:: bash 仅打包

      # 打包文件命名为 seismo-learn.tar（选项 -f 后的打包文件名一般用 .tar 来作为标识）
      $ tar -cvf seismo-learn.tar file1 file2

   .. code-tab:: bash 打包后用 gzip 命令压缩

      # 打包压缩文件命名为 seismo-learn.tar.gz（选项 -f 后的打包压缩文件名一般用 .tar.gz 或 .tgz 来作为标识）
      $ tar -zxvf seismo-learn.tar.gz

   .. code-tab:: bash 打包后用 bzip2 命令压缩

      # 打包压缩文件命名为 seismo-learn.tar.bz2（选项 -f 后的打包压缩文件名一般用 .tar.bz2 或 .tbz 来作为标识）
      $ tar -jxvf seismo-learn.tar.bz2

查阅打包压缩文件含有哪些文件和目录::

    $ tar -tvf seismo-learn.tar
    $ tar -tvf seismo-learn.tar.gz
    $ tar -tvf seismo-learn.tar.tb2

将打包压缩文件还原::

    $ tar -xvf seismo-learn.tar
    $ tar -xvf seismo-learn.tar.gz
    $ tar -xvf seismo-learn.tar.bz2

解压还原被打包和压缩的文件:

.. tabs::

   .. code-tab:: bash 还原 .tar 文件

      # 默认还原到当前目录下
      $ tar -xvf seismo-learn.tar
      # 还原到 bak 目录下（该目录必须存在）
      $ mkdir bak
      $ tar -xvf seismo-learn.tar -C bak

   .. code-tab:: bash 还原 .tar.gz 文件

      # 默认还原到当前目录下
      $ tar -zxvf seismo-learn.tar.gz
      # 还原到 bak 目录下（该目录必须存在）
      $ mkdir bak
      $ tar -zxvf seismo-learn.tar.gz -C bak

   .. code-tab:: bash 还原 .tar.bz2 文件

      # 默认还原到当前目录下
      $ tar -jxvf seismo-learn.tar.bz2
      # 还原到 bak 目录下（该目录必须存在）
      $ mkdir bak
      $ tar -jxvf seismo-learn.tar.bz2 -C bak

以上示例使用的 ``-v`` 选项会显示指令执行过程，若不想显示执行过程，可以不使用该选项。

uniq
----

``uniq`` 命令的命名源于 **uniq**\ ue（即\ **唯一**\ ），可以用于忽略或查询文件中的重复行。
如果重复行不相邻，则该命令不起作用。所以，``uniq`` 命令一般与 `sort`_ 命令结合使用。以下命令
假设示例文件已经按行排序，即重复行相邻。

打印 :file:`file` 中非重复和重复行，但重复行只打印一次::

    $ uniq file
    # 以上命令等同于以下命令
    $ sort -u file

同上，同时打印各行在文件中出现的次数::

    $ uniq -c file

只打印 :file:`file` 中非重复的行::

    $ uniq -u file

只打印 :file:`file` 中重复的行::

    $ uniq -d file

若重复行在文件中不相邻，可以使用 `sort`_ 命令先对文件进行排序::

    $ sort file | uniq
    # 以上命令等同于以下命令
    $ sort -c file
    $ sort file | uniq -c
    $ sort file | uniq -u
    $ sort file | uniq -d

若文件已经按行排序，重复行在文件中相邻:

.. tabs::

   .. code-tab:: bash 打印文件并忽略重复行

      # 重复行只打印一次
      $ uniq file
      # 以上命令等同于以下命令
      $ sort -u file

   .. code-tab:: bash 同时统计各行的出现次数

      $ uniq -c file

   .. code-tab:: bash 只打印非重复行

      $ uniq -u file

   .. code-tab:: bash  只打印重复行

      $ uniq -d file

若重复行在文件中不相邻，需要先使用 `sort`_ 命令对文件进行排序，然后再使用 `uniq` 命令：

.. tabs::

   .. code-tab:: bash 打印文件并忽略重复行

      # 重复行只打印一次
      $ sort file | uniq
      # 以上命令等同于以下命令
      $ sort -u file

   .. code-tab:: bash 同时统计各行的出现次数

      $ sort file | uniq -c

   .. code-tab:: bash 只打印非重复行

      $ sort file | uniq -u

   .. code-tab:: bash  只打印重复行

      $ sort file | uniq -d

wc
--


``wc`` 命令的名字来自 **w**\ ord **c**\ ount（字数）。该命令可以打印文件或标准输入的
行数、单词数以及字节数。

打印统计 :file:`/etc/passwd` 的行数、单词数以及字节数::

    $ wc /etc/passwd

使用 ``-l``\ 、\ ``-w``\ 或 ``-c`` 选项，可以分别只打印行数、单词数或字节数。例如，
只打印 :file:`/etc/passwd` 的行数::

    $ wc -l /etc/passwd
