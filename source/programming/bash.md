# Bash 脚本

- 本节作者: {{姚家园}}（作者）、{{田冬冬}}（作者）
- 最近更新日期: 2023-02-27
- 预计阅读时间: 15 分钟

## Bash 简介

Bash（全称 **B**ourne-**A**gain **SH**ell）是 GNU 开发的一个 Shell。
Bash 是目前绝大多数 Linux 发行版的默认 Shell。

打开终端，使用如下命令可以查看本机的 Bash 版本:
```
$ bash --version
GNU bash，version 5.0.3(1)-release (x86_64-pc-linux-gnu)
```

这一节中，我们不介绍具体的 Bash 语法，而是介绍如何编写和执行 Bash 脚本。
{doc}`/computer/linux101` 一节中已经简要介绍了 Bash 语法，
本节的最后也列出了一些 Bash 学习资源，读者可根据需要自行学习。

## Bash 脚本

按照 Bash 语法规则编写的含有一系列指令的文本文件即称之为 Bash 脚本。
Bash 脚本一般以 `.sh` 作为后缀。

打开文本编辑器，新建一个文本文件，在文件中编写如下内容，并将其保存成名为
{file}`hello-world.sh` 的文件，则得到一个简单的 Bash 脚本。

```bash
#!/usr/bin/env bash
#
# 输出 Hello world!
#

# 使用 echo 命令输出 Hello world
echo Hello world!  # 这也是注释

# 每一句指令以换行或分号隔开
echo Hello; echo world!

# 有些命令比较长，写成多行会有利于阅读和编辑
# 每行结尾加上反斜杠，Bash 会将下一行跟当前行一起解释
echo Hello world! \
This is seismo-learn.
```

Bash 脚本的第一行通常用于指定脚本解释器。这一行以 Shebang 字符 `#!` 开头，故而
也称之为 Shebang 行。Shebang 行不是必须的，但是建议加上这行。

Shebang 字符后紧跟着脚本解释器的路径。`/usr/bin/env bash` 可以在环境变量
**PATH** 指定的目录中自动寻找 Bash 解释器并返回其路径。

```{note}
你可能也会见到 Shebang 行的另一种写法 `#!/bin/bash`。
Bash 解释器一般位于 {file}`/bin` 目录下，因而这种写法也是可行的。
但某些特殊的 Linux 系统的 Bash 解释器可能不在 {file}`/bin` 目录下，使得脚本
在这些特殊的系统上无法正常运行，因而不推荐使用这种写法。
而 `env` 命令总在 {file}`/usr/bin` 目录下，所以 `#!/usr/bin/env bash`
这种写法总可以正确找到 Bash 解释器。
```

Shebang 行之后的所有行都是 Bash 脚本的实际代码，其中 `#` 表示注释，可以放在行首，
也可以放在行尾。所有注释都会被 Bash 解释器自动忽略。

## 运行 Bash 脚本

在终端中，可以直接用 `bash scriptname.sh` 的形式运行 Bash 脚本：
```
$ bash hello-world.sh
```

当脚本中已经显式地指定了 Bash 解释器（即存在 Shebang 行）时，可以使用 `chmod`
命令给脚本添加可执行权限：
```
$ chmod +x hello-world.sh
```
此时可以直接执行 Bash 脚本：
```
$ ./hello-world.sh
```

执行结果为：

```
Hello world!
Hello
world!
Hello world! This is seismo-learn.
```

拥有 Shebang 行和可执行权限的脚本，在调用时还需要指定脚本的路径，
如 `./hello-world.sh` 代表该脚本位于当前目录。如果将脚本放在环境变量 **PATH**
指定的目录中，就不需要指定路径了，因为 Bash 会自动到这些目录中寻找是否存在同名的
可执行文件。可以参考{doc}`/computer/environment-variable`一节
设置环境变量 **PATH**。

## 学习资源

- [Bash 脚本教程](https://wangdoc.com/bash/)（全面、系统）
- [Bash 脚本基础](https://101.lug.ustc.edu.cn/Ch06/#bash-usage)（简要）
- [X 分钟速成 Bash](https://learnxinyminutes.com/docs/zh-cn/bash-cn/)（简要）
