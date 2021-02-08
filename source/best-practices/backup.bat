REM
REM  目的： 使用 robocopy 命令备份指定目录
REM  作者： 赵志远、李天觉
REM  最近修改日期： 2021年2月7日
REM
REM  免责声明：
REM    本脚本完全基于编写者在自己的计算机上备份文件的经验总结，
REM    并不具备普遍适用性，仅供读者参考。
REM

REM 源目录和备份目录
REM   D:\directory、D:\代码、D:\项 目  : 要备份的源目录
REM   F:\backup                       : 备份目录

REM robocopy 命令常用选项：
REM   /mir        : 备份目录成为镜像 （复制子目录；删除备份目录下源目录中不存在的文件和目录）
REM   /mt[:n]     : 使用 n 个线程进行多线程复制（默认值为 8）。n 至少为 1，但不得大于 128。
REM                 例如，/mt 表示 8 个线程，/mt:4 表示 4 个线程
REM 可以参考 https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/robocopy
REM 了解 robocopy 命令的更多用法。例如，也可以使用正文中备份 D 盘是所用的
REM 一些选项 /R:10 /W:10 /A-:H /XD Config.Msi $RECYCLE.BIN

REM 注意事项：
REM   1. 如果脚本中存在中文，需要采用 ANSI 编码格式，否则会乱码。
REM   2. 若目录名存在空格，必须加引号，如 "D:\项 目"

echo "备份 D:\directory 到 F:\backup\directory"
robocopy D:\directory F:\backup\directory /mir /mt
pause

echo "备份 D:\代码 到 F:\backup\代码"
robocopy D:\代码 F:\backup\代码 /mir /mt
pause

echo "备份 D:\项 目 到 F:\backup\项 目"
robocopy "D:\项 目" "F:\backup\项 目" /mir /mt
pause
