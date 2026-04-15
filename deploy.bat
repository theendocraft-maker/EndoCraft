@echo off
echo.
echo  ================================
echo   EndoCraft Deploy to GitHub
echo  ================================
echo.

cd /d "%~dp0"

git add .

set TIMESTAMP=%date% %time%
git commit -m "Deploy: %TIMESTAMP%"

echo.
echo  Syncing with GitHub...
git pull origin main --rebase

echo.
echo  Uploading...
git push origin main

echo.
echo  ================================
echo   Done! endocraft.app updated
echo   in ~1-2 minutes.
echo  ================================
echo.
pause
