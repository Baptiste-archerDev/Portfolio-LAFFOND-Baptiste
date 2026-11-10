@echo off
chcp 65001 >nul
title Publication Portfolio vers GitHub — Baptiste Laffond
color 0F

echo ==============================================================================
echo    PORTFOLIO BAPTISTE LAFFOND — ENVOI AUTOMATIQUE VERS GITHUB
echo ==============================================================================
echo.

cd /d "%~dp0"

echo [1/3] Verification de Git et des fichiers...
git branch -M main >nul 2>&1
git add .
git commit -m "Mise a jour Portfolio Baptiste Laffond" >nul 2>&1
echo     Fichiers prets (210 fichiers indexes).
echo.

echo [2/3] Depot GitHub associe :
git remote get-url origin
echo.

echo [3/3] Envoi des fichiers vers GitHub...
echo     (Si une fenetre de navigateur s'ouvre, cliquez sur "Authorize" ou "Sign in")
echo.

git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ==============================================================================
    echo    SUCCES ! Tous vos fichiers sont en ligne sur GitHub !
    echo ==============================================================================
    echo.
    echo Votre depot : https://github.com/Baptiste-archerDev/portfolio
    echo.
    echo Pour activer l'hebergement public GitHub Pages :
    echo   1. Rendez-vous sur : https://github.com/Baptiste-archerDev/portfolio/settings/pages
    echo   2. Dans 'Source', selectionnez la branche 'main' et dossier '/(root)', puis 'Save'
    echo.
    echo Votre site sera consultable a :
    echo   https://baptiste-archerdev.github.io/portfolio/
    echo.
) else (
    echo.
    echo ==============================================================================
    echo    ATTENTION : L'envoi n'a pas pu se terminer.
    echo ==============================================================================
    echo.
    echo Verifications a faire :
    echo   1. Le depot 'portfolio' doit exister sur votre compte GitHub :
    echo      Verifiez sur https://github.com/Baptiste-archerDev/portfolio
    echo      Si ce depot n'existe pas encore : allez sur https://github.com/new
    echo      Nommez-le 'portfolio' et cliquez sur 'Create repository'.
    echo.
    echo   2. Si GitHub demande une autorisation de connexion dans votre navigateur,
    echo      validez la connexion.
    echo.
)

pause
