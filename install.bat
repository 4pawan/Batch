@echo off
set src=%~dp0
set dest="%ProgramFiles(x86)%\Digitas LBi\Unicorn Widget\"

NET SESSION >nul 2>&1
    IF %ERRORLEVEL% EQU 0 (
    goto :Starting
) ELSE (
    ECHO Please run commandPrompt as Administrator.
    goto :Ending
)

:Starting
echo Installation started!
"%src%setup.exe" /S /v/qn
echo Installation done!
start "unicorn" /D %dest%  "UnicornWidget.exe"
echo App started!
:Ending
PAUSE