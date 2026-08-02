/* ============================================================
   ApexDigits Portfolio ÔÇö script.js
   Supports: all pages (multi-page site)
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {

    /* ÔöÇÔöÇ NAVBAR: scroll effect + inner-page always-glass ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ HAMBURGER MENU ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ SCROLL-TO-TOP ÔöÇÔöÇ */
    const scrollTopBtn = document.getElementById('scrollTop');
    if (scrollTopBtn) {
        window.addEventListener('scroll', () => {
            scrollTopBtn.classList.toggle('show', window.scrollY > 400);
        }, { passive: true });
        scrollTopBtn.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));
    }

    /* ÔöÇÔöÇ ANIMATED COUNTERS ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ SCROLL REVEAL ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ EXPERTISE CARD PARALLAX (Home + Expertise page) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ HERO TYPING EFFECT (Home page only) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ SUBSCRIBE (blog.html) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ CONTACT FORM (contact.html) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ SMOOTH SCROLL for in-page anchor links ÔöÇÔöÇ */
    document.querySelectorAll('a[href^="#"]').forEach(a => {
        a.addEventListener('click', e => {
            const target = document.querySelector(a.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    /* ÔöÇÔöÇ DYNAMIC SOCIAL SHARING ÔöÇÔöÇ */
    const shareContainer = document.querySelector('.post-share');
    if (shareContainer) {
        const currentUrl = encodeURIComponent(window.location.href);
        const currentTitle = encodeURIComponent(document.title.split('|')[0].trim()); // Clean title
        
        const linkedInBtn = shareContainer.querySelector('.social-btn.linkedin');
        if (linkedInBtn) {
            linkedInBtn.href = `https://www.linkedin.com/sharing/share-offsite/?url=${currentUrl}`;
        }
        
/* ============================================================
   ApexDigits Portfolio ÔÇö script.js
   Supports: all pages (multi-page site)
   ============================================================ */

document.addEventListener('DOMContentLoaded', () => {

    /* ÔöÇÔöÇ NAVBAR: scroll effect + inner-page always-glass ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ HAMBURGER MENU ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ SCROLL-TO-TOP ÔöÇÔöÇ */
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
        if (countersStarted) return;
        countersStarted = true;
        counters.forEach(el => {
            const target = parseInt(el.dataset.target, 10);
            if (!target) return;
            const duration = 1500;
            const step = Math.max(15, Math.floor(duration / target));
            let current = 0;
            const timer = setInterval(() => {
                current += Math.max(1, Math.ceil(target / 30));
                if (current >= target) {
                    el.textContent = target + '+';
                    clearInterval(timer);
                } else {
                    el.textContent = current + '+';
                }
            }, step);
        });
    }

    if (counters.length > 0) {
        // Run counter animation immediately on load
        setTimeout(startCounters, 100);
        
        const counterObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    startCounters();
                }
            });
        }, { threshold: 0.1 });
        counters.forEach(c => counterObserver.observe(c));
    }


    /* ÔöÇÔöÇ SCROLL REVEAL ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ EXPERTISE CARD PARALLAX (Home + Expertise page) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ HERO TYPING EFFECT (Home page only) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ SUBSCRIBE (blog.html) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ CONTACT FORM (contact.html) ÔöÇÔöÇ */
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

    /* ÔöÇÔöÇ SMOOTH SCROLL for in-page anchor links ÔöÇÔöÇ */
    document.querySelectorAll('a[href^="#"]').forEach(a => {
        a.addEventListener('click', e => {
            const target = document.querySelector(a.getAttribute('href'));
            if (target) {
                e.preventDefault();
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });

    /* ÔöÇÔöÇ DYNAMIC SOCIAL SHARING ÔöÇÔöÇ */
    const shareContainer = document.querySelector('.post-share');
    if (shareContainer) {
        const currentUrl = encodeURIComponent(window.location.href);
        const currentTitle = encodeURIComponent(document.title.split('|')[0].trim()); // Clean title
        
        const linkedInBtn = shareContainer.querySelector('.social-btn.linkedin');
        if (linkedInBtn) {
            linkedInBtn.href = `https://www.linkedin.com/sharing/share-offsite/?url=${currentUrl}`;
        }
        
        const twitterBtn = shareContainer.querySelector('.social-btn.twitter');
        if (twitterBtn) {
            twitterBtn.href = `https://twitter.com/intent/tweet?text=${currentTitle}&url=${currentUrl}&via=Gunaseelan1108`;
        }
    }

    /* ── SIMPLE & BULLETPROOF BLOG FILTER & PAGINATION ── */
    const filterBtns = document.querySelectorAll('.filter-btn');
    const blogCards = document.querySelectorAll('.blog-wp-card');
    const searchInputs = document.querySelectorAll('.wp-search-input');
    const tagPills = document.querySelectorAll('.wp-tag-pill');
    const loadMoreBtn = document.getElementById('blogLoadMoreBtn');

    let isExpanded = false;

    function updateCardVisibility(filterTerm = 'all') {
        const rawTerm = (filterTerm || 'all').toLowerCase().replace('#', '').trim();
        let visibleMatchCount = 0;

        blogCards.forEach((card) => {
            const cat = (card.getAttribute('data-category') || '').toLowerCase();
            const tags = (card.getAttribute('data-tags') || '').toLowerCase();
            const text = card.innerText.toLowerCase();
            
            // Match against category attribute OR tags attribute OR text inside card
            const matches = (rawTerm === 'all' || cat.includes(rawTerm) || tags.includes(rawTerm) || text.includes(rawTerm));

            if (matches) {
                visibleMatchCount++;
                if (rawTerm === 'all' && !isExpanded && visibleMatchCount > 6) {
                    card.classList.add('hidden-card');
                } else {
                    card.classList.remove('hidden-card');
                }
            } else {
                card.classList.add('hidden-card');
            }
        });

        if (loadMoreBtn) {
            if (rawTerm === 'all' && !isExpanded && blogCards.length > 6) {
                loadMoreBtn.style.display = 'inline-block';
            } else {
                loadMoreBtn.style.display = 'none';
            }
        }
    }


    if (loadMoreBtn) {
        loadMoreBtn.addEventListener('click', (e) => {
            e.preventDefault();
            isExpanded = true;
            updateCardVisibility('all');
        });
    }

    if (filterBtns.length > 0) {
        filterBtns.forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.preventDefault();
                filterBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                const filter = btn.getAttribute('data-filter') || 'all';
                isExpanded = true;
                updateCardVisibility(filter);
            });
        });
    }

    if (tagPills.length > 0) {
        tagPills.forEach(pill => {
            pill.addEventListener('click', (e) => {
                e.preventDefault();
                const filter = pill.getAttribute('data-filter') || pill.innerText.replace('#', '');
                isExpanded = true;
                updateCardVisibility(filter);
            });
        });
    }

    if (searchInputs.length > 0) {
        searchInputs.forEach(input => {
            input.addEventListener('input', (e) => {
                isExpanded = true;
                updateCardVisibility(e.target.value.trim());
            });
        });
    }

    // Initial load setup
    if (blogCards.length > 0) {
        updateCardVisibility('all');
    }


});
