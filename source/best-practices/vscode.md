# VS Code 使用教程

- 本节贡献者: {{姚家园}}（作者）、{{田冬冬}}（审稿）
- 最近更新日期: 2021-09-28
- 预计花费时间: 30 分钟

---

:::{warning}
本节正在编写中，尚未完成。
:::

## 安装中文语言包

VS Code 的界面默认显示语言是英文，可以安装中文语言包。点击菜单栏“查看”后选择
“命令面板”（快捷键：{kbd}`Ctrl` + {kbd}`Shift` + {kbd}`p`），接着输入
“configure display language”并按 {kbd}`Enter` 键，然后选择“安装其他语言”。
这时界面会跳转到插件商店并自动搜索其他语言，一般第一个就是中文，
即 “Chinese (Simplified) Language Pack for Visual Studio Code”，点击安装就行了。
安装完之后自动重启，界面就变成中文了。

## 连接远程计算机

编辑远程计算机文件的传统方法是先使用 ssh 命令登录到远程计算机，然后在远程计算机中
使用 vim 编辑器编辑文件。

现在，我们可以借助 VS Code 扩展包 Remote - SSH，使用 VS Code 编辑远程文件，
这极大地提高编辑效率。这里简要介绍如何安装和使用该扩展包，可以参考 VS Code
官方文档 [ssh](https://code.visualstudio.com/docs/remote/ssh) 了解详细用法。

1. 安装 Remote - SSH 扩展包

   在“扩展”中，搜索“Remote - SSH”，点击安装。

   安装完之后，左下角导航栏会多一个类似 `><` 的远程连接图标。之后可以通过
   点击该图标来使用该扩展包。

2. 配置远程计算机的 SSH 主机

   一般情况下，远程计算机已安装 SSH 服务器，本地计算机已安装 SSH 客户端。
   我们还需要配置基于密钥的认证，这也是 VS Code 官方推荐的认证方式。以下
   命令假设本地和远程计算机都是 Linux 或 macOS 系统，远程计算机的 IP 地址是
   192.168.1.100，用户在远程计算机中的用户名是 seismo-learn。
   可以参考 [SSH 教程：SSH 密钥登录](https://wangdoc.com/ssh/key.html)
   进一步学习更详细的配置过程。

   本地计算机下，运行以下命令生成 SSH 密钥:

   ```
   $ ssh-keygen -t rsa -f ~/.ssh/id_rsa-remote-ssh
   ```

   该命令产生的一对 SSH 密钥分别位于 {file}`~/.ssh/id_rsa-remote-ssh` 和
   {file}`~/.ssh/id_rsa-remote-ssh.pub` 文件中。
   前者是私钥文件，不能泄露；后者是公钥文件，需要告诉远程计算机。

   运行以下命令将公钥复制到远程计算机中（需用户输入远程计算机的密码）:

   ```
   $ ssh-copy-id -i ~/.ssh/id_rsa-remote-ssh.pub seismo-learn@192.168.1.100
   ```

   该命令会把本地的公钥以追加的方式复制到远程计算机的 {file}`~/.ssh/authorized_keys`
   文件中，并给远程计算机中的用户家目录、{file}`~/.ssh` 目录以及 {file}`~/.ssh/authorized_keys`
   设置合适的权限。若远程计算机或本地计算机是 Windows 系统，请参考
   [Quick start: Using SSH keys](https://code.visualstudio.com/docs/remote/troubleshooting#_quick-start-using-ssh-keys)
   进行配置。

   在终端中输入以下命令，验证是否配置是否成功（即可以登录远程计算机）:

   ```
   $ ssh seismo-learn@192.168.1.100
   ```

3. 编辑远程文件

   点击左下角的远程连接图标，选择“Remote-SSH: Connect to Host”，输入
   <mailto:seismo-learn@192.168.1.100> 便可使用 VS Code 编辑远程计算机中的文件了。

4. 退出远程连接

   文件编辑完毕后，选择菜单栏“文件”中的“关闭远程连接”，或者直接关闭 VS Code，
   就可以退出远程连接。

:::{tip}
如果需要经常连接远程计算机，可以使用 SSH 配置文件。

在活动栏中选择“远程资源管理器”，点击“配置”后选择 {file}`~/.ssh/config`
配置文件，按照以下格式添加相关信息到该文件中:

```
Host seismology
    User seismo-learn
    HostName 192.168.1.100
    IdentityFile ~/.ssh/id_rsa-remote-ssh
```

第一列是关键词，如 Host、User、HostName、IdentityFile，第二列是对应的值。
seismology 是用户自定义的远程主机标识，其他三个值同上文。可以按照该格式，
向该文件中添加多个远程计算机。

点击左下角的远程连接图标，选择“Remote-SSH: Connect to Host”，点击“seismology”
就可以登录远程计算机了。也可以通过“远程资源管理器”，点击“seismology”登录远程计算机。
:::

:::{tip}
如果远程计算机使用的 Shell 是 Bash，本地计算机是 Zsh，可能遇到无法启动
VS Code 的终端的问题。此时，需要修改一下配置文件以正确启动终端。

打开命令面板，输入 Remote-SSH: Settings，搜索 terminal.integrated.shell.linux，
将 "/bin/zsh" 改为 "/bin/bash" 即可。详情请参考
[microsoft/vscode-remote-release issues #38](https://github.com/microsoft/vscode-remote-release/issues/38)
:::
