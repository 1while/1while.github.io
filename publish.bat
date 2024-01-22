
cd build

@echo off
cd build
for /f "delims=" %%i in ('dir /b /a-d ^| findstr /v /b /c:".git"') do (
    del /q "%%i"
)


cd %~dp0

@REM call make html
