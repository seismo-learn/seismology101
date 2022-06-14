# Windows 数据备份

- 本节贡献者: {{赵志远}}（作者）、{{姚家园}}（作者）
- 最近更新日期: 2021-10-01
- 预计阅读时间: 20 分钟

---

## robocopy

使用 Windows 自带的 [robocopy](https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/robocopy)
命令进行增量备份。这意味着只有第一次备份的时候需要花比较多的时间来同步文件，之后再使用该命令进行备份
只会同步有改动的文件。假设要备份整个 D 盘，移动硬盘下的备份目录为 {file}`F:\\backup`。
打开 CMD 或 PowerShell，使用以下命令可以将 D 盘同步到备份目录下，此时备份目录是 D 盘的一个镜像:

```
$ robocopy D:\ F:\backup /mir /mt /R:10 /W:10 /A-:H /XD Config.Msi $RECYCLE.BIN
```

:::{important}
以上命令中 D 盘盘符后的反斜杠（{file}`D:\\`）非常重要，省略的话可能无法备份整个 D 盘。

`/XD` 选项后的目录（如 {file}`Config.Msi`、{file}`$RECYCLE.BIN`）
在备份时被忽略。读者可以根据自己的实际情况把无法备份或者不想备份的目录添加到此选项后。
:::

读者可以参考 Batch 脚本 {download}`backup.bat`。点击下载后，修改源目录、备份目录以及想要
备份的子目录。然后，双击该 Batch 脚本即可直接运行。也可以打开 CMD 或 PowerShell，
再输入 Batch 脚本名以运行脚本。

## Backup

:::{warning}
本节尚未开始编写。读者可以参考 <https://www.portableone.com/Tech-News/Microsoft-Windows-10-PCs-have-their-own-Apple-Time-Machine-feature>
使用 Windows 10 Backup，欢迎提供反馈。
:::
