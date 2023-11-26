# 环境变量

- 本节贡献者: {{姚家园}}（作者）、{{田冬冬}}（作者）
- 最近更新日期: 2023-10-20
- 预计花费时间: 30 分钟

---

当用户登录 Linux 系统后，Shell 程序启动并读取一系列配置文件，这些文件设置了可供所有用户共享的 Shell 环境。
然后，Shell 会读取用户家目录下的配置文件，这些配置文件定义了用户个人的 Shell 环境。
Shell 配置文件的名字和读取顺序在不同的 Shell 中或不同情况的 Shell 会话下，有所区别。
Shell 环境由环境变量、Shell 变量、Shell 函数和别名等组成，这一节主要介绍常见环境变量及其常用配置方法。

## 常见的环境变量

环境变量是一种在操作系统中定义的变量，它们存储了有关系统环境的信息，如路径、用户名、主机名等。
环境变量可以在不同的进程之间共享，因此它们是非常有用的。

以下是一些常见的环境变量及其用途：

| 环境变量 | 说明 |
|:---|:---|
| **HOME**             | 当前用户的家目录 |
| **LD_LIBRARY_PATH**  | 程序加载运行期间，动态链接库的查找路径 |
| **PATH**             | 由冒号分开的用于搜索可执行程序名的目录列表 |
| **PS1**              | Shell 提示符 |
| **PWD**              | 当前工作目录 |
| **SHELL**            | Shell 程序的名字 |
| **USER**             | 当前用户的用户名 |

## 操作环境变量

### 查看环境变量

与一般的 SHELL 变量类似，可以使用 `echo` 命令查看某个环境变量的值。例如：

```
$ echo $HOME
/home/seismo-learn
```

:::{tip}
`printenv` 或 `env` 命令可以把当前所有环境变量打印出来。
:::

## 添加、修改环境变量

可以使用 `export` 命令添加或修改环境变量。例如，添加 `MY_VAR` 变量：
```
export MY_VAR="myvalue"
```

这将在当前 Shell 会话中添加 `MY_VAR` 变量，但是在会话结束后，该变量将被删除。

如果要永久添加环境变量，可以将其添加到 Shell 配置文件中（:file:`~/.bashrc`）。
Bash 常见的配置文件有 {file}`/etc/profile`、{file}`~/.bash_profile`、{file}`~/.bashrc` 等，
一般通过修改 {file}`~/.bashrc` 文件来设置和更新个人 Shell 环境。使用 Zsh 的读者可以修改 {file}`~/.zshrc`
来设置和更新个人 Shell 环境。修改配置文件后，打开新的终端，Shell 环境就会更新。需要注意的是，
当前终端的 Shell 环境并没有更新。 可以在当前终端中使用 `source` 命令重新加载（即读取并执行）配置文件，
当前 Shell 环境也会更新：

```
# 重新加载 ~/.bashrc
$ source ~/.bashrc
```

## 删除环境变量

使用 `unset` 命令可以删除某个环境变量。例如，

```
# 显示环境变量 USER 的值
$ echo $USER
seismo-learn

# 删除环境变量 USER
$ unset USER

# 再次检查环境变量 USER 的值（其值为空）
$ echo $USER
```

## 环境变量 PATH

**PATH** 是 Linux 系统中最重要也最常用的环境变量，其指定了 Shell

在终端中输入命令后，Shell 需要先找到该命令，才能交给系统执行。不同命令所在目录并不相同，
常见的命令目录有 {file}`/bin`、{file}`/usr/bin`、{file}`/usr/local/bin` 等。
此外，大多数闭源软件或商业软件默认安装在 {file}`/opt` 目录下，用户也可能会将一些常用工具放在 {file}`~/bin` 目录下。
因此，Shell 需要知道去哪些目录下搜索用户输入的命令。而 **PATH** 环境变量则定义了用于搜索可执行程序名的目录列表。
多个目录之间由冒号分隔。在终端中输入命令名后，Shell 会依次在该目录列表下搜索命令。

登录系统后，**PATH** 变量已经设置了默认值。前文中，在终端输入命令名后，Shell 正是到这些目录下去搜索并找到命令的。

```
# 使用 echo 命令查看 PATH 环境变量
$ echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
```

若某命令所在目录不在 **PATH** 变量中，Shell 将无法将其找到交给系统执行。可以通过修改配置文件将目录永久加入到 **PATH** 变量中。
```
# 在 ~/.bashrc 文件中添加一行命令 export PATH=$PATH:$HOME/bin
$ echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
```

以上命令在 {file}`~/.bashrc` 配置文件最后添加了一行 `export PATH=$PATH:$HOME/bin`。其中，`export` 命令用于新增、
修改或删除环境变量，**HOME** 环境变量表示用户的家目录，即 {file}`~`。假设用户名是 seismo-learn，家目录便是
{file}`/home/seismo-learn`。因此，该行的作用是将 {file}`/home/seismo-learn/bin` 目录添加到搜索目录列表的末尾，
更新 **PATH** 变量:

```
# 打开一个新的终端，查看 PATH 变量
$ echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/seismo-learn/bin
```

修改配置文件后，打开新的终端，Shell 环境就会更新。需要注意的是，当前终端的 Shell 环境并没有更新。
可以在当前终端中使用 `source` 命令重新加载（即读取并执行）配置文件，当前 Shell 环境也会更新:

```
# 重新加载 ~/.bashrc
$ source ~/.bashrc
```
