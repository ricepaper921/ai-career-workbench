@echo off
title AI 职业生涯规划工作台 - 局域网分享
cd /d "%~dp0"

set "PY="
where python >nul 2>nul && set "PY=python"
if not defined PY ( where py >nul 2>nul && set "PY=py" )
if not defined PY ( if exist "D:\m\python.exe" set "PY=D:\m\python.exe" )
if not defined PY (
  echo.
  echo   [x] 没有找到 Python，无法启动局域网分享。
  echo       请改用「部署成网址」的方式，详见 README.md。
  echo.
  pause
  exit /b 1
)

echo.
echo   ============================================================
echo     AI 职业生涯规划学习实践工作台 - 局域网分享
echo   ============================================================
echo.
echo   本机打开:      http://127.0.0.1:8000
echo.
echo   手机/平板访问: 确保与本电脑连同一个 Wi-Fi，然后打开下面任一地址
echo.
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
  for /f "tokens=1" %%b in ("%%a") do echo        http://%%b:8000
)
echo.
echo   ^> 选 192.168.x.x 或 10.x.x.x 那个（无线网卡）。
echo   ^> 手机打不开时: 确认同一 Wi-Fi；部分校园网/公共网络开启了
echo     设备隔离，此时请改用「部署成网址」。
echo.
echo   关闭本窗口即停止分享，Ctrl+C 也可以。
echo.
echo   ------------------------------------------------------------
echo.

%PY% -m http.server 8000

echo.
echo   分享已停止。
pause
