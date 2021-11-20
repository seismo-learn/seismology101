高效率软件
==========

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新日期: 2021-11-20

----

这一节推荐一些可以提高日常效率的软件，供读者参考。

dos2unix & unix2dos
-------------------

Windows 和 Linux/macOS 系统下，`文本文件的换行符 <https://www.ruanyifeng.com/blog/2006/04/post_213.html>`__\ 是不同的。
``dos2unix`` 和 ``unix2dos`` 是可以实现换行符转换的命令行工具。
``dos2unix`` 可以将 Windows 系统下的换行符转换为 Linux/macOS 系统下的换行符，
``unix2dos`` 则反之。

.. tab-set::

    .. tab-item:: Fedora
        :sync: fedora

        ::

            $ sudo dnf install dos2unix

    .. tab-item:: Ubuntu
        :sync: ubuntu

        ::

            $ sudo apt install dos2unix

    .. tab-item:: macOS
        :sync: macos

        ::

            $ brew install dos2unix unix2dos

tldr
----

`tldr <https://tldr.sh/>`__ 是一个提供命令的常用用法和示例的命令行工具，
其功能与 UNIX 下的 ``man`` 命令相似，但其提供的输出更简单、更易读。
使用如下命令安装 ``tldr``：

.. tab-set::

    .. tab-item:: Fedora
        :sync: fedora

        ::

            $ sudo dnf install tldr

    .. tab-item:: Ubuntu
        :sync: ubuntu

        ::

            $ sudo apt install tldr

    .. tab-item:: macOS
        :sync: macos

        ::

            $ brew install tldr

ack
---

`ack <https://beyondgrep.com/>`__ 是一个字符搜索工具，与 ``grep`` 命令类似。
其专为搜索源代码设计，因而在日常编程中更加简单易用。使用如下命令安装 ``ack``。

.. tab-set::

    .. tab-item:: Fedora
        :sync: fedora

        ::

            $ sudo dnf install ack

    .. tab-item:: Ubuntu
        :sync: ubuntu

        ::

            $ sudo apt install ack

    .. tab-item:: macOS
        :sync: macos

        ::

            $ brew install ack


VS Code
-------

Fedora/Ubuntu/macOS 系统自带的文本编辑器只具有最基本的文本编辑功能，无法满足日常编程需求。
推荐安装并使用更强大的文本编辑器 `Visual Studio Code <https://code.visualstudio.com/>`__。
VS Code 的安装与配置见 :doc:`vscode`。
