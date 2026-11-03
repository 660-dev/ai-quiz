@echo off
title Yu AI Learn - Launcher
cd /d %~dp0

echo ============================================
echo   AI Quiz Mini Program - Local Launcher
echo ============================================
echo.

echo [1/3] Starting MySQL on port 3306 ...
start "MySQL" cmd /k F:\mysql\bin\mysqld.exe --defaults-file=F:\mysql\my.ini --console
timeout /t 6 /nobreak >nul

echo [2/3] Starting FastAPI backend on port 8000 ...
start "Backend" cmd /k "cd /d %~dp0backend && venv\Scripts\python.exe -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000"
timeout /t 4 /nobreak >nul

echo [3/3] Building mini program (production, one-shot) ...
start "Frontend" cmd /k "cd /d %~dp0frontend && npm run build:weapp"

echo.
echo ============================================
echo  All started. Next step:
echo    1. Open WeChat DevTools
echo    2. Import project, choose folder:
echo       %~dp0frontend
echo       (project.config.json already points miniprogramRoot to dist/)
echo    3. AppID: pick "Test Account" or "No AppID (tourist)"
echo.
echo  Backend docs: http://127.0.0.1:8000/docs
echo ============================================
pause
