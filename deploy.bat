@echo off
echo.
echo  ================================
echo   EndoCraft Deploy to GitHub
echo  ================================
echo.

cd /d "%~dp0"

echo  Dateien die hochgeladen werden:
git status --short
echo.

git add .

set TIMESTAMP=%date% %time%
git commit -m "Deploy: %TIMESTAMP%"

echo.
echo  Uploading to GitHub...
git push origin main

echo.
echo  ================================
echo   Done! endocraft.app wird in
echo   ca. 1-2 Minuten aktualisiert.
echo  ================================
echo.
pause
