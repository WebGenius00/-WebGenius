# ================================================
# Web Genius Hub - Script de démarrage serveur
# ================================================

Write-Host "🚀 Démarrage du serveur Web Genius..." -ForegroundColor Cyan
Write-Host ""

# Vérifier si Apache est déjà en cours
$apacheProcess = Get-Process -Name "httpd" -ErrorAction SilentlyContinue

if ($apacheProcess) {
    Write-Host "✅ Apache est déjà en cours d'exécution" -ForegroundColor Green
    Write-Host "📊 Processus Apache: $($apacheProcess.Count) instance(s)" -ForegroundColor Gray
} else {
    Write-Host "🔄 Démarrage d'Apache..." -ForegroundColor Yellow
    
    try {
        # Démarrer Apache en mode standalone
        Start-Process -FilePath "C:\xampp\apache\bin\httpd.exe" -WorkingDirectory "C:\xampp\apache\bin" -WindowStyle Hidden
        
        # Attendre le démarrage
        Start-Sleep -Seconds 3
        
        # Vérifier le démarrage
        $newApacheProcess = Get-Process -Name "httpd" -ErrorAction SilentlyContinue
        
        if ($newApacheProcess) {
            Write-Host "✅ Apache démarré avec succès !" -ForegroundColor Green
        } else {
            Write-Host "❌ Échec du démarrage d'Apache" -ForegroundColor Red
            exit 1
        }
    } catch {
        Write-Host "❌ Erreur lors du démarrage: $($_.Exception.Message)" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "🌐 Test de connectivité..." -ForegroundColor Cyan

try {
    $response = Invoke-WebRequest -Uri "http://localhost" -TimeoutSec 5 -UseBasicParsing -ErrorAction Stop
    Write-Host "✅ Serveur accessible sur localhost" -ForegroundColor Green
    
    # Tester le site Web Genius Hub
    try {
        $siteResponse = Invoke-WebRequest -Uri "http://localhost/webgenius-hub/" -TimeoutSec 5 -UseBasicParsing -ErrorAction Stop
        Write-Host "🎉 Site Web Genius Hub accessible !" -ForegroundColor Green -BackgroundColor DarkGreen
    } catch {
        Write-Host "⚠️  Site Web Genius Hub non accessible" -ForegroundColor Orange
    }
    
} catch {
    Write-Host "❌ Serveur non accessible: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎯 SERVEUR PRÊT !" -ForegroundColor Green -BackgroundColor Black
Write-Host ""
Write-Host "📍 Vos URLs :" -ForegroundColor Yellow
Write-Host "   🏠 XAMPP Dashboard: http://localhost/" -ForegroundColor Blue
Write-Host "   🌟 Web Genius Hub:  http://localhost/webgenius-hub/" -ForegroundColor Magenta
Write-Host ""
Write-Host "📋 Commandes utiles :" -ForegroundColor Gray
Write-Host "   • Pour arrêter Apache: .\stop-server.ps1" -ForegroundColor White
Write-Host "   • Pour redémarrer:    .\restart-server.ps1" -ForegroundColor White
Write-Host ""
Write-Host "💡 TIP: Gardez cette fenêtre ouverte ou créez un raccourci !" -ForegroundColor Cyan

# Optionnel: Ouvrir automatiquement le navigateur
$openBrowser = Read-Host "Voulez-vous ouvrir le site dans le navigateur ? (o/n)"
if ($openBrowser -eq "o" -or $openBrowser -eq "O" -or $openBrowser -eq "oui") {
    Start-Process "http://localhost/webgenius-hub/"
    Write-Host "🌐 Navigateur ouvert !" -ForegroundColor Green
}

Write-Host ""
Write-Host "✨ Serveur Web Genius Hub opérationnel ! ✨" -ForegroundColor Green