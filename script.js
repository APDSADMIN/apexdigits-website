/* ============================================================
   ApexDigits Portfolio — script.js
   Supports: all pages (multi-page site)
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {

    /* ── NAVBAR: scroll effect + inner-page always-glass ── */
    const navbar = document.getElementById('navbar');
    const isInnerPage = !!document.querySelector('.page-hero');

    if (isInnerPage && navbar) {
        navbar.classList.add('scrolled');
    }

    window.addEventListener('scroll', () => {
        if (!navbar) return;
        if (window.scrollY > 40 || isInnerPage) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    }, { passive: true });

    /* ── HAMBURGER MENU ── */
    const hamburger = document.getElementById('hamburger');
    const navLinks = document.getElementById('navLinks');

    if (hamburger && navLinks) {
        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('open');
            navLinks.classList.toggle('open');
        });

        // Close on nav link click (mobile)
        navLinks.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', () => {
                hamburger.classList.remove('open');
                navLinks.classList.remove('open');
            });
        });
    }

    /* ── SCROLL-TO-TOP ── */
    const scrollTopBtn = document.getElementById('scrollTop');
    if (scrollTopBtn) {
        window.addEventListener('scroll', () => {
            scrollTopBtn.classList.toggle('show', window.scrollY > 400);
        }, { passive: true });
        scrollTopBtn.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));
    }

    /* ── ANIMATED COUNTERS ── */
    const counters = document.querySelectorAll('.stat-number[data-target]');
    let countersStarted = false;

    function startCounters() {
        counters.forEach(el => {
            const target = parseInt(el.dataset.target, 10);
            const duration = 1800;
            const step = Math.ceil(duration / target);
            let current = 0;
            const timer = setInterval(() => {
                current += Math.max(1, Math.ceil(target / 60));
                if (current >= target) {
                    el.textContent = target.toLocaleString();
                    clearInterval(timer);
                } else {
                    el.textContent = current.toLocaleString();
                }
            }, step > 30 ? 30 : step);
        });
    }

    if (counters.length > 0) {
        const counterObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting && !countersStarted) {
                    countersStarted = true;
                    startCounters();
                }
            });
        }, { threshold: 0.3 });
        counters.forEach(c => counterObserver.observe(c));
    }

    /* ── SCROLL REVEAL ── */
    const revealEls = document.querySelectorAll('.reveal-left, .reveal-right');
    if (revealEls.length > 0) {
        const revealObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    revealObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.15 });
        revealEls.forEach(el => revealObserver.observe(el));
    }

    /* ── EXPERTISE CARD PARALLAX (Home + Expertise page) ── */
    document.querySelectorAll('.expertise-card').forEach(card => {
        card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = ((e.clientX - rect.left) / rect.width - 0.5) * 12;
            const y = ((e.clientY - rect.top) / rect.height - 0.5) * 12;
            card.style.transform = `perspective(800px) rotateX(${-y}deg) rotateY(${x}deg) translateY(-6px)`;
        });
        card.addEventListener('mouseleave', () => {
            card.style.transform = '';
        });
    });

    /* ── HERO TYPING EFFECT (Home page only) ── */
    const heroBadge = document.querySelector('.hero-badge');
    if (heroBadge) {
        const roles = [
            'Senior Technical Architect & SME',
            'Multi-Cloud Solutions Architect',
            'DevSecOps Engineering Leader',
            'Enterprise Virtualisation Expert',
            'Azure | AWS | GCP Specialist'
        ];
        let ri = 0, ci = 0, deleting = false;
        const typing = () => {
            const word = roles[ri];
            heroBadge.innerHTML = `<i class="fas fa-shield-halved"></i> ${deleting ? word.slice(0, ci--) : word.slice(0, ++ci)}`;
            const delay = deleting ? 45 : ci === word.length ? 2200 : 75;
            if (!deleting && ci === word.length) deleting = true;
            if (deleting && ci === 0) { deleting = false; ri = (ri + 1) % roles.length; }
            setTimeout(typing, delay);
        };
        setTimeout(typing, 1200);
    }

    /* ── BLOG FILTER (blog.html) ── */
    const filterBtns = document.querySelectorAll('.filter-btn');
    const blogCards = document.querySelectorAll('#blogGrid .blog-card');
    const featuredRow = document.querySelector('.blog-featured-row');

    if (filterBtns.length > 0) {
        filterBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                filterBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');

                const filter = btn.dataset.filter;
                const isAll = filter === 'all';

                // Handle featured row
                if (featuredRow) {
                    featuredRow.style.display = (isAll || filter === 'multi-cloud') ? '' : 'none';
                }

                // Handle article cards
                blogCards.forEach(card => {
                    const cat = card.dataset.category || '';
                    card.classList.toggle('hidden', !isAll && cat !== filter);
                });
            });
        });
    }

    /* ── SUBSCRIBE (blog.html) ── */
    window.handleSubscribe = function (e) {
        e.preventDefault();
        const input = document.getElementById('subscribeEmail');
        const success = document.getElementById('subscribeSuccess');
        if (input && success) {
            success.classList.add('show');
            input.value = '';
            input.disabled = true;
            setTimeout(() => { input.disabled = false; success.classList.remove('show'); }, 4000);
        }
    };

    /* ── CONTACT FORM (contact.html) ── */
    window.handleFormSubmit = function (e) {
        e.preventDefault();
        const form = document.getElementById('contactForm');
        const success = document.getElementById('formSuccess');
        if (success) {
            success.classList.add('show');
            form.querySelectorAll('input, textarea, select, button[type="submit"]').forEach(el => {
                el.disabled = true;
            });
            setTimeout(() => {
                success.classList.remove('show');
                form.reset();
                form.querySelectorAll('input, textarea, select, button[type="submit"]').forEach(el => {
                    el.disabled = false;
                });
            }, 5000);
        }
    };

    /* ── SMOOTH SCROLL for in-page anchor links ── */
    document.querySelectorAll('a[href^="#"]').forEach(a => {
        a.addEventListener('click', e => {
            const target = document.querySelector(a.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

});
