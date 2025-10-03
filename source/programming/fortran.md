# Fortran 语言

- 本节贡献者: {{何星辰}}（作者）、{{田冬冬}}（审稿）
- 最近更新日期: 2025-10-01
- 预计花费时间: 60 分钟

---

# Fortran 语言简介

Fortran（Formula Translation）是世界上第一个高级编程语言，专为科学与工程领域的数值计算而生。它的核心优势在于其卓越的计算性能，能够被编译器高度优化以生成运行速度极快的机器码，尤其擅长处理数组和矩阵运算。现代Fortran标准（Fortran 90 及之后）已引入模块化、面向对象和原生并行计算等特性，使其在保持顶尖性能的同时也具备了现代化的编程能力。

# 简单的 Fortran 源码示例

这里我们使用 Fortran 来进行估算地震震中距，以此来作为 Fortran 科学计算的实例。

由于地震 P 波比 S 波快，因此距离震源越远，两者的到达时间差（ S - P 时）越大。这个时间差可用于估算震中距。对于地壳内的近震，震中距的估算有一个广为使用的经验公式：

$$D \approx t_{S-P} \times 8.0$$

  - **$D$** : 震中距 (km)
  - **$t\_{S-P}$** : S波与P波的到时差 (s)
  - **$8.0$** : 经验常数 (km/s)

使用记事本新建一个`simple_example.f90`的 Fortran 语言文件，编写代码完成后进行保存。

```fortran
! 程序入口
PROGRAM estimate_distance

    ! IMPLICIT NONE 强制所有变量必须声明类型。
    IMPLICIT NONE

    ! 定义双精度实数类型，保证计算精度
    INTEGER, PARAMETER :: dp = KIND(1.0D0)

    ! 使用 PARAMETER 定义经验常数
    REAL(KIND=dp), PARAMETER :: EFFECTIVE_VELOCITY = 8.0_dp

    ! 声明变量
    REAL(KIND=dp) :: s_p_time   ! S-P 到时差 (s)
    REAL(KIND=dp) :: distance   ! 用于存储结果的变量 (km)

    ! S-P 到时差赋值
    s_p_time = 15.5_dp

    ! 执行计算 (语法与C几乎一样)
    distance = s_p_time * EFFECTIVE_VELOCITY

    ! 使用格式化输出打印结果
    ! '(A, F0.2, A)' 是格式描述符，A代表字符串, F0.2代表保留两位小数的浮点数
    PRINT '("S-P Time: ", F0.2, " s")', s_p_time
    PRINT '("Estimated Distance: ", F0.2, " km")', distance

! 程序结尾
END PROGRAM estimate_distance
```

# 编译 Fortran 源码

在编译之前，首先需要安装编译器。而无论是在哪个平台，目前最流行、最通用的 Fortran 编译器是 [GFortran](https://gcc.gnu.org/onlinedocs/)，它是 GCC (GNU Compiler Collection) 的一部分。

  * **Linux (Ubuntu/Debian)**: GFortran 通常需要手动安装。打开终端运行：

    ```bash
    sudo apt update && sudo apt install gfortran
    ```

  * **macOS**: Xcode 命令行工具**不包含** GFortran。推荐的安装方式是使用 [Homebrew](https://brew.sh/) 包管理器。打开“终端” (Terminal) 程序，运行：

    ```bash
    brew install gcc
    ```

    *注意：此命令会安装完整的 GCC 工具套件，其中就包含了 GFortran。*

  * **Windows**: 推荐安装 WSL (Windows Subsystem for Linux) 并使用其中的 Ubuntu 环境，这样操作体验将和 Linux 完全一致（在WSL内运行 `sudo apt install gfortran` 即可）。另一种原生方式是安装 **MinGW-w64** 工具链，通常通过 [MSYS2](https://www.msys2.org/) 来管理会更方便。在 MSYS2 终端中，运行以下命令安装 GFortran：

    ```bash
    pacman -S mingw-w64-x86_64-gcc-fortran
    ```

安装完成后，先进入到`simple_example.f90`文件所在目录，然后运行命令：

```bash
# -o 后紧跟输出文件名
gfortran simple_example.f90 -o simple_example
```

最后，运行生成的`simple_example` (或 `simple_example.exe`) 文件，命令如下：

```bash
./simple_example
```

输出结果将会是：

```
S-P Time: 15.50 s
Estimated Distance: 124.00 km
```

# 复杂的 Fortran 源码示例

接下来，我们将编写一个相对复杂的程序，用于模拟地震波的射线路径与走时。在程序设计上，将算法模型的定义、具体实现以及主程序调用进行模块化分离，以便更好地管理与集成各个功能。

:::{figure} fortran.png
:align: center
:alt: "平面波穿过两个均匀半空间之间的水平界面"
:width: 50%

平面波穿过两个均匀半空间之间的水平界面
引自《[Introduction to Seismology](http://d.cambridge.org/us/universitypress/subjects/earth-and-environmental-science/solid-earth-geophysics/introduction-seismology-3rd-edition?format=HB&isbn=9781316635742)》（第三版）图 4.2。
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

接下来，我们根据上面所介绍的模型与计算方法来编写计算射线的水平距离 $X(P)$ 与传播时间 $T(P)$ 的程序。

首先，新建一个模块文件 `travel_time_mod.f90`。在 Fortran 中，模块 (Module) 同时承担了“接口定义”和“逻辑实现”两种角色。我们将所有的数据结构（TYPE）、函数接口和具体实现都封装在这个模块里。

```fortran
! 此模块定义了速度模型相关的数据结构和计算函数
MODULE travel_time_mod
    IMPLICIT NONE
    PRIVATE ! 默认模块内所有内容为私有

    ! 定义双精度 kind，保证可移植性
    INTEGER, PARAMETER, PUBLIC :: dp = KIND(1.0D0)
    ! 定义支持的最大地层数
    INTEGER, PARAMETER, PUBLIC :: MAX_LAYERS = 10

    ! 地层结构体 (等同于 C 的 struct Layer)
    TYPE, PUBLIC :: Layer
        REAL(KIND=dp) :: thickness_km
        REAL(KIND=dp) :: velocity_kms
    END TYPE Layer

    ! 速度模型结构体
    TYPE, PUBLIC :: VelocityModel
        INTEGER :: num_layers = 0
        TYPE(Layer), DIMENSION(MAX_LAYERS) :: layers
    END TYPE VelocityModel

    ! 结果结构体
    TYPE, PUBLIC :: RayPath
        REAL(KIND=dp) :: time_s = -1.0_dp       ! 总走时 T(p)
        REAL(KIND=dp) :: distance_km = -1.0_dp  ! 总水平距离 X(p)
        INTEGER :: turning_layer = 0            ! 射线发生转折的层 (1-based)
    END TYPE RayPath

    ! 将子程序声明为 PUBLIC
    PUBLIC :: compute_tx_for_ray

CONTAINS ! 模块子程序部分

    ! 子程序：计算射线的走时和距离
    SUBROUTINE compute_tx_for_ray(model, p, result)
        ! 声明输入输出参数
        TYPE(VelocityModel), INTENT(IN)  :: model
        REAL(KIND=dp),       INTENT(IN)  :: p
        TYPE(RayPath),       INTENT(OUT) :: result

        ! 声明局部变量
        INTEGER :: i
        REAL(KIND=dp) :: total_time_sum, total_dist_sum
        REAL(KIND=dp) :: velocity, thickness, slowness, denom_sqrt

        ! 初始化
        total_time_sum = 0.0_dp
        total_dist_sum = 0.0_dp
        result%turning_layer = 0 ! 0 表示无效结果

        ! 遍历模型中的每一层 
        DO i = 1, model%num_layers
            velocity  = model%layers(i)%velocity_kms
            thickness = model%layers(i)%thickness_km
            slowness  = 1.0_dp / velocity

            ! 如果射线参数 p 大于等于当前层的慢度，射线将无法穿透该层
            IF (p >= slowness) THEN
                ! 转折点发生在上一层的底部
                result%turning_layer = i - 1
                EXIT ! 停止向下计算
            END IF

            ! 计算公式 (u^2 - p^2)^1/2 的值
            denom_sqrt = SQRT(slowness**2 - p**2)

            ! 公式 T(p) = 2 * SUM( u^2 * dz / sqrt(u^2-p^2) )
            total_time_sum = total_time_sum + (slowness**2 * thickness) / denom_sqrt

            ! 公式 X(p) = 2p * SUM( dz / sqrt(u^2-p^2) )
            total_dist_sum = total_dist_sum + thickness / denom_sqrt

            ! 如果这是最后一层，说明转折点在这一层内部或更深
            IF (i == model%num_layers) THEN
                result%turning_layer = i
            END IF
        END DO

        ! 如果循环至少执行了一次 (即射线至少进入了第一层)
        IF (result%turning_layer > 0) THEN
            result%time_s      = 2.0_dp * total_time_sum
            result%distance_km = 2.0_dp * p * total_dist_sum
        END IF

    END SUBROUTINE compute_tx_for_ray

END MODULE travel_time_mod
```

最后，新建一个主程序文件 `main.f90`。它通过 `USE` 语句引用 `travel_time_mod` 模块，就可以调用其中定义的公开类型和函数来构建流程并计算最终结果。

```fortran
! 主程序，用于构建速度模型并计算射线路径
PROGRAM main_travel_time
    ! 调用 travel_time_mod 模块
    USE travel_time_mod
    IMPLICIT NONE

    ! 声明变量
    TYPE(VelocityModel) :: textbook_model
    TYPE(RayPath)       :: result
    REAL(KIND=dp)       :: p_ray

    ! 构建3层速度模型
    textbook_model%num_layers = 3
    ! 使用数组构造器初始化地层数组
    textbook_model%layers(1:3) = [ &
        Layer(thickness_km = 3.0_dp, velocity_kms = 4.0_dp), &
        Layer(thickness_km = 3.0_dp, velocity_kms = 6.0_dp), &
        Layer(thickness_km = 3.0_dp, velocity_kms = 8.0_dp)  &
    ]

    ! 定义射线参数 p
    p_ray = 0.15_dp ! s/km

    ! 调用模块中定义的计算子程序
    CALL compute_tx_for_ray(textbook_model, p_ray, result)

    ! 输出结果
    PRINT '("Input ray parameter p = ", F5.3, " s/km")', p_ray
    PRINT * ! 打印一个空行
    PRINT '(" -> Total Distance X(p)  = ", F6.2, " km")', result%distance_km
    PRINT '(" -> Total Travel Time T(p) = ", F6.2, " s")', result%time_s
    PRINT *

END PROGRAM main_travel_time
```

# 编译与链接

目前，我们`travel_time_mod.f90`模块与`main.f90`主函数。由于 `main.f90` 中有 `USE travel_time_mod` 语句，它依赖于 `travel_time_mod.f90`。编译器必须先处理 `travel_time_mod.f90` 来了解模块的接口，然后才能正确编译 `main.f90`。编译命令如下：

```bash
gfortran travel_time_mod.f90 main.f90 -o travel_time_app
```

这是最简单直接的方法，编译器会按照顺序进行编译，最后才进行链接并输出文件。还有一种方法是分步进行编译，最后进行编译。

```bash
gfortran -c travel_time_mod.f90
gfortran -c main.f90
gfortran travel_time_mod.o main.o -o travel_time_app
```

这个命令会生成`travel_time_mod.o`，`travel_time_mod.mod`和`main.o`三个文件。其中`travel_time_mod.mod`是模块的接口文件，它告诉编译器此模块里有哪些类型、变量和函数可供使用。最后，链接器会解析函数调用，并生成最终的、单一的可执行文件 `travel_time_app`。

运行结果如下：

```
Input ray parameter p = 0.150 s/km

 -> Total Distance X(p)  =  16.89 km
 -> Total Travel Time T(p) =   4.17 s
```

# Makefile

在上一节，我们使用了两种方法来编译链接我们的多文件 Fortran 项目。得益于只有两个文件，所以编译很方便快速。但是当文件增多后，每次编译都要手动敲入一长串命令。同时如果我们只修改了 `main.f90`，理论上就只需要重新编译 `main.f90`，而不需要重新编译 `travel_time_mod.f90`。但如果手动操作，就很可能会把所有命令都重跑一遍，浪费大量时间。

而 Makefile 就是为了解决上面的问题而生的。它可以使用 `make` 这个工具来高效、智能地构建我们的项目。

首先，让我们从一个基本的 Makefile 开始，先在之前的项目文件夹（包含 `main.f90`, `travel_time_mod.f90`）中，创建一个名为 `Makefile` 的文件（没有后缀名），并填入以下内容：

```makefile
# 最终目标： travel_time_app
# 它依赖于两个目标文件
travel_time_app: main.o travel_time_mod.o
	gfortran main.o travel_time_mod.o -o travel_time_app

# 编译：如何从 .f90 生成 .o
# main.o 依赖于 main.f90 和 travel_time_mod.o
# (因为 main.f90 USE 了 travel_time_mod 模块，所以模块文件改变，main.f90 也需重编)
# 让 main.o 依赖 travel_time_mod.o 是确保编译顺序的常用技巧
main.o: main.f90 travel_time_mod.o
	gfortran -Wall -c main.f90

# travel_time_mod.o 依赖于 travel_time_mod.f90
travel_time_mod.o: travel_time_mod.f90
	gfortran -Wall -c travel_time_mod.f90

# 清理
# 一键删除生成的中间文件（.o 和 .mod）和最终程序
.PHONY: clean
clean:
	rm -f *.o *.mod travel_time_app
```

上面的 Makefile 看起来非常冗长，这是因为所有文件名和命令都直接固定写在了规则里。对于初学者是很明白的，但是如果项目有增删之类的改动，那么就得手动修改，变得难以维护。所以下面有更高效与通用的一种写法。

这里，我们通常使用变量来组织 Makefile。这会使修改编译器、编译选项等变得非常容易。

```makefile
# 定义编译器 (Fortran Compiler)
FC = gfortran

# 定义编译选项
# -Wall: 开启所有警告
# -g: 添加调试信息
FCFLAGS = -Wall -g

# 定义所有需要的目标文件 (.o 文件)
OBJS = main.o travel_time_mod.o

# 定义最终的可执行文件名
TARGET = travel_time_app

# $@ 是一个自动变量，代表规则中的“目标”
# $^ 是一个自动变量，代表规则中的所有“依赖”
$(TARGET): $(OBJS)
	$(FC) -o $@ $^

# 编译：如何将任意 .f90 文件编译成 .o 文件
# $< 是一个自动变量，代表规则中的第一个“依赖”
%.o: %.f90
	$(FC) $(FCFLAGS) -c $< -o $@

# Fortran 特有的依赖关系：main.o 依赖于模块文件
# 我们可以通过让它依赖模块的 .o 文件来保证编译顺序
main.o: travel_time_mod.o

# 清理
.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET) *.mod
```

这个版本功能完全相同，但更具高效性和可维护性。

-----

有了 `Makefile` 文件后，只需在终端中执行简单的 `make` 命令即可。

```bash
make
```

`make` 会自动读取 `Makefile`，分析文件依赖关系，并执行所有必要的命令来生成最终的 `travel_time_app` 文件。

```bash
make clean
```

这个命令会执行 `clean` 规则下的 `rm` 命令，删除所有生成的目标文件、模块文件和可执行文件，只让项目保留源代码文件。


可以看到。Fortran 的编译方式与 C 类似，这源于 C 编译器借鉴了 Fortran 的编译理论，且 Fortran 后来也融入了由 C 与 UNIX 构建的工具生态系统。不过，两者在特性和应用上仍有区别。Fortran 更贴近数学表达，擅长数组与数值计算，常用于科学与高性能计算；C 则偏向底层，强调内存与指针操作，广泛应用于系统和嵌入式开发。

# 扩展阅读

- [Fortran 语言教程](https://fortran-lang.org/zh_CN/learn/quickstart/) （较全面、系统）

- [Netlib Repository](https://www.netlib.org/)(数值计算软件库)

- [SciFortran](https://github.com/scifortran)(科学计算工具集合)

- [MKL](https://www.intel.com/content/www/us/en/developer/tools/oneapi/onemkl.html)(Intel 高性能数学核心库)

