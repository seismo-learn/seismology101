# C 语言

- 本节贡献者: {{何星辰}}、{{姚家园}}、{{田冬冬}}
- 最近更新日期: 2025-10-11
- 预计花费时间: 60 分钟

---

## C 语言简介

C 语言是一门强大、高效且应用广泛的过程式编程语言。它由丹尼斯·里奇 (Dennis Ritchie) 于 20 世纪 70 年代初在贝尔实验室 (Bell Labs) 开发，最初用于编写 UNIX 操作系统。对于地震学研究者而言，C 语言是一门不可或缺的高性能计算工具。它主要用于快速处理海量的波形数据、运行复杂的数值模拟。

## 简单的 C 源码示例

首先，使用 vscode 新建一个`hello-world.c`的 C 语言文件，编写代码完成后进行保存。

```c
//导入需要的函数库
#include <stdio.h>

int main() {
    
    // 打印输出
    printf("Hello World!\n");
    
    return 0; 
}
```

## 编译 C 源码

打开终端，并用`cd` 命令切换到`hello-world.c`文件所在的目录.

然后，运行以下命令：

```bash
gcc hello-world.c -o hello-world
```

`-o` 表示编译后的输出文件名，执行完后会生成一个名为`hello-world`的文件。

最后通过以下命令运行它：

```bash
./hello-world
```

结果如下:

```
Hello World!
```

## 复杂的 C 源码示例

## 编译与链接

## Makefile

## 扩展阅读

- [C 语言教程](https://wangdoc.com/clang/)
- [C 语言教程](https://www.runoob.com/cprogramming/c-tutorial.html)（较全面、系统）
- [X 分钟速成 C](https://learnxinyminutes.com/docs/zh-cn/c-cn/)（简要）
- [Building programs](https://fortran-lang.org/learn/building_programs)（简要）
- [跟我一起写 Makefile](https://seisman.github.io/how-to-write-makefile/)（较全面、系统）
- [X 分钟速成 make](https://learnxinyminutes.com/docs/zh-cn/make-cn/)（简要）
