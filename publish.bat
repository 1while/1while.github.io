

@echo off
cd build
rmdir /s /q doctrees

cd html

for /f "delims=" %%F in ('dir /b /a-d ^| findstr /v /i /c:".git"') do (
    echo Deleting %%F...
    del /f /q "%%F"
)

for /d %%D in (*) do (
    if not "%%~nxD" == ".git" (
        echo Deleting directory %%D...
        rmdir /s /q "%%D"
    )
)

cd %~dp0

call make html
