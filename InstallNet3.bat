@echo off
Title .NET Framework 3.5 Offline Installer

:: ~~~~~~~~~~~~ Check for Admin ~~~~~~~~~~~~

Echo.
Echo Checking Administrative Rights....

openfiles>nul 2>&1
if %errorlevel% EQU 0 goto startscript

Echo.
Echo In order for this script to run properly, it is necessary
Echo for the script to have Administrative Rights.
Echo.
Echo Please rerun this script as an Administrator.
Echo.
Echo Press Enter to close the script...
pause>nul
exit

:: Start Script
::
:startscript
Echo.
Echo The script is running with elevated rights.

:: Navigate to Directory Script is Located
::
cd %~dp0

:: Copying .cab files to C:\
::
mkdir C:\NetInstall
Copy .\cab C:\NetInstall /f

:: Attempt Installation
::
Echo.
Echo Attempting to install .NET Framework 3.5...
Dism /online /enable-feature /featurename:NetFX3 /All /Source:"C:\cab" /LimitAccess
Echo.
Echo .NET Framework 3.5 should be installed.  Please confirm this.
Echo.

:: End of Script
::
Echo Press Enter to close the script...
pause>nul
exit


