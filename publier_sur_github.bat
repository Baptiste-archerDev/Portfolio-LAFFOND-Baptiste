@echo off
chcp 65001 >nul
title Déploiement Portfolio GitHub — Baptiste Laffond
color 0F

echo ==============================================================================
echo    PORTFOLIO BAPTISTE LAFFOND — DÉPLOIEMENT AUTOMATIQUE VERS GITHUB
echo ==============================================================================
echo.

:: Se positionner dans le dossier du portfolio
cd /d "%~dp0"

:: 1. Vérification de Git
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERREUR] Git n'est pas installe sur cet ordinateur.
    echo Telechargez Git : https://git-scm.com/download/win
    echo.
    pause
    exit /b
)

echo [1/4] Git detecte : OK.
echo.

:: 2. Initialisation et validation des fichiers
echo [2/4] Preparation des fichiers du portfolio...
if not exist ".git" (
    git init -b main >nul 2>&1
)
git branch -M main >nul 2>&1
git add .
git commit -m "Mise a jour Portfolio Baptiste Laffond" >nul 2>&1
echo     Fichiers indexes et prets pour l'envoi.
echo.

:: 3. Configuration du dépôt distant
git remote get-url origin >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [3/4] Liaison avec votre compte GitHub :
    echo     Compte GitHub detecte : Baptiste-archerDev
    echo.
    echo Avez-vous cree un depot sur https://github.com/new ?
    echo Tapez le nom de votre depot GitHub (ex: portfolio)
    set REPO_NAME=portfolio
    set /p REPO_NAME="Nom du depot [Appuyez sur Entree pour 'portfolio'] : "
    
    git remote add origin https://github.com/Baptiste-archerDev/%REPO_NAME%.git
    echo.
    echo     Lien associe : https://github.com/Baptiste-archerDev/%REPO_NAME%.git
) else (
    echo [3/4] Depot GitHub deja configure :
    git remote get-url origin
)
echo.

:: 4. Envoi des fichiers vers GitHub
echo [4/4] Envoi en cours vers GitHub (cela ne prend que quelques secondes)...
echo.
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ==============================================================================
    echo    SUCCES ! Vos 210 fichiers sont maintenant sur GitHub !
    echo ==============================================================================
    echo.
    echo Pour voir votre site en ligne gratuitement (GitHub Pages) :
    echo   1. Allez sur https://github.com/Baptiste-archerDev/portfolio/settings/pages
    echo   2. Dans 'Source', choisissez 'Deploy from a branch'
    echo   3. Selectionnez la branche 'main' et le dossier '/(root)', puis 'Save'
    echo.
    echo Votre site sera en ligne sur :
    echo   https://baptiste-archerdev.github.io/portfolio/
    echo.
) else (
    echo.
    echo ------------------------------------------------------------------------------
    echo [NOTE D'AUTHENTIFICATION]
    echo Si une fenetre s'est ouverte pour vous connecter a GitHub, validez-la.
    echo Si le depot n'existe pas encore sur GitHub :
    echo   1. Rendez-vous sur https://github.com/new
    echo   2. Nommez-le 'portfolio' (sans cocher 'Add README')
    echo   3. Cliquez sur 'Create repository'
    echo   4. Relancez ce fichier !
    echo ------------------------------------------------------------------------------
    echo.
)

pause
