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
