@echo off
title ROM Flasher by Mayank Droid - Launcher
color 0A

echo ==============================================================
echo       ROM FLASHER BY MAYANK DROID - AUTO-CHECK & LAUNCH
echo ==============================================================
echo.

:: 1. Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo [ERROR] Python aapke system me installed ya PATH me add nahi hai!
    echo Kripya Python install karein aur "Add to PATH" checkbox tick karein.
    echo.
    pause
    exit /b
)

:: 2. Auto-Install Dependencies if missing
echo [*] Dependencies check kar rahe hain...
python -c "import customtkinter, PIL, packaging, PyInstaller" >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Missing modules detect hue. Auto-installing libraries...
    python -m pip install -r requirements.txt
    if %errorlevel% neq 0 (
        color 0C
        echo [ERROR] Libraries install nahi ho payi. Internet connection check karein.
        pause
        exit /b
    )
)
echo [OK] Saari libraries verified hain.
echo.

:: 3. Check if Compiled .EXE exists
if exist "dist\ROM_Flasher_by_Mayank_Droid.exe" (
    echo [*] Standalone .EXE pehle se maujood hai.
    echo [*] Launching ROM Flasher Studio...
    start "" "dist\ROM_Flasher_by_Mayank_Droid.exe"
    exit
)

:: 4. If .EXE not built yet, Build it automatically
echo [!] Standalone .EXE nahi mili. Fresh compile start kar rahe hain...
echo [*] PyInstaller background me single .exe create kar raha hai...
echo.

pyinstaller --noconfirm --onefile --windowed --name="ROM_Flasher_by_Mayank_Droid" --icon=app_icon.ico --add-data "bin;bin" --add-data "app_icon.ico;." --add-data "8402-black-cat-anime.png;." app.py

if %errorlevel% neq 0 (
    color 0C
    echo.
    echo ==============================================================
    echo [ERROR] Compilation fail ho gayi! Upar ka error log check karein.
    echo ==============================================================
    pause
    exit /b
)

echo.
echo ==============================================================
echo [SUCCESS] Compilation safal rahi!
echo File: dist\ROM_Flasher_by_Mayank_Droid.exe
echo [*] App launch ho rahi hai...
echo ==============================================================

start "" "dist\ROM_Flasher_by_Mayank_Droid.exe"
timeout /t 3 >nul
exit