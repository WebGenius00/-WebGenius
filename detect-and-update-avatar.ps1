# ================================================
# Web Genius Hub - Détection et mise à jour automatique de l'avatar
# ================================================

Write-Host "🔍 ===== DÉTECTION AUTOMATIQUE DE L'AVATAR ===== 🔍" -ForegroundColor Green -BackgroundColor Black
Write-Host ""

# Surveillance continue de l'avatar
$maxAttempts = 60  # 1 minute d'attente
$attemptCount = 0

Write-Host "📸 Recherche de votre avatar anime..." -ForegroundColor Cyan
Write-Host "⏱️  Surveillance active (60 secondes maximum)..." -ForegroundColor Gray

while ($attemptCount -lt $maxAttempts) {
    # Vérifier tous les formats d'image possibles
    $imageFiles = @(
        "webgenius-avatar.jpg", 
        "webgenius-avatar.png", 
        "webgenius-avatar.jpeg",
        "avatar.jpg",
        "avatar.png",
        "avatar.jpeg"
    )
    
    $foundImage = $null
    
    foreach ($imageName in $imageFiles) {
        $imagePath = "C:\xampp\htdocs\webgenius-hub\assets\images\$imageName"
        if (Test-Path $imagePath) {
            $foundImage = $imageName
            $imageSize = [math]::Round((Get-Item $imagePath).Length / 1KB, 1)
            Write-Host ""
            Write-Host "🎉 AVATAR TROUVÉ !" -ForegroundColor Green -BackgroundColor DarkGreen
            Write-Host "✅ Fichier: $imageName" -ForegroundColor White
            Write-Host "📊 Taille: $imageSize KB" -ForegroundColor White
            break
        }
    }
    
    if ($foundImage) {
        Write-Host ""
        Write-Host "🔧 Mise à jour automatique en cours..." -ForegroundColor Yellow
        
        # Mise à jour du HTML
        try {
            $indexPath = "C:\xampp\htdocs\webgenius-hub\index.html"
            $indexContent = Get-Content $indexPath -Raw
            
            # Remplacer toutes les références d'avatar par la nouvelle image
            $indexContent = $indexContent -replace 'assets/images/webgenius-avatar\.svg', "assets/images/$foundImage"
            $indexContent = $indexContent -replace 'assets/images/webgenius-avatar\.jpg', "assets/images/$foundImage"
            $indexContent = $indexContent -replace 'assets/images/webgenius-avatar\.png', "assets/images/$foundImage"
            
            Set-Content $indexPath $indexContent
            Write-Host "✅ HTML mis à jour !" -ForegroundColor Green
            
        } catch {
            Write-Host "⚠️  Erreur lors de la mise à jour HTML: $($_.Exception.Message)" -ForegroundColor Orange
        }
        
        Write-Host ""
        Write-Host "🎨 ===== TRANSFORMATION TERMINÉE ! ===== 🎨" -ForegroundColor Green -BackgroundColor Black
        Write-Host ""
        Write-Host "✨ AMÉLIORATIONS APPLIQUÉES :" -ForegroundColor Cyan
        Write-Host "  🖼️  Avatar anime intégré" -ForegroundColor White
        Write-Host "  💫 Particules flottantes animées" -ForegroundColor White
        Write-Host "  🌟 Effet néon sur le nom" -ForegroundColor White
        Write-Host "  💎 Glassmorphism sur les boutons" -ForegroundColor White
        Write-Host "  🎭 Animation de typing" -ForegroundColor White
        Write-Host "  📱 Optimisations mobile" -ForegroundColor White
        Write-Host ""
        Write-Host "🚀 TESTEZ MAINTENANT :" -ForegroundColor Yellow
        Write-Host "👉 http://localhost/webgenius-hub/" -ForegroundColor Blue -BackgroundColor DarkBlue
        Write-Host ""
        
        # Demander si on ouvre le site
        $openSite = Read-Host "Ouvrir le site dans le navigateur pour voir le résultat ? (o/n)"
        if ($openSite -eq "o" -or $openSite -eq "O" -or $openSite -eq "oui") {
            Start-Process "http://localhost/webgenius-hub/"
            Write-Host "🌐 Site ouvert ! Admirez votre nouveau look de créateur pro !" -ForegroundColor Green
        }
        
        Write-Host ""
        Write-Host "🎯 PROCHAINES ÉTAPES :" -ForegroundColor Magenta
        Write-Host "1. ✅ Vérifiez que votre avatar s'affiche correctement" -ForegroundColor White
        Write-Host "2. 🔗 Mettez à jour vos liens sociaux dans assets/js/main.js" -ForegroundColor White
        Write-Host "3. 📱 Testez sur mobile" -ForegroundColor White
        Write-Host "4. 🌍 Déployez en ligne avec deploy-netlify.ps1" -ForegroundColor White
        Write-Host "5. 🎉 Partagez sur vos réseaux sociaux !" -ForegroundColor White
        
        break
    }
    
    # Attendre 1 seconde et réessayer
    Start-Sleep -Seconds 1
    $attemptCount++
    
    # Afficher un point toutes les 5 secondes pour montrer l'activité
    if ($attemptCount % 5 -eq 0) {
        Write-Host "." -NoNewline -ForegroundColor Gray
    }
}

if (-not $foundImage) {
    Write-Host ""
    Write-Host "⏰ Temps d'attente écoulé..." -ForegroundColor Orange
    Write-Host ""
    Write-Host "📸 AVATAR NON TROUVÉ" -ForegroundColor Red
    Write-Host ""
    Write-Host "📋 VÉRIFIEZ :" -ForegroundColor Yellow
    Write-Host "• L'image est bien sauvegardée dans le bon dossier" -ForegroundColor White
    Write-Host "• Le nom est exact : webgenius-avatar.jpg" -ForegroundColor White
    Write-Host "• Le format est supporté (jpg, png, jpeg)" -ForegroundColor White
    Write-Host ""
    Write-Host "🔄 POUR RÉESSAYER :" -ForegroundColor Cyan
    Write-Host "1. Sauvegardez votre image avec le bon nom" -ForegroundColor White
    Write-Host "2. Relancez ce script ou upgrade-avatar.ps1" -ForegroundColor White
    Write-Host ""
    
    # Ouvrir le dossier pour faciliter la sauvegarde
    $openFolder = Read-Host "Ouvrir le dossier images pour sauvegarder maintenant ? (o/n)"
    if ($openFolder -eq "o" -or $openFolder -eq "O") {
        Start-Process "C:\xampp\htdocs\webgenius-hub\assets\images"
    }
}

Write-Host ""
Write-Host "✨ Script terminé ! ✨" -ForegroundColor Green