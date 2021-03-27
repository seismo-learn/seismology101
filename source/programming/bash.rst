Bash 脚本
=========

Bash（全称 **B**\ ourne-\ **A**\ gain **SH**\ ell）是 GNU 开发的一个 Shell，
它是 Bourne Shell 的扩展。Bash 是目前绝大多数 Linux 发行版的默认 Shell。

::

    # 查看本机的 Bash 版本
    $ bash --version
    GNU bash，version 5.0.3(1)-release (x86_64-pc-linux-gnu)

脚本（script）是包含一系列命令的文本文件。解释器（Bash 脚本的解释器即 Bash）读取这个文件，
依次执行里面的所有命令，就好像这些命令直接输入到命令行一样。所有能够在命令行完成的任务，
都能够用脚本完成。脚本的好处是可以重复使用，也可以指定在特定场合自动调用，比如系统启动或
关闭时自动执行脚本。按照 Bash 语法编写的脚本即是 Bash 脚本，本节只是介绍其基本语法，经常
使用 Bash 脚本的读者可以参考 `Bash 脚本教程 <https://wangdoc.com/bash/>`__
学习更全面的语法。

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


流程控制
--------

逻辑运算
^^^^^^^^

条件判断
^^^^^^^^^

for 循环
^^^^^^^^

while 循环
^^^^^^^^^^^


输入输出
--------

