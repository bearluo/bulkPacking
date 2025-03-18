@echo off

echo #################渠道打包工具v4.0.0 by bearluo ################
call init.bat
set antpath=lib\ant.properties

del .\package\assets\res\xxlConfig.lua /q

rem 读取所有列
for /f "skip=1 tokens=1-2" %%a in (a.txt) do (
	echo 正在打包....
	
	del %antpath%
	(echo #)>>%antpath%
	(echo #)>>%antpath%	
	(echo #	Ant Build Config)>>%antpath%
	(echo #)>>%antpath%
	(echo #)>>%antpath%
	(echo #key store)>>%antpath%
	(echo key.store=%keyStorePath%)>>%antpath%
	(echo key.alias=%keyAlias%)>>%antpath%
	(echo key.store.password=%keyStorePassword%)>>%antpath%
	(echo key.alias.password=%keyAliasPassword%)>>%antpath%
	(echo #out.dir The name of the output directory. Default is 'bin'.)>>%antpath%
	(echo out.apk=apk)>>%antpath%
	
	echo OPERATORSID:%%a 
	echo UMENG_CHANNEL:%%b
	
	(echo OPERATORSID=%%a)>>%antpath%
	(echo UMENG_CHANNEL=%%b)>>%antpath%
	call %ant_exe_path% auto-batch-encode
)
pause