# ================================================
# Web Genius Hub - Script d'arrêt serveur
# ================================================

Write-Host "🛑 Arrêt du serveur Web Genius..." -ForegroundColor Red
Write-Host ""

# Vérifier si Apache est en cours
$apacheProcesses = Get-Process -Name "httpd" -ErrorAction SilentlyContinue

if ($apacheProcesses) {
    Write-Host "📊 Processus Apache trouvés: $($apacheProcesses.Count) instance(s)" -ForegroundColor Gray
    
    try {
        Write-Host "🔄 Arrêt des processus Apache..." -ForegroundColor Yellow
        
        # Arrêter tous les processus Apache
        $apacheProcesses | Stop-Process -Force
        
        # Attendre l'arrêt
        Start-Sleep -Seconds 2
        
        # Vérifier l'arrêt
        $remainingProcesses = Get-Process -Name "httpd" -ErrorAction SilentlyContinue
        
        if (-not $remainingProcesses) {
            Write-Host "✅ Apache arrêté avec succès !" -ForegroundColor Green
        } else {
            Write-Host "⚠️  Certains processus Apache sont encore actifs" -ForegroundColor Orange
            Write-Host "📊 Processus restants: $($remainingProcesses.Count)" -ForegroundColor Gray
        }
        
    } catch {
        Write-Host "❌ Erreur lors de l'arrêt: $($_.Exception.Message)" -ForegroundColor Red
    }
    
} else {
    Write-Host "ℹ️  Aucun processus Apache en cours d'exécution" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "🌐 Test de connectivité..." -ForegroundColor Cyan

try {
    $response = Invoke-WebRequest -Uri "http://localhost" -TimeoutSec 2 -UseBasicParsing -ErrorAction Stop
    Write-Host "⚠️  Le serveur répond encore (Code: $($response.StatusCode))" -ForegroundColor Orange
} catch {
    Write-Host "✅ Serveur arrêté - localhost n'est plus accessible" -ForegroundColor Green
}

Write-Host ""
Write-Host "🎯 ARRÊT TERMINÉ !" -ForegroundColor Red -BackgroundColor Black
Write-Host ""
Write-Host "📋 Pour redémarrer le serveur :" -ForegroundColor Gray
Write-Host "   • Exécutez: .\start-server.ps1" -ForegroundColor White
Write-Host ""
Write-Host "💡 Votre site sera de nouveau accessible après redémarrage" -ForegroundColor Cyan