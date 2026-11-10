@echo off
chcp 65001 >nul
title Publication Portfolio vers GitHub — Baptiste Laffond
color 0F

echo ==============================================================================
echo    PORTFOLIO BAPTISTE LAFFOND — ENVOI AUTOMATIQUE VERS GITHUB
echo ==============================================================================
echo.

cd /d "%~dp0"

echo [1/3] Verification des fichiers du portfolio...
git branch -M main >nul 2>&1
git add .
git commit -m "Mise a jour Portfolio Baptiste Laffond" >nul 2>&1
echo     210 fichiers indexes et prets.
echo.

echo [2/3] Depot GitHub cible :
echo     https://github.com/Baptiste-archerDev/Portfolio-LAFFOND-Baptiste.git
echo.

echo [3/3] Envoi des fichiers en cours vers GitHub...
echo     (Si une fenetre de navigateur s'ouvre, cliquez sur "Authorize" ou "Sign in")
echo.

git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ==============================================================================
    echo    SUCCES ! Vos 210 fichiers sont maintenant en ligne sur GitHub !
    echo ==============================================================================
    echo.
    echo Votre depot : https://github.com/Baptiste-archerDev/Portfolio-LAFFOND-Baptiste
    echo.
    echo Pour activer l'hebergement public gratuit GitHub Pages :
    echo   1. Rendez-vous sur : https://github.com/Baptiste-archerDev/Portfolio-LAFFOND-Baptiste/settings/pages
    echo   2. Dans 'Source', selectionnez la branche 'main' et dossier '/(root)', puis cliquez sur 'Save'
    echo.
    echo Votre site sera en ligne a l'adresse :
    echo   https://baptiste-archerdev.github.io/Portfolio-LAFFOND-Baptiste/
    echo.
) else (
    echo.
    echo ==============================================================================
    echo    ATTENTION : L'envoi n'a pas pu aboutir.
    echo ==============================================================================
    echo.
    echo Verifications :
    echo   1. Le depot https://github.com/Baptiste-archerDev/Portfolio-LAFFOND-Baptiste
    echo      doit bien exister sur votre compte GitHub.
    echo   2. Si GitHub demande une autorisation de connexion dans votre navigateur,
    echo      cliquez sur 'Authorize'.
    echo.
)

pause
