# generate-expanded-pages.ps1
# Automates the creation of 7 new service landing pages and 7 new technical articles
# with proper formatting, SEO meta tags, and structured schemas.

$projDir = "C:\Users\Gunas\.gemini\antigravity\scratch\apexdigits"

# ----------------- TEMPLATES -----------------

function Get-ServiceTemplate {
    param (
        [string]$title,
        [string]$description,
        [string]$urlPath,
        [string]$logoGrad,
        [string]$heroClass,
        [string]$heading,
        [string]$subheading,
        [string]$icon,
        [string]$cardTitle,
        [string]$overview,
        [array]$features,
        [string]$whyConsult
    )

    $featuresHtml = ""
    foreach ($f in $features) {
        $featuresHtml += "                        <li><i class='fas fa-check-circle' style='color: var(--blue);'></i> $f</li>`n"
    }

    $template = @"
<!DOCTYPE html>
<html lang="en">

<head>
  <title>$title | ApexDigits</title>
  <meta name="description" content="$description" />
  <link rel="canonical" href="https://apexdigits.com/$urlPath" />

  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="website" />
  <meta property="og:title" content="$title | ApexDigits" />
  <meta property="og:description" content="$description" />
  <meta property="og:url" content="https://apexdigits.com/$urlPath" />
  <meta property="og:image" content="https://apexdigits.com/assets/images/profile.png" />
  <meta property="og:site_name" content="ApexDigits" />

  <!-- Twitter -->
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="$title | ApexDigits" />
  <meta name="twitter:description" content="$description" />
  <meta name="twitter:image" content="https://apexdigits.com/assets/images/profile.png" />
  <meta name="twitter:creator" content="@Gunaseelan1108" />
  <meta name="twitter:site" content="@Gunaseelan1108" />

  <!-- Structured Data -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {
        "@type": "ListItem",
        "position": 1,
        "name": "Home",
        "item": "https://apexdigits.com/"
      },
      {
        "@type": "ListItem",
        "position": 2,
        "name": "Services",
        "item": "https://apexdigits.com/services"
      },
      {
        "@type": "ListItem",
        "position": 3,
        "name": "$heading",
        "item": "https://apexdigits.com/$urlPath"
      }
    ]
  }
</script>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Montserrat:wght@400;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <!-- NAVIGATION -->
    <nav id="navbar">
        <div class="nav-container">
            <a href="index.html" class="nav-logo">
                <div class="logo-icon">
                    <svg class="oloid-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                        <path d="M50 10 A 40 40 0 0 1 90 50 L 90 50 A 40 40 0 0 1 50 90 A 40 40 0 0 1 10 50 L 10 50 A 40 40 0 0 1 50 10 Z" fill="none" stroke="url(#logo-grad-$urlPath)" stroke-width="6" />
                        <path d="M50 10 C 65 30, 65 70, 50 90" fill="none" stroke="url(#logo-grad-$urlPath)" stroke-width="3" stroke-opacity="0.7" />
                        <path d="M10 50 C 30 35, 70 35, 90 50" fill="none" stroke="url(#logo-grad-$urlPath)" stroke-width="3" stroke-opacity="0.7" />
                        <defs>
                            <linearGradient id="logo-grad-$urlPath" x1="0%" y1="0%" x2="100%" y2="100%">
                                <stop offset="0%" style="stop-color:#45A29E;stop-opacity:1" />
                                <stop offset="100%" style="stop-color:#66FCF1;stop-opacity:1" />
                            </linearGradient>
                        </defs>
                    </svg>
                </div>
                <span class="logo-text">ApexDigits</span>
            </a>
            <ul class="nav-links" id="navLinks">
                <li><a href="about.html" class="nav-link">About</a></li>
                <li><a href="expertise.html" class="nav-link">Expertise</a></li>
                <li><a href="experience.html" class="nav-link">Experience</a></li>
                <li><a href="services.html" class="nav-link">Services</a></li>
                <li><a href="blog.html" class="nav-link">Blog</a></li>
                <li><a href="contact.html" class="nav-link cta-nav">Contact</a></li>
            </ul>
            <button class="hamburger" id="hamburger" aria-label="Toggle menu"><span></span><span></span><span></span></button>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <section class="page-hero $heroClass">
        <div class="hero-bg-overlay"></div>
        <div class="page-hero-content">
            <nav class="breadcrumb"><a href="index.html">Home</a><i class="fas fa-chevron-right"></i><a href="services.html">Services</a><i class="fas fa-chevron-right"></i><span>$heading</span></nav>
            <h1 class="page-hero-title">$heading</h1>
            <p class="page-hero-sub">$subheading</p>
        </div>
    </section>

    <!-- DETAILS -->
    <section class="section">
        <div class="container">
            <div class="services-grid" style="grid-template-columns: 1fr; max-width: 900px; margin: 0 auto; gap: 2rem;">
                <div class="service-card glass-card reveal-up" style="text-align: left; padding: 3rem;">
                    <div class="service-icon-wrapper" style="$logoGrad"><i class="$icon"></i></div>
                    <h2 style="font-size: 2rem; margin-bottom: 1.5rem; font-family: var(--font-head);">$cardTitle</h2>
                    <p style="margin-bottom: 1.5rem; line-height: 1.7; color: var(--text);">$overview</p>
                    
                    <h3 style="color: var(--cyan); margin-top: 2rem; margin-bottom: 1rem;">Service Features</h3>
                    <ul class="expertise-list" style="margin-bottom: 2rem; display: grid; grid-template-columns: 1fr 1fr; gap: 0.8rem;">
$featuresHtml                    </ul>

                    <h3 style="color: var(--cyan); margin-top: 1rem; margin-bottom: 1rem;">Why Consult with Us?</h3>
                    <p style="line-height: 1.7; color: var(--text);">$whyConsult</p>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="index.html" class="nav-logo">
                        <div class="logo-icon">
                            <svg class="oloid-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                                <path d="M50 10 A 40 40 0 0 1 90 50 L 90 50 A 40 40 0 0 1 50 90 A 40 40 0 0 1 10 50 L 10 50 A 40 40 0 0 1 50 10 Z" fill="none" stroke="url(#logo-grad-f-$urlPath)" stroke-width="6" />
                                <path d="M50 10 C 65 30, 65 70, 50 90" fill="none" stroke="url(#logo-grad-f-$urlPath)" stroke-width="3" stroke-opacity="0.5" />
                                <path d="M10 50 C 30 35, 70 35, 90 50" fill="none" stroke="url(#logo-grad-f-$urlPath)" stroke-width="3" stroke-opacity="0.5" />
                                <defs>
                                    <linearGradient id="logo-grad-f-$urlPath" x1="0%" y1="0%" x2="100%" y2="100%">
                                        <stop offset="0%" style="stop-color:#45A29E;stop-opacity:1" />
                                        <stop offset="100%" style="stop-color:#66FCF1;stop-opacity:1" />
                                    </linearGradient>
                                </defs>
                            </svg>
                        </div>
                        <span class="logo-text">ApexDigits</span>
                    </a>
                    <p>Strategic IT Infrastructure, Cloud Transformation, and Digital Workplace Consultation.</p>
                </div>
                <div class="footer-links">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="about.html">About Me</a></li>
                        <li><a href="expertise.html">Portfolio</a></li>
                        <li><a href="experience.html">Experience</a></li>
                        <li><a href="services.html">Services</a></li>
                    </ul>
                </div>
                <div class="footer-contact">
                    <h4>Get In Touch</h4>
                    <ul>
                        <li><i class="fas fa-envelope"></i> Gunaseelan.Madhavan@ApexDigits.net</li>
                        <li><i class="fas fa-phone"></i> +44 7442 316163</li>
                        <li><i class="fas fa-map-marker-alt"></i> Stafford, United Kingdom</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 ApexDigits. All rights reserved.</p>
            </div>
        </div>
    </footer>
    <script src="script.js"></script>
</body>
</html>
"@
    return $template
}

function Get-BlogTemplate {
    param (
        [string]$title,
        [string]$description,
        [string]$urlPath,
        [string]$category,
        [string]$readTime,
        [string]$date,
        [string]$heading,
        [string]$bodyHtml
    )

    $template = @"
<!DOCTYPE html>
<html lang="en">

<head>
  <title>$title | ApexDigits</title>
  <meta name="description" content="$description" />
  <link rel="canonical" href="https://apexdigits.com/$urlPath" />

  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="article" />
  <meta property="og:title" content="$title | ApexDigits" />
  <meta property="og:description" content="$description" />
  <meta property="og:url" content="https://apexdigits.com/$urlPath" />
  <meta property="og:image" content="https://apexdigits.com/assets/images/profile.png" />
  <meta property="og:site_name" content="ApexDigits" />

  <!-- Twitter -->
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="$title | ApexDigits" />
  <meta name="twitter:description" content="$description" />
  <meta name="twitter:image" content="https://apexdigits.com/assets/images/profile.png" />
  <meta name="twitter:creator" content="@Gunaseelan1108" />
  <meta name="twitter:site" content="@Gunaseelan1108" />

  <!-- Structured Data -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    "mainEntityOfPage": {
      "@type": "WebPage",
      "@id": "https://apexdigits.com/$urlPath"
    },
    "headline": "$heading",
    "description": "$description",
    "image": "https://apexdigits.com/assets/images/profile.png",
    "author": {
      "@type": "Person",
      "name": "Gunaseelan Madhavan",
      "url": "https://apexdigits.com/about"
    },
    "publisher": {
      "@type": "Organization",
      "name": "ApexDigits",
      "logo": {
        "@type": "ImageObject",
        "url": "https://apexdigits.com/assets/images/profile.png"
      }
    },
    "datePublished": "$date"
  }
</script>
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      {
        "@type": "ListItem",
        "position": 1,
        "name": "Home",
        "item": "https://apexdigits.com/"
      },
      {
        "@type": "ListItem",
        "position": 2,
        "name": "Blog",
        "item": "https://apexdigits.com/blog"
      },
      {
        "@type": "ListItem",
        "position": 3,
        "name": "$heading",
        "item": "https://apexdigits.com/$urlPath"
      }
    ]
  }
</script>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Montserrat:wght@400;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <!-- NAVIGATION -->
    <nav id="navbar">
        <div class="nav-container">
            <a href="index.html" class="nav-logo">
                <div class="logo-icon">
                    <svg class="oloid-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                        <path d="M50 10 A 40 40 0 0 1 90 50 L 90 50 A 40 40 0 0 1 50 90 A 40 40 0 0 1 10 50 L 10 50 A 40 40 0 0 1 50 10 Z" fill="none" stroke="url(#logo-grad-$urlPath)" stroke-width="6" />
                        <path d="M50 10 C 65 30, 65 70, 50 90" fill="none" stroke="url(#logo-grad-$urlPath)" stroke-width="3" stroke-opacity="0.7" />
                        <path d="M10 50 C 30 35, 70 35, 90 50" fill="none" stroke="url(#logo-grad-$urlPath)" stroke-width="3" stroke-opacity="0.7" />
                        <defs>
                            <linearGradient id="logo-grad-$urlPath" x1="0%" y1="0%" x2="100%" y2="100%">
                                <stop offset="0%" style="stop-color:#45A29E;stop-opacity:1" />
                                <stop offset="100%" style="stop-color:#66FCF1;stop-opacity:1" />
                            </linearGradient>
                        </defs>
                    </svg>
                </div>
                <span class="logo-text">ApexDigits</span>
            </a>
            <ul class="nav-links" id="navLinks">
                <li><a href="about.html" class="nav-link">About</a></li>
                <li><a href="expertise.html" class="nav-link">Expertise</a></li>
                <li><a href="experience.html" class="nav-link">Experience</a></li>
                <li><a href="services.html" class="nav-link">Services</a></li>
                <li><a href="blog.html" class="nav-link active-page">Blog</a></li>
                <li><a href="contact.html" class="nav-link cta-nav">Contact</a></li>
            </ul>
            <button class="hamburger" id="hamburger" aria-label="Toggle menu"><span></span><span></span><span></span></button>
        </div>
    </nav>

    <!-- POST HERO -->
    <section class="page-hero post-hero">
        <div class="hero-bg-grid"></div>
        <div class="hero-orb hero-orb-1"></div>
        <div class="hero-orb hero-orb-2"></div>
        <div class="page-hero-content">
            <nav class="breadcrumb"><a href="index.html">Home</a><i class="fas fa-chevron-right"></i><a href="blog.html">Blog</a><i class="fas fa-chevron-right"></i><span>$heading</span></nav>
            <div class="post-meta-row">
                <span class="blog-cat">$category</span>
                <span class="blog-read-time"><i class="fas fa-clock"></i> $readTime</span>
                <span class="blog-date"><i class="fas fa-calendar"></i> $date</span>
            </div>
            <h1 class="page-hero-title" style="font-size:clamp(1.8rem,4vw,3rem);">$heading</h1>
            <div class="post-author-strip">
                <div class="blog-author-pill">
                    <img src="assets/images/profile.png" alt="Gunaseelan Madhavan" class="author-avatar" style="object-fit:cover;">
                    <div>
                        <p class="author-name">Gunaseelan Madhavan</p>
                        <p class="author-title">Technical Architect & Cloud SME</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ARTICLE BODY -->
    <section class="section">
        <div class="container">
            <article class="post-content glass-card reveal-up" style="max-width: 800px; margin: 0 auto; padding: 3rem; text-align: left; line-height: 1.8; color: var(--text);">
$bodyHtml
            </article>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="index.html" class="nav-logo">
                        <div class="logo-icon">
                            <svg class="oloid-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                                <path d="M50 10 A 40 40 0 0 1 90 50 L 90 50 A 40 40 0 0 1 50 90 A 40 40 0 0 1 10 50 L 10 50 A 40 40 0 0 1 50 10 Z" fill="none" stroke="url(#logo-grad-f-$urlPath)" stroke-width="6" />
                                <path d="M50 10 C 65 30, 65 70, 50 90" fill="none" stroke="url(#logo-grad-f-$urlPath)" stroke-width="3" stroke-opacity="0.5" />
                                <path d="M10 50 C 30 35, 70 35, 90 50" fill="none" stroke="url(#logo-grad-f-$urlPath)" stroke-width="3" stroke-opacity="0.5" />
                                <defs>
                                    <linearGradient id="logo-grad-f-$urlPath" x1="0%" y1="0%" x2="100%" y2="100%">
                                        <stop offset="0%" style="stop-color:#45A29E;stop-opacity:1" />
                                        <stop offset="100%" style="stop-color:#66FCF1;stop-opacity:1" />
                                    </linearGradient>
                                </defs>
                            </svg>
                        </div>
                        <span class="logo-text">ApexDigits</span>
                    </a>
                    <p>Strategic IT Infrastructure, Cloud Transformation, and Digital Workplace Consultation.</p>
                </div>
                <div class="footer-links">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="about.html">About Me</a></li>
                        <li><a href="expertise.html">Portfolio</a></li>
                        <li><a href="experience.html">Experience</a></li>
                        <li><a href="services.html">Services</a></li>
                    </ul>
                </div>
                <div class="footer-contact">
                    <h4>Get In Touch</h4>
                    <ul>
                        <li><i class="fas fa-envelope"></i> Gunaseelan.Madhavan@ApexDigits.net</li>
                        <li><i class="fas fa-phone"></i> +44 7442 316163</li>
                        <li><i class="fas fa-map-marker-alt"></i> Stafford, United Kingdom</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 ApexDigits. All rights reserved.</p>
            </div>
        </div>
    </footer>
    <script src="script.js"></script>
</body>
</html>
"@
    return $template
}

# ----------------- WRITE FILES -----------------

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Create Service Pages
$servicesData = @(
    @{
        title = "Azure DevOps Consulting & IaC Pipelines"
        description = "Expert Azure DevOps Consulting. Accelerate enterprise deployment cycles with secure CI/CD pipelines, automated Terraform orchestration, and policy guardrails."
        urlPath = "azure-devops-consulting"
        logoGrad = "background: linear-gradient(135deg, #0078d4 0%, #5c2d91 100%);"
        heroClass = "services-with-bg"
        heading = "Azure DevOps Consulting"
        subheading = "Enabling enterprise agility and secure deployment pipelines via automated Terraform infrastructures and Azure DevOps (YAML) orchestrations."
        icon = "fab fa-microsoft"
        cardTitle = "Automated Infrastructure & Pipelines"
        overview = "Bespoke DevOps engineering to automate software release lifecycles. We implement hardened Azure Pipelines, manage enterprise Terraform registries, build secure key-vault credentials references, and configure branch policy compliance guardrails."
        features = @(
            "Multi-stage YAML Pipelines",
            "Terraform Infrastructure as Code",
            "Azure Key Vault Integrations",
            "Self-Hosted DevOps Agents",
            "Branch Security & Policies",
            "Automatic DevSecOps Auditing"
        )
        whyConsult = "We design secure, repeatable pipelines that guarantee consistency and eliminate deployment drift. Serve clients across Staffordshire, West Midlands, and London with hybrid onsite-offshore scaling capabilities."
    },
    @{
        title = "Azure Security Assessment & Compliance Audit"
        description = "Professional Azure Security Assessment. Identify vulnerability gaps, audit Entra ID configurations, audit Azure Network Security groups, and map CIS security benchmarks."
        urlPath = "azure-security-assessment"
        logoGrad = "background: linear-gradient(135deg, #0078d4 0%, #107c41 100%);"
        heroClass = "services-with-bg"
        heading = "Azure Security Assessment"
        subheading = "Audit subscription resources, tighten Entra ID Conditional Access rules, and map governance rules using Defender for Cloud and Azure Policy."
        icon = "fas fa-shield-halved"
        cardTitle = "Hardened Subscription Architectures"
        overview = "Our security audits uncover hidden structural vulnerabilities in your cloud subscriptions. We review Microsoft Defender policies, audit Azure Active Directory (Entra ID) configuration, review Network Security Groups (NSGs), and build automated Azure Policy configurations."
        features = @(
            "Microsoft Defender for Cloud Auditing",
            "Entra ID RBAC & PAM Audits",
            "Network Security Group Compliance",
            "Azure Policy Guardrails Configuration",
            "KMS Encryption Audit",
            "CIS & ISO Regulatory Mapping"
        )
        whyConsult = "We ensure your enterprise tenant is completely secure and compliant. We bring 20+ years of security expertise and advise organizations locally across Stafford and the UK."
    },
    @{
        title = "AWS Cloud Architecture & Infrastructure Design"
        description = "Hardened AWS Cloud Architecture. Design highly available multi-region infrastructures, deploy containers, and optimize scalable serverless frameworks."
        urlPath = "aws-cloud-architecture"
        logoGrad = "background: linear-gradient(135deg, #ff9900 0%, #3f51b5 100%);"
        heroClass = "services-with-bg"
        heading = "AWS Cloud Architecture"
        subheading = "Implement scalable, highly available enterprise environments compliant with the AWS Well-Architected Framework."
        icon = "fab fa-aws"
        cardTitle = "Resilient Enterprise AWS Platforms"
        overview = "Transition from monolithic setups to secure microservices. We build multi-region network topologies, orchestrate container applications (EKS/ECS), configure load balancers, and automate systems with Terraform."
        features = @(
            "Well-Architected Infrastructure Design",
            "EKS & ECS Container Topologies",
            "Serverless Lambda Architectures",
            "Elastic Load Balancing (ELB/ALB)",
            "Auto-Scaling Group Orchestration",
            "Infrastructure as Code (Terraform)"
        )
        whyConsult = "Our designs are highly resilient and cost-optimized. We act as your fractional Technical Architect and deliver high-touch guidance locally in Stafford, London, and the West Midlands."
    },
    @{
        title = "AWS Landing Zone Design & Governance Setup"
        description = "Hardened AWS Landing Zone Design. Configure AWS Control Tower, enforce centralized multi-account logging, SCPs, and single sign-on (SSO) configurations."
        urlPath = "aws-landing-zone-design"
        logoGrad = "background: linear-gradient(135deg, #ff9900 0%, #e91e63 100%);"
        heroClass = "services-with-bg"
        heading = "AWS Landing Zone Design"
        subheading = "Centralize multi-account logging, enforce governance policies, and configure Transit Gateway networks via AWS Control Tower."
        icon = "fas fa-network-wired"
        cardTitle = "Centralized AWS Governance Design"
        overview = "We implement secure multi-account AWS environments using AWS Control Tower and AWS Organizations. Centralize audit logs, configure Service Control Policies (SCPs), enforce networking hubs, and secure IAM Identity Center access."
        features = @(
            "AWS Control Tower Organization Design",
            "Multi-account Organizational Unit (OU) Structures",
            "Service Control Policies (SCPs)",
            "Centralized CloudTrail Logging",
            "IAM Identity Center (SSO)",
            "Transit Gateway Hub-and-Spoke Networking"
        )
        whyConsult = "We configure enterprise account baselines that are secure by default. We deliver expert cloud landing zones built using Terraform automation directly to your team."
    },
    @{
        title = "NetScaler ADC & Citrix Gateway Consulting"
        description = "Advanced NetScaler ADC (Citrix ADC) Consulting. Expert traffic management, SSL offloading, Web Application Firewall (WAF), GSLB, and Zero Trust Gateway access."
        urlPath = "citrix-adc-consulting"
        logoGrad = "background: linear-gradient(135deg, #02a1e2 0%, #3f51b5 100%);"
        heroClass = "services-with-bg"
        heading = "NetScaler ADC Consulting"
        subheading = "Configure advanced traffic optimization, secure remote access, SSL profile hardening, and GSLB with NetScaler ADC."
        icon = "fas fa-server"
        cardTitle = "Optimized NetScaler & Traffic Delivery"
        overview = "Hardened traffic management and remote access setups. We configure high availability clusters, design Global Server Load Balancing (GSLB) policies, implement WAF defense, and optimize StoreFront delivery configurations."
        features = @(
            "NetScaler Gateway Remote Access",
            "Global Server Load Balancing (GSLB)",
            "Web Application Firewall (WAF) Configurations",
            "SSL/TLS Profile Hardening & Offloading",
            "Contextual Traffic Policies & Rewrites",
            "High Availability (HA) Clustering"
        )
        whyConsult = "We are Citrix/NetScaler Subject Matter Experts with enterprise scaling backgrounds (NatWest Group, IBM). We maximize infrastructure performance for local UK and international systems."
    },
    @{
        title = "Citrix Modernization & VDI Image Automation"
        description = "Expert Citrix Modernization Services. Modernize virtual desktops, automate images (MCS/PVS), configure FSLogix containers, and deploy Workspace Environment Management (WEM)."
        urlPath = "citrix-modernization-services"
        logoGrad = "background: linear-gradient(135deg, #02a1e2 0%, #ff5722 100%);"
        heroClass = "services-with-bg"
        heading = "Citrix Modernization Services"
        subheading = "Upgrade virtual desktops, automate provisioning using MCS and PVS, and optimize performance via Citrix WEM."
        icon = "fas fa-desktop"
        cardTitle = "Modern Virtual Desktop Infrastructure"
        overview = "Modernize legacy Citrix platforms to hybrid cloud delivery models. We build automated Machine Creation Services (MCS) and Provisioning Services (PVS) image pipelines, deploy FSLogix profile virtualization, and optimize resource settings using WEM."
        features = @(
            "Citrix Virtual Apps & Desktops Upgrades",
            "Automated MCS & PVS Image Pipelines",
            "FSLogix Profile Container Deployments",
            "Citrix WEM Resource Optimization",
            "Workspace App Hardening & Customization",
            "Hybrid Cloud Resource Integration"
        )
        whyConsult = "We transform sluggish legacy environments into lightning-fast workspaces. Get local architecture support directly in Stafford, the West Midlands, and London."
    },
    @{
        title = "Multi-Cloud Architecture & Cross-Cloud Networks"
        description = "Enterprise Multi-Cloud Architecture. Harden environments across Azure, AWS, and GCP with unified governance and Terraform infrastructure automation."
        urlPath = "multi-cloud-architecture"
        logoGrad = "background: linear-gradient(135deg, #45A29E 0%, #66FCF1 100%);"
        heroClass = "services-with-bg"
        heading = "Multi-Cloud Architecture"
        subheading = "Design consistent governance, hybrid cloud networks, and unified identity boundaries across AWS, Azure, and GCP."
        icon = "fas fa-cubes"
        cardTitle = "Unified Multi-Cloud Infrastructure"
        overview = "Avoid vendor lock-in. We build multi-cloud platforms using Terraform automation, connect networks using VPN/ExpressRoute/DirectConnect, unify identity federation, and enforce consistent security guardrails across providers."
        features = @(
            "Cross-Cloud Network Topologies",
            "Unified Identity Federation & SSO",
            "Multi-provider Infrastructure as Code (IaC)",
            "Centralized Multi-cloud Security Controls",
            "Unified Monitoring & Log Aggregation",
            "Cross-cloud Workload Migrations"
        )
        whyConsult = "We combine deep technical expertise in both Microsoft and AWS ecosystems. We advise organizations locally across the UK and internationally on hybrid cloud transformation strategies."
    }
)

foreach ($s in $servicesData) {
    $html = Get-ServiceTemplate -title $s.title -description $s.description -urlPath $s.urlPath -logoGrad $s.logoGrad -heroClass $s.heroClass -heading $s.heading -subheading $s.subheading -icon $s.icon -cardTitle $s.cardTitle -overview $s.overview -features $s.features -whyConsult $s.whyConsult
    [System.IO.File]::WriteAllText("$projDir\$($s.urlPath).html", $html, $utf8NoBom)
    Write-Host "Created Service Page: $($s.urlPath).html" -ForegroundColor Green
}

# Create Blog Pages
$blogsData = @(
    @{
        title = "Optimizing Multi-Cloud Costs 2026: Cost Reduction Guide"
        description = "Enterprise Multi-Cloud Cost Optimization in 2026. Practical strategies for right-sizing, reserved instances, automated schedules, and cloud waste elimination."
        urlPath = "optimizing-multi-cloud-costs-2026"
        category = "Cloud Finance"
        readTime = "10 min read"
        date = "July 2026"
        heading = "Optimizing Multi-Cloud Costs 2026"
        bodyHtml = @"
<h2>Enterprise Cloud Cost Management</h2>
<p>As enterprise cloud adoption matures, multi-cloud setups across AWS and Microsoft Azure are becoming standard. While this offers resilience, it introduces massive cost complexities. In 2026, uncontrolled cloud spend remains a major pain point. This guide details practical architectural strategies to eliminate cloud waste and optimize budgets.</p>

<h3>1. Right-Sizing Compute & Storage</h3>
<p>Over-provisioning is the leading cause of cloud waste. Analyze utilization metrics for VM and database nodes. Right-size instances based on historical CPU, memory, and disk IOPS usage. Leverage family upgrades (e.g., migrating from older AWS M5 instances to Graviton-powered M7g instances) to improve performance-per-dollar ratios.</p>

<h3>2. Commitment-Based Pricing Models</h3>
<p>Commit to predictable baseline workloads to unlock steep discounts. Mix Reserved Instances (RIs) and Savings Plans on AWS, alongside Reserved VM Instances on Azure. Implement flexible plans that adapt to shifting multi-cloud architectures over a 1 or 3-year term.</p>

<h3>3. Automated Resource Scheduling</h3>
<p>Implement automation scripts to shut down non-production resources (dev, staging, sandbox environments) outside of business hours. Configure auto-scaling groups to shrink compute instances to zero during low-traffic periods.</p>

<div class="info-block">
  <strong>Key Takeaway:</strong> Establishing a unified FinOps governance structure across AWS and Azure is critical to tracking, allocating, and optimizing multi-cloud budgets.
</div>
"@
    },
    @{
        title = "Citrix Cloud Migration: Financial Sector Case Study"
        description = "Citrix Cloud Migration Case Study. Transitioning a large financial enterprise to Citrix DaaS in Microsoft Azure with secure hybrid connectivity."
        urlPath = "citrix-cloud-migration-case-study"
        category = "Case Study"
        readTime = "12 min read"
        date = "June 2026"
        heading = "Citrix Cloud Migration Case Study"
        bodyHtml = @"
<h2>Financial Enterprise Migration Playbook</h2>
<p>This case study details the migration of a major financial organization (10,000+ active sessions) from legacy on-premises Citrix Virtual Apps and Desktops (CVAD) to Citrix DaaS in Microsoft Azure. The project focused on security compliance, hybrid connectivity, and seamless user transitions.</p>

<h3>The Challenge</h3>
<p>The client required high performance and strict security (complying with banking regulations). On-premises hardware was reaching end-of-life, and managing database nodes and StoreFront clusters across data centers was administratively expensive.</p>

<h3>The Solution</h3>
<p>We designed and implemented a hybrid architecture:
<ul>
  <li>Citrix Cloud control plane managing virtual delivery agents (VDAs) in Microsoft Azure.</li>
  <li>ExpressRoute connections linking Azure resource locations to secure on-premises directories and core databases.</li>
  <li>Hardened FSLogix profile container storage utilizing Azure NetApp Files for sub-millisecond user logons.</li>
</ul>
</p>

<h3>The Results</h3>
<p>Logon times were cut by 40%, administrative overhead was halved, and the client achieved full regulatory compliance through role-based access controls and encrypted storage tiers.</p>
"@
    },
    @{
        title = "Azure Virtual Desktop Migration Guide & Tutorial"
        description = "Step-by-step Azure Virtual Desktop (AVD) Migration Tutorial. Configure host pools, FSLogix profiles, Entra ID joins, and scaling scripts."
        urlPath = "azure-virtual-desktop-migration-guide"
        category = "Tutorial"
        readTime = "15 min read"
        date = "May 2026"
        heading = "Azure Virtual Desktop Migration Guide"
        bodyHtml = @"
<h2>Step-by-Step AVD Migration</h2>
<p>Migrating physical or legacy virtual desktop infrastructures to Azure Virtual Desktop (AVD) offers scalability and natively integrates with Microsoft Entra ID. This tutorial covers the step-by-step configuration of an enterprise-ready AVD environment.</p>

<h3>Step 1: Landing Zone & Networking</h3>
<p>Configure a secure hub-and-spoke virtual network in Azure. Establish hybrid connectivity (VPN or ExpressRoute) to your active directory environment and allocate dedicated subnets for AVD host pools.</p>

<h3>Step 2: Host Pool Configuration</h3>
<p>Create a pooled or personal host pool. Select multi-session Windows 11 Enterprise templates to maximize user densities, and enable Entra ID-joined host pools to eliminate legacy domain controller dependencies.</p>

<h3>Step 3: FSLogix Profile Management</h3>
<p>Create Azure Files storage accounts with AD DS or Entra ID authentication. Install and configure the FSLogix agent on your golden image, pointing Profile Containers to the file shares to support persistent user settings.</p>
"@
    },
    @{
        title = "Securing AWS Control Tower Organizations & Governance"
        description = "Hardening AWS Control Tower Organizations. Enforce Service Control Policies (SCPs), Guardrails, IAM Identity Center, and centralized auditing."
        urlPath = "securing-aws-control-tower-organizations"
        category = "Security"
        readTime = "11 min read"
        date = "April 2026"
        heading = "Securing AWS Control Tower"
        bodyHtml = @"
<h2>Multi-Account AWS Security Baselines</h2>
<p>AWS Control Tower automates the setup of a multi-account organization, but hardening the structure requires implementing advanced service control policies and centralized security guardrails. This guide outlines key security baselines.</p>

<h3>1. Restricting Member Regions via SCPs</h3>
<p>Deploy Service Control Policies (SCPs) at the root level of AWS Organizations to restrict API operations outside authorized regions. This blocks shadow IT and reduces your attack surface.</p>

<h3>2. Centralized Security Logging</h3>
<p>Route all AWS CloudTrail and VPC Flow Logs from member accounts into a dedicated, write-once-read-many (WORM) Log Archive account. Protect the bucket with AWS KMS customer-managed keys (CMK).</p>

<h3>3. Implementing Least Privilege with IAM Identity Center</h3>
<p>Migrate all user authentication to AWS IAM Identity Center (Single Sign-On). Enforce multi-factor authentication (MFA) and define granular Permission Sets to prevent privilege creep.</p>
"@
    },
    @{
        title = "Hybrid Cloud Active Directory Integration & Sync"
        description = "Designing Hybrid Active Directory Environments. Configure Entra Cloud Sync, ADFS federation, and password hash synchronization."
        urlPath = "hybrid-cloud-active-directory-integration"
        category = "Identity"
        readTime = "9 min read"
        date = "March 2026"
        heading = "Hybrid Cloud AD Integration"
        bodyHtml = @"
<h2>Bridging On-Premises AD and Entra ID</h2>
<p>Maintaining a seamless, secure identity boundary across on-premises servers and Microsoft Azure is the foundation of digital workplace security. This guide compares integration methods and details sync processes.</p>

<h3>Sync Options: Entra Connect vs. Cloud Sync</h3>
<p>While Microsoft Entra Connect is the legacy solution, Microsoft Entra Cloud Sync offloads the synchronization workload from your local domain controllers to the Microsoft cloud service, using lightweight agents.</p>

<h3>Implementing Password Hash Synchronization</h3>
<p>Enable Password Hash Synchronization (PHS) alongside Seamless Single Sign-On. This provides users with single-credential login access to cloud resources while enabling Entra ID to detect leaked credentials on the dark web.</p>
"@
    },
    @{
        title = "Improving Core Web Vitals for Static HTML Sites"
        description = "Optimize static HTML sites for Core Web Vitals and SEO. Minimize CSS/JS payloads, optimize images to WebP, leverage CDNs, and configure caching."
        urlPath = "improving-core-web-vitals-static-sites"
        category = "Performance"
        readTime = "8 min read"
        date = "February 2026"
        heading = "Optimizing Core Web Vitals"
        bodyHtml = @"
<h2>Accelerate Your Static Site Performance</h2>
<p>Search engines prioritize websites that load instantly and offer visual interactions. For static HTML sites, achieving Core Web Vitals (LCP, FID, CLS) is highly achievable. This article covers the essential optimizations.</p>

<h3>1. Largest Contentful Paint (LCP)</h3>
<p>Improve LCP by compressing high-resolution images. Convert PNG/JPG files to next-gen formats like WebP or AVIF. Host site assets on global Content Delivery Networks (CDNs) like Vercel Edge or Cloudflare to deliver files from servers closest to users.</p>

<h3>2. Cumulative Layout Shift (CLS)</h3>
<p>Prevent page shifting by declaring explicit dimensions on all images. Use font-display: swap in CSS to load fallback system fonts instantly while web fonts load.</p>

<h3>3. Inline Critical CSS</h3>
<p>Extract and inline the CSS required to render the top portion of your page directly inside your `<head>` block, and defer loading the rest of your stylesheets.</p>
"@
    },
    @{
        title = "Zero Trust Network Access (ZTNA) with NetScaler Gateway"
        description = "Implement Zero Trust Network Access (ZTNA) using NetScaler Gateway. Configure nFactor MFA, endpoint posture checks, and contextual policies."
        urlPath = "zero-trust-network-access-netscaler"
        category = "Zero Trust"
        readTime = "13 min read"
        date = "January 2026"
        heading = "ZTNA with NetScaler Gateway"
        bodyHtml = @"
<h2>Hardened Remote Access Infrastructure</h2>
<p>Legacy VPNs grant excessive trust to user devices. Under the Zero Trust Security Model, access must be continuously authenticated and verified. This guide outlines configuring ZTNA on NetScaler Gateway.</p>

<h3>1. nFactor Multi-Factor Authentication</h3>
<p>Configure nFactor pipelines on NetScaler Gateway to run sequential authentication checks. Enforce Entra ID SAML authentication in the first factor, and run a secondary check for push notifications or security tokens.</p>

<h3>2. Endpoint Posture Analysis (EPA)</h3>
<p>Configure pre-authentication EPA policies on the gateway to scan user devices for compliant anti-virus software, enabled firewalls, and active registry checks before prompting for login.</p>

<h3>3. Contextual Access Policies</h3>
<p>Define dynamic session profiles that restrict file downloads, clipboard copying, and local drive mapping if users log in from personal devices or untrusted IP addresses.</p>
"@
    }
)

foreach ($b in $blogsData) {
    $html = Get-BlogTemplate -title $b.title -description $b.description -urlPath $b.urlPath -category $b.category -readTime $b.readTime -date $b.date -heading $b.heading -bodyHtml $b.bodyHtml
    [System.IO.File]::WriteAllText("$projDir\$($b.urlPath).html", $html, $utf8NoBom)
    Write-Host "Created Blog Page: $($b.urlPath).html" -ForegroundColor Green
}

# ----------------- UPDATE INTEGRATIONS -----------------

$servicesFile = "$projDir\services.html"
$servicesContent = [System.IO.File]::ReadAllText($servicesFile, [System.Text.Encoding]::UTF8)

$newServicesGrid = @"
            <div class="services-grid" style="grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));">
                <!-- AZURE CONSULTING -->
                <div class="service-card glass-card reveal-up">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #0078d4 0%, #00bcf2 100%);">
                        <i class="fab fa-microsoft"></i>
                    </div>
                    <h3>Azure Consulting</h3>
                    <p>Microsoft Cloud Adoption Framework (CAF) compliant landing zones, enterprise governance, policy guardrails, and hybrid networking.</p>
                    <a href="azure-consulting.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- AWS SECURITY CONSULTING -->
                <div class="service-card glass-card reveal-up delay-1">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #ff9900 0%, #ffc800 100%);">
                        <i class="fab fa-aws"></i>
                    </div>
                    <h3>AWS Security Consulting</h3>
                    <p>Hardened multi-account structures, AWS Control Tower governance, IAM audit, KMS setups, and Security Hub compliance.</p>
                    <a href="aws-security-consulting.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- CITRIX MIGRATION SERVICES -->
                <div class="service-card glass-card reveal-up delay-2">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #02a1e2 0%, #00c6ff 100%);">
                        <i class="fas fa-desktop"></i>
                    </div>
                    <h3>Citrix Migration Services</h3>
                    <p>Seamless transition from on-premises CVAD to Citrix DaaS (Citrix Cloud), NetScaler ADC optimizations, and MCS/PVS image automation.</p>
                    <a href="citrix-migration-services.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- AZURE VIRTUAL DESKTOP -->
                <div class="service-card glass-card reveal-up">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #0078d4 0%, #50a7f9 100%);">
                        <i class="fas fa-network-wired"></i>
                    </div>
                    <h3>Azure Virtual Desktop</h3>
                    <p>Enterprise VDI design on Azure. host pools provisioning, FSLogix profile container setup, autoscale controls, and secure workspace configurations.</p>
                    <a href="azure-virtual-desktop.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- DEVOPS ENGINEERING -->
                <div class="service-card glass-card reveal-up delay-1">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #333 0%, #555 100%);">
                        <i class="fas fa-gears"></i>
                    </div>
                    <h3>DevOps Engineering</h3>
                    <p>Continuous Integration and Continuous Deployment (CI/CD) pipelines, Infrastructure as Code automation with Terraform, and security scanning.</p>
                    <a href="devops-engineering.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- CLOUD SECURITY ASSESSMENT -->
                <div class="service-card glass-card reveal-up delay-2">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #107c41 0%, #1f9a55 100%);">
                        <i class="fas fa-shield-halved"></i>
                    </div>
                    <h3>Cloud Security Assessment</h3>
                    <p>Compliance auditing, threat modeling, IAM auditing, security baseline scans, and vulnerability assessments across AWS and Azure environments.</p>
                    <a href="cloud-security-assessment.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- INFRASTRUCTURE AUTOMATION -->
                <div class="service-card glass-card reveal-up">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #f39c12 0%, #f1c40f 100%);">
                        <i class="fas fa-code"></i>
                    </div>
                    <h3>Infrastructure Automation</h3>
                    <p>Zero-touch deployment scripts, PowerShell utility runbooks, configuration drift remediation, and cloud systems automation.</p>
                    <a href="infrastructure-automation.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- AZURE DEVOPS CONSULTING -->
                <div class="service-card glass-card reveal-up delay-1">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #0078d4 0%, #5c2d91 100%);">
                        <i class="fab fa-microsoft"></i>
                    </div>
                    <h3>Azure DevOps Consulting</h3>
                    <p>Establish production YAML deployment pipelines, configure Terraform orchestration, secure credential managers, and enforce compliance gates.</p>
                    <a href="azure-devops-consulting.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- AZURE SECURITY ASSESSMENT -->
                <div class="service-card glass-card reveal-up delay-2">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #0078d4 0%, #107c41 100%);">
                        <i class="fas fa-shield-halved"></i>
                    </div>
                    <h3>Azure Security Assessment</h3>
                    <p>Tighten Entra ID controls, scan subscription assets, configure Azure Policy audit baselines, and map CIS compliance regulations.</p>
                    <a href="azure-security-assessment.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- AWS CLOUD ARCHITECTURE -->
                <div class="service-card glass-card reveal-up">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #ff9900 0%, #3f51b5 100%);">
                        <i class="fab fa-aws"></i>
                    </div>
                    <h3>AWS Cloud Architecture</h3>
                    <p>Design multi-region systems, ECS/EKS microservices container host nodes, and serverless compute frameworks using Terraform IaC.</p>
                    <a href="aws-cloud-architecture.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- AWS LANDING ZONE DESIGN -->
                <div class="service-card glass-card reveal-up delay-1">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #ff9900 0%, #e91e63 100%);">
                        <i class="fas fa-network-wired"></i>
                    </div>
                    <h3>AWS Landing Zone Design</h3>
                    <p>Orchestrate multi-account setups with AWS Control Tower, centralized CloudTrail auditing structures, and IAM SSO logins.</p>
                    <a href="aws-landing-zone-design.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- NETSCALER ADC CONSULTING -->
                <div class="service-card glass-card reveal-up delay-2">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #02a1e2 0%, #3f51b5 100%);">
                        <i class="fas fa-server"></i>
                    </div>
                    <h3>NetScaler ADC Consulting</h3>
                    <p>Tune NetScaler Gateway secure logins, Global Server Load Balancing (GSLB) traffic redirection, and SSL/TLS profile hardening.</p>
                    <a href="citrix-adc-consulting.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- CITRIX MODERNIZATION -->
                <div class="service-card glass-card reveal-up">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #02a1e2 0%, #ff5722 100%);">
                        <i class="fas fa-desktop"></i>
                    </div>
                    <h3>Citrix Modernization Services</h3>
                    <p>Upgrade to Citrix DaaS hybrid resource providers, automate MCS/PVS image templates, and configure FSLogix containers.</p>
                    <a href="citrix-modernization-services.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>

                <!-- MULTI-CLOUD ARCHITECTURE -->
                <div class="service-card glass-card reveal-up delay-1">
                    <div class="service-icon-wrapper" style="background: linear-gradient(135deg, #45A29E 0%, #66FCF1 100%);">
                        <i class="fas fa-cubes"></i>
                    </div>
                    <h3>Multi-Cloud Architecture</h3>
                    <p>Enforce cross-cloud networks (Azure/AWS), centralized hybrid logging boundaries, and multi-provider Terraform setups.</p>
                    <a href="multi-cloud-architecture.html" class="btn btn-outline" style="margin-top: 1.5rem; display: inline-flex; justify-content: center; align-items: center; width: 100%;">Explore Service <i class="fas fa-arrow-right" style="margin-left: 0.5rem;"></i></a>
                </div>
            </div>
"@

$pattern = '(?s)<!-- SPECIALIZED SOLUTIONS -->.*?<div class="services-grid">.*?</div>\s*</div>\s*</section>'

$replacement = @"
<!-- SPECIALIZED SOLUTIONS -->
    <section class="section section-dark">
        <div class="container">
            <div class="section-header">
                <span class="section-tag">Specialized Expertise</span>
                <h2 class="section-title">Targeted <span class="gradient-text">Service Offerings</span></h2>
                <p class="section-desc">Bespoke technical consultations and implementation services for enterprise cloud architectures and digital workspaces.</p>
            </div>

$newServicesGrid
        </div>
    </section>
"@

$servicesContent = [System.Text.RegularExpressions.Regex]::Replace($servicesContent, $pattern, $replacement)
[System.IO.File]::WriteAllText($servicesFile, $servicesContent, $utf8NoBom)
Write-Host "Updated services.html specialized grid!" -ForegroundColor Green


# Update blog.html
$blogFile = "$projDir\blog.html"
$blogContent = [System.IO.File]::ReadAllText($blogFile, [System.Text.Encoding]::UTF8)

$newBlogCards = @"
                    <article class="blog-wp-card" data-category="multi-cloud">
                        <div class="blog-wp-thumb" style="color:#0078d4;"><i class="fas fa-chart-line"></i></div>
                        <div class="blog-wp-content">
                            <div class="blog-wp-header">
                                <span class="blog-cat">Cloud Finance</span>
                                <span><i class="fas fa-calendar"></i> July 2026</span>
                                <span><i class="fas fa-clock"></i> 10 min read</span>
                            </div>
                            <h3><a href="optimizing-multi-cloud-costs-2026.html" style="text-decoration:none;color:inherit;">Optimizing Multi-Cloud Costs 2026: Cost Reduction Guide</a></h3>
                            <p class="blog-wp-excerpt">Enterprise cost management strategies for AWS and Azure. Reviewing right-sizing, reserved instances, saving plans, and cloud waste minimization.</p>
                            <div class="blog-wp-footer">
                                <span class="author-name" style="font-size:0.8rem;color:var(--text-muted);">By Gunaseelan Madhavan</span>
                                <a href="optimizing-multi-cloud-costs-2026.html" class="blog-link" style="font-size:0.85rem;">Read More <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </article>

                    <article class="blog-wp-card" data-category="euc">
                        <div class="blog-wp-thumb" style="color:var(--accent);"><i class="fas fa-desktop"></i></div>
                        <div class="blog-wp-content">
                            <div class="blog-wp-header">
                                <span class="blog-cat">Case Study</span>
                                <span><i class="fas fa-calendar"></i> June 2026</span>
                                <span><i class="fas fa-clock"></i> 12 min read</span>
                            </div>
                            <h3><a href="citrix-cloud-migration-case-study.html" style="text-decoration:none;color:inherit;">Citrix Cloud Migration: Financial Sector Case Study</a></h3>
                            <p class="blog-wp-excerpt">A deep dive into migrating a large financial sector client from legacy CVAD to Citrix DaaS in Microsoft Azure with secure hybrid networks.</p>
                            <div class="blog-wp-footer">
                                <span class="author-name" style="font-size:0.8rem;color:var(--text-muted);">By Gunaseelan Madhavan</span>
                                <a href="citrix-cloud-migration-case-study.html" class="blog-link" style="font-size:0.85rem;">Read More <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </article>

                    <article class="blog-wp-card" data-category="euc">
                        <div class="blog-wp-thumb" style="color:var(--accent);"><i class="fas fa-desktop"></i></div>
                        <div class="blog-wp-content">
                            <div class="blog-wp-header">
                                <span class="blog-cat">Tutorial</span>
                                <span><i class="fas fa-calendar"></i> May 2026</span>
                                <span><i class="fas fa-clock"></i> 15 min read</span>
                            </div>
                            <h3><a href="azure-virtual-desktop-migration-guide.html" style="text-decoration:none;color:inherit;">Azure Virtual Desktop Migration Guide & Tutorial</a></h3>
                            <p class="blog-wp-excerpt">Step-by-step technical tutorial on migrating legacy virtual desktop infrastructure (VDI) to Azure Virtual Desktop (AVD) using Entra ID.</p>
                            <div class="blog-wp-footer">
                                <span class="author-name" style="font-size:0.8rem;color:var(--text-muted);">By Gunaseelan Madhavan</span>
                                <a href="azure-virtual-desktop-migration-guide.html" class="blog-link" style="font-size:0.85rem;">Read More <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </article>

                    <article class="blog-wp-card" data-category="security">
                        <div class="blog-wp-thumb" style="color:#ff9900;"><i class="fas fa-shield-halved"></i></div>
                        <div class="blog-wp-content">
                            <div class="blog-wp-header">
                                <span class="blog-cat">Security</span>
                                <span><i class="fas fa-calendar"></i> April 2026</span>
                                <span><i class="fas fa-clock"></i> 11 min read</span>
                            </div>
                            <h3><a href="securing-aws-control-tower-organizations.html" style="text-decoration:none;color:inherit;">Securing AWS Control Tower Organizations & Governance</a></h3>
                            <p class="blog-wp-excerpt">Hardening multi-account environments. Defining Service Control Policies (SCPs), configuring Guardrails, and routing CloudTrail centralized logs.</p>
                            <div class="blog-wp-footer">
                                <span class="author-name" style="font-size:0.8rem;color:var(--text-muted);">By Gunaseelan Madhavan</span>
                                <a href="securing-aws-control-tower-organizations.html" class="blog-link" style="font-size:0.85rem;">Read More <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </article>

                    <article class="blog-wp-card" data-category="security">
                        <div class="blog-wp-thumb" style="color:#0078d4;"><i class="fas fa-id-card"></i></div>
                        <div class="blog-wp-content">
                            <div class="blog-wp-header">
                                <span class="blog-cat">Security</span>
                                <span><i class="fas fa-calendar"></i> March 2026</span>
                                <span><i class="fas fa-clock"></i> 9 min read</span>
                            </div>
                            <h3><a href="hybrid-cloud-active-directory-integration.html" style="text-decoration:none;color:inherit;">Hybrid Cloud Active Directory Integration & Sync</a></h3>
                            <p class="blog-wp-excerpt">Designing hybrid identity boundaries. Configuring Entra Cloud Sync agents, configuring ADFS SSO, and password sync audits.</p>
                            <div class="blog-wp-footer">
                                <span class="author-name" style="font-size:0.8rem;color:var(--text-muted);">By Gunaseelan Madhavan</span>
                                <a href="hybrid-cloud-active-directory-integration.html" class="blog-link" style="font-size:0.85rem;">Read More <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </article>

                    <article class="blog-wp-card" data-category="devops">
                        <div class="blog-wp-thumb" style="color:#333;"><i class="fas fa-gears"></i></div>
                        <div class="blog-wp-content">
                            <div class="blog-wp-header">
                                <span class="blog-cat">DevOps</span>
                                <span><i class="fas fa-calendar"></i> February 2026</span>
                                <span><i class="fas fa-clock"></i> 8 min read</span>
                            </div>
                            <h3><a href="improving-core-web-vitals-static-sites.html" style="text-decoration:none;color:inherit;">Improving Core Web Vitals for Static HTML Sites</a></h3>
                            <p class="blog-wp-excerpt">Optimize static HTML/CSS/JS files for loading speed. Compressing images, offloading to CDNs, and optimizing caching rules.</p>
                            <div class="blog-wp-footer">
                                <span class="author-name" style="font-size:0.8rem;color:var(--text-muted);">By Gunaseelan Madhavan</span>
                                <a href="improving-core-web-vitals-static-sites.html" class="blog-link" style="font-size:0.85rem;">Read More <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </article>

                    <article class="blog-wp-card" data-category="security">
                        <div class="blog-wp-thumb" style="color:var(--accent);"><i class="fas fa-lock"></i></div>
                        <div class="blog-wp-content">
                            <div class="blog-wp-header">
                                <span class="blog-cat">Security</span>
                                <span><i class="fas fa-calendar"></i> January 2026</span>
                                <span><i class="fas fa-clock"></i> 13 min read</span>
                            </div>
                            <h3><a href="zero-trust-network-access-netscaler.html" style="text-decoration:none;color:inherit;">Zero Trust Network Access (ZTNA) with NetScaler Gateway</a></h3>
                            <p class="blog-wp-excerpt">Designing remote workspace access with Zero Trust. Configuring nFactor pipelines, EPA scans, and contextual session configurations.</p>
                            <div class="blog-wp-footer">
                                <span class="author-name" style="font-size:0.8rem;color:var(--text-muted);">By Gunaseelan Madhavan</span>
                                <a href="zero-trust-network-access-netscaler.html" class="blog-link" style="font-size:0.85rem;">Read More <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </article>
"@

$pattern = '(?s)(<div class="blog-main-feed">)'
$replacement = "$1`n$newBlogCards"
$blogContent = [System.Text.RegularExpressions.Regex]::Replace($blogContent, $pattern, $replacement)
[System.IO.File]::WriteAllText($blogFile, $blogContent, $utf8NoBom)
Write-Host "Updated blog.html grid with new technical publications!" -ForegroundColor Green


# Update sitemap.xml
$sitemapFile = "$projDir\sitemap.xml"
$sitemapContent = [System.IO.File]::ReadAllText($sitemapFile, [System.Text.Encoding]::UTF8)

$newSitemapEntries = @"
  <!-- New Service Landing Pages -->
  <url>
    <loc>https://apexdigits.com/azure-devops-consulting</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/azure-security-assessment</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/aws-cloud-architecture</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/aws-landing-zone-design</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/citrix-adc-consulting</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/citrix-modernization-services</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/multi-cloud-architecture</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.7</priority>
  </url>

  <!-- New Technical Articles -->
  <url>
    <loc>https://apexdigits.com/optimizing-multi-cloud-costs-2026</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/citrix-cloud-migration-case-study</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/azure-virtual-desktop-migration-guide</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/securing-aws-control-tower-organizations</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/hybrid-cloud-active-directory-integration</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/improving-core-web-vitals-static-sites</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
  <url>
    <loc>https://apexdigits.com/zero-trust-network-access-netscaler</loc>
    <lastmod>2026-07-31</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
"@

$pattern = '(?s)(</urlset>)'
$replacement = "$newSitemapEntries`n$1"
$sitemapContent = [System.Text.RegularExpressions.Regex]::Replace($sitemapContent, $pattern, $replacement)
[System.IO.File]::WriteAllText($sitemapFile, $sitemapContent, $utf8NoBom)
Write-Host "Updated sitemap.xml with 14 new URLs!" -ForegroundColor Green

Write-Host "All page expansions and updates generated successfully!" -ForegroundColor Green
