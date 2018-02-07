@ECHO OFF
set src=%~dp0
echo Installation started!
"%src%setup.exe" /x /S /v/qn
echo Installation done!
PAUSE