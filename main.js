/* ================================================
   Web Genius Hub - JavaScript Interactif
   ================================================ */

// Configuration et initialisation
const CONFIG = {
    // URLs des réseaux sociaux (à personnaliser)
    socialLinks: {
        youtube: 'https://www.youtube.com/@webgenius', // À remplacer par l'URL réelle
        instagram: 'https://www.instagram.com/webgenius_official', // À remplacer
        facebook: 'https://www.facebook.com/webgenius.page', // À remplacer  
        discord: 'https://discord.gg/webgenius', // À remplacer
        snapchat: 'https://www.snapchat.com/add/webgenius', // À remplacer
        email: 'mailto:contact@webgenius.com' // À remplacer
    },
    
    // Configuration des animations
    animations: {
        clickRipple: true,
        parallax: true,
        autoTyping: true
    },
    
    // Analytics et tracking
    analytics: {
        enabled: true,
        events: []
    }
};

// ================================================
// Utilitaires
// ================================================

const Utils = {
    // Debounce pour optimiser les performances
    debounce(func, delay) {
        let timeoutId;
        return (...args) => {
            clearTimeout(timeoutId);
            timeoutId = setTimeout(() => func.apply(null, args), delay);
        };
    },
    
    // Throttle pour les événements fréquents
    throttle(func, limit) {
        let lastFunc;
        let lastRan;
        return function() {
            const context = this;
            const args = arguments;
            if (!lastRan) {
                func.apply(context, args);
                lastRan = Date.now();
            } else {
                clearTimeout(lastFunc);
                lastFunc = setTimeout(function() {
                    if ((Date.now() - lastRan) >= limit) {
                        func.apply(context, args);
                        lastRan = Date.now();
                    }
                }, limit - (Date.now() - lastRan));
            }
        };
    },
    
    // Animation fluide vers un élément
    scrollToElement(element, duration = 800) {
        const targetPosition = element.offsetTop;
        const startPosition = window.pageYOffset;
        const distance = targetPosition - startPosition;
        let startTime = null;
        
        function animation(currentTime) {
            if (startTime === null) startTime = currentTime;
            const timeElapsed = currentTime - startTime;
            const run = Utils.easeInOutQuad(timeElapsed, startPosition, distance, duration);
            window.scrollTo(0, run);
            if (timeElapsed < duration) requestAnimationFrame(animation);
        }
        
        requestAnimationFrame(animation);
    },
    
    // Fonction d'easing pour les animations
    easeInOutQuad(t, b, c, d) {
        t /= d/2;
        if (t < 1) return c/2*t*t + b;
        t--;
        return -c/2 * (t*(t-2) - 1) + b;
    }
};

// ================================================
// Gestion des liens sociaux
// ================================================

class SocialLinksManager {
    constructor() {
        this.links = document.querySelectorAll('.social-link');
        this.init();
    }
    
    init() {
        this.setupLinks();
        this.setupClickTracking();
        this.setupRippleEffect();
    }
    
    // Configuration des liens avec les URLs réelles
    setupLinks() {
        this.links.forEach(link => {
            const platform = link.dataset.platform;
            if (CONFIG.socialLinks[platform]) {
                link.href = CONFIG.socialLinks[platform];
            }
        });
    }
    
    // Tracking des clics pour analytics
    setupClickTracking() {
        this.links.forEach(link => {
            link.addEventListener('click', (e) => {
                const platform = link.dataset.platform;
                
                // Analytics
                this.trackClick(platform);
                
                // Feedback visuel
                this.animateClick(link);
                
                // Log pour développement
                console.log(`🔗 Clic sur ${platform} à ${new Date().toLocaleTimeString()}`);
            });
        });
    }
    
    // Effet ripple au clic
    setupRippleEffect() {
        if (!CONFIG.animations.clickRipple) return;
        
        this.links.forEach(link => {
            link.addEventListener('click', (e) => {
                const ripple = document.createElement('span');
                const rect = link.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.width = ripple.style.height = size + 'px';
                ripple.style.left = x + 'px';
                ripple.style.top = y + 'px';
                ripple.classList.add('ripple');
                
                link.appendChild(ripple);
                
                // Nettoyer après l'animation
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });
    }
    
    // Animation de feedback au clic
    animateClick(element) {
        element.style.transform = 'translateY(-6px) scale(0.98)';
        element.style.transition = 'all 0.1s ease';
        
        setTimeout(() => {
            element.style.transform = 'translateY(-4px) scale(1)';
            element.style.transition = 'all 0.3s ease';
        }, 100);
    }
    
    // Enregistrement des clics pour analytics
    trackClick(platform) {
        if (!CONFIG.analytics.enabled) return;
        
        const event = {
            type: 'social_click',
            platform: platform,
            timestamp: Date.now(),
            url: window.location.href,
            userAgent: navigator.userAgent
        };
        
        CONFIG.analytics.events.push(event);
        
        // Ici vous pouvez envoyer à Google Analytics, Facebook Pixel, etc.
        // gtag('event', 'click', { event_category: 'social', event_label: platform });
    }
}

// ================================================
// Effets parallax et interactions souris
// ================================================

class InteractiveEffects {
    constructor() {
        this.avatar = document.getElementById('avatar');
        this.floatingElements = document.querySelectorAll('.floating-element');
        this.init();
    }
    
    init() {
        this.setupMouseTracking();
        this.setupParallaxScroll();
        this.setupKeyboardNavigation();
        this.setupIntersectionObserver();
    }
    
    // Suivi de la souris pour effets interactifs
    setupMouseTracking() {
        let mouseX = 0, mouseY = 0;
        
        document.addEventListener('mousemove', Utils.throttle((e) => {
            mouseX = (e.clientX / window.innerWidth) * 100;
            mouseY = (e.clientY / window.innerHeight) * 100;
            
            // Effet parallax sur les éléments flottants
            if (CONFIG.animations.parallax) {
                this.updateParallaxElements(mouseX, mouseY);
            }
            
        }, 16)); // ~60fps
    }
    
    // Mise à jour des éléments parallax
    updateParallaxElements(mouseX, mouseY) {
        this.floatingElements.forEach((element, index) => {
            const speed = (index + 1) * 0.5;
            const x = (mouseX - 50) * speed * 0.02;
            const y = (mouseY - 50) * speed * 0.02;
            
            element.style.transform = `translate(${x}px, ${y}px)`;
        });
    }
    
    // Effets au scroll
    setupParallaxScroll() {
        let ticking = false;
        
        window.addEventListener('scroll', () => {
            if (!ticking) {
                requestAnimationFrame(() => {
                    this.handleScroll();
                    ticking = false;
                });
                ticking = true;
            }
        });
    }
    
    handleScroll() {
        const scrolled = window.pageYOffset;
        const rate = scrolled * -0.5;
        
        // Parallax sur l'avatar
        if (this.avatar) {
            this.avatar.style.transform = `translateY(${rate * 0.1}px)`;
        }
        
        // Parallax sur les éléments flottants
        this.floatingElements.forEach((element, index) => {
            const speed = (index + 1) * 0.3;
            element.style.transform += ` translateY(${rate * speed}px)`;
        });
    }
    
    // Navigation au clavier pour l'accessibilité
    setupKeyboardNavigation() {
        document.addEventListener('keydown', (e) => {
            // Navigation avec les flèches
            if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
                e.preventDefault();
                const links = Array.from(this.links);
                const currentIndex = links.indexOf(document.activeElement);
                
                let nextIndex;
                if (e.key === 'ArrowDown') {
                    nextIndex = currentIndex + 1 >= links.length ? 0 : currentIndex + 1;
                } else {
                    nextIndex = currentIndex - 1 < 0 ? links.length - 1 : currentIndex - 1;
                }
                
                links[nextIndex].focus();
            }
            
            // Entrée pour activer
            if (e.key === 'Enter' && document.activeElement.classList.contains('social-link')) {
                document.activeElement.click();
            }
        });
    }
    
    // Observation des éléments pour animations d'apparition
    setupIntersectionObserver() {
        const options = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                }
            });
        }, options);
        
        // Observer tous les liens sociaux
        document.querySelectorAll('.social-link').forEach(link => {
            observer.observe(link);
        });
    }
}

// ================================================
// Gestionnaire de performance et PWA
// ================================================

class PerformanceManager {
    constructor() {
        this.init();
    }
    
    init() {
        this.optimizeImages();
        this.setupServiceWorker();
        this.monitorPerformance();
    }
    
    // Optimisation des images (lazy loading)
    optimizeImages() {
        const images = document.querySelectorAll('img[src]');
        
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        if (img.dataset.src) {
                            img.src = img.dataset.src;
                            img.removeAttribute('data-src');
                        }
                        imageObserver.unobserve(img);
                    }
                });
            });
            
            images.forEach(img => imageObserver.observe(img));
        }
    }
    
    // Configuration du Service Worker pour PWA
    setupServiceWorker() {
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', () => {
                // Le Service Worker sera créé plus tard si nécessaire
                console.log('🔧 Service Worker ready to be implemented');
            });
        }
    }
    
    // Monitoring des performances
    monitorPerformance() {
        // Web Vitals basiques
        if ('PerformanceObserver' in window) {
            try {
                const observer = new PerformanceObserver((list) => {
                    list.getEntries().forEach((entry) => {
                        console.log(`📊 ${entry.name}: ${entry.duration}ms`);
                    });
                });
                
                observer.observe({ entryTypes: ['measure', 'navigation'] });
            } catch (e) {
                console.log('Performance monitoring not supported');
            }
        }
    }
}

// ================================================
// Gestionnaire d'état et thème
// ================================================

class ThemeManager {
    constructor() {
        this.init();
    }
    
    init() {
        this.detectTheme();
        this.setupThemeToggle();
    }
    
    detectTheme() {
        const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        const savedTheme = localStorage.getItem('webgenius-theme');
        
        const theme = savedTheme || (prefersDark ? 'dark' : 'light');
        document.documentElement.setAttribute('data-theme', theme);
    }
    
    setupThemeToggle() {
        // Si vous voulez ajouter un toggle de thème plus tard
        console.log('🎨 Theme system ready');
    }
}

// ================================================
// Initialisation principale
// ================================================

class WebGeniusHub {
    constructor() {
        this.socialManager = null;
        this.effectsManager = null;
        this.performanceManager = null;
        this.themeManager = null;
        
        this.init();
    }
    
    async init() {
        // Attendre que le DOM soit chargé
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => this.startup());
        } else {
            this.startup();
        }
    }
    
    startup() {
        console.log('🚀 Web Genius Hub - Initialisation...');
        
        // Initialiser les gestionnaires
        this.socialManager = new SocialLinksManager();
        this.effectsManager = new InteractiveEffects();
        this.performanceManager = new PerformanceManager();
        this.themeManager = new ThemeManager();
        
        // Ajouter les styles CSS dynamiques
        this.injectDynamicStyles();
        
        // Événements globaux
        this.setupGlobalEvents();
        
        console.log('✅ Web Genius Hub - Prêt!');
        
        // Animation d'entrée
        this.playWelcomeAnimation();
    }
    
    // Injection de styles CSS pour les effets JavaScript
    injectDynamicStyles() {
        const style = document.createElement('style');
        style.textContent = `
            .ripple {
                position: absolute;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.3);
                pointer-events: none;
                animation: ripple-animation 0.6s ease-out;
            }
            
            @keyframes ripple-animation {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
            
            .animate-in {
                animation: slideInUp 0.6s ease-out forwards;
            }
            
            @keyframes slideInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        `;
        document.head.appendChild(style);
    }
    
    // Événements globaux
    setupGlobalEvents() {
        // Gestion des erreurs JavaScript
        window.addEventListener('error', (e) => {
            console.error('💥 Erreur JS:', e.error);
        });
        
        // Gestion du focus pour l'accessibilité
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Tab') {
                document.body.classList.add('keyboard-navigation');
            }
        });
        
        document.addEventListener('mousedown', () => {
            document.body.classList.remove('keyboard-navigation');
        });
    }
    
    // Animation de bienvenue
    playWelcomeAnimation() {
        const avatar = document.getElementById('avatar');
        if (avatar) {
            avatar.style.animation = 'pulse 1s ease-in-out';
            setTimeout(() => {
                avatar.style.animation = '';
            }, 1000);
        }
    }
    
    // Méthodes utilitaires publiques
    updateSocialLink(platform, url) {
        CONFIG.socialLinks[platform] = url;
        this.socialManager.setupLinks();
        console.log(`🔗 Lien ${platform} mis à jour: ${url}`);
    }
    
    getAnalytics() {
        return CONFIG.analytics.events;
    }
    
    clearAnalytics() {
        CONFIG.analytics.events = [];
        console.log('📊 Analytics cleared');
    }
}

// ================================================
// Démarrage de l'application
// ================================================

// Instance globale
window.WebGeniusHub = new WebGeniusHub();

// Export pour utilisation externe si nécessaire
if (typeof module !== 'undefined' && module.exports) {
    module.exports = WebGeniusHub;
}