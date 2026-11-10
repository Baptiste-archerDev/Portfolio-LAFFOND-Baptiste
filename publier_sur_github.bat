@echo off
chcp 65001 >nul
title Déploiement Portfolio GitHub — Baptiste Laffond
color 0F

echo ==============================================================================
echo    PORTFOLIO BAPTISTE LAFFOND — DÉPLOIEMENT EN 1 CLIC SUR GITHUB
echo ==============================================================================
echo.

:: S'assurer que le script travaille dans le bon dossier
cd /d "%~dp0"

:: 1. Vérification de la présence de Git
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERREUR] Git n'est pas installe sur cet ordinateur.
    echo Telechargez Git gratuitement sur : https://git-scm.com/download/win
    echo Puis relancez ce fichier.
    echo.
    pause
    exit /b
)

echo [1/5] Verification de Git : OK.
echo.

:: 2. Initialisation du dépôt Git local
if not exist ".git" (
    echo [2/5] Initialisation du repertoire Git local...
    git init
    git branch -M main
) else (
    echo [2/5] Repertoire Git local deja initialise.
    git branch -M main >nul 2>&1
)
echo.

:: 3. Ajout des fichiers selon .gitignore
echo [3/5] Indexation des fichiers du portfolio...
git add .
git commit -m "Mise a jour Portfolio Baptiste Laffond" >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo     Commit effectue avec succes.
) else (
    echo     Aucun nouveau fichier a valider ou deja a jour.
)
echo.

:: 4. Vérification ou saisie de l'URL distante GitHub
git remote get-url origin >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [4/5] Configuration du lien vers GitHub...
    echo.
    echo Veuillez coller l'URL de votre depot GitHub
    echo (Exemple : https://github.com/votre-pseudo/portfolio.git) :
    set /p REPO_URL="URL du depot : "
    
    if "%REPO_URL%"=="" (
        echo [ANNULATION] Aucune URL fournie. Le depot local est pret, vous pourrez le lier plus tard.
        pause
        exit /b
    )
    git remote add origin %REPO_URL%
) else (
    echo [4/5] Depot GitHub distant deja configure :
    git remote get-url origin
)
echo.

:: 5. Envoi vers GitHub
echo [5/5] Envoi des fichiers vers la branche main sur GitHub...
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ==============================================================================
    echo    SUCCES ! Votre portfolio est publie sur GitHub avec succes !
    echo ==============================================================================
    echo.
    echo Pour activer l'hebergement gratuit GitHub Pages :
    echo   1. Allez sur votre depot GitHub dans votre navigateur
    echo   2. Cliquez sur 'Settings' -^> 'Pages' (dans le menu de gauche)
    echo   3. Dans 'Build and deployment', choisissez 'GitHub Actions' (ou branche 'main')
    echo   4. Votre site est accessible mondialement en quelques secondes !
    echo.
) else (
    echo.
    echo [ATTENTION] L'envoi vers GitHub a rencontre un souci.
    echo Verifiez :
    echo   - Votre connexion Internet
    echo   - Que vous etes bien connecte a votre compte GitHub
    echo   - Que le depot distant existe bien sur GitHub
    echo.
)

pause
