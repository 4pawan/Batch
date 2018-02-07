@echo off
set src=%~dp0
set dest=-ia /D=E:\AdditionalSetUp\

NET SESSION >nul 2>&1
    IF %ERRORLEVEL% EQU 0 (
    goto :Starting
) ELSE (
    ECHO Please run commandPrompt as Administrator.
    goto :Ending
)

:Starting
::@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
::choco install googlechrome -ia %dest%chrome
::choco install firefox
::choco install vlc
::choco install skype
::choco install nitroreader.install
choco install 7zip %dest%7zip1 -y
::choco install winrar
echo winrar installed!

::choco install notepadplusplus.install
::echo notepad++ installed!
::choco install git
::choco install nodejs
::choco install treesizefree
::choco install sublimetext3
::choco install postman

:Ending
PAUSE