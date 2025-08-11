REM filepath: c:\Users\i314q159\Desktop\bat\komga.bat
@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

REM Set Komga jar directory
set KOMGA_DIR=D:\jar_d

REM Check if directory exists
if not exist "%KOMGA_DIR%" (
    echo [ERROR] Directory not found: %KOMGA_DIR%
    pause
    exit /b 1
)

REM Clean old versions, keep latest 3
echo [INFO] Cleaning old versions...
set count=0
for /f "delims=" %%i in ('dir /b /o-n "%KOMGA_DIR%\komga-*.jar"') do (
    set /a count+=1
    if !count! gtr 3 (
        echo [INFO] Deleting old version: %%i
        del /f /q "%KOMGA_DIR%\%%i"
    )
)

REM Start latest version
for /f "delims=" %%i in ('dir /b /o-n "%KOMGA_DIR%\komga-*.jar"') do (
    echo [INFO] Starting latest version: %%i
    java -jar "%KOMGA_DIR%\%%i"
    goto :eof
)

echo [ERROR] No Komga jar file found
pause
exit /b 1
