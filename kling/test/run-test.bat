@echo off
REM ===================================================================
REM  Kling A -> B Test, zwei Clips, zusammen ca. 1,28 $
REM
REM  Braucht KEIN Python mehr. Laeuft ueber PowerShell, das ist auf
REM  jedem Windows schon drauf.
REM
REM  Vorher im selben Fenster einmal:
REM     set AIMLAPI_KEY=sk-dein-schluessel
REM  Dann:  run-test.bat
REM
REM  Nur pruefen, ohne Kosten:  run-test.bat dry
REM
REM  Alles landet zusaetzlich in test-log.txt -- die Datei kannst du mir
REM  schicken, wenn etwas schiefgeht.
REM ===================================================================
setlocal
cd /d "%~dp0"

set ARG=
if /i "%1"=="dry" set ARG=-Dry

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0run-test.ps1" %ARG%

echo.
pause
endlocal
