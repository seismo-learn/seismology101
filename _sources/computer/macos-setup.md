# macOS 配置指南

- 本节贡献者: {{田冬冬}}、{{姚家园}}、{{何星辰}}、{{王亮}}
- 最近更新日期: 2025-10-12
- 预计花费时间: 120 分钟

---

:::{note}
本节内容基于作者在 macOS Sequoia (15) 上的配置经验，仅适用于 Apple M 系列芯片。
欢迎用户帮助我们更新本文以适配 macOS 最新版本。
:::

## 安装系统

第一次启动 Mac 电脑后，经过简单的设置，就得到了一个可供日常使用的 macOS 系统。

macOS 系统的更新也十分简单。当有新版本发布以后，在“系统偏好设置”的“软件更新”中
直接更新即可。

:::{warning}
更新系统前，特别是大版本更新（如 macOS 14 更新为 macOS 15），
最好先备份一下（可以参考[](/best-practices/backup)）。
:::

:::{note}
本节接下来介绍的大部分软件都通过命令行安装。按下 {kbd}`Command` + {kbd}`空格`，
输入 “Terminal” 并按下 {kbd}`Enter` 键以启动终端，
然后在终端中输入命令并按下 {kbd}`Enter` 键即可执行相应的命令。
:::

## 系统软件

经过简单设置后的 macOS 系统，尚不能满足日常科研与编程开发的需求，还需要做
进一步的配置。

### Command Line Tools for Xcode

[Xcode](https://developer.apple.com/cn/xcode/) 是 macOS 下的集成开发环境（IDE），
类似于 Windows 下的 [Microsoft Visual Studio](https://visualstudio.microsoft.com/)。
Command Line Tools for Xcode 是 Xcode 的一部分，其包含了常用的命令行开发工具，
比如 C/C++ 编译器（`gcc`、`g++`）、`make`、`git` 等，是 macOS 下编程开发的必需软件。

执行如下命令，并在弹出的窗口中点击 “Install” 以安装 Command Line Tools for Xcode:

```
$ xcode-select --install
```

此处安装的 Command Line Tools for Xcode 可能不是最新版。点击桌面左上角的 Apple 图标，
在“系统偏好设置”的“软件更新”中查看是否有相关更新。如果有，则升级到最新版。
macOS 系统更新后，有时需重新安装 Command Line Tools for Xcode，再次执行以上命令即可。

### Homebrew

[Homebrew](https://brew.sh/zh-cn/) 是 macOS 下最流行的第三方软件包管理器。
安装 Homebrew 后，即可通过命令行安装日常与科研工作所需的大多数软件和库文件。

#### 安装 Homebrew

Homebrew 的安装脚本及相关资源托管在 [GitHub](https://github.com/) 上。
国内可能由于网络问题无法访问 GitHub，进而导致无法安装 Homebrew 或安装
其他软件速度太慢。因而，Homebrew 的安装说明分为国内和国外两个版本。
读者应根据自己所处的地理位置使用相应的安装说明。

打开终端，执行如下命令，并根据终端提示进行操作，以安装 Homebrew。
Homebrew 以及通过 Homebrew 安装的所有软件包都会被安装到目录 {file}`/opt/homebrew` 下。
::::{tab-set}
:::{tab-item} 国内用户
配置使用 Homebrew 的中科大镜像源

```
# 将 Homebrew 镜像配置写入 .zshrc 文件
$ echo 'export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"' >> ~/.zshrc
$ echo 'export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"' >> ~/.zshrc
$ echo 'export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"' >> ~/.zshrc
$ echo 'export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"' >> ~/.zshrc

# 刷新配置
$ source ~/.zshrc
```

安装 Homebrew

```
$ /bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
```

国内用户的 Homebrew 安装和配置指南来自于 [USTC Mirror Help](https://mirrors.ustc.edu.cn/help/brew.git.html)。
:::

:::{tab-item} 国外用户
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
:::
::::

安装完成后，需要将 brew 命令的路径添加到配置文件中。

```
# 将 Homebrew 命令路径写入 .zshrc 文件
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc

# 刷新配置
$ source ~/.zshrc
```

#### 使用 Homebrew

安装好 Homebrew 后，即可以使用 Homebrew 提供的 `brew` 命令。
`brew` 的详细用法见[官方文档](https://docs.brew.sh/Manpage)。此处仅列出一些常用的用法:

```
# 模糊搜索与 wget 相关的软件
$ brew search wget

# 安装 wget 软件包
$ brew install wget

# 安装 QQ
$ brew install qq

# 升级某个软件
$ brew upgrade xxx

# 卸载某个软件
$ brew uninstall xxx
```

:::{tip}
Homebrew 用户也可以访问网站 <https://formulae.brew.sh/> 查看和搜索可安装的软件包。
:::

:::{dropdown} Homebrew 相关名词解释
:color: info
:icon: info

使用 Homebrew 时会碰到很多名词。这里做简单解释，
更详细的解释请查看[官方文档](https://docs.brew.sh/Formula-Cookbook#homebrew-terminology)。

`brew`
: Homebrew 提供的命令，用于查询、安装、卸载、升级以及管理软件包。

Formula
: 软件的描述文件，包含了软件的基本信息和编译安装方法。
  Homebrew 根据 Formula 提供的信息，即可编译或安装软件。
  每个软件对应一个 Formula。例如，git 对应的 Formula 是
  ​{file}`/opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/git.rb`。

Bottle
: 预先编译好的二进制软件包。使用 Bottle 安装软件，
  比从源码编译和安装更快。如果一个软件仓库包含预编译的软件包，使用 `brew install`
  时会自动使用它。

Tap
: 一个含有一系列软件的 git 仓库。使用
  [brew tap](https://docs.brew.sh/Taps#the-brew-tap-command)
  命令查看已启用的仓库列表或启用仓库。已启用的仓库位于
  ​{file}`/opt/homebrew/Library/Taps/homebrew` 目录。
  默认启用的软件仓库有 [homebrew-core](https://github.com/Homebrew/homebrew-core)
  和 [homebrew-cask](https://github.com/Homebrew/homebrew-cask)。
  其中，homebrew-core 是内置核心仓库，
  homebrew-cask 仓库则含有各种 macOS 系统下带图形界面的应用程序。

Cellar
: 所有软件的安装目录，即 {file}`/opt/homebrew/Cellar`。

Keg
: 某一软件的安装目录，如 {file}`/opt/homebrew/Cellar/git/2.45.0`。
:::

## 编程开发环境

### C/C++

Command Line Tools for Xcode 已经提供了 C/C++ 编译器和相关工具，因此无需再单独安装 C/C++ 编译器。
需要注意的是，其提供的 C/C++ 编译器实际上是 [Apple Clang](https://clang.llvm.org/)，
而非 [GCC](https://gcc.gnu.org/)（GNU Compiler Collection）。尽管两者存在一定差异，
但 Apple Clang 足以满足大多数科研场景中编译 C/C++ 程序的需求，一般情况下无需再安装 GCC。

:::{note}
若确有需要（例如希望与 Linux 上的 GCC 环境保持一致），可以通过 Homebrew 安装 GCC：
```
$ brew install gcc
```
通过 Homebrew 安装的 GCC 提供了命令 `gcc-15` 和 `g++-15` （`15` 是 GCC 的主版本号）
以避免替换 Command Line Tools for Xcode 提供的 `gcc` 和 `g++` 命令。
用户如果想使用 GCC 编译器，可以在编译代码时显式指定使用 `gcc-15` 和 `g++-15` 命令，
或者在 Homebrew 的 bin 目录下创建软链接:

```
$ cd $(brew --prefix)/bin/
$ ln -s gcc-15 gcc
$ ln -s g++-15 g++
```

打开一个新终端后，使用的 `gcc` 和 `g++` 命令则默认是 GCC 编译器。
删除软链接后，默认使用的又是 Apple Clang 编译器了。
:::

### Fortran

[GNU Fortran](https://gcc.gnu.org/fortran/) 编译器是 macOS 下最常用的 Fortran 编译器，
其提供了 `gfortran` 命令。 GNU Fortran 是 GCC 套件的一部分，因而通过安装 GCC 即可获得
GNU Fortran 编译器：
```
$ brew install gcc
```

### Java

运行 Java 程序需要安装 Java 运行环境，即 OpenJDK:

```
$ brew install openjdk
$ sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk \
  /Library/Java/JavaVirtualMachines/openjdk.jdk
```

### git

[git](https://git-scm.com/) 是目前最流行的版本控制工具，推荐在科研过程中使用
git 管理自己编写的代码和文件。Command Line Tools for Xcode 中已经安装了 Apple 版
的 git，其与原版 git 有一些区别。可以用如下命令安装原版的 git:

```
$ brew install git
```

### GNU 实用工具

macOS 下自带了很多实用工具，如 `sed`、`grep` 等（位于 {file}`/usr/bin/` 目录下）。
需要注意，这些实用工具是由 [BSD](https://www.bsd.org/) 提供的，而 Linux 系统下的
实用工具则是由 [GNU](https://www.gnu.org/) 提供的。
BSD 和 GNU 实用工具的命令行语法有相似之处，但也有差异。
由于网络上的大部分文档介绍的都是 GNU 实用工具的用法，因而 macOS 用户在使用网络上的
命令时可能会出现错误。这一点可以通过安装 GNU 实用工具来解决:

```
# 此处仅安装常用的 GNU 实用工具
$ brew install findutils gawk gnu-sed gnu-tar grep
```

Homebrew 将 GNU 实用工具安装在 {file}`/usr/local/bin` 或 {file}`/opt/homebrew/bin` 目录下，
但在所有工具的名称前加上了前缀 `g`，以避免替换 macOS 系统自带的 BSD 实用工具，即 `sed` 是 BSD 提供的，
而 `gsed` 是 GNU 提供的。一般情况下，建议使用 BSD 工具（无前缀 `g`），
在遇到不兼容的情况下，可以考虑使用 GNU 工具（有前缀 `g`），但在写脚本时，
要额外注意脚本的可移植性。

## 扩展阅读

- [GNU 与 BSD 实用工具的用法区别](https://ponderthebits.com/2017/01/know-your-tools-linux-gnu-vs-mac-bsd-command-line-utilities-grep-strings-sed-and-find/)
