@echo off
title Web Genius Hub - Serveur Local
color 0A

echo.
echo  ===================================
echo   WEB GENIUS HUB - SERVEUR LOCAL  
echo  ===================================
echo.
echo  🚀 Demarrage du serveur...
echo.

REM Changer vers le répertoire XAMPP
cd /d C:\xampp

REM Vérifier si Apache est déjà en cours
tasklist /FI "IMAGENAME eq httpd.exe" 2>NUL | find /I /N "httpd.exe" >NUL
if "%ERRORLEVEL%"=="0" (
    echo  ✅ Apache est deja en cours
    goto :test_server
)

REM Démarrer Apache
echo  🔄 Lancement d'Apache...
start /min apache\bin\httpd.exe
timeout /t 3 /nobreak >nul

:test_server
echo.
echo  🌐 Test de connectivite...
curl -s -o nul -w "%%{http_code}" http://localhost >temp_result.txt
set /p HTTP_CODE=<temp_result.txt
del temp_result.txt >nul 2>&1

if "%HTTP_CODE%"=="200" (
    echo  ✅ Serveur accessible !
    echo.
    echo  🎯 SERVEUR PRET !
    echo.
    echo  📍 Vos URLs :
    echo     🏠 XAMPP: http://localhost/
    echo     🌟 Web Genius: http://localhost/webgenius-hub/
    echo.
    
    set /p OPEN_BROWSER="  Ouvrir le site dans le navigateur ? (o/n): "
    if /i "%OPEN_BROWSER%"=="o" (
        start http://localhost/webgenius-hub/
        echo  🌐 Navigateur ouvert !
    )
) else (
    echo  ❌ Serveur non accessible
    echo     Code HTTP: %HTTP_CODE%
)

echo.
echo  💡 Gardez cette fenetre ouverte pour que le serveur reste actif
echo  📋 Pour arreter le serveur, fermez cette fenetre
echo.
pause