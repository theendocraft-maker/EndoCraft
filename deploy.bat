@echo off
echo.
echo  ================================
echo   EndoCraft Deploy to GitHub
echo  ================================
echo.

cd /d "%~dp0"

REM --- 1. Stale Git-Sperrdateien entfernen (sonst bricht commit/push ab) ---
if exist ".git\index.lock" (
    echo  - Entferne stale index.lock
    del /F /Q ".git\index.lock"
)
if exist ".git\HEAD.lock" (
    echo  - Entferne stale HEAD.lock
    del /F /Q ".git\HEAD.lock"
)

REM --- 2. Cruft wegraeumen, das nicht deployed werden soll ---
if exist "free\_preview-thankyou.html" (
    echo  - Loesche Preview-Datei
    del /F /Q "free\_preview-thankyou.html"
)
if exist "free\portraits\*.png" (
    echo  - Loesche unbenutzte PNG-Originale ^(nur JPGs gehen live^)
    del /F /Q "free\portraits\*.png"
)

echo.
echo  Staging changes...
git add -A

set TIMESTAMP=%date% %time%
git commit -m "Deploy: %TIMESTAMP%"
if errorlevel 1 echo  ^(Nichts Neues zu committen - pushe ggf. bestehende Commits^)

echo.
echo  Syncing with GitHub...
git pull origin main --rebase
if errorlevel 1 (
    echo.
    echo  !! PULL/REBASE fehlgeschlagen - bitte Ausgabe oben pruefen.
    echo     Haeufig: Merge-Konflikt. Loesen, dann 'git rebase --continue'.
    echo.
    pause
    exit /b 1
)

echo.
echo  Uploading...
git push origin main
if errorlevel 1 (
    echo.
    echo  !! PUSH fehlgeschlagen - bitte Ausgabe oben pruefen.
    echo.
    pause
    exit /b 1
)

echo.
echo  ================================
echo   Done! endocraft.app updated
echo   in ~1-2 minutes.
echo  ================================
echo.
pause
