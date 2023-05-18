@echo off

if not "%1"=="" set project=%1
if not "%2"=="" set version=%2

if "%project%"=="" set /p project=Please enter the project name:
if "%version%"=="" set /p version=Please enter the project version:

:pull
git pull

if errorlevel 1 (
    echo Pull failed! Retrying...
    timeout /t 5 > nul
    goto pull
) else (
    echo Pull successful!
)

git add -A
git commit -m "Update %project%:%version%"

:push
git push

if errorlevel 1 (
    echo Push failed! Retrying...
    timeout /t 5 > nul
    goto push
) else (
    echo Push successful!
)
