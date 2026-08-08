@echo off
setlocal

:: Rcode Launcher for Windows
:: This batch file launches Rcode with LuaJIT

set SCRIPT_DIR=%~dp0
set LUAJIT=%SCRIPT_DIR%luajit.exe

if not exist "%LUAJIT%" (
    echo LuaJIT not found in distribution directory
    echo Trying to use system LuaJIT...
    set LUAJIT=luajit
)

%LUAJIT% "%SCRIPT_DIR%rcode.lua" %*
