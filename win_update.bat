@echo off
:: ================================================================
:: OpenRocket Git Wrapper
:: ---------------------------------------------------------------
:: • Converts every *.ork file in the current folder:
::      – If it’s already XML  ➜  leave it alone
::      – If it’s a ZIP export ➜  extract rocket.ork,
::        rename it to <original>.ork, delete the ZIP
:: • Stages all *.ork files, asks for a commit message,
::   commits, and pushes.
::
:: Prerequisites:  Git for Windows + PowerShell (Win7+)
:: Usage:          double‑click or run from cmd in the repo root
:: ================================================================
setlocal enabledelayedexpansion

echo.
echo ===========================================
echo  OpenRocket → Git one-click updater
echo ===========================================

:: ---------------------------------------------------------------
:: STEP 1 – Loop over every *.ork in this folder
:: ---------------------------------------------------------------
for %%F in (*.ork) do (

    echo.
    echo [i] Processing "%%F" ...

    :: Does the file already look like XML?
    findstr /M /C:"<?xml" "%%F" >nul
    if errorlevel 1 (
        :: -------------------------------------------------------
        :: It’s NOT XML ➜ treat as ZIP, convert it
        :: -------------------------------------------------------
        echo     Detected ZIP-style .ork - converting ...

        set "BASENAME=%%~nF"
        ren "%%F" "%%F.zip"

        :: Extract to a temp folder
        powershell -NoLogo -NoProfile -Command ^
            "Expand-Archive -Force '%%F.zip' 'tmp_unzip'"

        if not exist "tmp_unzip\rocket.ork" (
            echo [!] rocket.ork not found inside %%F.zip - skipping.
            goto :cleanup_single
        )

        ren "tmp_unzip\rocket.ork" "%%~nF.ork"
        move /Y "tmp_unzip\%%~nF.ork" "%%~nF.ork" >nul
        echo     → Saved XML as "%%~nF.ork"

:cleanup_single
        rd /s /q "tmp_unzip"
        del "%%F.zip"
    ) else (
        echo     Already XML - nothing to do.
    )
)

:: ---------------------------------------------------------------
:: STEP 2 – Git add / commit / push
:: ---------------------------------------------------------------
echo.
git add *.ork

set /p commit_msg=Enter commit message: 
git commit -m "%commit_msg%"
git push

echo.
echo [] Done - your designs are safely in Git!

:: Show them where to go to see the remote repo
echo.
echo [i] Open the remote repo in your browser:
git remote -v
echo.

:: Wait for enter
set /p "dummy=Press ENTER to exit ..."
echo.
endlocal
