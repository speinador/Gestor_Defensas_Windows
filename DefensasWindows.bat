@echo off
title Gestor de Defensas de Windows
color 1F
mode con: cols=70 lines=20

:MENU
cls
echo ============================================
echo      GESTOR DE DEFENSAS DE WINDOWS
echo ============================================
echo.
echo   1. Desactivar defensas de Windows
echo   2. Reactivar defensas de Windows
echo   3. Salir
echo.
set /p option=Elige una opcion (1-3): 

if "%option%"=="1" goto DESACTIVAR
if "%option%"=="2" goto REACTIVAR
if "%option%"=="3" exit
goto MENU

:DESACTIVAR
cls
echo Desactivando defensas de Windows...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $true"
powershell -Command "Set-MpPreference -DisableBlockAtFirstSeen $true"
powershell -Command "Set-MpPreference -DisableIOAVProtection $true"
powershell -Command "Set-MpPreference -DisablePrivacyMode $true"
powershell -Command "Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $true"
powershell -Command "Set-MpPreference -DisableArchiveScanning $true"
powershell -Command "Set-MpPreference -DisableIntrusionPreventionSystem $true"
powershell -Command "Set-MpPreference -DisableScriptScanning $true"
powershell -Command "Set-MpPreference -SubmitSamplesConsent 2"
powershell -Command "Set-MpPreference -MAPSReporting 0"
echo.
echo Defensas desactivadas correctamente.
pause
goto MENU

:REACTIVAR
cls
echo Reactivando defensas de Windows...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $false"
powershell -Command "Set-MpPreference -DisableBlockAtFirstSeen $false"
powershell -Command "Set-MpPreference -DisableIOAVProtection $false"
powershell -Command "Set-MpPreference -DisablePrivacyMode $false"
powershell -Command "Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $false"
powershell -Command "Set-MpPreference -DisableArchiveScanning $false"
powershell -Command "Set-MpPreference -DisableIntrusionPreventionSystem $false"
powershell -Command "Set-MpPreference -DisableScriptScanning $false"
powershell -Command "Set-MpPreference -SubmitSamplesConsent 1"
powershell -Command "Set-MpPreference -MAPSReporting 1"
echo.
echo Defensas reactivadas correctamente.
pause
goto MENU
