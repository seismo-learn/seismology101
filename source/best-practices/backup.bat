REM
REM  目的： 使用 robocopy 命令备份指定目录
REM  作者： 李天觉
REM  最近修改日期： 2021年2月4日
REM

echo Check if the source and backup paths exist
pause

REM d:\directory1 和 d:\directory2 : 要备份的源目录
REM e:\backup      : 备份目录
REM e:\backup.txt  : 备份目录下的备份日志

REM robocopy 命令常用选项：
REM   /mir        : 备份目录成为镜像 （复制子目录；删除备份目录下源目录中不存在的文件和目录）
REM   /mt[:n]     : 使用 n 个线程进行多线程复制（默认值为 8）。n 至少为 1，但不得大于 128
REM   /log+:file  : 将备份状态以追加的方式输出到日志文件 file 中
REM 可以参考 http://www.svngo.net/article61 了解 robocopy 命令更多用法

robocopy d:\directory1 e:\backup\directory1 /mir /mt:16 /log+:e:\backup.txt
robocopy d:\directory2 e:\backup\directory2 /mir /mt:16 /log+:e:\backup.txt
