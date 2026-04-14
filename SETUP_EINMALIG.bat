@echo off
echo.
echo  ================================
echo   EndoCraft - Einmaliges Setup
echo  ================================
echo.

cd /d "%~dp0"

git init
git remote add origin https://github.com/theendocraft-maker/EndoCraft.git
git branch -M main
git add .
git commit -m "Initial deploy"
git push -u origin main

echo.
echo  ================================
echo   Setup fertig! Ab jetzt nur
echo   noch deploy.bat benutzen.
echo  ================================
echo.
pause
