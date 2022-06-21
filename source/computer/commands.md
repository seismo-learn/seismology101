# Linux 常用命令

- 本节贡献者: {{姚家园}}（作者）、{{田冬冬}}（作者）
- 最近更新日期: 2021-04-04
- 预计花费时间: 120 分钟

---

Linux/macOS 下有成百上千个命令，每个命令都有众多选项。一开始上手 Linux/macOS，
如果要学习这么多命令会让人发狂，而且根本记不住。其实，**命令不是背出来的而是用出来的**。
我们只需要掌握少数常用命令的常用用法，遇到不熟悉的命令或用法再查询和学习即可。
这一节就介绍一些常用命令的常用用法。用户可以通过如下方式查询更多命令及其用法。

1. 使用 [tldr](https://tldr.sh/) 命令查询 [**推荐**]

   `tldr` 是由社区维护的简化版的命令帮助文档。其以实例的方式展示了
   大多数常用命令的常见用法，但某些命令可能还未编写。例如 `tldr mkdir`
   将显示 `mkdir` 命令的简单用法。

2. 使用 UNIX 提供的 `man` 命令查询

   `man` 提供了命令的完整语法，因而通常比较冗长。例如 `man mkdir` 将
   显示 `mkdir` 命令的完整语法。

3. 网页搜索相关命令

   - 使用 Google 搜索
   - 在网站 <https://man.linuxde.net/> 中查询

______________________________________________________________________

::::{grid} 2 2 2 4
:gutter: 4 4 3 3

:::{grid-item-card} 文件查看
- [](cat)
- [](head)
- [](less)
- [](tail)
:::

:::{grid-item-card} 文件处理
- [](diff)
- [](gawk)
- [](grep)
- [](sed)
- [](sort)
- [](uniq)
- [](wc)
:::

:::{grid-item-card} 文件搜索
- [](find)
- [](locate)
:::

:::{grid-item-card} 文件传输
- [](rsync)
- [](scp)
:::

:::{grid-item-card} 文件下载
- [](wget)
:::

:::{grid-item-card} 压缩与解压
- [](tar)
:::

:::{grid-item-card} 系统管理
- [](df)
- [](du)
- [](sudo)
- [](top)
:::

:::{grid-item-card} 远程登录
- [](ssh)
:::
::::

(cat)=
## cat

`cat` 命令的命名来源于 con**cat**enate（拼接）。该命令可以输出某个文件的
内容，或将多个文件拼接起来:

```
# 将一个文件的内容输出到终端
$ cat file

# 输出文件内容并显示行号
$ cat -n file

# 将文件 file1 和 file2 拼接到一个文件 target_file 中
$ cat file1 file2 > target_file
```

(diff)=
## diff

`diff` 命令的命名来自 **diff**erence。该命令可以用来逐行比较两个文件的异同。
我们用以下两个示例文件展示其用法:

```
$ cat file1
seismo-learn
seismology
software

$ cat file2
seismo-learn
seismology101
software
```

比较 {file}`file1` 和 {file}`file2` 的异同，结果显示两个文件第二行不同，其他
行是相同的:

```
$ diff file1 file2
2c2
< seismology
---
> seismology101
```

(df)=
## df

`df` 命令的命名来自 **d**isk **f**ree（可使用的硬盘空间）。
该命令可以获取硬盘总空间、已使用空间、剩余空间等信息。

```
$ df -h
Filesystem                          Size  Used Avail Use% Mounted on
/dev/mapper/cl_ivantjuawinata-root  100G   86G   15G  86% /
devtmpfs                            7.8G     0  7.8G   0% /dev
tmpfs                               7.8G  114M  7.7G   2% /run
/dev/mapper/cl_ivantjuawinata-home  1.1T  904G  149G  86% /home
```

从输出中可以得知，{file}`/home` 分区总硬盘空间为 1.1 TB，已使用 904 GB，剩余 149 GB。

(du)=
## du

`du` 命令的名字来自 **d**isk **u**sage（硬盘使用情况）。该命令用于查看
文件和目录占用的硬盘空间。

查看当前目录所占硬盘空间（也可以在最后指定想查看的目录名）:

```
# 默认显示当前目录及其所有子目录所占硬盘空间
$ du -h

# 设置目录深度为 0，即只显示当前目录所占硬盘空间，不显示其任何子目录
$ du -h -d 0

# 设置目录深度为 1，即只显示当前目录及其一级子目录所占硬盘空间
$ du -h -d 1
```

查看指定文件所占硬盘空间:

```
$ du -h file1.txt
```

(find)=
## find

`find` 命令用来查找指定目录下的子目录和文件，并执行一些操作。可以参考
[find 命令](https://man.linuxde.net/find/) 学习更多用法。

```
# 列出 ~/src 目录及其子目录下的所有目录和文件
$ find ~/src

# 查找 ~/src 目录及其子目录下以 .c 结尾的目录和文件
$ find ~/src -name "*.c"

# 查找 ~/src 目录及其子目录下以 .c 结尾的文件
$ find ~/src -type f -name "*.c"
```

使用 `-delete` 选项可以直接删除查找的文件或目录:

```
# 查找 ~/src 目录及其子目录下以 .pyc 结尾的文件，并删除
$ find ~/src -type f -name "*.pyc" -delete
```

`find` 的 `-exec` 选项可以调用其他系统命令直接对查找的结果进行处理:

```
# 查找 ~/src 目录及其子目录下以 .c 结尾的文件，并执行 grep 命令找出这些文件中含 seismo-learn 的行
$ find ~/src -type f -name "*.c" -exec grep seismo-learn {} +
```

这个例子中，`{}` 与 `-exec` 选项结合，表示查找到的文件。我们还可以用 `-ok`
来代替 `-exec` 选项，二者的区别是 `-ok` 选项在执行后面的命令前会给出提示，
输入 {kbd}`y` 才会执行，输入 {kbd}`n` 则不执行。

(gawk)=
## gawk

`awk` 命令的命名起源于其三位作者的姓氏首字母。该命令可以选择标准输入、其他命令的
输出或文件中的特定字段并进行操作。它依次扫描每一行，并读取里面的每一个字段。
可以参考
[Bash 脚本教程: awk](https://www.bookstack.cn/read/bash-tutorial/docs-archives-commands-awk.md)
学习其更多用法。

`gawk` 是 GNU 版本的 `awk` 命令。通常建议直接使用 `gawk` 而非 `awk`，
尽管在 Linux 系统下，`awk` 命令一般是指向 `gawk` 命令的软链接。

```
# 将一个文件的每一行输出到标准输出。 $0 表示当前行
$ gawk '{print $0}' file

# 将一个文件的每一行的第 1 个和第 3 个字段输出到标准输出（字段的默认分隔符是空格和制表符）
$ gawk '{print $1,$3}' file

# 同上，但跳过第 1-2 行，从第 3 行开始。FNR 为当前行的行数
$ gawk 'FNR>2 {print $1,$3}' file

# 将 /etc/passwd 每一行的第 1 个和第 3 个字段输出到标准输出，并设置字段分隔符为冒号
$ gawk -F ':' '{print $1,$3}' /etc/passwd

# 同上，并输出每一行的行号
$ gawk -F ':' '{print NR,$1,$3}' /etc/passwd
```

(grep)=
## grep

`grep` 命令的命名来自 **g**lobally search a **re**gular expression and **p**rint
（以正则表达式进行全局搜索并输出）。它是一个强大的文本搜索工具，可以搜索文件中
与指定模式匹配的行并输出:

```
# 搜索并输出 /etc/passwd 中含有 root 的行
$ grep root /etc/passwd

# 同上，并显示行号
$ grep -n root /etc/passwd

# 搜索并输出 /etc/passwd 中不含有 root 的行
$ grep -v root /etc/passwd
```

(head)=
## head

`head` 命令用于输出文件开头部分的内容:

```
# 输出 /etc/passwd 的前 10 行
$ head /etc/passwd

# 输出 /etc/passwd 的前 5 行
$ head -n 5 /etc/passwd
```

(less)=
## less

`less` 命令可以用来浏览文件内容，比 `more` 命令功能更强大。因此，一个常用的
笑话记忆方式是“less is more”。该命令允许用户向前或向后浏览文件：按 {kbd}`PageUp`
键向上翻页，用 {kbd}`PageDown` 键向下翻页，按 {kbd}`Enter` 键或向下方向键则向下移动，
用向上方向键则向上移动。按 {kbd}`q` 键退出浏览。

```
# 浏览 /etc/passwd
$ less /etc/passwd

# 同上，并显示行号
$ less -N /etc/passwd
```

(locate)=
## locate

`locate` 命令可以用于查找目录和文件。该命令比 [find] 命令快得多，原因在于它
不搜索具体目录，而是直接搜索含有本地所有文件信息的数据库:

```
# 搜索名称含 passwd 的目录或文件
$ locate passwd

# 搜索名称含 /etc/sh 的目录或文件（包括了 /etc 目录下所有以 sh 开头的目录或文件）
$ locate /etc/sh

# 搜索名称含 ~/Des 的目录或文件（包括了家目录下，所有以 Des 开头的目录或文件）
$ locate ~/Des

# 同上，但忽略大小写
$ locate -i ~/des
```

该命令所需的数据库是系统自动创建的，每天自动更新。因此，`locate` 命令查不到
最新变动过的文件。可以执行 `updatedb` 命令手动更新数据库，但是 `updatedb`
命令的执行过程较长:

```
# Linux
$ sudo updatedb

# macOS 系统可以使用以下命令
$ sudo /usr/libexec/locate.updatedb
```

(rsync)=
## rsync

`rsync` 命令的命名来自 **r**emote **sync**hronization（远程同步）。该命名
可以用于同步文件，可以是两个本地目录之间，也可以是本地计算机与远程计算机之间。
与其他文件传输工具（如 [scp]）不同，`rsync` 命令仅传输有变动的部分。因此，
同步速度更快，常用于文件备份。可以参考
[SSH 教程：rsync 命令](https://wangdoc.com/ssh/rsync.html)
进一步学习其用法。

以下示例假设源目录是 {file}`~/Downloads/source`，目标目录是 {file}`~/workspace/destination`，
远程电脑的 IP 地址是 192.168.1.100，用户名是 seismo-learn。

同步两个本地目录:

```
# 将源目录同步到目标目录下。~/workspace/destination/source 成为源目录的一个镜像
$ rsync -av --delete ~/Downloads/source ~/workspace/destination

# 将源目录下的文件和目录同步到目标目录下。~/workspace/destination 成为源目录的一个镜像
# 该命令与上一命令相比，在源目录的结尾多了一个反斜杠 "/"
$ rsync -av --delete ~/Downloads/source/ ~/workspace/destination

# 若只想查看命令执行效果，不真的执行命令，可以使用 -n 选项。例如
$ rsync -anv ~/Downloads/source ~/workspace/destination
```

同步本地源目录到远程计算机的目标目录下:

```
$ rsync -av --delete ~/Downloads/source seismo-learn@192.168.1.100:~/workspace/destination
```

同步远程计算机的源目录本地目标目录下:

```
$ rsync -av --delete seismo-learn@192.168.1.100:~/Downloads/source ~/workspace/destination
```

具体解释以下几个常用选项：

- `-a` 选项表示以归档方式传输文件，并保持所有文件属性
- `-v` 选项表示将执行过程输出到终端，用于查看哪些内容正在被同步
- `--delete` 选项表示删除目标目录下那些不存在于源目录下的文件和目录，
  实现源目录和目标目录的同步
- `-n` 选项表示不执行命令，但模拟执行结果，可用于检测命令的运行是否符合预期

(scp)=
## scp

`scp` 命令的命名来源于 **s**ecure **c**o**p**y（安全复制），可用于本地
和远程计算机之间传输文件。该命令基于 [ssh] 进行安全的远程文件传输，因此传输是加密的。
虽然 `scp` 传输速度不如 [rsync] 命令，但是它不占系统资源。当需要传输大量小文件时，
使用 [rsync] 命名会导致硬盘 I/O（输入/输出）非常高，而 `scp` 基本不影响系统
正常使用。可以参考
[SSH 教程：scp 命令](https://wangdoc.com/ssh/scp.html)
进一步学习其用法。

以下命令假定远程电脑的 IP 地址是 192.168.1.100，用户名是 seismo-learn:

```
# 复制远程文件或目录 /home/seismo-learn/file-or-folder 到本地目录 ~/Downloads 下
$ scp -r seismo-learn@192.168.1.100:/home/seismo-learn/file-or-folder ~/Downloads/

# 上传本地文件或目录 ~/Downloads/file-or-folder 到远程目录 home/seismo-learn/folder2
$ scp -r ~/Downloads/file-or-folder seismo-learn@192.168.1.100:/home/seismo-learn/folder2/
```

(sed)=
## sed

`sed` 命令的名字来源于 **s**tream **ed**itor（流编辑器）。该命令可以用于
对输入流（文件或管道）执行基本的文本转换。它会把当前处理的行存储在临时缓冲区中
再进行处理，处理完成后再把缓冲区的内容送往屏幕。接着处理下一行，直到文件末尾。
因此默认情况下，文件内容并没有改变:

```
# 将 file 中每一行的第一个 book 替换成 books
$ sed 's/book/books/' file

# 将 file 中每一行的所有的 book 都替换成 books
$ sed 's/book/books/g' file

# 以上命令只是将转换后的文本内容输出出来，并未改变文件本身。可以使用 -i 选项直接改变文件
$ sed -i 's/book/books/g' file

# 以上命令使用斜杠 / 当定界符，也可以使用任意定界符，比如 #
$ sed 's#book#books#' file
$ sed 's#book#books#g' file
$ sed -i 's#book#books#g' file
```

需要注意，macOS 提供的 BSD `sed` 的语法很不同。建议 macOS 用户使用 Homebrew
安装 `gnu-sed`，并将以上命令替换为 `gsed`。

(sort)=
## sort

`sort` 命令可以将文件内容进行排序，并输出排序结果。该命令将文件的每一行作为
一个单位，相互比较。默认的比较原则是从首字符向后，依次按 ASCII 码值进行比较，
最后将他们按排序结果输出。

```
# 按 ASCII 码值进行升序排序
$ sort seismo-learn-sort.txt

# 按 ASCII 码值进行降序排序
$ sort -r seismo-learn-sort.txt

# 按 ASCII 码值进行升序排序，并忽略相同行（即重复行只统计一次）
$ sort -u seismo-learn-sort.txt

# 按 ASCII 码值进行降序排序，并忽略相同行
$ sort -u -r seismo-learn-sort.txt
# 不同选项也可以写在一块
# sort -ur seismo-learn-sort.txt

# 按数值大小进行升序排序
$ sort -n seismo-learn-sort.txt

# 按第三列 ASCII 码值进行升序排列
$ sort -k3,3 seismo-learn-sort.txt

# 按第三列的数值大小进行升序排列
$ sort -k3,3n seismo-learn-sort.txt

# 按第三列的数值大小进行降序排列
$ sort -k3,3nr seismo-learn-sort.txt
```

(ssh)=
## ssh

`ssh` 命令的命名源于 **S**ecure **Sh**ell（安全外壳协议，简称 SSH），
该协议是一种加密的网络传输协议。使用 `ssh` 命令可以登录到远程计算机中。
常用于登录服务器提交计算任务。可以参考
[SSH 教程：SSH 基本知识](https://wangdoc.com/ssh/key.html)
进一步学习其用法。

若远程计算机的 IP 地址是 192.168.1.100，用户名是 seismo-learn:

```
# 登录远程计算机
$ ssh seismo-learn@192.168.1.100

# 登录远程计算机并打开图形界面（需要配置远程计算上的 ssh 服务器配置）
$ ssh -X seismo-learn@192.168.1.100
```

(sudo)=
## sudo

用户可以随意对家目录下的文件进行任何读、写以及删除等操作，但却无法对根目录下的
文件进行类似操作。这是因为 Linux 下有严格的权限机制，只允许 root 用户（即管理员）
对根目录下的文件进行操作，以防止一般用户的操作对系统造成破坏。有些时候，
为安装软件或者修改系统配置文件，需要临时获取 root 用户权限。此时可以在需要执行的
命令前加上 `sudo`。例如，在 Fedora 下使用 dnf 命令安装 GNU Fortran:

```
$ sudo dnf install gcc-gfortran
```

(tail)=
## tail

`tail` 命令用于输出文件尾部内容:

```
# 输出 /etc/passwd 的后 10 行
$ tail /etc/passwd

# 输出 /etc/passwd 的后 5 行
$ tail -n 5 /etc/passwd
```

(tar)=
## tar

`tar` 命令的名字来自 **t**ape **ar**chive（磁带存档），因为该命令最初被
用来在磁带上创建档案。该命令可以把一大堆文件和目录打包成一个文件，并且可以
对该文件进行压缩。这对于备份文件或将几个文件组合成一个文件以便于网络传输是非常有用的。

首先要弄清两个概念：打包和压缩。打包是指将一大堆文件或目录打包成一个文件，而压缩
则是将一个大文件通过一些压缩算法变成一个小文件。Linux 中的很多压缩程序只能压缩
单个文件，若想压缩一大堆文件，首先得将这一大堆文件打成一个包（使用 `tar` 命令），
再用压缩程序进行压缩（使用 `gzip` 或 `bzip2` 命令）。使用 `tar` 命令时，
可以直接选择压缩打包的文件，无需再单独使用压缩程序进行压缩。

```
# 将 file1 和 file2 打包并用 gzip 命令进行压缩，文件命名为 seismo-learn.tar.gz。也可用 .tgz 来作标识
$ tar -zcvf seismo-learn.tar.gz file1 file2

# 打包并用 bzip2 命令进行压缩。一般用 .tar.bz2 或 .tbz 来作文件标识
$ tar -jcvf seism-learn.tar.bz2 file1 file2

# 列出压缩包中的文件和目录
$ tar -tvf seismo-learn.tar.gz

# 解压一个压缩包，默认解压到当前目录下
$ tar -xvf seismo-learn.tar.gz

# 解压到 bak 目录下（该目录必须存在）
$ mkdir bak
$ tar -xvf seismo-learn.tar.gz -C bak
```

以上查看和解压命令也适用于 {file}`.tar` 和 {file}`tar.bz2` 压缩包格式。

以上示例使用的 `-v` 选项会显示指令执行过程，若不想显示执行过程，可以不使用该选项。

(top)=
## top

`top` 命令的名字来自 **t**able **o**f **p**rocesses（进程表）。
该命令可以实时动态地查看系统的整体运行情况，是一个综合了多方信息，
监测系统性能和运行信息的实用工具。

```
$ top
top - 14:31:52 up 29 days, 14:02,  5 users,  load average: 0.32, 0.51, 0.49
Tasks: 328 total,   1 running, 327 sleeping,   0 stopped,   0 zombie
%Cpu(s):  1.0 us,  0.5 sy,  0.0 ni, 98.6 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16320540 total,  2548620 free,  6057748 used,  7714172 buff/cache
KiB Swap: 17821692 total, 17444092 free,   377600 used.  8252436 avail Mem

   PID USER           PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
120901 seismo-learn   20   0 5027300  88404  45736 S   2.0  0.5   0:20.05 chrome
  2158 seismo-learn   20   0 4355124 444384  57984 S   1.0  2.7   1581:35 gnome-shell
148103 seismo-learn   20   0  911924  82504  26180 S   1.0  0.5   4:04.09 terminator
```

`top` 命令执行过程中可以使用的一些单字母或数字的交互命令:

- `q`：退出命令
- `1`：显示每个 CPU 的状态

(uniq)=
## uniq

`uniq` 命令的命名源于 **uniq**ue（唯一），可以用于忽略或查询文件中的重复行。
如果重复行不相邻，则该命令不起作用。所以，`uniq` 命令一般与 [sort] 命令结合使用。
以下命令假设示例文件已经按行排序，即重复行相邻。

```
# 输出 file 中非重复和重复行，但重复行只输出一次
$ uniq file
# 以上命令等同于以下命令
$ sort -u file

# 同上，同时输出各行在文件中出现的次数
$ uniq -c file

# 只输出 file 中非重复的行
$ uniq -u file

# 只输出 file 中重复的行
$ uniq -d file
```

若重复行在文件中不相邻，可以使用 [sort] 命令先对文件进行排序:

```
$ sort file | uniq
# 以上命令等同于以下命令
$ sort -c file

$ sort file | uniq -c
$ sort file | uniq -u
$ sort file | uniq -d
```

(wc)=
## wc

`wc` 命令的名字来自 **w**ord **c**ount（字数）。该命令可以输出文件或标准输入的
行数、单词数以及字节数:

```
# 输出统计 /etc/passwd 的行数、单词数以及字节数
$ wc /etc/passwd
 119     321    7579 /etc/passwd
```

从输出中可以得知，{file}`/etc/passwd` 有 119 行、321 个单词以及 7579 个字节。

使用 `-l`、`-w` 或 `-c` 选项，可以分别只输出行数、单词数或字节数。例如，
只输出 {file}`/etc/passwd` 的行数:

```
$ wc -l /etc/passwd
```

(wget)=
## wget

`wget` 命令的名字来自 **W**orld **W**ide **W**eb **get**（万维网获取）。
该命令可以用来从网络上下载文件，支持断点续传。
类似的命令还有 `curl`，可以参考 [curl 用法指南](https://www.ruanyifeng.com/blog/2019/09/curl-reference.html)
学习其基本用法。

```
# 下载以下网址对应的单个文件（即 distaz.c 代码）
$ wget http://www.seis.sc.edu/software/distaz/distaz.c

# 下载并以不同的文件名保存
$ wget -O distaz-rename.c http://www.seis.sc.edu/software/distaz/distaz.c

# 继续一个未完成的下载任务，这对下载大文件时突然中断非常有帮助
$ wget -c http://www.seis.sc.edu/software/distaz/distaz.c
```
