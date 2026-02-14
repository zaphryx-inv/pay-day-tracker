@echo off
echo ========================================
echo PayTracker - GitHub Deployment Script
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

REM Check if we're in a git repository
if not exist ".git" (
    echo Initializing Git repository...
    git init
    git remote add origin https://github.com/zaphryx-inv/pay-day-tracker.git
) else (
    echo Git repository already initialized.
)

echo.
echo Staging files...
git add .

echo.
echo Committing changes...
set /p commit_msg="Enter commit message (or press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Update PayTracker app

git commit -m "%commit_msg%"

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo ========================================
echo Deployment complete!
echo ========================================
echo.
echo Your app should be live at:
echo https://zaphryx-inv.github.io/pay-day-tracker/
echo.
echo Note: It may take a few minutes for GitHub Pages to update.
echo.
pause
