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
REM   D:\directory1 和 D:\directory2  : 要备份的源目录
REM   F:\backup                       : 备份目录

REM robocopy 命令常用选项：
REM   /mir        : 备份目录成为镜像 （复制子目录；删除备份目录下源目录中不存在的文件和目录）
REM   /mt[:n]     : 使用 n 个线程进行多线程复制（默认值为 8）。n 至少为 1，但不得大于 128。
REM                 例如，/mt 表示 8 个线程，/mt:4 表示 4 个线程
REM 可以参考 https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/robocopy
REM 了解 robocopy 命令的更多用法

REM 注意事项：
REM   1. 如果命令中有中文，脚本需要采用 ANSI 编码格式（Windows 下的默认编码格式）。
REM   2. 若目录名存在空格，必须加引号，如 "D:\direc tory1"

echo "备份 D:\directory1 到 F:\backup\directory1"
robocopy D:\directory1 F:\backup\directory1 /mir /mt
pause

echo "备份 D:\directory2 到 F:\backup\directory2"
robocopy D:\directory2 F:\backup\directory2 /mir /mt
pause
