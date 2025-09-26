# ================================================
# Web Genius Hub - Déploiement Automatique Netlify
# ================================================

Write-Host "🚀 ===== DÉPLOIEMENT WEB GENIUS HUB ===== 🚀" -ForegroundColor Green -BackgroundColor Black
Write-Host ""
Write-Host "🎯 Objectif : Mettre votre site en ligne en 2 minutes !" -ForegroundColor Cyan
Write-Host ""

# Vérifier si Node.js est installé
Write-Host "🔍 Vérification des prérequis..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version 2>$null
    Write-Host "✅ Node.js installé : $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js NON installé !" -ForegroundColor Red
    Write-Host ""
    Write-Host "📥 INSTALLATION REQUISE :" -ForegroundColor Yellow
    Write-Host "1. Allez sur https://nodejs.org" -ForegroundColor White
    Write-Host "2. Téléchargez et installez Node.js" -ForegroundColor White
    Write-Host "3. Relancez ce script" -ForegroundColor White
    Write-Host ""
    $openNodeSite = Read-Host "Ouvrir le site Node.js maintenant ? (o/n)"
    if ($openNodeSite -eq "o" -or $openNodeSite -eq "O") {
        Start-Process "https://nodejs.org"
    }
    exit 1
}

Write-Host ""
Write-Host "📦 Installation de Netlify CLI..." -ForegroundColor Cyan

# Installer Netlify CLI globalement
try {
    npm install -g netlify-cli
    Write-Host "✅ Netlify CLI installé avec succès !" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Problème d'installation, continuons..." -ForegroundColor Orange
}

Write-Host ""
Write-Host "🌐 Options de déploiement :" -ForegroundColor Magenta
Write-Host ""
Write-Host "1️⃣ NETLIFY (Recommandé - Drag & Drop)" -ForegroundColor Green
Write-Host "   • Ultra simple, juste glisser-déposer" -ForegroundColor White
Write-Host "   • URL: https://webgenius-hub.netlify.app" -ForegroundColor Blue
Write-Host ""
Write-Host "2️⃣ SURGE.SH (Ultra rapide)" -ForegroundColor Green  
Write-Host "   • Déploiement en ligne de commande" -ForegroundColor White
Write-Host "   • URL: https://webgenius-hub.surge.sh" -ForegroundColor Blue
Write-Host ""

$choice = Read-Host "Choisissez votre méthode (1 ou 2)"

if ($choice -eq "1") {
    Write-Host ""
    Write-Host "🎯 MÉTHODE NETLIFY SÉLECTIONNÉE" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 ÉTAPES À SUIVRE :" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "1️⃣ Je vais ouvrir netlify.com pour vous" -ForegroundColor White
    Write-Host "2️⃣ Créez un compte (gratuit)" -ForegroundColor White
    Write-Host "3️⃣ Glissez-déposez votre dossier webgenius-hub" -ForegroundColor White
    Write-Host "4️⃣ Votre site sera en ligne instantanément !" -ForegroundColor White
    Write-Host ""
    
    $confirm = Read-Host "Prêt ? Je vais ouvrir Netlify (o/n)"
    if ($confirm -eq "o" -or $confirm -eq "O") {
        Write-Host "🌐 Ouverture de Netlify..." -ForegroundColor Cyan
        Start-Process "https://app.netlify.com/drop"
        
        Write-Host ""
        Write-Host "📁 Ouverture de votre dossier de projet..." -ForegroundColor Cyan
        Start-Process "C:\xampp\htdocs\webgenius-hub"
        
        Write-Host ""
        Write-Host "✨ INSTRUCTIONS FINALES :" -ForegroundColor Green
        Write-Host "1. Dans Netlify, glissez le dossier 'webgenius-hub' sur la zone" -ForegroundColor White
        Write-Host "2. Attendez le déploiement (30 secondes)" -ForegroundColor White
        Write-Host "3. Cliquez sur 'Site settings' > 'Change site name'" -ForegroundColor White
        Write-Host "4. Tapez: webgenius-hub" -ForegroundColor White
        Write-Host "5. Votre URL sera: https://webgenius-hub.netlify.app" -ForegroundColor Blue
        Write-Host ""
        Write-Host "🎉 FÉLICITATIONS ! Votre site sera en ligne !" -ForegroundColor Green
    }

} elseif ($choice -eq "2") {
    Write-Host ""
    Write-Host "⚡ MÉTHODE SURGE.SH SÉLECTIONNÉE" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "📦 Installation de Surge..." -ForegroundColor Cyan
    try {
        npm install -g surge
        Write-Host "✅ Surge installé avec succès !" -ForegroundColor Green
    } catch {
        Write-Host "❌ Erreur d'installation de Surge" -ForegroundColor Red
        exit 1
    }
    
    Write-Host ""
    Write-Host "🚀 Déploiement en cours..." -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📋 Vous allez devoir :" -ForegroundColor Yellow
    Write-Host "1. Entrer votre email" -ForegroundColor White
    Write-Host "2. Créer un mot de passe" -ForegroundColor White
    Write-Host "3. Confirmer le domaine: webgenius-hub.surge.sh" -ForegroundColor White
    Write-Host ""
    
    # Changer vers le répertoire du projet
    Set-Location "C:\xampp\htdocs\webgenius-hub"
    
    # Lancer Surge
    surge
    
    Write-Host ""
    Write-Host "🎉 Si tout s'est bien passé, votre site est en ligne !" -ForegroundColor Green
    Write-Host "🌐 URL: https://webgenius-hub.surge.sh" -ForegroundColor Blue
    
} else {
    Write-Host "❌ Choix invalide. Relancez le script." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📊 STATISTIQUES DE VOTRE DÉPLOIEMENT :" -ForegroundColor Magenta
$totalFiles = (Get-ChildItem -Recurse -File).Count
$totalSize = [math]::Round((Get-ChildItem -Recurse -File | Measure-Object -Property Length -Sum).Sum / 1KB, 1)

Write-Host "📁 Fichiers déployés: $totalFiles" -ForegroundColor White
Write-Host "💾 Taille totale: $totalSize KB" -ForegroundColor White
Write-Host ""

Write-Host "🎯 ÉTAPES SUIVANTES :" -ForegroundColor Cyan
Write-Host "1. ✅ Tester votre site sur mobile" -ForegroundColor White
Write-Host "2. 🔗 Mettre à jour vos liens sociaux" -ForegroundColor White
Write-Host "3. 📊 Configurer Google Analytics" -ForegroundColor White
Write-Host "4. 🌟 Partager sur vos réseaux sociaux !" -ForegroundColor White
Write-Host ""
Write-Host "🚀 VOTRE WEB GENIUS HUB EST MAINTENANT MONDIAL ! 🚀" -ForegroundColor Green -BackgroundColor Black