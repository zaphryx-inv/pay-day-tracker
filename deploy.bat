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

REM Clear old credentials
echo Clearing old Git credentials...
git credential-manager delete https://github.com >nul 2>&1

REM Check if we're in a git repository
if not exist ".git" (
    echo Initializing Git repository...
    git init
    git remote add origin https://github.com/zaphryx-inv/pay-day-tracker.git
) else (
    echo Git repository already initialized.
    REM Update remote URL to ensure it's correct
    git remote set-url origin https://github.com/zaphryx-inv/pay-day-tracker.git
)

REM Configure git user
echo.
echo Configuring Git user...
git config user.name "zaphryx-inv"
git config user.email "zaphryx-inv@github.com"

echo.
echo Staging files...
git add .

echo.
echo Committing changes...
set /p commit_msg="Enter commit message (or press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Update PayTracker app

git commit -m "%commit_msg%"

echo.
echo ========================================
echo AUTHENTICATION REQUIRED
echo ========================================
echo.
echo When prompted, use one of these methods:
echo 1. GitHub username + Personal Access Token (recommended)
echo    - Go to: https://github.com/settings/tokens
echo    - Create a token with 'repo' scope
echo    - Use token as password
echo.
echo 2. GitHub username + password (if 2FA not enabled)
echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

if errorlevel 1 (
    echo.
    echo ========================================
    echo PUSH FAILED - Authentication Error
    echo ========================================
    echo.
    echo Try this manual fix:
    echo 1. Go to: https://github.com/settings/tokens
    echo 2. Create a new token with 'repo' scope
    echo 3. Run this command with your token:
    echo.
    echo git remote set-url origin https://YOUR_TOKEN@github.com/zaphryx-inv/pay-day-tracker.git
    echo git push -u origin main
    echo.
    pause
    exit /b 1
)

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
