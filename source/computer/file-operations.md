# 文件操作

- 本节贡献者: {{姚家园}}（作者）、{{田冬冬}}（审稿）
- 最近更新日期: 2021-04-23
- 预计花费时间: 30 分钟

---

## 熟悉 Linux 文件系统

:::{figure} linux-file-system-tree.*
:align: center

Linux 文件系统树
:::

Linux 文件系统就像一颗树一样，从 {file}`/` 目录开始，这个特殊的目录称为根目录。
根目录下一般有 {file}`/home`、{file}`/root`、{file}`/bin`、
{file}`/usr`、{file}`/lib`、{file}`/opt` 等目录。

- {file}`/home` 目录：用户的家目录，存储用户自己的文件
- {file}`/bin` 目录：存储必须的程序和命令，所有用户都可用
- {file}`/usr` 目录：大多数软件的安装位置
- {file}`/opt` 目录：某些闭源或商业软件（如 Matlab、Google Chrome、Google Earth）
  默认将软件安装到此目录下

日常科研中，大多数情况下只在 {file}`/home` 目录下工作。假设用户名是 seismo-learn，
该用户的家目录便是 {file}`/home/seismo-learn`。macOS 下的家目录是 {file}`/Users/seismo-learn`。
在 Linux/macOS 系统下，可用 {file}`~` 代表家目录。Linux 系统安装后，自动创建的家目录下的目录有
{file}`~/Desktop`、{file}`~/Documents`、{file}`~/Downloads` 等。熟悉 Linux 文件系统后可以参考{doc}`《文件管理实践经验》<best-practices/file-organization>`和{doc}`《软件安装实践经验》<best-practices/software-installation>`进一步组织与管理家目录，以提高工作效率。

## 操作文件与目录

接下来将通过一系列命令熟悉和掌握 Linux 系统下文件和目录的常用操作。
读者应打开终端，根据下面的教程自行输入命令（不要复制粘贴！），记住并理解每个
命令的作用。这一小节中，假设用户名是 seismo-learn，读者根据自己的情况自行修改。

### 查看文件和目录

```
# 使用 pwd（print working directory，即打印当前工作目录）命令查看当前所在目录
# 可以看出启动终端后，默认进入家目录
$ pwd
/home/seismo-learn

# 使用 ls（list，即列表）命令显示当前所在目录（即家目录）含有的子目录和文件
$ ls
Desktop    Documents    Downloads
# 查看 ~/Desktop 目录和 /etc/passwd 文件
$ ls Desktop
$ ls /etc/passwd
```

### 切换目录

```
# 使用 cd（change directory，即切换目录）命令进入根目录
$ cd /
# 查看根目录中的子目录和文件
$ ls
bin   etc   lib    mnt  proc  run   srv  tmp  var
boot  dev   home  lib64  media   opt  root  sbin  sys  usr
# 切换回家目录（以下任一操作均可）
$ cd /home/seismo-learn
$ cd ~
$ cd

# 确认已经切换回家目录下
$ pwd
/home/seismo-learn
```

### 新建文件和目录

```
# 进入家目录
$ cd ~
# 使用 mkdir（make directory，即创建目录）命令新建以下目录
$ mkdir codes software
$ ls
codes  Desktop  Documents  Downloads  software
# 建立 workspace 目录，并在该目录下建立 source 目录
# 需要使用 -p 选项，表示自动创建不存在的中间层目录
$ mkdir -p workspace/source
$ ls workspace/
source

# 进入 workspace 目录
$ cd workspace
# 使用 touch 命令创建新文件 hello-world.txt 和 seismo-learn.txt
$ touch hello-world.txt seismo-learn.txt
$ ls
hello-world.txt  seismo-learn.txt  source
```

### 复制文件和目录

:::{note}
以下所有操作都假设读者已经切换到 {file}`~/workspace` 目录下了，即:

```
# 进入 ~/workspace 目录
$ cd ~/workspace
```
:::

```
# 使用 cp（copy，即复制）命令复制 hello-world.txt 文件到同一目录下，并重命名为 hello-world-cp.txt
$ cp hello-world.txt hello-world-cp.txt
$ ls
hello-world-cp.txt  hello-world.txt  seismo-learn.txt  source
# 复制 hello-world.txt 和 seismo-learn.txt 文件到 source 目录下
$ cp hello-world.txt seismo-learn.txt source
$ ls source
hello-world.txt  seismo-learn.txt

# 复制 source 目录为同一目录下的 destination 目录（目标目录不存在）
$ cp -r source destination
$ ls
destination  hello-world-cp.txt  hello-world.txt  seismo-learn.txt  source
$ ls destination
hello-world.txt  seismo-learn.txt
# 复制 source 目录到同一目录下的 destination 目录下（目标目录已存在）
$ cp -r source destination
$ ls destination
hello-world.txt  seismo-learn.txt  source
```

### 移动文件和目录

```
# 使用 mv（move，即移动）命令移动 hello-world.txt 文件同一目录下，并重命名为 hello-world-mv.txt
$ mv hello-world.txt hello-world-mv.txt
$ ls
destination  hello-world-cp.txt  hello-world-mv.txt  seismo-learn.txt  source
# 移动 hello-world-cp.txt 和 hello-world-mv.txt 文件到 source 目录下
$ mv hello-world-cp.txt hello-world-mv.txt source
ls
destination  seismo-learn.txt  source
$ ls source
hello-world-cp.txt  hello-world.txt  hello-world-mv.txt  seismo-learn.txt

# 移动 source 目录为同一目录下的 source-mv 目录（相当于重命名）
$ mv source source-mv
$ ls
destination  seismo-learn.txt  source-mv
# 移动 source-mv 目录到同一目录下的 destination 目录下
$ mv source-mv destination
$ ls
destination  seismo-learn.txt
$ ls destination
hello-world.txt  seismo-learn.txt  source  source-mv
```

### 删除文件和目录

```
# 使用 rm（remove，即删除）命令删除 seismo-learn.txt 文件
$ rm seismo-learn.txt
$ ls
destination
# 删除 destination 目录
## rm 命令无法直接删除文件夹，直接使用 rm 命令删除文件夹会出现如下报错
$ rm destination/
rm: destination/: is a directory
## 需要使用 -r 选项（recursive，表示递归）
$ rm -r destination
$ ls

# 新建 tmp 目录
$ mkdir tmp
$ ls
tmp
# 使用 rmdir（remove directory，即删除目录）命令删除空目录 tmp。目录不为空时则不删除
$ rmdir tmp
$ ls
```

:::{warning}
使用 `rm` 命令删除的文件会被直接删除，并不会被放在回收站里。
因而执行 `rm` 命令时一定要小心再小心，不要误删重要文件。
可以先把要删除的文件移动到某目录下（如 {file}`~/trash`），之后统一删除；
也可以考虑使用其他命令行工具管理回收站
（如 [trash-cli](https://github.com/andreafrancia/trash-cli)）。
:::

### 创建软链接

软链接，也叫符号链接，类似于 Windows 下的快捷方式。Linux 下可以使用 `ln` （link，即链接）
命令为文件和目录建立软链接:

```
# 在当前目录下，为文件 /etc/passwd 建立软链接
$ ln -s /etc/passwd
# 使用 ls -l 命令查看，会发现在当前目录下生成了一个 passwd 文件，其指向源文件 /etc/passwd
$ ls -l
total 0
lrwxr-xr-x  1 seismo-learn  seismo-learn  11 Oct  4 21:55 passwd -> /etc/passwd
# 默认情况下，软链接与源文件同名。可以重新指定软链接的文件名
$ ln -s /etc/passwd mylocalpasswd
$ ls -l
total 0
lrwxr-xr-x  1 seismo-learn  seismo-learn  11 Oct  4 21:59 mylocalpasswd -> /etc/passwd
lrwxr-xr-x  1 seismo-learn  seismo-learn  11 Oct  4 21:55 passwd -> /etc/passwd

# 在当前目录下，为文件夹 /usr/lib 建立软链接
$ ln -s /usr/lib mylibdir
$ ls -l
total 0
lrwxr-xr-x  1 seismo-learn  seismo-learn     8B Oct  4 22:04 mylibdir -> /usr/lib
lrwxr-xr-x  1 seismo-learn  seismo-learn    11B Oct  4 21:59 mylocalpasswd -> /etc/passwd
lrwxr-xr-x  1 seismo-learn  seismo-learn    11B Oct  4 21:55 passwd -> /etc/passwd
# 可以直接对软链接进行各种操作
$ ls mylibdir/

# 删除软链接。源文件不受影响
$ rm mylibdir passwd mylocalpasswd
```

## 隐藏文件和隐藏目录

Linux 中，以 `.` 开头的文件和目录是隐藏文件或隐藏目录。所谓隐藏，是指在一般情况下，
在文件浏览器或执行 `ls` 命令时不会显示这些文件或目录。

下面使用 `touch` 和 `mkdir` 命令创建一个隐藏文件和一个隐藏目录：
```
# 创建隐藏文件
$ touch .hidden-example-file.txt
# 创建隐藏目录
$ mkdir .hidden-example-dir
```

使用 `ls` 命令查看当前目录的内容，隐藏文件和隐藏目录不会被显示：
```
$ ls
```
想要显示隐藏文件和隐藏目录，需要使用 `-a` 选项：
```
$ ls -a
.                  ..                 .hidden-example-dir      .hidden-example-file.txt
```

:::{note}
`.` 和 `..` 的具体含义会在下面一节介绍。
:::

在文件浏览器中，可以勾选“Show Hidden Files”选项以显示隐藏文件和隐藏目录，
也可以直接使用快捷键 {kbd}`Ctrl` + {kbd}`H`。

## 文件路径

访问文件或目录需要指定文件或目录的路径。Linux 下有两种表示路径的方式：绝对路径和相对路径。

顾名思义，绝对路径是从根目录 {file}`/` 开始算起的路径。例如，家目录是 {file}`/home`，
用户 seismo-learn 的家目录是 {file}`/home/seismo-learn`，该用户的桌面目录的路径是
{file}`/home/seismo-learn/Desktop`。日常科研中，用户的计算机一般只有用户自己在使用，
因此提到家目录时一般特指 {file}`/home/seismo-learn`，而不是指 {file}`/home`。
因为大多数情况下，我们都在用户的家目录下操作计算机，因此就给这个目录一个特殊的别称
{file}`~`，其和 {file}`/home/seismo-learn` 是一回事。

有时进入到某个目录中，使用绝对路径并不方便。例如，当前位于 {file}`~/projects/NorthChina-MTZ/data`
目录中，如果想进入 {file}`~/projects/NorthChina-MTZ/figures` 目录下，使用绝对路径要
输入很多字母。为了解决这个问题，Linux 文件系统定义了两个特殊的路径：

- {file}`.`：当前目录
- {file}`..`：当前目录的上一级目录

利用这两个特殊路径，可以使用相对路径访问其他目录下的文件和目录。例如，

- {file}`./Beijing`：当前目录下的 {file}`Beijing` 目录，即 {file}`~/projects/NorthChina-MTZ/data/Beijing`。
  当前路径也可以省略，即 {file}`Beijing`
- {file}`./Beijing/IC-BJI.sac`：当前目录下的 {file}`Beijing` 目录下的 {file}`IC-BJI.sac` 文件，
  即 {file}`~/projects/NorthChina-MTZ/data/Beijing/IC-BJT.sac`。
  当前路径也可以省略，即 {file}`Beijing/IC-BJT.sac`
- {file}`..`：上一层目录，即 {file}`~/projects/NorthChina-MTZ` 目录
- {file}`../..`：上一层的上一层目录，即 {file}`~/projects` 目录
- {file}`../figures`：上一层目录下的 {file}`figures` 目录，即 {file}`~/projects/NorthChina-MTZ/figures` 目录
- {file}`../figures/fig1.pdf`：上一层目录下的 {file}`figures` 目录下的 {file}`fig1.pdf` 文件，
  即 {file}`~/projects/NorthChina-MTZ/figures/fig1.pdf`

## 文件权限

Linux 下每个文件和目录都有自己的权限，使用 `ls -l` 命令可以查看文件或目录的权限:

```
# 进入 ~/workspace 目录，并新建 hello-world.sh 文件和 source 目录
$ cd ~/workspace
$ touch hello-world.sh
$ mkdir source

# 使用 ls 命令的 -l 选项可以查看 ~/workspace 目录下的所有文件和目录的详细信息
$ ls -l
total 0
-rw-r--r-- 1 seismo-learn seismo-learn 0 Feb  7 22:07 hello-world.sh
drwxr-xr-x 2 seismo-learn seismo-learn 6 Feb  7 22:07 source
```

`ls -l` 的输出中，第一列为文件权限位，第三列和第四列分别表示文件所属用户和用户组。
此处，文件 {file}`hello-world.txt` 和目录 {file}`source` 属于用户 seismo-learn，
且属于用户组 seismo-learn（对于个人计算机而言，用户组通常有且仅有一个用户，
因而用户组与用户同名）。

第一列文件权限位总共包含了 10 位信息（如 `-rw-r--r--`），从左到右的含义分别是：

- 第一位：文件类型（例如，`-` 表示普通文件，`d` 表示目录）
- 第二到第四位：文件所属用户的权限
- 第五到第七位：文件所属用户组的权限
- 第八到第十位：其他人的权限

每种权限（即文件所属用户的权限、文件所属用户组的权限、其他人的权限）
包含三位信息，第一位 `r` 代表可读取（read），第二位 `w` 代表可写入（write），
第三位 `x` 代表可执行（execute，对于目录而言表示可以进入该目录），`-` 代表没有对应的权限。

从文件的权限位可以看出，用户 seismo-learn 可以读写文件 {file}`hello-world.sh`，
但不可直接执行该文件，对 {file}`source` 目录拥有可读、可写、可执行的权限。

除了用字母 `rwx` 表示权限外，还可以用数字表示权限。4 代表可读，2 代表可写，
1 代表可执行。因为 $4+2+1=7$，所以 7 代表可读、可写、可执行。以此类推，
6 代表可读、可写、不可执行，5 代表可读、不可写、可执行，
4 代表可读、不可写、不可执行。

使用 `chmod`（change mode，即变更模式）命令可以修改文件或目录的权限:

```
# 修改 hello-world.sh 权限
# 所属用户可读可写不可执行、所属用户组可读可写不可执行、其他人所属用户可读不可写不可执行
$ chmod 664 hello-world.sh
$ ls -l hello-world.sh
-rw-rw-r-- 1 seismo-learn seismo-learn 0 Feb  7 22:37 hello-world.sh

# 增加 hello-world.sh 的可执行属性
$ chmod +x hello-world.sh
-rwxrwxr-x 1 seismo-learn seismo-learn 0 Feb  7 22:37 hello-world.sh

# 当文件有可执行权限后，即可通过 ./文件名 的方式直接执行该文件
$ ./hello-world.sh
```
