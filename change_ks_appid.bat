@echo off

echo #################apk �滻app name by bearluo ################
call init.bat
rem set antpath=lib\change_name.properties

rem ��ȡ������
rem for /f  %%a in (change_name.txt) do (
rem 	echo �����޸�Ӧ������....
rem 	
rem 	del %antpath%
rem 	echo change_name:%%a 
rem 	(echo change_name=%%a)>>%antpath%
rem 	call ant change-name-by-input
rem 	break
rem )
call %ant_exe_path% change-ks-app-id-by-input
pause