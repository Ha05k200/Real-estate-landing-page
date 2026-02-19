@echo off
setlocal
cd /d "%~dp0"

set PORT=5500
if not "%~1"=="" set PORT=%~1

set PY_CMD=
where python >nul 2>nul
if %errorlevel%==0 set PY_CMD=python
if "%PY_CMD%"=="" (
  where py >nul 2>nul
  if %errorlevel%==0 set PY_CMD=py
)

if "%PY_CMD%"=="" (
  echo Python was not found on PATH.
  echo Install Python 3 and try again.
  exit /b 1
)

echo Starting local server at http://127.0.0.1:%PORT%/
echo Press Ctrl+C to stop the server.
start "" "http://127.0.0.1:%PORT%/"
%PY_CMD% -m http.server %PORT%
