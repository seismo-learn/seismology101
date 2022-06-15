# Linux 数据备份

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（作者）
- 最近更新日期: 2021-10-01
- 预计阅读时间: 20 分钟

---

新买的移动硬盘的文件系统一般是 NTFS 或 exFAT。推荐将移动硬盘文件系统
设置为 Linux 系统的常见格式 ext4，用于 Linux 下的文件备份。
该格式在 Ubuntu、Debian、Fedora、CentOS 等 Linux 发行版下，可以保持文件权限。
在 Linux 系统下，可以使用 `mkfs` 命令将移动硬盘设置为 Linux 文件系统。还可以
使用 `e2label` 命令为移动硬盘设置卷标。

## rsync

使用 `rsync` 命令进行备份十分方便。假设用户名为 seismo-learn，移动硬盘下的备份目录
为 {file}`/mnt/seismo-learn/backup/` 。使用以下命令可以将家目录下的所有子目录和文件
完整同步到备份目录下，此时备份目录是家目录的一个镜像:

```
$ rsync -av --delete /home/seismo-learn/ /mnt/seismo-learn/backup/
```

:::{important}
以上命令中家目录 {file}`/home/seismo-learn/` 最后的斜杠非常重要。若没有这个斜杠
（{file}`/home/seismo-learn`），则会把家目录本身同步到备份目录下，
即产生 {file}`/mnt/seismo-learn/backup/seismo-learn` 目录。
:::

`rsync` 命令的特色在于增量备份。这意味着只有第一次备份的时候需要花比较多的时间来
同步文件，之后再使用该命令进行备份只会同步有改动的文件。假如一周只修改了一个文件，
那么同步的过程会在瞬间完成。

读者可以参考 Bash 脚本 {download}`backup.sh`。点击下载后，修改源目录、
备份目录以及想要备份的子目录。然后按以下命令，修改文件权限为可执行，
并将脚本移至 {file}`~/bin` 目录下，就可以运行了:

```
# 修改可执行权限
$ chmod +x backup.sh

# 移动至 ~/bin/ 目录
$ mv backup.sh ~/bin

# 执行命令开始备份
$ backup.sh
```

## DejaDup

[DejaDup](https://wiki.gnome.org/Apps/DejaDup) 是一款很好的图形界面备份工具。

安装 DejaDup：

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install deja-dup
```
:::

:::{tab-item} CentOS
:sync: centos

```
$ sudo yum install deja-dup
```
:::

:::{tab-item} Ubuntu/Debian
:sync: ubuntu-debian

```
$ sudo apt update
$ sudo apt install deja-dup
```
:::
::::
