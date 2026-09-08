@echo off
title Mass Upload Games to GitHub
echo.
echo ==========================================
echo       MASS UPLOAD GAMES TO GITHUB
echo ==========================================
echo.

where git >nul 2>nul
if errorlevel 1 (
    echo ERROR: Git is not installed.
    echo Install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo.
set /p REPO="Paste your GitHub repository URL: "
if "%REPO%"=="" (
    echo No repository URL entered.
    pause
    exit /b 1
)

echo.
echo Initializing Git...
if not exist ".git" git init
git branch -M main

echo.
echo Adding ALL files...
git add .

echo.
echo Creating commit...
git commit -m "Mass upload games and images"

echo.
echo Connecting to GitHub...
git remote remove origin >nul 2>nul
git remote add origin "%REPO%"

echo.
echo Uploading to GitHub...
git push -u origin main

if errorlevel 1 (
    echo.
    echo ==========================================
    echo UPLOAD FAILED
    echo ==========================================
    echo.
    echo If GitHub asks you to sign in, complete the login.
    echo If a file is over 100 MB, GitHub will reject it.
    echo.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo UPLOAD COMPLETE!
echo ==========================================
echo.
pause
