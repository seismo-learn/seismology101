# 高效率软件

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（作者）
- 最近更新日期: 2021-11-20
- 预计阅读时间: 10 分钟

---

这一节推荐一些可以提高日常效率的软件，供读者参考。

## dos2unix & unix2dos

Windows 和 Linux/macOS 系统下，[文本文件的换行符](https://www.ruanyifeng.com/blog/2006/04/post_213.html)是不同的。
`dos2unix` 和 `unix2dos` 是可以实现换行符转换的命令行工具。
`dos2unix` 可以将 Windows 系统下的换行符转换为 Linux/macOS 系统下的换行符，
`unix2dos` 则反之。

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install dos2unix
```
:::

:::{tab-item} Ubuntu
:sync: ubuntu

```
$ sudo apt install dos2unix
```
:::

:::{tab-item} macOS
:sync: macos

```
$ brew install dos2unix unix2dos
```
:::
::::

## tldr

[tldr](https://tldr.sh/) 是一个提供命令的常用用法和示例的命令行工具，
其功能与 UNIX 下的 `man` 命令相似，但其提供的输出更简单、更易读。
使用如下命令安装 `tldr`：

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install tldr
```
:::

:::{tab-item} Ubuntu
:sync: ubuntu

```
$ sudo apt install tldr
```
:::

:::{tab-item} macOS
:sync: macos

```
$ brew install tldr
```
:::
::::

## ack

[ack](https://beyondgrep.com/) 是一个字符搜索工具，与 `grep` 命令类似。
其专为搜索源代码设计，因而在日常编程中更加简单易用。使用如下命令安装 `ack`。

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install ack
```
:::

:::{tab-item} Ubuntu
:sync: ubuntu

```
$ sudo apt install ack
```
:::

:::{tab-item} macOS
:sync: macos

```
$ brew install ack
```
:::
::::

## 解压软件

Fedora/Ubuntu/macOS 系统自带的压缩解压工具可以识别并打开 Linux 下的常见压缩格式
（如 `.tar.gz`、`.tar.bz2` 等），也支持 Windows 和 macOS 下的常见压缩格式
（如 `.zip` 和 `.7z`），但默认不支持 `.rar` 格式。
推荐安装解压软件 [The Unarchiver](https://theunarchiver.com/)，其支持几乎
所有压缩格式。安装后即可通过双击直接解压 `.rar` 文件。

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install unar
```
:::

:::{tab-item} Ubuntu
:sync: ubuntu

```
$ sudo apt install unar
```
:::

:::{tab-item} macOS
:sync: macos

```
$ brew install --cask the-unarchiver
```
:::
::::

### 终端

Fedora/Ubuntu/macOS 自带了终端模拟器 Terminal，使用起来中规中矩。
日常科研经常需要开好几个终端，切换和管理起来比较麻烦。

Linux 下的 [Terminator](https://gnome-terminator.org/) 和
macOS 下的 [iTerm2](https://iterm2.com/) 相比于自带 Terminal 具有更多的功能，
比如支持水平和垂直分割窗格以及终端快速切换。

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install terminator
```
:::

:::{tab-item} Ubuntu
:sync: ubuntu

```
$ sudo apt install terminator
```
:::

:::{tab-item} macOS
:sync: macos

```
$ brew install --cask iterm2
```
:::
::::
