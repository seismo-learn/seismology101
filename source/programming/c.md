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


C 语言是一门强大、高效且应用广泛的过程式编程语言。它由丹尼斯·里奇 (Dennis Ritchie) 于 20 世纪 70 年代初在贝尔实验室 (Bell Labs) 开发，最初用于编写 UNIX 操作系统。对于地震学研究者而言，C语言是一门不可或缺的高性能计算工具。它主要用于快速处理海量的波形数据、运行复杂的数值模拟。

## 简单的 C 源码示例

这里我们使用C来进行估算地震震中距，以此来作为C科学计算的实例。

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

接下来，我们将编写一个相对复杂的程序，用于模拟地震波的射线路径与走时。在程序设计上，将算法模型的定义、具体实现以及主程序调用进行模块化分离，以便更好地管理与集成各个功能。


:::{figure} c.png
:align: center
:alt: "平面波穿过两个均匀半空间之间的水平界面"
:width: 50%

平面波穿过两个均匀半空间之间的水平界面
引自《[Introduction to Seismology]》（第三版）图 4.2。
:::

在地震学研究中，地球常被理想化为由若干水平均匀的速度层叠加而成，且速度随深度逐渐增大。地震波在这种层状介质中传播时，会在各层界面发生折射，$\theta$不断变大，传播方向逐步趋向水平。随着速度的不断增加，入射角 $\theta$ 会逐渐逼近 $90^\circ$，最终使射线转为近似水平的传播路径。


根据**斯涅尔定律**，定义射线参数 $p$：

$$
p = \frac{\sin\theta_i}{V_i} = u_i \sin\theta_i, \quad u_i = \tfrac{1}{V_i},
$$

其在整个传播路径中保持不变。由此可得，对于满足慢度$u_i > p$ 的各层，可以逐层累加得到射线的水平距离$X(P)$与传播时间$T(P)$：

$$
X(p) = 2p \sum_i \frac{\Delta z_i}{\sqrt{u_i^2 - p^2}}, \qquad
T(p) = 2 \sum_i \frac{u_i^2 \Delta z_i}{\sqrt{u_i^2 - p^2}}.
$$

接下来，我们根据上面所介绍的模型与计算方法来编写计算射线的水平距离$X(P)$与传播时间$T(P)$的程序。

首先，新建一个`travel_time.h`头文件，里面定义了`Layer`, `VelocityModel`等结构体和可供调用的函数。但它本身不包含任何计算逻辑，仅供其他文件调用。

```c
#ifndef TRAVEL_TIME_H
#define TRAVEL_TIME_H

#define MAX_LAYERS 10 // 定义支持的最大地层数

// 地层结构体
typedef struct {
    double thickness_km;
    double velocity_kms;
} Layer;

// 速度模型结构体，可以包含多个地层
typedef struct {
    int num_layers;
    Layer layers[MAX_LAYERS];
} VelocityModel;

// 结果结构体，返回计算出的T和X
typedef struct {
    double time_s;      // 总走时 T(p)
    double distance_km; // 总水平距离 X(p)
    int turning_layer;  // 射线发生转折的层
} RayPath;

//可供调用的函数接口
RayPath compute_tx_for_ray(const VelocityModel* model, double p);

#endif // TRAVEL_TIME_H
```

然后新建一个`travel_time.c`文件，这里面实现了头文件中声明的函数。包含程序的计算，可以封装复杂算法。

```c
#include <math.h>
#include <stdio.h> 
#include "travel_time.h"

//头文件中函数的具体实现
RayPath compute_tx_for_ray(const VelocityModel* model, double p) {
    RayPath result = {-1.0, -1.0, -1}; // 初始化为无效结果
    double total_time_sum = 0;
    double total_dist_sum = 0;
    
    // 遍历模型中的每一层
    for (int i = 0; i < model->num_layers; ++i) {
        double velocity = model->layers[i].velocity_kms;
        double thickness = model->layers[i].thickness_km;
        double slowness = 1.0 / velocity;

        // 如果射线参数p大于等于当前层的慢度，射线将无法穿透该层
        if (p >= slowness) {
            result.turning_layer = i - 1; 
            break; // 停止向下计算
        }
      
        // 计算公式 (u^2 - p^2)^1/2 的值
        double denom_sqrt = sqrt(pow(slowness, 2) - pow(p, 2));

        // 公式 T(p) = 2 * SUM( u^2 * dz / sqrt(u^2-p^2) )
        total_time_sum += (pow(slowness, 2) * thickness) / denom_sqrt;
        
        // 公式 X(p) = 2p * SUM( dz / sqrt(u^2-p^2) )
        total_dist_sum += thickness / denom_sqrt;
        
        // 如果这是最后一层，说明转折点在这一层内部或更深
        if (i == model->num_layers - 1) {
            result.turning_layer = i;
        }
    }

    // 如果循环至少执行了一次 (即射线至少进入了第一层)
    if (result.turning_layer >= 0) {
        result.time_s = 2.0 * total_time_sum;
        result.distance_km = 2.0 * p * total_dist_sum;
    }
    
    return result;
}
```

最后则是新建一个`main.c`，可以在这里面构建整体流程，只需要引用头文件`travel_time.h`就可以计算定义的速度模型的最后结果。

```c
#include <stdio.h>
#include "travel_time.h"

int main() {
    // 构建3层速度模型
    VelocityModel textbook_model;
    textbook_model.num_layers = 3;
    textbook_model.layers[0] = (Layer){ .thickness_km = 3.0, .velocity_kms = 4.0 };
    textbook_model.layers[1] = (Layer){ .thickness_km = 3.0, .velocity_kms = 6.0 };
    textbook_model.layers[2] = (Layer){ .thickness_km = 3.0, .velocity_kms = 8.0 };

    // 定义射线参数 p 
    double p_ray = 0.15; // s/km
    
    //调用定义的计算函数
    RayPath result = compute_tx_for_ray(&textbook_model, p_ray);
    
    // 输出结果
    printf("Input ray parameter p = %.3f s/km\n\n", p_ray);
    printf(" -> Total Distance X(p)  = %.2f km\n", result.distance_km);
    printf(" -> Total Travel Time T(p) = %.2f s\n\n", result.time_s);

    return 0;
}
```

## 编译与链接
在完成代码编写后，我们将它们组合成一个可执行程序。此部分的编译与上面一节中编译C源码一样，但不同的是这里有两个.c文件，所以在编译的同时我们需要将他们进行链接，不然单独编译`main.c`会导致其运行时不能找到`travel_time.c`里面的计算代码而报错。同时，如果使用了一些外部库的话，也需要在链接选项后添加`-l`，例如此处使用了`Math Library`,所以需要加上`-lm`。

 这里有两种方法，一种是先进行编译，然后才链接。另一种是直接编译与链接同步进行。

- 方法一
```bash
# 编译 main.c，生成 main.o
gcc -Wall -c main.c

# 编译 travel_time.c，生成 travel_time.o
gcc -Wall -c travel_time.c
```
执行后，文件夹里会多出 main.o 和 travel_time.o 这两个文件,但还不能独立运行。下面需要将他们链接在一起。

```bash
# 将所有 .o 文件链接起来，并指定输出文件名tx_calculator
gcc main.o travel_time.o -o tx_calculator -lm
```
现在就得到了一个名为 tx_calculator 的完整可执行文件，可以通过` ./tx_calculator` 运行。

- 方法二

通常，`gcc` 可以将上述两步合并成一条命令.
```bash
gcc -Wall main.c travel_time.c -o tx_calculator -lm
```
虽然这条命令看起来是一步，但 GCC 在后台仍然是先分别编译每个 .c 文件，然后再将生成的目标文件链接起来。

最后运行结果如下：
```
Input ray parameter p = 0.150 s/km

 -> Total Distance X(p)  = 16.89 km
 -> Total Travel Time T(p) = 4.17 s
```

最后，如果在大型项目中，如果只修改了一个 .c 文件，你只需重新编译那一个文件，然后重新链接所有 .o 文件即可，便可比重新编译所有文件节约时间。
## Makefile


在上一节，我们使用了两种方法来编译链接我们的多文件项目。得益于只有两个文件，所以编译很方便快速。但是当文件增多后，每次编译都要手动敲入一长串命令。同时如果我们只修改了 `main.c`，其那就只需要编译 `main.c`，而不需要重新编译 `travel_time.c`。但如果手动操作，就很可能会把所有命令都重跑一遍，浪费大量时间。

而Makefile就是为了解决上面的问题而生的。它可以使用 `make` 这个工具来高效、智能地构建我们的项目。

首先，让我们从一个一个基本的 Makefile开始，先在之前的项目文件夹（包含 `main.c`, `travel_time.c`, `travel_time.h`）中，创建一个名为 `Makefile` 的文件（没有后缀名），并填入以下内容：

```makefile

# 最终目标：可执行文件 tx_calculator
# 它依赖于两个目标文件 .o
tx_calculator: main.o travel_time.o
	gcc main.o travel_time.o -o tx_calculator -lm

# 编译：如何从 .c 生成 .o
# main.o 依赖于 main.c 和 travel_time.h
# (因为 main.c 包含了 travel_time.h，所以头文件改变，main.c 也需重编)
main.o: main.c travel_time.h
	gcc -Wall -c main.c

# travel_time.o 依赖于 travel_time.c 和 travel_time.h
travel_time.o: travel_time.c travel_time.h
	gcc -Wall -c travel_time.c

# 清理
# 一键删除生成的中间文件，最后只剩源码
.PHONY: clean
clean:
	rm -f *.o tx_calculator
```
上面的makefile看起来非常冗长，这是因为所有文件名和命令都直接固定写在了规则里。对于初学者是很明白的，但是如果项目有增删之类的改动，那么就得手动修改，变得难以维护。所以下面有更高效与通用的一种写法。

---
这里，我们通常使用变量来组织 Makefile。这会使修改编译器、编译选项等变得非常容易。


```makefile

# 定义编译器
CC = gcc

# 定义编译选项
# -Wall: 开启所有警告
# -g: 添加调试信息
CFLAGS = -Wall -g

# 定义链接选项
LDFLAGS = -lm

# 定义所有需要的目标文件 (.o 文件)
OBJS = main.o travel_time.o

# 定义最终的可执行文件名
TARGET = tx_calculator


# $@ 是一个自动变量，代表规则中的“目标”
# $^ 是一个自动变量，代表规则中的所有“依赖”
$(TARGET): $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS)

# 编译：如何将任意 .c 文件编译成 .o 文件
# $< 是一个自动变量，代表规则中的第一个“依赖”
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 清理
.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET)
```

这个版本功能完全相同，但更具高效性和可维护性。

-----

有了 `Makefile` 文件后，只需在终端中执行简单的 `make` 命令即可。

```bash
make
```
`make` 会自动读取 `Makefile`，分析文件依赖关系，并执行所有必要的命令来生成最终的 `tx_calculator` 文件。


```bash
make clean
```

这个命令会执行 `clean` 规则下的 `rm` 命令，删除所有生成的目标文件和可执行文件，只让项目保留源代码文件



## 扩展阅读

- [C 语言教程](https://wangdoc.com/clang/)
- [C 语言教程](https://www.runoob.com/cprogramming/c-tutorial.html)（较全面、系统）
- [X 分钟速成 C](https://learnxinyminutes.com/docs/zh-cn/c-cn/)（简要）
- [Building programs](https://fortran-lang.org/learn/building_programs)（简要）
- [跟我一起写 Makefile](https://seisman.github.io/how-to-write-makefile/)（较全面、系统）
- [X 分钟速成 make](https://learnxinyminutes.com/docs/zh-cn/make-cn/)（简要）
