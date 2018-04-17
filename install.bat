@echo off
set src=%~dp0
set dest="%ProgramFiles(x86)%\Digitas\Unicorn Widget\"
set temp="%appdata%\Unicorn Widget\"
set exe="UnicornWidget.exe"

NET SESSION >nul 2>&1
    IF %ERRORLEVEL% EQU 0 (
    goto :Starting
) ELSE (
    ECHO Please run commandPrompt as Administrator.
    goto :Ending
)

:Starting
IF EXIST %dest%%exe% (
echo Uninstalling previous version would take some time .Please wait...
tasklist /FI "IMAGENAME eq %exe%" 2>NUL | find /I /N %exe%>NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im %exe%
wmic product where "description='Unicorn Widget' " uninstall
echo Uninstallation done!
) ELSE ( echo No previous version found!
)
IF EXIST %temp% rmdir %temp% /S /Q
echo Cleared temporary files!

IF NOT EXIST %src%setup.exe ( 
echo Setup file doesn't exists in directory.Make sure you have in same directory as of script!
goto :Ending )
echo Installation started!
"%src%setup.exe" /S /v/qn
echo Installation done!
start "unicorn" /D %dest% %exe%
echo App started!
:Ending
PAUSE
