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
REM   D:\directory��D:\���롢D:\�� Ŀ  : Ҫ���ݵ�ԴĿ¼
REM   F:\backup                       : ����Ŀ¼

REM robocopy �����ѡ�
REM   /mir        : ����Ŀ¼��Ϊ���� ��������Ŀ¼��ɾ������Ŀ¼��ԴĿ¼�в����ڵ��ļ���Ŀ¼��
REM   /mt[:n]     : ʹ�� n ���߳̽��ж��̸߳��ƣ�Ĭ��ֵΪ 8����n ����Ϊ 1�������ô��� 128��
REM                 ���磬/mt ��ʾ 8 ���̣߳�/mt:4 ��ʾ 4 ���߳�
REM ���Բο� https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/robocopy
REM �˽� robocopy ����ĸ����÷������磬Ҳ����ʹ�������б��� D �������õ�
REM һЩѡ�� /R:10 /W:10 /A-:H /XD Config.Msi $RECYCLE.BIN

REM ע�����
REM   1. ����ű��д������ģ���Ҫ���� ANSI �����ʽ����������롣
REM   2. ��Ŀ¼�����ڿո񣬱�������ţ��� "D:\�� Ŀ"

echo "���� D:\directory �� F:\backup\directory"
robocopy D:\directory F:\backup\directory /mir /mt
pause

echo "���� D:\���� �� F:\backup\����"
robocopy D:\���� F:\backup\���� /mir /mt
pause

echo "���� D:\�� Ŀ �� F:\backup\�� Ŀ"
robocopy "D:\�� Ŀ" "F:\backup\�� Ŀ" /mir /mt
pause
