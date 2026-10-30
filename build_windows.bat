@echo off
setlocal
cd /d "%~dp0"

echo [1/4] Python 3.12 확인 중...
py -3.12 --version
if errorlevel 1 (
    echo Python 3.12가 필요합니다. Python 3.12를 설치한 뒤 다시 실행해 주세요.
    pause
    exit /b 1
)

echo [2/4] 필요한 패키지 설치 중...
py -3.12 -m pip install --upgrade pip
if errorlevel 1 goto :error
py -3.12 -m pip install -r requirements.txt pyinstaller==6.22.3
if errorlevel 1 goto :error

echo [3/4] SURVIVOR.exe 빌드 중...
set "FONT_ARG="
if exist "fonts\neodgm.ttf" set "FONT_ARG=--add-data fonts\neodgm.ttf;fonts"
py -3.12 -m PyInstaller --noconfirm --clean --onedir --windowed --name SURVIVOR --contents-directory _internal --collect-all pygame %FONT_ARG% main.py
if errorlevel 1 goto :error

if not exist "dist\SURVIVOR\SURVIVOR.exe" goto :error

echo [4/4] 배포용 ZIP 생성 중...
powershell -NoProfile -ExecutionPolicy Bypass -Command "if (Test-Path 'dist\SURVIVOR-Windows.zip') { Remove-Item 'dist\SURVIVOR-Windows.zip' -Force }; Compress-Archive -Path 'dist\SURVIVOR\*' -DestinationPath 'dist\SURVIVOR-Windows.zip' -CompressionLevel Optimal"
if errorlevel 1 goto :error

echo.
echo 완료: dist\SURVIVOR-Windows.zip
echo 압축을 풀면 SURVIVOR.exe와 _internal 폴더가 함께 있어야 합니다.
pause
exit /b 0

:error
echo 빌드 중 오류가 발생했습니다. 위의 오류 메시지를 확인해 주세요.
pause
exit /b 1
