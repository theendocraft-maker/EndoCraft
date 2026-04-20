@echo off
REM ═══════════════════════════════════════════════════════════
REM  GitHub Pages FIX fuer EndoCraft
REM  Entfernt den kaputten Git-Worktree-Submodul-Eintrag, der
REM  seit 20.04. 21:25 alle Pages-Builds zerschiesst.
REM ═══════════════════════════════════════════════════════════

echo.
echo  ================================
echo   EndoCraft  -  Pages Build Fix
echo  ================================
echo.

cd /d "%~dp0"

echo [1/5] Entferne kaputten Worktree-Submodul-Eintrag aus Git...
git rm --cached scroll/.claude/worktrees/dreamy-ptolemy-d54a40 2>nul
git rm --cached -r scroll/.claude 2>nul
git rm --cached -r .claude 2>nul
echo.

echo [2/5] Stelle sicher, dass .gitignore korrekt ist...
git add .gitignore
echo.

echo [3/5] Committe den Fix...
set TIMESTAMP=%date% %time%
git commit -m "Fix: remove .claude worktree gitlink that broke Pages build (%TIMESTAMP%)"
echo.

echo [4/5] Sync mit GitHub...
git pull origin main --rebase
echo.

echo [5/5] Pushe zu GitHub...
git push origin main
echo.

echo  ================================
echo   FERTIG!
echo.
echo   Geh auf github.com/theendocraft-maker/EndoCraft/actions
echo   und schau ob der neue Build jetzt gruen wird (ca. 1 Min).
echo   Danach: endocraft.app/scroll/ hart-refreshen (Strg+F5).
echo  ================================
echo.
pause
