@echo off

echo #################apk 替换app name by bearluo ################
call init.bat
rem set antpath=lib\change_name.properties

rem 读取所有列
rem for /f  %%a in (change_name.txt) do (
rem 	echo 正在修改应用名称....
rem 	
rem 	del %antpath%
rem 	echo change_name:%%a 
rem 	(echo change_name=%%a)>>%antpath%
rem 	call ant change-name-by-input
rem 	break
rem )
call %ant_exe_path% change-ks-app-id-by-input
pause