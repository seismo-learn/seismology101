---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.13.0
kernelspec:
  display_name: C++17     
  language: c++           
  name: xcpp17           
---

# C 语言

- 本节贡献者: [何星辰](https://github.com/Chuan1937)（作者）、[田冬冬](https://me.seisman.info/)（审稿）
- 最近更新日期: 2025-09-24
- 预计花费时间: 10 分钟

---
## C 语言简介

:::{warning}
本节正在编写中。
:::

C 语言是一门强大、高效且应用广泛的过程式编程语言。它由丹尼斯·里奇 (Dennis Ritchie) 于 20 世纪 70 年代初在贝尔实验室 (Bell Labs) 开发，最初用于编写 UNIX 操作系统。对于地震学研究者而言，C语言是一门不可或缺的高性能计算工具。它主要用于快速处理海量的波形数据、运行复杂的数值模拟。

## 简单的 C 源码示例

这里我们使用C来进行估算地震的震中距，以此来作为C科学计算的实例。

由于地震P波比S波快，因此距离震源越远，两者的到达时间差（S-P时）越大。这个时间差可用于估算震中距。对于地壳内的近震，震中距的估算有一个广为使用的经验公式：

$$D \approx t_{S-P} \times 8.0$$

  - **$D$** : 震中距 (km)
  - **$t\_{S-P}$** : S波与P波的到时差 (s)
  - **$8.0$** : 经验常数 (km/s)

使用记事本新建一个`simple_example.c`的C语言文件，编写代码完成后进行保存。
```c
//导入需要的函数库
#include <stdio.h>

// 定义经验常数
#define EFFECTIVE_VELOCITY 8.0

int main() {
    
    // 定义 S-P 到时差为 15.5 秒
    double s_p_time = 15.5; 
    
    // 定义变量用于存储结果
    double distance;
    
    // 执行计算
    distance = s_p_time * EFFECTIVE_VELOCITY;
    
    // 打印输出，.2f 表示保留两位小数
    printf("S-P Time: %.2f s\n", s_p_time);
    printf("Estimated Distance: %.2f km\n", distance);
    
    return 0; 
}
```
## 编译 C 源码
简单来说，编译就是一个“翻译”过程。编写的 C 代码（.c 文件）是人类可以理解的“高级语言”。但是，计算机的中央处理器（CPU）只能理解由 0 和 1 组成的“机器语言”。编译器 (Compiler) 就是一个翻译程序，它读取 C 源码，将其翻译成 CPU 可以直接执行的机器码文件（在 Windows 上是 .exe 文件，在 Linux/macOS 上通常没有后缀）。

**安装编译器**

无论是在哪个平台，都需要先安装C编译器。目前最流行、最通用的 C 编译器是 [GCC](https://gcc.gnu.org/) (GNU Compiler Collection)。

- **Linux (Ubuntu/Debian)**: GCC 通常已预装。如果没有，打开终端运行：

```
sudo apt update && sudo apt install build-essential
```

- **macOS**: 需要安装 Xcode 命令行工具。打开“终端” (Terminal) 程序，运行：
```
xcode-select --install
```

- **Windows**: 推荐安装 WSL (Windows Subsystem for Linux) 并使用其中的 Ubuntu 环境，这样操作体验将和 Linux 完全一致。另一种方式是安装 [MinGW-w64](https://www.mingw-w64.org/)，它为 Windows 提供了 GCC 工具链。


安装完成后，首先打开终端，并用`cd` 命令切换到`simple_example.c`文件所在的目录.

然后，运行以下命令：

```
gcc simple_example.c -o simple_example
```
`-o`表示编译后的输出文件名，执行完后会生成一个名为`simple_example`的文件。

最后通过以下命令运行它：
```
./simple_example
```

结果如下:

```
S-P Time: 15.50 s
Estimated Distance: 124.00 km
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
