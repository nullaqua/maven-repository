@echo off
set /p project=Project Name:
set /p version=Version:

:push
git add -A
git commit -m "Upload %project%:%version% to GitHub"
git push

if errorlevel 1 (
    echo 推送失败！正在重试...
    goto push
) else (
    echo 推送成功!
)
