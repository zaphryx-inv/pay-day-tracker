@echo off
echo ========================================
echo PayTracker - Push with Personal Token
echo ========================================
echo.
echo This script will help you push using a Personal Access Token
echo.
echo STEP 1: Create a Personal Access Token
echo ========================================
echo Go to: https://github.com/settings/tokens
echo Click: "Generate new token" (classic)
echo Name it: "PayTracker"
echo Check: "repo" scope
echo Click: "Generate token"
echo Copy the token (you won't see it again!)
echo.
set /p token="Paste your Personal Access Token here: "

if "%token%"=="" (
    echo ERROR: No token provided
    pause
    exit /b 1
)

echo.
echo Clearing old credentials...
git credential-manager delete https://github.com >nul 2>&1

echo.
echo Configuring Git...
git config user.name "zaphryx-inv"
git config user.email "zaphryx-inv@github.com"

echo.
echo Setting up remote with token...
git remote set-url origin https://%token%@github.com/zaphryx-inv/pay-day-tracker.git

echo.
echo Staging and committing...
git add .
git commit -m "Update PayTracker app" --allow-empty

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

if errorlevel 1 (
    echo.
    echo ERROR: Push failed. Check your token and try again.
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Deployment complete!
echo ========================================
echo.
echo Your app is live at:
echo https://zaphryx-inv.github.io/pay-day-tracker/
echo.
echo Note: GitHub Pages may take a few minutes to update.
echo.
pause
