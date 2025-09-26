# ===== SCRIPT AUTOMATIQUE GOJO =====
# Détecte automatiquement votre image et l'intègre

Write-Host "🚀 ===== AUTO-GOJO ACTIVÉ ===== 🚀" -ForegroundColor Green -BackgroundColor Black
Write-Host ""

$imagePath = "C:\xampp\htdocs\webgenius-hub\assets\images"
$targetName = "gojo1.jpg"

# Ouverture du dossier pour faciliter le glisser-déposer
Write-Host "📂 Ouverture du dossier images..." -ForegroundColor Yellow
Start-Process $imagePath

Write-Host "✅ Dossier ouvert !" -ForegroundColor Green
Write-Host ""
Write-Host "🎯 INSTRUCTIONS ULTRA-SIMPLES :" -ForegroundColor Cyan -BackgroundColor DarkBlue
Write-Host ""
Write-Host "1️⃣ GLISSEZ votre image Gojo dans le dossier ouvert" -ForegroundColor Green
Write-Host "2️⃣ RENOMMEZ-la en : gojo1.jpg" -ForegroundColor Green
Write-Host "3️⃣ C'EST TOUT ! Le site l'utilisera automatiquement" -ForegroundColor Green
Write-Host ""
Write-Host "👁️ SURVEILLANCE ACTIVE..." -ForegroundColor Yellow
Write-Host "   Je surveille l'apparition de gojo1.jpg..." -ForegroundColor Gray

$counter = 0
$maxWait = 300 # 5 minutes max
$found = $false

do {
    Start-Sleep -Seconds 2
    $counter += 2
    
    # Vérification de gojo1.jpg
    if (Test-Path "$imagePath\$targetName") {
        Write-Host ""
        Write-Host "🎉 GOJO1.JPG DÉTECTÉ !" -ForegroundColor Green -BackgroundColor DarkGreen
        
        $file = Get-Item "$imagePath\$targetName"
        Write-Host "   📁 Fichier : $($file.Name)" -ForegroundColor White
        Write-Host "   📊 Taille : $([math]::Round($file.Length/1KB, 2)) KB" -ForegroundColor White
        Write-Host "   ⏰ Créé : $($file.CreationTime)" -ForegroundColor White
        Write-Host ""
        Write-Host "✅ PARFAIT ! Votre image est prête !" -ForegroundColor Green
        Write-Host ""
        Write-Host "🚀 Ouverture du site..." -ForegroundColor Yellow
        Start-Process "http://localhost/webgenius-hub"
        Write-Host "🌐 Site ouvert avec votre vraie image Gojo !" -ForegroundColor Green
        
        $found = $true
        break
    }
    
    # Message de progression toutes les 10 secondes
    if ($counter % 10 -eq 0) {
        Write-Host "⏱️ Attente... ($counter s) - En attente de votre image" -ForegroundColor Gray
        Write-Host "💡 Glissez et renommez votre image en gojo1.jpg" -ForegroundColor Yellow
    }
    
} while ($counter -lt $maxWait)

if (-not $found) {
    Write-Host ""
    Write-Host "⏰ Temps d'attente écoulé (5 min)" -ForegroundColor Yellow
    Write-Host "💭 Relancez le script quand vous êtes prêt !" -ForegroundColor White
    Write-Host "🎯 Commande : .\auto-gojo.ps1" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "📋 RAPPEL :" -ForegroundColor Yellow
Write-Host "   • Votre image doit s'appeler exactement : gojo1.jpg" -ForegroundColor White
Write-Host "   • Elle doit être dans : assets/images/" -ForegroundColor White
Write-Host "   • Le site la détectera automatiquement !" -ForegroundColor White