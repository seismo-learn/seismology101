@echo off
echo Windows���滻VScode��bat��shell���﷨���������ļ�,ʵ��GMT�﷨����
echo ��Ҫ��װ gawk
where code | gawk -F"bin" "{print $1}" > tmp121212.txt
set /p T1=<tmp121212.txt
copy batchfile.tmLanguage.json "%T1%"\resources\app\extensions\bat\syntaxes\batchfile.tmLanguage.json
copy shell-unix-bash.tmLanguage.json "%T1%"\resources\app\extensions\shellscript\syntaxes\shell-unix-bash.tmLanguage.json
del tmp121212.txt 
echo ���������� Vscode��
pause