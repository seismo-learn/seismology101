REM
REM  Ŀ�ģ� ʹ�� robocopy �����ָ��Ŀ¼
REM  ���ߣ� ��־Զ�������
REM  ����޸����ڣ� 2021��2��7��
REM
REM  ����������
REM    ���ű���ȫ���ڱ�д�����Լ��ļ�����ϱ����ļ��ľ����ܽᣬ
REM    �����߱��ձ������ԣ��������߲ο���
REM

REM ԴĿ¼�ͱ���Ŀ¼
REM   D:\directory1 �� D:\directory2  : Ҫ���ݵ�ԴĿ¼
REM   F:\backup                       : ����Ŀ¼

REM robocopy �����ѡ�
REM   /mir        : ����Ŀ¼��Ϊ���� ��������Ŀ¼��ɾ������Ŀ¼��ԴĿ¼�в����ڵ��ļ���Ŀ¼��
REM   /mt[:n]     : ʹ�� n ���߳̽��ж��̸߳��ƣ�Ĭ��ֵΪ 8����n ����Ϊ 1�������ô��� 128��
REM                 ���磬/mt ��ʾ 8 ���̣߳�/mt:4 ��ʾ 4 ���߳�
REM ���Բο� https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/robocopy
REM �˽� robocopy ����ĸ����÷�

REM ע�����
REM   1. ��������������ģ��ű���Ҫ���� ANSI �����ʽ��Windows �µ�Ĭ�ϱ����ʽ����
REM   2. ��Ŀ¼�����ڿո񣬱�������ţ��� "D:\direc tory1"

echo "���� D:\directory1 �� F:\backup\directory1"
robocopy D:\directory1 F:\backup\directory1 /mir /mt
pause

echo "���� D:\directory2 �� F:\backup\directory2"
robocopy D:\directory2 F:\backup\directory2 /mir /mt
pause
