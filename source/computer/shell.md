# Shell 基础

- 本节贡献者: {{姚家园}}、{{田冬冬}}
- 最近更新日期: 2023-04-08
- 预计花费时间: 60 分钟

---

## Shell 扩展

Shell 接收到用户输入的命令后，会以空格为分隔符将输入的命令拆分成一个个词元（token）。
如果词元中存在特殊字符，Shell 会先扩展这些特殊字符。扩展完成后，Shell 才会把命令
交给系统执行。需要注意，**扩展是由 Shell 负责的，与所执行的命令无关**。命令本身
并不扩展参数，收到什么参数就原样执行。

例如，用户在终端键入 `cd ~` 后，Shell 先将该命令拆分成 `cd` 和 `~` 两个词元，
然后把 `~` 这个特殊字符扩展成用户的家目录路径（如 `/home/seismo-learn`），
最后交给系统执行，即 `cd /home/seismo-learn`。系统执行完命令后，用户所在目
录就切换到家目录下了。

:::{note}
本文只介绍 Shell 扩展的一些常见用法，可以参考
[Bash 的模式扩展](https://wangdoc.com/bash/expansion.html#startend-%E6%89%A9%E5%B1%95)
学习详细用法。

在网络上的部分教程或文档中，Shell 扩展（expansion）也被称为模式匹配（pattern matching）
或通配符（wildcards 或 globbing）。通常来说，这些名词指代的都是这一节所介绍的内容。
:::

下表中列出了 Shell 中最常用的扩展字符：

| 扩展字符 | 作用 | 示例 |
|:---|:---|:---|
| ~               | 匹配当前用户的家目录                     | 例如 /home/seismo-learn |
| ?               | 匹配任意单个字符（不能匹配零个字符）     | ?.txt 匹配 a.txt、b.txt 等文件名 |
| \*              | 匹配任意数量字符（能匹配零个字符）       | \*.txt 匹配 a.txt、b.txt、ab.txt 等文件名 |
| [...]           | 匹配方括号中的任意一个字符               | [abc].txt 匹配 a.txt、b.txt 以及 c.txt 文件名 |
| [*start*-*end*] | 方括号扩展的简写模式，匹配一个连续的范围 | [a-z] 表示所有小写字母，[0-9] 等同于 [0123456789] |
| [^...]          | 匹配不在方括号里面的任意一个字符         | [^ab]c.txt 匹配 cc.txt、dc.txt 等文件名 |

### 字符 `?` 扩展

字符 `?` 可以匹配任意**单个**字符。

假如当前目录下有 {file}`filea.txt`、{file}`fileb.txt` 和 {file}`fileab.txt` 三个文件。
在命令中使用 `file?.txt` 时，Shell 会对 `file?.txt` 进行扩展。由于字符 `?` 可以
匹配任意单个字符，因而 `file?.txt` 会匹配到文件 {file}`filea.txt` 和 {file}`fileb.txt`：
```
$ ls file?.txt
filea.txt fileb.txt
```
同理，`file??.txt` 可以匹配文件 {file}`fileab.txt`：
```
$ ls file??.txt
fileab.txt
```

### 字符 `*` 扩展

字符 `*` 可以匹配任意数量（零个或多个）的任意字符。

假如当前目录下有 {file}`filea.txt`、{file}`fileb.txt` 和 {file}`fileab.txt` 三个文件。
使用 `*.txt` 可以匹配所有以 `.txt` 结尾的文件：
```
$ ls *.txt
filea.txt fileb.txt fileab.txt
```

使用 `filea*.txt` 可以匹配到以 `filea` 开头并以 `.txt` 结尾的文件：
```
$ ls filea*.txt
filea.txt fileab.txt
```

使用 `*b*` 可以匹配文件名中包括字符 `b` 的文件：
```
$ ls *b*
fileb.txt fileab.txt
```

### 方括号 `[...]` 扩展

方括号 `[...]` 可以用于匹配方括号内的任意单个字符。

假如当前目录下有 {file}`filea.txt`、{file}`fileb.txt` 和 {file}`filec.txt` 三个文件。
使用 `file[ab].txt` 则会匹配到 {file}`filea.txt` 和 {file}`fileb.txt` 两个文件：
```
$ ls file[ab].txt
filea.txt fileb.txt
```
使用 `file[cd].txt` 则只能匹配到 {file}`filec.txt` 这一个文件：
```
$ ls file[cd].txt
filec.txt
```
方括号里还可以用破折号 `-` 指定连续范围内的多个字符。例如 `[a-z]` 表示从 a 到 z
的所有小写字母，`[A-Z]` 表示从 A 到 Z 的所有大小字母，`[0-9]` 表示数字 0 到 9，
`[a-zA-Z0-9]` 则表示所有字母和数字。例如，使用 `file[a-c].txt` 可以匹配到三个文件：
```
$ ls file[a-c].txt
filea.txt fileb.txt filec.txt
```

### 多种扩展字符的组合

不同的扩展字符组合在一起使用可以实现更复杂的匹配功能。

若当前目录下存在文件 {file}`filea.txt`、{file}`fileaaa.txt`、{file}`filebbb.txt`
和 {file}`fileabc.txt`，则通配符 `file[a-b]b?.txt` 会匹配到 {file}`filebbb.txt`
和 {file}`fileabc.txt` 两个文件：
```
$ ls file[a-b]b?.txt
fileabc.txt filebbb.txt
```

:::{warning}
其他 Shell （如 Zsh, csh, ksh）的扩展语法可能稍微不同，以上示例可能不适用。
:::

## 标准输入输出与重定向

一般情况下，命令从标准输入（stdin）读取输入，并将产生的输出发送到到标准输出（stdout），
默认的标准输入和标准输出都是终端。此外，还有标准错误（stderr），用于输出命令运行的
状态和错误信息，其默认也是终端。一般用 0、1、2 分别表示标准输入、标准输出和标准错误。

在下面的示例中，`echo` 命令从终端（即标准输入）获取了输入 `"Hello World"`，
并将输出 `Hello World` 发送到终端（即标准输出）:

```
# 使用 echo 命令输出 Hello World 到终端
$ echo "Hello World"
Hello World
```

使用重定向，可以修改标准输入、标准输出以及标准错误，以达到从文件中读取输入，以及
输出到文件的目的。

### 标准输出重定向

以 `echo` 命令为例的重定向输出到文件:

```
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
```

### 标准输入重定向

以 `cat` 命令为例的从文件中读取输入:

```
# 键入 cat 命令
$ cat

# 没指定任何参数时，该命令会从标准输入读入数据，即正在等待我们从终端输入中
# 在终端输入 Hello World 并按 Enter 键，最后按 Ctrl + D 结束输入
$ cat
Hello World
Hello World

# 重定向标准输入从 output_file 读如内容
$ cat < output_file
Rewrite it
Append it
```

从文件中读如输入，并输出到文件:

```
# 查看 output_file 文件内容，并输出到 output_file2 文件中
$ cat < output_file > output_file2
$ cat output_file2
Rewrite it
Append it
```

上例子中 `cat` 命令后面直接跟文件名时，跟加 `<` 和文件名，结果一样。

### 标准错误重定向

标准错误可以用 `2>` 和 `2>>` 重定向输出到文件中，数字 2 和 `>` 与 `>>`
之间没有空格:

```
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
```

使用 `2>&1` 可以将标准错误合并到标准输出（注意重定向的顺序非常重要，标准错误的
重定向 `2>&1` 必须总是出现在标准输出重定向之后，否则不起作用）:

```
# 将命令输出和出错信息都写入到 out_err_file 文件中
$ cat out_file > out_err_file 2>&1
cat: out_file: No such file or directory

# 将命令输出和出错信息以追加的形式都写入到 out_err_file 文件中
$ cat out_file >> out_err_file 2>&1
cat: out_file: No such file or directory
cat: out_file: No such file or directory
```

可以使用 `&>` 和 `&>>` 这以精简方法来执行这种联合的重定向:

```
# 将命令输出和出错信息都写入到 out_err_file 文件中
$ cat out_file &> out_err_file
cat: out_file: No such file or directory

# 将命令输出和出错信息以追加的形式都写入到 out_err_file 文件中
$ cat out_file &>> out_err_file
cat: out_file: No such file or directory
cat: out_file: No such file or directory
```

:::{tip}
有时，我们不想要命令的输出结果（标准输出或标准错误）。此时可以将输出重定向到
{file}`/dev/null` 文件。此文件是系统设备，叫做位存储桶，可以接受输入，并且
对输入不做任何处理。例如:

```
$ cat out_file 2> /dev/null
```
:::

### 输入多行字符串

Here 文档（here document）是一种输入多行字符串的方法，格式如下:

```
<< token
text
token
```

它的格式分成开始标记 `<< token`、字符串 `text` 和结束标记 `token`。
开始标记由两个小于号加上 Here 文档的名称（名称可以随意取，通常用 `EOF` 或 `END`）
组成，后面必须是一个换行符。结束标记是单独一行且顶格写的 Here 文档名称，若不顶格，
结束标记不起作用。两者之间就是多行字符串的内容。

```
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
```

## 管道

管道（pipe）操作符 `|` 可以将一个命令的标准输出送至另一个命令的标准输入。
管道不会处理标准错误。

```
# echo 命令输出的 Hello World 被管道操作符交给 wc 命令当作输入来统计字数
$ echo "Hello World" | wc -w
2

# 可以无限多次使用管道。使用 cat 命令将上例的输出重定向写入 pipe.dat 文件中
$ echo "Hello World" | wc -w | cat > pipe.dat
```
