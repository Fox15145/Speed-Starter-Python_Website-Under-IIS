@echo off
REM #################################################################
REM ## Pour une nouvelle configuration, pensez à éditer le fichier ##
REM ##                 -> Env_Config.conf <-                       ##
REM #################################################################
set curPath=%~dp0
set initialPath=%CD%
cd "%curPath%"
%curPath:~0,2%
set templateConfigFile=%~dp0IIS - Configs\Env_Config.conf
set configFile=%~dp0Env_Config.conf
set runningFile=%~dp0Running_IIS_Env_Config.bat
set templateFile=.\IIS - Configs\Template_Env_Config.conf

if not exist "%templateConfigFile%" GOTO CONFIG_MISSED
copy "%templateConfigFile%" "%curPath%"
if not exist "%configFile%" GOTO CONFIG_MISSED 
if not exist "%templateFile%" GOTO TEMPLATE_MISSED 
for %%a in (%templateFile%) do set $Fichier=%%~na
copy "%templateFile%" %~dp0
copy %~dp0*Env_Config.conf %runningFile%
if exist CreateSymbolicLink.bat copy CreateSymbolicLink.bat %~dp0
call "%runningFile%"
goto END

:TEMPLATE_MISSED
echo /!\ Configuration impossible, "Template" manquant !
goto END

:CONFIG_MISSED
echo /!\ Configuration impossible, fichier "Env_Config.conf" manquant !
goto END

:END
if exist "%curPath%\%$Fichier%.conf" erase "%curPath%\%$Fichier%.conf"
if exist "%runningFile%" erase "%runningFile%"
if exist "%configFile%" erase "%configFile%"
if exist "%curPath%\CreateSymbolicLink.bat" erase "%curPath%\CreateSymbolicLink.bat"
cd "%initialPath%"
%initialPath:~0,2%
pause
