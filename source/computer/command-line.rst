命令行
=======

:本节贡献者: |姚家园|\（作者）、
             |田冬冬|\（审稿）
:最近更新日期: 2021-02-03
:预计花费时间: 10 分钟

----

命令行与图形界面
----------------

地震学日常科研中，大部分时间使用的是命令行界面（CLI：Command Line Interface），
有时也使用图形界面（GUI：Graph User Interface）。命令行基本以操作键盘为主，图形界面
一般同时操作鼠标和键盘。图形界面上手简单，各种常用功能显式可见，但是我们推荐在日常科研中
使用和掌握命令行，原因如下：

- 命令行更加高效。操作键盘比操作鼠标快；图形界面的操作重复的时间成本较高，而直接运行使用
  命令行编写的脚本即可重复之前的操作。
- 命令行有时候是唯一的选择。例如，登录远程服务器时，很少有图形化界面可供使用。
- 图形界面占用更多的系统资源。

近几年，一些图形界面工具发展迅速，有时使用图形界面会更方便。例如，Visual Studio Code
是当前最流行的图形界面编辑器之一，使用其进行编程或编辑文本十分高效。

终端
-----

命令行一般需使用终端（Terminal）输入指令。日常使用的终端更确切的称谓应该是终端模拟器（Terminal Emulator）。
我们可以在桌面或菜单栏中，找到并点击“Terminal”图标启动终端，然后就可以输入各种命令来操作计算机了::

   # 使用 echo（回声）命令输出 Hello World!
   $ echo "Hello World"
   
   # 退出终端
   $ exit
