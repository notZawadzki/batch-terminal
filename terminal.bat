@echo off

set "silent=False" rem True/False
set "noRepeat=False" rem True/False

title Terminal

chcp 65001 >nul
if not "%silent%"=="True" (
	echo [36m**********************************************************
	echo ** Zawadzki's Terminal v1                               **
	echo ** For private use only. Redistribution is prohibited.  **
	echo **********************************************************[0m
)

for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A

IF EXIST "%~dp0/autorun.bat" (
	call "%~dp0/autorun.bat"
)

:input

IF "noRepeat"=="True" (
	set "cmd="
)

IF NOT "%cmd%"=="" (
    echo Finished with code %errorlevel%
)

echo.

echo [95m╔══[0m([33m%username%[0m@[92m%computername%[0m)-[[94m%cd%[0m]
set /p cmd=".%BS%[95m╚══>[0m "

echo.

%cmd%

goto input