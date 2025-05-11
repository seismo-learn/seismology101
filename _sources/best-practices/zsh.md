# Zsh 及其配置

- 本节贡献者: {{田冬冬}}（作者）、{{姚家园}}（作者）
- 最近更新日期: 2021-01-21
- 预计阅读时间: 20 分钟

---

Linux 下有很多 Shell，最常见的是 Bash，此外还有 Zsh、csh、ksh。推荐使用 Zsh。

Zsh 有如下特点：

- 语法基本完全兼容于 Bash，一般用户完全体会不到其区别
- Zsh 提供命令补全特性，比 Bash 的补全要更好用
- 可配置性强

## 安装 Zsh

在终端键入 `zsh --version`，若显示 Zsh 版本号，则表示 Zsh
已安装。否则需要安装 Zsh。

自 macOS Catalina（10.15）开始，macOS 系统默认的 Shell 已由 Bash 变为 Zsh。

Linux 用户可以使用如下命令安装 Zsh：

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install zsh
```
:::

:::{tab-item} CentOS
:sync: centos

```
$ sudo yum install zsh
```
:::

:::{tab-item} Ubuntu/Debian
:sync: ubuntu-debian

```
$ sudo apt install zsh
```
:::
::::

通过如下命令设置默认 Shell 为 Zsh:

```
$ chsh -s $(which zsh)
```

`chsh` 命令修改的是登陆 Shell，因而需要退出当前用户并重新登陆，
用户的默认 Shell 就从 Bash 变成 Zsh 了。打开新的终端并键入
`echo $SHELL`，查看当前 Shell，会显示 {file}`/bin/zsh`。

:::::{dropdown} chsh: command not found 错误
:color: info
:icon: info

若出现 `chsh: command not found` 错误，则需要安装 util-linux-user:

::::{tab-set}

:::{tab-item} Fedora
:sync: fedora

```
$ sudo dnf install util-linux-user
```
:::

:::{tab-item} CentOS
:sync: centos

```
$ sudo yum install util-linux-user
```
:::
::::
:::::

Zsh 的配置文件为 {file}`~/.zshrc`。因而切换到 Zsh 后，
所有的 Shell 配置都不用写到 {file}`~/.bashrc`，而要写到 {file}`~/.zshrc` 中。

## Oh My Zsh

Zsh 稍作配置会更加方便好用。[Oh My Zsh](https://ohmyz.sh/) 是由 Oh My Zsh 社区
维护的一套 Zsh 配置文件，使用起来非常方便。一般用户直接使用该配置即可。

安装 Oh My Zsh:

```
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

该命令会创建 {file}`~/.oh-my-zsh` 目录，下载 Oh My Zsh 到该目录下，生成默认的 Zsh 配置文件
{file}`~/.zshrc`，并备份老的配置到类似 {file}`~/.zshrc.pre-oh-my-zsh` 的文件中。

:::{note}
GitHub 在国内访问不畅，以上安装命令可能会由于网络问题而失败。若以上命令失败，
可直接打开脚本链接 <https://github.com/ohmyzsh/ohmyzsh/blob/master/tools/install.sh>，
复制脚本内容到文本编辑器中（如 Visual Studio Code），保存到本地某目录下
（如 {file}`~/Downloads` 目录）。然后进入该目录，运行脚本即可:

```
$ cd ~/Downloads
$ sh install.sh
```
:::

之后可以根据个人习惯修改配置文件 {file}`~/.zshrc`，如[设置主题](https://github.com/ohmyzsh/ohmyzsh#themes)、[启用插件](https://github.com/ohmyzsh/ohmyzsh#plugins) 等。

### 设置主题

修改配置文件 {file}`~/.zshrc` 中的变量 **ZSH_THEME** 即可使用不同的主题。例如，
可以设置:

```
ZSH_THEME="bira"
```

打开新的终端即可查看主题效果。

Oh My Zsh 自带了很多主题，位于 {file}`~/.oh-my-zsh/themes` 目录下，可以在线[预览主题效果](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)。
用户也可以使用[外部主题](https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes)。

### 启用插件

直接修改配置文件 {file}`~/.zshrc` 中的变量 **plugins** 便可启用插件:

```
plugins=(
  sudo
  extract
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

Oh My Zsh 自带了很多插件，位于 {file}`~/.oh-my-zsh/plugins` 目录下，也可以[在线查询](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview)。
这里推荐几个常用的自带插件。

- [sudo 插件](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)：
  按两下 {kbd}`ESC` 即可在当前命令前加上 `sudo`

- [extract 插件](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract)：
  使用 `x abc.zip` 语法即可解压几乎所有压缩文件，如 `.tar.gz`、`.tar.bz2`、`.zip`、
  `.7z`、`.rar` 等

- [autojump 插件](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autojump)：
  非常智能的目录快速切换工具

  ```
  $ pwd
  /home/seismo-learn
  $ cd Desktop
  $ cd /opt
  $ cd /usr/local

  # 用 j 命令迅速从 /usr/local 跳转到与 des 匹配的目录，这里只有 Desktop 可以匹配
  $ j des
  $ pwd
  /home/seismo-learn/Desktop
  ```

  启用 autojump 插件前，需提前安装 [autojump](https://github.com/wting/autojump):

  ::::{tab-set}

  :::{tab-item} Fedora
  :sync: fedora

  ```
  $ sudo dnf install autojump-zsh
  ```
  :::

  :::{tab-item} CentOS
  :sync: centos

  ```
  $ sudo yum install autojump-zsh
  ```
  :::

  :::{tab-item} Ubuntu/Debian
  :sync: ubuntu-debian

  ```
  # 安装后，还要根据 /usr/share/doc/autojump/README.Debian 里的要求做进一步设置
  $ sudo apt install autojump
  ```
  :::

  :::{tab-item} macOS
  :sync: macos

  ```
  $ brew install autojump
  ```
  :::
  ::::

除了 Oh My Zsh 自带的插件，还可以使用第三方插件，只需提前安装即可。这里推荐几个常用的。

- [zsh-autosuggestions 插件](https://github.com/zsh-users/zsh-autosuggestions)：
  命令自动补全插件，当输入命令的几个字母，它会自动根据历史输入进行自动补全

  ```
  $ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  ```

- [zsh-syntax-highlighting 插件](https://github.com/zsh-users/zsh-syntax-highlighting)：
  高亮 Zsh 可用命令

  ```
  $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  ```

  该插件需要位于配置文件 {file}`~/.zshrc` 中的插件列表的最后一位:

  ```
  plugins=([plugins...] zsh-syntax-highlighting)
  ```

  :::{note}
  某些主题下，一些插件可能无法正常使用。
  :::

## 从 Bash 迁移到 Zsh

Linux 下通常使用 Bash 作为默认 Shell，因而很多软件的配置信息都会写在
Bash 配置文件 `~/.bashrc` 中。将默认 Shell 切换到 Zsh 后，还需要将 Bash
配置文件中的软件配置迁移到 Zsh 中。

由于 Zsh 兼容 Bash 语法，对于大多数软件的配置，都可以直接从 `~/.bashrc`
复制粘贴到 `~/.zshrc` 中。

对于 Anaconda/Miniconda 用户，需要在 Bash 环境中重新执行 `conda` 初始化设置，即:

```
# 进入 bash 环境
$ bash
# 在 bash 环境下执行 conda 初始化
$ conda init zsh
# 返回 zsh 环境
$ exit
```
