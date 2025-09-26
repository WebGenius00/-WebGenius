/* ========================================
   🎬 SYSTÈME D'ANIMATIONS AVANCÉES 🎬
   ======================================== */

// Attente du chargement complet
document.addEventListener('DOMContentLoaded', function() {
    console.log('🎬 Système d\'animations activé !');
    
    // Initialisation des animations
    initializeAnimations();
    
    // Gestion des interactions avancées
    setupAdvancedInteractions();
    
    // Animation finale après chargement
    setTimeout(() => {
        document.querySelector('.container').classList.add('loaded');
        console.log('✨ Animation finale déclenchée !');
    }, 5000);
});

/* ===== INITIALISATION DES ANIMATIONS ===== */
function initializeAnimations() {
    
    // Animation du curseur de frappe pour le nom
    setTimeout(() => {
        const nameElement = document.querySelector('.name');
        if (nameElement) {
            // Suppression du curseur après l'animation de frappe
            setTimeout(() => {
                nameElement.style.borderRight = 'none';
            }, 4000);
        }
    }, 100);
    
    // Création de particules supplémentaires
    createDynamicParticles();
    
    // Configuration des observer pour les animations au scroll
    setupScrollAnimations();
    
    // Démarrage des animations de fond
    startBackgroundAnimations();
}

/* ===== PARTICULES DYNAMIQUES ===== */
function createDynamicParticles() {
    const particleContainer = document.querySelector('.floating-particles');
    if (!particleContainer) return;
    
    // Création de particules supplémentaires pour effet WOW
    for (let i = 10; i <= 20; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        particle.style.left = Math.random() * 100 + '%';
        particle.style.animationDelay = -(Math.random() * 30) + 's';
        particle.style.animationDuration = (20 + Math.random() * 15) + 's';
        particle.style.width = (2 + Math.random() * 4) + 'px';
        particle.style.height = particle.style.width;
        
        // Différentes couleurs pour les particules
        const colors = [
            'rgba(255, 255, 255, 0.8)',
            'rgba(102, 126, 234, 0.6)',
            'rgba(118, 75, 162, 0.6)',
            'rgba(56, 178, 172, 0.6)'
        ];
        const randomColor = colors[Math.floor(Math.random() * colors.length)];
        particle.style.background = `radial-gradient(circle, ${randomColor} 0%, transparent 70%)`;
        
        particleContainer.appendChild(particle);
    }
    
    console.log('✨ Particules dynamiques créées !');
}

/* ===== ANIMATIONS AU SCROLL ===== */
function setupScrollAnimations() {
    // Observer pour déclencher des animations lors du scroll
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in-view');
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    });
    
    // Observation des éléments
    const elementsToObserve = document.querySelectorAll('.social-link, .footer');
    elementsToObserve.forEach(el => observer.observe(el));
}

/* ===== INTERACTIONS AVANCÉES ===== */
function setupAdvancedInteractions() {
    
    // Animation spéciale pour l'avatar au clic
    const avatar = document.querySelector('#avatar');
    if (avatar) {
        avatar.addEventListener('click', () => {
            avatar.style.animation = 'avatarSpectacular 1s cubic-bezier(0.68, -0.55, 0.265, 1.55)';
            
            setTimeout(() => {
                avatar.style.animation = '';
            }, 1000);
            
            // Effet de particules explosives
            createClickParticles(avatar);
        });
    }
    
    // Animation de typing pour le nom au clic
    const nameElement = document.querySelector('.name');
    if (nameElement) {
        nameElement.addEventListener('click', () => {
            nameElement.style.animation = 'nameTypewriter 2s steps(40), nameGlow 1s ease-in-out 2s infinite alternate';
            nameElement.style.borderRight = '3px solid rgba(255, 255, 255, 0.75)';
            
            setTimeout(() => {
                nameElement.style.borderRight = 'none';
            }, 2500);
        });
    }
    
    // Effets avancés sur les liens sociaux
    const socialLinks = document.querySelectorAll('.social-link');
    socialLinks.forEach((link, index) => {
        
        // Animation d'entrée au survol
        link.addEventListener('mouseenter', () => {
            link.style.zIndex = '10';
            link.style.animation = `linkPulse 0.6s ease-in-out`;
            
            // Effet ripple
            createRippleEffect(link, event);
        });
        
        link.addEventListener('mouseleave', () => {
            link.style.zIndex = '';
            link.style.animation = '';
        });
        
        // Animation au clic
        link.addEventListener('mousedown', () => {
            link.style.animation = 'linkPress 0.2s ease-in-out';
        });
        
        link.addEventListener('mouseup', () => {
            link.style.animation = '';
        });
    });
    
    console.log('🎭 Interactions avancées configurées !');
}

/* ===== EFFETS SPÉCIAUX ===== */
function createClickParticles(element) {
    const rect = element.getBoundingClientRect();
    const centerX = rect.left + rect.width / 2;
    const centerY = rect.top + rect.height / 2;
    
    for (let i = 0; i < 12; i++) {
        const particle = document.createElement('div');
        particle.style.position = 'fixed';
        particle.style.left = centerX + 'px';
        particle.style.top = centerY + 'px';
        particle.style.width = '6px';
        particle.style.height = '6px';
        particle.style.backgroundColor = '#667eea';
        particle.style.borderRadius = '50%';
        particle.style.pointerEvents = 'none';
        particle.style.zIndex = '9999';
        
        document.body.appendChild(particle);
        
        // Animation de l'explosion
        const angle = (i / 12) * Math.PI * 2;
        const distance = 50 + Math.random() * 30;
        const duration = 800 + Math.random() * 400;
        
        particle.animate([
            {
                transform: 'translate(-50%, -50%) scale(1)',
                opacity: 1
            },
            {
                transform: `translate(${Math.cos(angle) * distance - 50}%, ${Math.sin(angle) * distance - 50}%) scale(0)`,
                opacity: 0
            }
        ], {
            duration: duration,
            easing: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)'
        }).onfinish = () => {
            particle.remove();
        };
    }
}

function createRippleEffect(element, event) {
    const ripple = document.createElement('div');
    const rect = element.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height);
    const x = event.clientX - rect.left - size / 2;
    const y = event.clientY - rect.top - size / 2;
    
    ripple.style.position = 'absolute';
    ripple.style.width = size + 'px';
    ripple.style.height = size + 'px';
    ripple.style.left = x + 'px';
    ripple.style.top = y + 'px';
    ripple.style.background = 'rgba(255, 255, 255, 0.3)';
    ripple.style.borderRadius = '50%';
    ripple.style.transform = 'scale(0)';
    ripple.style.pointerEvents = 'none';
    
    element.appendChild(ripple);
    
    ripple.animate([
        { transform: 'scale(0)', opacity: 1 },
        { transform: 'scale(2)', opacity: 0 }
    ], {
        duration: 600,
        easing: 'cubic-bezier(0.25, 0.46, 0.45, 0.94)'
    }).onfinish = () => {
        ripple.remove();
    };
}

/* ===== ANIMATIONS DE FOND DYNAMIQUES ===== */
function startBackgroundAnimations() {
    // Création de gradients animés supplémentaires
    const backgroundLayer = document.createElement('div');
    backgroundLayer.style.position = 'fixed';
    backgroundLayer.style.top = '0';
    backgroundLayer.style.left = '0';
    backgroundLayer.style.width = '100%';
    backgroundLayer.style.height = '100%';
    backgroundLayer.style.pointerEvents = 'none';
    backgroundLayer.style.zIndex = '0';
    backgroundLayer.style.opacity = '0.5';
    
    // Animation de gradient rotatif
    backgroundLayer.style.background = `
        conic-gradient(from 0deg at 50% 50%, 
            transparent 0deg,
            rgba(102, 126, 234, 0.05) 60deg,
            transparent 120deg,
            rgba(118, 75, 162, 0.05) 180deg,
            transparent 240deg,
            rgba(56, 178, 172, 0.05) 300deg,
            transparent 360deg
        )
    `;
    
    backgroundLayer.animate([
        { transform: 'rotate(0deg) scale(1)' },
        { transform: 'rotate(360deg) scale(1.1)' }
    ], {
        duration: 60000, // 1 minute
        iterations: Infinity,
        easing: 'linear'
    });
    
    document.body.appendChild(backgroundLayer);
    
    console.log('🌊 Animations de fond démarrées !');
}

/* ===== ANIMATIONS CONDITIONNELLES ===== */
function triggerSpecialAnimation() {
    // Animation spéciale déclenchable
    const container = document.querySelector('.container');
    if (container) {
        container.style.animation = 'finalSparkle 2s ease-in-out';
        
        setTimeout(() => {
            container.style.animation = '';
        }, 2000);
    }
}

/* ===== PERFORMANCE ET OPTIMISATION ===== */
function optimizeAnimations() {
    // Réduction des animations sur les appareils avec des performances limitées
    if (navigator.hardwareConcurrency < 4) {
        console.log('🔧 Optimisation des animations pour appareil limité');
        
        // Réduction des particules
        const particles = document.querySelectorAll('.particle');
        particles.forEach((particle, index) => {
            if (index % 2 === 0) {
                particle.style.display = 'none';
            }
        });
        
        // Réduction des durées d'animation
        const style = document.createElement('style');
        style.textContent = `
            .container { animation-duration: 1s !important; }
            .avatar-container { animation-duration: 1s !important; }
            .name { animation-duration: 1.5s !important; }
        `;
        document.head.appendChild(style);
    }
}

/* ===== GESTION DES ERREURS ===== */
window.addEventListener('error', (e) => {
    console.warn('⚠️ Erreur d\'animation:', e.message);
});

// Auto-optimisation
setTimeout(optimizeAnimations, 1000);

// Déclenchement d'animation spéciale sur Konami Code (pour le fun !)
let konamiCode = [];
const konamiSequence = ['ArrowUp', 'ArrowUp', 'ArrowDown', 'ArrowDown', 'ArrowLeft', 'ArrowRight', 'ArrowLeft', 'ArrowRight', 'KeyB', 'KeyA'];

document.addEventListener('keydown', (e) => {
    konamiCode.push(e.code);
    if (konamiCode.length > konamiSequence.length) {
        konamiCode.shift();
    }
    
    if (konamiCode.join('') === konamiSequence.join('')) {
        console.log('🎉 Konami Code détecté ! Animation spéciale !');
        triggerSpecialAnimation();
        konamiCode = [];
    }
});

console.log('🎬 Système d\'animations mega-spectaculaires chargé !');