# 🌟 Web Genius Hub - Site de Présence Sociale

Un site élégant et moderne pour centraliser tous vos liens de réseaux sociaux et présenter votre marque Web Genius de manière professionnelle.

## 🎯 Fonctionnalités

- ✨ **Design moderne** avec animations fluides
- 📱 **Responsive** - Compatible mobile, tablette, desktop
- 🎨 **Thème sombre** avec effets de parallax
- 🔗 **Liens sociaux** vers tous vos comptes (YouTube, Instagram, Facebook, Discord, Snapchat)
- 📊 **Analytics** intégrées pour tracker les clics
- ⚡ **Performance optimisée** avec lazy loading
- ♿ **Accessible** avec navigation clavier
- 🎭 **Animations interactives** et effets visuels

## 📋 Personnalisation

### 1. Avatar/Photo de profil
- Remplacez `assets/images/webgenius-avatar.jpg` par votre photo
- Formats recommandés : JPG, PNG (carré, min. 300x300px)

### 2. Liens des réseaux sociaux
Modifiez dans `assets/js/main.js` (lignes 8-15) :

```javascript
socialLinks: {
    youtube: 'https://www.youtube.com/@VOTRE_CHAINE',
    instagram: 'https://www.instagram.com/VOTRE_COMPTE',
    facebook: 'https://www.facebook.com/VOTRE_PAGE',
    discord: 'https://discord.gg/VOTRE_SERVEUR',
    snapchat: 'https://www.snapchat.com/add/VOTRE_SNAP',
    email: 'mailto:votre@email.com'
}
```

### 3. Informations personnelles
Dans `index.html`, modifiez :
- Ligne 35 : `<h1 class="name">Votre Nom</h1>`
- Ligne 36 : `<p class="tagline">Votre Description</p>`
- Lignes 37-40 : Votre présentation personnelle

### 4. Couleurs et thème
Dans `assets/css/style.css`, personnalisez les couleurs (lignes 14-16) :
```css
--primary-color: #6366f1;      /* Couleur principale */
--primary-dark: #4f46e5;       /* Version foncée */
--primary-light: #a5b4fc;      /* Version claire */
```

## 🚀 Installation

1. **Placez les fichiers** dans votre dossier web (htdocs, www, etc.)
2. **Remplacez l'avatar** par votre photo dans `assets/images/`
3. **Personnalisez les liens** dans `assets/js/main.js`
4. **Adaptez le contenu** dans `index.html`
5. **Testez le site** en ouvrant `index.html` dans votre navigateur

## 📱 Responsive

Le site s'adapte automatiquement à tous les écrans :
- 📱 **Mobile** : Design vertical optimisé
- 📲 **Tablette** : Mise en page intermédiaire
- 💻 **Desktop** : Version complète avec effets

## 🎨 Customisation avancée

### Ajouter un nouveau réseau social

1. **Dans `index.html`**, ajoutez un nouveau lien :
```html
<a href="#" class="social-link tiktok" data-platform="tiktok" target="_blank">
    <div class="link-content">
        <i class="fab fa-tiktok"></i>
        <div class="link-text">
            <span class="platform-name">TikTok</span>
            <span class="platform-desc">Vidéos courtes</span>
        </div>
        <i class="fas fa-external-link-alt link-arrow"></i>
    </div>
</a>
```

2. **Dans `assets/css/style.css`**, ajoutez les styles :
```css
.tiktok:hover { border-color: #ff0050; }
.tiktok:hover i:first-child { color: #ff0050; }
```

3. **Dans `assets/js/main.js`**, ajoutez l'URL :
```javascript
tiktok: 'https://www.tiktok.com/@votre_compte'
```

### Modifier les animations
Dans `assets/js/main.js`, ligne 18-22 :
```javascript
animations: {
    clickRipple: true,    // Effet ripple au clic
    parallax: true,       // Effets parallax
    autoTyping: false     // Animation de frappe (à implémenter)
}
```

## 📊 Analytics

Le site enregistre automatiquement :
- Clics sur chaque réseau social
- Horodatage des interactions
- Informations du navigateur

Accédez aux données via la console :
```javascript
WebGeniusHub.getAnalytics()  // Voir les statistiques
WebGeniusHub.clearAnalytics()  // Effacer les données
```

## 🔧 Développement

### Structure des fichiers
```
webgenius-hub/
├── index.html              # Page principale
├── README.md              # Ce fichier
├── assets/
│   ├── css/
│   │   └── style.css      # Styles principaux
│   ├── js/
│   │   └── main.js        # JavaScript interactif
│   └── images/
│       └── webgenius-avatar.jpg  # Votre photo
```

### Technologies utilisées
- **HTML5** sémantique et accessible
- **CSS3** avec variables CSS et Grid/Flexbox
- **JavaScript ES6+** avec classes et modules
- **Font Awesome** pour les icônes
- **Google Fonts** (Inter) pour la typographie

## 🌐 SEO et Performance

✅ **Meta tags** optimisés pour les réseaux sociaux  
✅ **Lazy loading** des images  
✅ **Performance** optimisée avec throttling  
✅ **Accessibilité** avec navigation clavier  
✅ **Responsive design** mobile-first  
✅ **Lighthouse score** élevé  

## 📞 Support

- Modifiez le contenu selon vos besoins
- Testez sur différents appareils
- Vérifiez que tous les liens fonctionnent
- Optimisez vos images pour le web

## 📝 Licence

Ce projet est libre d'utilisation pour Web Genius. Personnalisez selon vos besoins !

---

**🚀 Prêt à impressionner vos visiteurs avec un hub social professionnel !**