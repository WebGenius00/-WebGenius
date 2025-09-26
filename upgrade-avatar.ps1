# ================================================
# Web Genius Hub - Upgrade Avatar et Design
# ================================================

Write-Host "🎨 ===== UPGRADE WEB GENIUS HUB ===== 🎨" -ForegroundColor Cyan -BackgroundColor Black
Write-Host ""

# Vérifier si une image avatar existe
$imageFiles = @("webgenius-avatar.jpg", "webgenius-avatar.png", "webgenius-avatar.jpeg", "avatar.jpg", "avatar.png")
$foundImage = $null

Write-Host "🔍 Recherche de votre avatar..." -ForegroundColor Yellow

foreach ($imageName in $imageFiles) {
    $imagePath = "C:\xampp\htdocs\webgenius-hub\assets\images\$imageName"
    if (Test-Path $imagePath) {
        $foundImage = $imageName
        Write-Host "✅ Avatar trouvé : $imageName" -ForegroundColor Green
        break
    }
}

if (-not $foundImage) {
    Write-Host "📸 AVATAR NON TROUVÉ" -ForegroundColor Red
    Write-Host ""
    Write-Host "📋 INSTRUCTIONS :" -ForegroundColor Yellow
    Write-Host "1. Enregistrez votre photo anime dans :" -ForegroundColor White
    Write-Host "   📁 C:\xampp\htdocs\webgenius-hub\assets\images\" -ForegroundColor Blue
    Write-Host "2. Nommez-la : 'webgenius-avatar.jpg'" -ForegroundColor White
    Write-Host "3. Relancez ce script" -ForegroundColor White
    Write-Host ""
    
    # Ouvrir le dossier d'images
    $openFolder = Read-Host "Ouvrir le dossier images maintenant ? (o/n)"
    if ($openFolder -eq "o" -or $openFolder -eq "O") {
        Start-Process "C:\xampp\htdocs\webgenius-hub\assets\images"
    }
    exit 1
}

# Modifier index.html pour utiliser la vraie photo
Write-Host ""
Write-Host "🔧 Mise à jour du fichier HTML..." -ForegroundColor Cyan

$indexPath = "C:\xampp\htdocs\webgenius-hub\index.html"
$indexContent = Get-Content $indexPath -Raw

# Remplacer le SVG par la vraie photo
$indexContent = $indexContent -replace 'src="assets/images/webgenius-avatar\.svg"', "src=`"assets/images/$foundImage`""

# Sauvegarder les changements
Set-Content $indexPath $indexContent

Write-Host "✅ Avatar mis à jour dans index.html !" -ForegroundColor Green

# Créer une version optimisée du CSS pour l'avatar photo
Write-Host ""
Write-Host "🎨 Optimisation CSS pour photo réelle..." -ForegroundColor Cyan

$cssPath = "C:\xampp\htdocs\webgenius-hub\assets\css\style.css"
$cssContent = Get-Content $cssPath -Raw

# Ajouter des styles spécifiques pour photos réelles
$photoCSS = @"

/* ================================================
   STYLES OPTIMISÉS POUR PHOTO AVATAR RÉELLE
   ================================================ */

.avatar {
    /* Optimisations pour photos réelles */
    box-shadow: 
        0 0 0 4px var(--primary-color),
        0 20px 40px rgba(99, 102, 241, 0.3),
        0 0 60px rgba(99, 102, 241, 0.1);
    filter: brightness(1.05) contrast(1.1) saturate(1.1);
    transition: all var(--transition-normal);
}

.avatar:hover {
    transform: scale(1.08) rotateZ(2deg);
    box-shadow: 
        0 0 0 4px var(--primary-light),
        0 25px 50px rgba(99, 102, 241, 0.4),
        0 0 80px rgba(99, 102, 241, 0.2);
    filter: brightness(1.1) contrast(1.15) saturate(1.2);
}

/* Animation de pulsation subtile */
@keyframes photo-pulse {
    0%, 100% {
        box-shadow: 
            0 0 0 4px var(--primary-color),
            0 20px 40px rgba(99, 102, 241, 0.3);
    }
    50% {
        box-shadow: 
            0 0 0 6px var(--primary-light),
            0 25px 50px rgba(99, 102, 241, 0.4);
    }
}

.avatar {
    animation: photo-pulse 3s infinite ease-in-out;
}

/* Masque de brillance pour effet professionnel */
.avatar::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-radius: 50%;
    background: linear-gradient(135deg, 
        rgba(255, 255, 255, 0.15) 0%,
        transparent 50%,
        rgba(0, 0, 0, 0.1) 100%
    );
    pointer-events: none;
}

/* Effet de reflet sur hover */
.avatar:hover::after {
    background: linear-gradient(135deg, 
        rgba(255, 255, 255, 0.25) 0%,
        transparent 50%,
        rgba(0, 0, 0, 0.05) 100%
    );
}

"@

# Ajouter les nouveaux styles CSS
if ($cssContent -notlike "*STYLES OPTIMISÉS POUR PHOTO AVATAR RÉELLE*") {
    $cssContent += $photoCSS
    Set-Content $cssPath $cssContent
    Write-Host "✅ Styles photo ajoutés au CSS !" -ForegroundColor Green
} else {
    Write-Host "ℹ️  Styles photo déjà présents" -ForegroundColor Cyan
}

# Ajouter des améliorations visuelles supplémentaires
Write-Host ""
Write-Host "✨ Ajout d'améliorations visuelles..." -ForegroundColor Magenta

# Créer un fichier CSS d'améliorations
$enhancementsCSS = @"
/* ================================================
   WEB GENIUS HUB - AMÉLIORATIONS VISUELLES PRO
   ================================================ */

/* Effet de particules flottantes */
.floating-particles {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    z-index: 1;
}

.particle {
    position: absolute;
    width: 3px;
    height: 3px;
    background: var(--primary-color);
    border-radius: 50%;
    opacity: 0.4;
    animation: float-particle 15s infinite linear;
}

@keyframes float-particle {
    0% {
        transform: translateY(100vh) translateX(0);
        opacity: 0;
    }
    10% {
        opacity: 0.4;
    }
    90% {
        opacity: 0.4;
    }
    100% {
        transform: translateY(-100px) translateX(100px);
        opacity: 0;
    }
}

/* Amélioration du nom avec effet néon */
.name {
    text-shadow: 
        0 0 10px var(--primary-color),
        0 0 20px var(--primary-color),
        0 0 30px var(--primary-color);
    animation: glow-pulse 2s ease-in-out infinite alternate;
}

@keyframes glow-pulse {
    from {
        text-shadow: 
            0 0 10px var(--primary-color),
            0 0 20px var(--primary-color);
    }
    to {
        text-shadow: 
            0 0 15px var(--primary-color),
            0 0 25px var(--primary-color),
            0 0 35px var(--primary-color);
    }
}

/* Boutons sociaux avec effet glassmorphism */
.social-link {
    backdrop-filter: blur(15px);
    background: rgba(22, 33, 62, 0.8);
    border: 1px solid rgba(255, 255, 255, 0.15);
}

.social-link::before {
    background: linear-gradient(90deg, 
        transparent, 
        rgba(255, 255, 255, 0.15), 
        transparent
    );
}

.social-link:hover {
    background: rgba(22, 33, 62, 0.9);
    border-color: rgba(255, 255, 255, 0.25);
}

/* Effet de typing pour la description */
.tagline {
    border-right: 2px solid var(--primary-color);
    white-space: nowrap;
    overflow: hidden;
    animation: typing 3s steps(40) 1s 1 normal both, blink-caret 1s step-end infinite;
}

@keyframes typing {
    from { width: 0; }
    to { width: 100%; }
}

@keyframes blink-caret {
    from, to { border-color: transparent; }
    50% { border-color: var(--primary-color); }
}

/* Gradient animé pour le background */
body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle at 20% 20%, 
        rgba(99, 102, 241, 0.1) 0%,
        transparent 50%
    ),
    radial-gradient(circle at 80% 80%, 
        rgba(139, 92, 246, 0.1) 0%,
        transparent 50%
    );
    animation: gradient-shift 10s ease-in-out infinite;
    pointer-events: none;
    z-index: 0;
}

@keyframes gradient-shift {
    0%, 100% {
        opacity: 1;
    }
    50% {
        opacity: 0.7;
    }
}

/* Amélioration mobile */
@media (max-width: 480px) {
    .name {
        font-size: 2.2rem;
        text-shadow: 
            0 0 8px var(--primary-color),
            0 0 15px var(--primary-color);
    }
    
    .avatar {
        width: 110px;
        height: 110px;
        box-shadow: 
            0 0 0 3px var(--primary-color),
            0 15px 30px rgba(99, 102, 241, 0.25);
    }
}
"@

$enhancementsPath = "C:\xampp\htdocs\webgenius-hub\assets\css\enhancements.css"
Set-Content $enhancementsPath $enhancementsCSS

Write-Host "✅ Fichier d'améliorations créé !" -ForegroundColor Green

# Modifier le HTML pour inclure les améliorations
Write-Host ""
Write-Host "🔗 Intégration des améliorations dans HTML..." -ForegroundColor Cyan

$indexContent = Get-Content $indexPath -Raw

# Ajouter le lien vers les améliorations CSS
if ($indexContent -notlike "*enhancements.css*") {
    $indexContent = $indexContent -replace '(<link rel="stylesheet" href="assets/css/style\.css">)', "`$1`n    <link rel=`"stylesheet`" href=`"assets/css/enhancements.css`">"
    Set-Content $indexPath $indexContent
    Write-Host "✅ Améliorations CSS liées dans HTML !" -ForegroundColor Green
}

# Ajouter des particules flottantes dans le HTML
if ($indexContent -notlike "*floating-particles*") {
    $particlesHTML = @"
        
        <!-- Particules flottantes -->
        <div class="floating-particles">
            <div class="particle" style="left: 10%; animation-delay: 0s;"></div>
            <div class="particle" style="left: 20%; animation-delay: 2s;"></div>
            <div class="particle" style="left: 30%; animation-delay: 4s;"></div>
            <div class="particle" style="left: 40%; animation-delay: 6s;"></div>
            <div class="particle" style="left: 50%; animation-delay: 8s;"></div>
            <div class="particle" style="left: 60%; animation-delay: 1s;"></div>
            <div class="particle" style="left: 70%; animation-delay: 3s;"></div>
            <div class="particle" style="left: 80%; animation-delay: 5s;"></div>
            <div class="particle" style="left: 90%; animation-delay: 7s;"></div>
        </div>
"@
    
    $indexContent = $indexContent -replace '(</body>)', "$particlesHTML`n    `$1"
    Set-Content $indexPath $indexContent
    Write-Host "✅ Particules flottantes ajoutées !" -ForegroundColor Green
}

Write-Host ""
Write-Host "🎉 ===== UPGRADE TERMINÉ ! ===== 🎉" -ForegroundColor Green -BackgroundColor Black
Write-Host ""
Write-Host "✨ AMÉLIORATIONS APPORTÉES :" -ForegroundColor Cyan
Write-Host "  🖼️  Avatar photo intégré" -ForegroundColor White
Write-Host "  💎 Effet glassmorphism sur les boutons" -ForegroundColor White
Write-Host "  ✨ Particules flottantes animées" -ForegroundColor White
Write-Host "  🌟 Effet néon sur le nom" -ForegroundColor White
Write-Host "  📱 Optimisations mobile améliorées" -ForegroundColor White
Write-Host "  🎭 Animations de typing" -ForegroundColor White
Write-Host ""
Write-Host "🚀 TESTEZ VOTRE SITE : http://localhost/webgenius-hub/" -ForegroundColor Blue -BackgroundColor DarkBlue
Write-Host ""

$openSite = Read-Host "Ouvrir le site dans le navigateur ? (o/n)"
if ($openSite -eq "o" -or $openSite -eq "O") {
    Start-Process "http://localhost/webgenius-hub/"
    Write-Host "🌐 Site ouvert ! Admirez les améliorations !" -ForegroundColor Green
}

Write-Host ""
Write-Host "💡 PROCHAINES ÉTAPES :" -ForegroundColor Yellow
Write-Host "1. Vérifiez que votre avatar s'affiche correctement" -ForegroundColor White
Write-Host "2. Testez les nouvelles animations" -ForegroundColor White
Write-Host "3. Ajustez les liens sociaux si nécessaire" -ForegroundColor White
Write-Host "4. Déployez en ligne avec deploy-netlify.ps1" -ForegroundColor White