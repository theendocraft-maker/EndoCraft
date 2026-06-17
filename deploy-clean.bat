@echo off
echo.
echo  ================================
echo   EndoCraft Frontend · Clean Deploy
echo  ================================
echo.

cd /d "%~dp0"

REM 1. Lock-File loeschen falls vorhanden
if exist ".git\index.lock" (
    echo  - Removing stale index.lock
    del /F /Q ".git\index.lock"
)

REM 2. Line-Ending-only diffs zuruecksetzen (Sandbox-Verschmutzung)
echo  - Reverting line-ending-only files
git checkout -- scroll/index.html 2>nul

REM 3. NUR die ECHTEN neuen / geaenderten Files stagen
echo  - Staging only real changes
git add free/index.html
git add free/endocraft-free-pack.zip
git add free/README.txt
git add free/NPCs-Quick-Reference.md
git add admin/leads/index.html
git add tools/bundle-studio/etsy-update.html
git add tools/bundle-studio/cover-lab.html
git add tools/bundle-studio/splitter.html
git add tools/bundle-studio/thumbnail.html
git add tools/bundle-studio/dashboard.html
git add tools/bundle-studio/quality.html
git add tools/bundle-studio/pipeline.html
git add tools/bundle-studio/listing.html
git add tools/bundle-studio/pinterest.html
git add tools/bundle-studio/backlog.html
git add tools/bundle-studio/index.html

REM 4. Commit
set TIMESTAMP=%date% %time%
git commit -m "Lead-magnet landing + Etsy updater + Quality-Lock + AI-honest copy"

REM 5. Pull + Push
echo.
echo  Pulling latest...
git pull origin main --rebase

echo.
echo  Pushing...
git push origin main

echo.
echo  ================================
echo   GitHub Pages live in ~1-2 min
echo  ================================
echo.
pause
