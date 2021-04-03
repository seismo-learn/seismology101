Bash 脚本
=========

Bash（全称 **B**\ ourne-\ **A**\ gain **SH**\ ell）是 GNU 开发的一个 Shell，
它是 Bourne Shell 的扩展。Bash 是目前绝大多数 Linux 发行版的默认 Shell。

::

    # 查看本机的 Bash 版本
    $ bash --version
    GNU bash，version 5.0.3(1)-release (x86_64-pc-linux-gnu)

脚本（script）是包含一系列命令的文本文件。解释器（Bash 脚本的解释器即 Bash）读取这个文件，
依次执行里面的所有命令、函数以及表达式等，就好像他们直接输入到命令行一样。所有在命令行执行的操作，
都能够用脚本完成。脚本的好处是可以重复使用，也可以指定在特定场合自动调用（如系统启动或关闭时自动执行脚本）。
按照 Bash 语法编写的脚本即是 Bash 脚本，本节只是介绍其基本语法，经常使用 Bash 脚本的读者可以参考
`Bash 脚本教程 <https://wangdoc.com/bash/>`__ 学习更全面的语法。

Hello World
-----------

让我们运行第一个 Bash 脚本 :file:`hello-world.sh`\ 。

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2

   :download:`hello-world.sh`
   ^^^^^^^^^^^^^^^^^^^^^^^^^^

   .. code-block:: bash

      #!/usr/bin/env bash
      #
      # 输出 Hello world~
      #
   
      # 使用 echo 命令输出 Hello world
      echo Hello world  # 这也是注释
   
      # 每一句指令以换行或分号隔开
      echo Hello; echo world
   
      # 有些命令比较长，写成多行会有利于阅读和编辑
      # 每行结尾加上反斜杠，Bash 会将下一行跟当前行一起解释
      echo Hello world~ \
      This is seismo-learn.

   ---

   运行结果
   ^^^^^^^^

   ::

       $ bash hello-world.sh
       Hello world
       Hello
       world
       Hello world~ This is seismo-learn.

脚本的第一行通常是指定解释器，即这个脚本必须通过什么解释器执行。这一行以 ``#!`` 字符开头，
该字符称为 Shebang，所以这一行就叫做 Shebang 行。``#!`` 后面就是脚本解释器的位置，
二者之间有没有空格都可以。Shebang 行之后的行都是 Bash 脚本的实际代码，其中 # 表示注释，
可以放在行首，也可以放在行尾。

Bash 脚本的解释器一般是 :file:`/bin/bash`。但如果 Bash 解释器不在目录 :file:`/bin`
中，而 Shebang 行却是 :file:`#!/bin/bash`，脚本就无法执行了。所以为了保险起见，一般按照
:file:`hello-world.sh` 中的方式来写 Shebang 行，即使用 ``env`` 命令
（此命令总在 :file:`/usr/bin` 目录中）返回 ``bash`` 可执行文件的位置。Shebang 行不是
必需的，但是建议加上这行::

    # 如果缺少该行，运行脚本时就需要显式地指定解释器
    $ bash hello-world.sh

    # 如果有该行，同时脚本文件具有可执行权限，可以直接调用运行该脚本
    $ ./hello-world.sh

    # 直接点击下载的 hello-world.sh 脚本并没有可执行权限，执行以下命令增加可执行属性
    $ chmod +x hello-world.sh

拥有 Shebang 行和可执行权限的脚本，在调用时还需要指定脚本的路径，如 ``./hello-world.sh``
代表该脚本位于当前目录。如果将脚本放在环境变量 **PATH** 指定的目录中，就不需要指定路径了，
因为 Bash 会自动到这些目录中寻找是否存在同名的可执行文件。可以参考\ :doc:`/computer/environment-variable`\
一节设置环境变量 **PATH**。

数据结构
--------

变量
^^^^^

Shell 变量一般有四种形式：用户自定义变量、环境变量、位置变量和预定义特殊变量。用户创建变量
的时候，变量名必须遵守下面的规则：

- 字母、数字和下划线字符组成
- 第一个字符必须是一个字母或一个下划线，不能是数字
- 不允许出现空格和标点符号

需要注意，Bash 没有数据类型的概念，所有的变量值都是字符串。

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
 
   变量定义
   ^^^^^^^^
 
   .. code:: bash

      # 声明变量 var_1，并赋值 seismo-learn
      # 等号左边是变量名，右边是变量值，等号两边不能有空格
      var_1=seismo-learn

      # 如果变量的值包含空格，则必须将值放在引号中
      var_2="seismo learn"

      # 输出变量 var_1 和 var_2 的值
      # 变量名前加美元符号 $ 即可读取变量的值
      echo $var_1
      echo $var_2

    ---
 
    运行结果
    ^^^^^^^^
 
    ::
 
        seismo-learn
        seismo learn

.. dropdown:: :fa:`exclamation-circle,mr-1` 变量读取
   :container: + shadow
   :title: bg-info text-white font-weight-bold 

   读取变量的时候，变量名也可以使用花括号 {} 包围，比如 ``$var_1`` 也可以写成 ``${var_1}``。
   这种写法可以用于变量名与其他字符连用的情况。

   .. panels::
      :container: container-lg pb-3
      :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
   
      变量读取
      ^^^^^^^^
   
      .. code:: bash
  
         var_1=seism
         echo ${a}_learn
   
      ---
   
      运行结果
      ^^^^^^^^

      ::
   
          seism_learn

   如果变量值包含连续空格（或制表符和换行符），最好放在双引号里面读取。

   .. panels::
      :container: container-lg pb-3
      :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
   
      变量读取
      ^^^^^^^^
   
      .. code:: bash
  
         # 变量 var_1 包含了两个连续空格
         var_1="seis101 seis  software"

         # 直接读取，Bash 会将连续空格合并成一个
         echo $a
         # 放在双引号里面读取，才能保持原来的格式
         echo "$a"

      ---
   
      运行结果
      ^^^^^^^^

      ::
   
          seis101 seis software
          seis101 seis  software

.. dropdown:: :fa:`exclamation-circle,mr-1` 引号和转义
   :container: + shadow
   :title: bg-info text-white font-weight-bold 

   Bash 只有一种数据类型，就是字符串。不管用户输入什么数据，Bash 都视为字符串。因此，
   字符串相关的引号和转义，对 Bash 来说就非常重要。可以参考\ `引号和转义 <https://wangdoc.com/bash/quotation.html>`__\
   学习更多引号和转义用法。

数组
^^^^

数组（array）是一个包含多个值的变量。数组元素的编号从 0 开始，数量没有上限，也没有要求元素
被连续索引。

.. panels::
    :container: container-lg pb-3
    :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
  
    创建和读取数组
    ^^^^^^^^^^^^^
  
    .. code:: bash
 
       # 创建名为 seismo_learn1 的数组，并赋值
       seismo_learn1[0]=seismology101
       seismo_learn1[1]=seismology
       seismo_learn1[2]=software
 
       # 也可以采用一次性赋值的方式创建
       seismo_learn2=(seismology101 seismology software)
       # 等同于
       seismo_learn3=(
           seismology101
           seismology
           software
       )
 
       # 显示数组 seismo_learn1 的第一个和第三个元素
       echo ${seismo_learn1[0]} ${seismo_learn1[2]}
       
       # 显示数组 seismo_learn3 的所有元素
       echo ${seismo_learn3[@]}

     ---
  
     运行结果
     ^^^^^^^^
  
     ::
  
         seismology101 software
         seismology101 seismology software


算术运算
--------

使用 ``((...))`` 语法可以进行\ **整数**\ 的算术运算和赋值。输入必须是整数，结果为非整数时也会
截断为整数。``((...))`` 语法会自动忽略内部的空格，所以运算数、运算符、等号之间有没有空格都可以。

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
 
   赋值和读取运算结果
   ^^^^^^^^^^^^^^^
 
   .. code:: bash
   
      # 以下语法不返回算术运算的结果
      ((2 + 2))  # 加法运算
      echo $?  # 结果不是 0 时，环境变量 $? 为 0
      ((2 - 2))  # 减法运算
      echo $?  # 结果为 0 时，环境变量 $? 为 1

      # 使用以下方式可以读取算术运算的结果
      ((add1 = 2 + 2))  # 直接将结果赋值给 add1 变量
      add2=$((2 + 3))  # 用 $ 读取结果，并赋值给 add2 变量
      echo $add1 $add2
      echo $((2 + 4))  # 直接输出结果

   ---

   运行结果
   ^^^^^^^^
  
   ::

       0
       1
       4 5
       6

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
 
   支持的算术运算符
   ^^^^^^^^^^^^^^

   .. code:: bash

      echo 加法: $((1 + 1))
      echo 减法: $((2 - 1))
      echo 乘法: $((2 * 1))
      echo 除法（整除）: $((5 / 2)) $((-1 / 2))
      echo 余数: $((5 % 2))
      echo 指数: $((2**3))
      
      i=1; echo 自增后缀: $i $((i++)) $i  # 先返回值后自增
      i=1; echo 自增前缀: $i $((++i)) $i  # 先自增后返回值
      i=1; echo 自减后缀: $i $((i--)) $i  # 先返回值后自减
      i=1; echo 自减前缀: $i $((--i)) $i  # 先自减后返回值

    ---

    运行结果
    ^^^^^^^^

    ::

        加法: 2
        减法: 1
        乘法: 2
        除法: 2 0
        余数: 1
        指数: 8
        自增后缀: 1 1 2
        自增前缀: 1 2 2
        自减后缀: 1 1 0
        自减前缀: 1 0 0

流程控制
--------

逻辑运算
^^^^^^^^

Bash 常用 ``test`` 命令进行逻辑运算，其有三种等价形式：``test 条件表达式``\ 、\ ``[ 条件表达式 ]``\ 、
``[[ 条件表达式 ]]``\ 。第三种形式支持正则判断式，前两种不支持，常用第二种形式。
需要注意，第二种和第三种形式里的方括号（\ **[** **]**\ ）与内部表达式之间必须有空格。

``test`` 命令支持多种条件表达式，如文件状态判断、字符串比较、整数数值比较、正则表达式判断等。
表达式的真伪与 ``test`` 命令返回值的关系如下：

- 当表达式为真时，``test`` 命令执行成功，返回值为 0
- 当表达式为伪时，``test`` 命令执行失败，返回值为 1

可以参考 `Bash 脚本教程：判断表达式 <https://wangdoc.com/bash/condition.html#%E5%88%A4%E6%96%AD%E8%A1%A8%E8%BE%BE%E5%BC%8F>`__
了解条件表达式的详细语法和实例。以下仅使用 ``[ 条件表达式 ]`` 形式展示文件状态判断、字符串比较、
整数数值比较这三种条件表达式的简单例子。

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
 
   文件状态判断
   ^^^^^^^^^^^^^
 
   .. code:: bash

      # 若 /etc/hosts 存在并且是一个普通文件，则表达式为真
      [ -f /etc/hosts ]
      # 查看环境变量 $?（前一个命令返回值）
      # 返回值为 0 表示命令执行成功；非 0 表示执行失败
      echo $?

      # 查看 /etc/hostssss 是否存在且是一个普通文件
      [ -f /etc/hostssss ]; echo $?

      # 若 /etc 存在并且是一个目录，则表达式为真
      [ -d /etc ]; echo $?

    ---
 
    运行结果
    ^^^^^^^^
 
    ::
 
        0
        1
        0

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
 
   字符串比较
   ^^^^^^^^^^
 
   .. code:: bash

      # 若 string1 变量不为空（长度大于 0），则表达式为真
      string1=seismo-learn
      [ "$string1" ]; echo $?

      # 若 string1 和 string2 相同，则表达式为真
      # 以下方法与 [ "$string1" == "$string2" ] 等价
      string2=seismo
      [ "$string1" = "$string2" ]; echo $?

      # 若 string1 和 string2 不同，则表达式为真
      [ "$string1" != "$string2" ]; echo $?

    ---
 
    运行结果
    ^^^^^^^^
 
    ::
 
        0
        1
        0

.. panels::
   :container: container-lg pb-3
   :column: col-lg-6 col-md-6 col-sm-6 col-xs-6 p-2
 
   整数数值比较
   ^^^^^^^^^^^
 
   .. code:: bash

      integer1=1
      integer2=2
      # 若 integer1 等于 integer2，则表达式为真
      [ $integer1 -eq $integer2 ]; echo $?
      # 若 integer1 不等于 integer2，则表达式为真
      [ $integer1 -ne $integer2 ]; echo $?
      # 若 integer1 小于或等于 integer2，则表达式为真
      [ $integer1 -le $integer2 ]; echo $?
      # 若 integer1 小于 integer2，则表达式为真
      [ $integer1 -lt $integer2 ]; echo $?
      # 若 integer1 大于或等于 integer2，则表达式为真
      [ $integer1 -ge $integer2 ]; echo $?
      # 若 integer1 大于 integer2，则表达式为真
      [ $integer1 -gt $integer2 ]; echo $?

    ---
 
    运行结果
    ^^^^^^^^
 
    ::
 
        1
        0
        0
        0
        1
        1

if 条件判断
^^^^^^^^^^^

for 循环
^^^^^^^^

while 循环
^^^^^^^^^^^


输入输出
--------

