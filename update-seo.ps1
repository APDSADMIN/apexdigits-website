# update-seo.ps1
# Overwrites all SEO metadata with optimized mappings and Schema.org structured data.

$projDir = "C:\Users\Gunas\.gemini\antigravity\scratch\apexdigits"

$seoMap = @{
    # Core Pages
    "index.html" = @{
        Title = "ApexDigits | Cloud Consulting, Azure Landing Zones & VDI SME"
        Desc = "Senior Technical Architect and Cloud SME specializing in Azure Landing Zones, AWS security, Citrix Cloud migrations, and DevOps automation in Stafford, UK."
        Type = "index"
    }
    "about.html" = @{
        Title = "About Gunaseelan Madhavan | Senior Cloud Architect & SME"
        Desc = "Learn about Gunaseelan Madhavan's 20+ years of IT infrastructure expertise architecting multi-cloud environments, DevSecOps pipelines, and Citrix VDI."
        Type = "about"
        Breadcrumb = "About"
    }
    "expertise.html" = @{
        Title = "Technical Skillset & Cloud Portfolio | Gunaseelan Madhavan"
        Desc = "Deep dive into Gunaseelan Madhavan's SME skillsets: Azure AVD, AWS Architecture, CI/CD pipelines, Citrix Cloud, Nutanix, VMware, and IT Governance."
        Type = "expertise"
        Breadcrumb = "Expertise"
    }
    "experience.html" = @{
        Title = "Professional Experience & IT Journey | Gunaseelan Madhavan"
        Desc = "Explore Gunaseelan Madhavan's professional journey, highlighting Senior Architect roles at NatWest, GFT Technologies, and Cognizant since 2002."
        Type = "experience"
        Breadcrumb = "Experience"
    }
    "services.html" = @{
        Title = "Cloud & VDI Consulting Services | Stafford, UK & Remote"
        Desc = "Professional enterprise IT consulting services: Cloud landing zone design, Citrix Cloud migration strategy, DevSecOps advisory, and security assessments."
        Type = "services"
        Breadcrumb = "Services"
    }
    "blog.html" = @{
        Title = "Cloud & EUC Insights Blog | Gunaseelan Madhavan"
        Desc = "Technical blog posts, case studies, and engineering strategies on Multi-Cloud, Citrix migration, Entra ID authentication, and Zero Trust security."
        Type = "blog"
        Breadcrumb = "Blog"
    }
    "contact.html" = @{
        Title = "Contact Gunaseelan Madhavan | Cloud Consulting & SME"
        Desc = "Get in touch with Gunaseelan Madhavan (ApexDigits) for cloud architecture, enterprise VDI migration, or DevSecOps advisory engagements."
        Type = "contact"
        Breadcrumb = "Contact"
    }
    # Service Landing Pages
    "aws-security-consulting.html" = @{
        Title = "AWS Security Consulting & Cloud Architecture | ApexDigits"
        Desc = "Expert AWS Security Consulting. Secure AWS Cloud Architecture, IAM auditing, GuardDuty compliance, and DevSecOps integrations by Senior Cloud Architect."
        Type = "service"
    }
    "azure-consulting.html" = @{
        Title = "Azure Consulting & Landing Zone Design | ApexDigits"
        Desc = "Professional Azure Consulting. Expert landing zone design, Azure DevOps integration, governance, and cloud security assessments by Senior Cloud Architect."
        Type = "service"
    }
    "azure-virtual-desktop.html" = @{
        Title = "Azure Virtual Desktop (AVD) Consultation | ApexDigits"
        Desc = "Enterprise Azure Virtual Desktop (AVD) Design & Migration. Modernize VDI, integrate FSLogix profiles, and streamline Remote Desktop client configuration."
        Type = "service"
    }
    "citrix-migration-services.html" = @{
        Title = "Citrix Cloud Migration & Modernization Services | ApexDigits"
        Desc = "Migrate legacy on-premises Citrix workloads to Citrix Cloud. Optimization, licensing modernization, NetScaler ADC consultation, and zero-trust workspace."
        Type = "service"
    }
    "cloud-security-assessment.html" = @{
        Title = "Cloud Security Assessment & Zero Trust Audit | ApexDigits"
        Desc = "Bespoke Cloud Security Assessments. Identify infrastructure vulnerabilities, review Zero Trust compliance, audit identity, and secure Microsoft Entra ID."
        Type = "service"
    }
    "devops-engineering.html" = @{
        Title = "DevOps & CI/CD Pipeline Engineering | ApexDigits"
        Desc = "Professional Azure DevOps Consulting. CI/CD pipeline automation, DevSecOps compliance integrations, infrastructure as code (Terraform), and SRE advisory."
        Type = "service"
    }
    "infrastructure-automation.html" = @{
        Title = "Infrastructure Automation & IaC Services | ApexDigits"
        Desc = "Bespoke Infrastructure Automation. We design custom Terraform scripts, automate provisioning with Bicep, build secure runbooks, and optimize cloud scale."
        Type = "service"
    }
    # Blog Articles
    "antigravity-vercel-workflow.html" = @{
        Title = "Google Antigravity, GitHub & Vercel Automation | G. Madhavan"
        Desc = "Discover how the Google Antigravity AI pair-programmer seamlessly orchestrates website updates locally, syncs securely through GitHub, and deploys globally."
        Type = "article"
    }
    "aws-security-architecture-framework.html" = @{
        Title = "AWS Security Architecture Framework | Gunaseelan Madhavan"
        Desc = "Designing secure AWS cloud environments. Framework structures, identity and access management (IAM), KMS encryption policies, and monitoring setups."
        Type = "article"
    }
    "azure-automation-powershell-scripts.html" = @{
        Title = "Azure Automation: Storing & Executing PowerShell | G. Madhavan"
        Desc = "Learn how to store safely, manage easily, and execute PowerShell scripts securely at scale using Azure Automation Runbooks."
        Type = "article"
    }
    "azure-landing-zone-best-practices-2026.html" = @{
        Title = "Azure Landing Zone Best Practices 2026 | Gunaseelan Madhavan"
        Desc = "Best practices for Azure Landing Zones in 2026. Multi-subscription structures, custom policy guardrails, networking architecture, and infrastructure automation."
        Type = "article"
    }
    "azure-virtual-desktop-vs-citrix-daas.html" = @{
        Title = "Azure Virtual Desktop vs Citrix DaaS | Gunaseelan Madhavan"
        Desc = "Architectural comparison of Microsoft Azure Virtual Desktop and Citrix Desktop-as-a-Service for enterprise EUC infrastructure environments."
        Type = "article"
    }
    "citrix-cloud-migration-playbook-2026.html" = @{
        Title = "Citrix Cloud Migration Playbook: 2026 Strategy | G. Madhavan"
        Desc = "Step-by-step strategic playbook for migrating enterprise Citrix virtualisation environments to Citrix Cloud DaaS, managing NetScaler ADC and FSLogix profiles."
        Type = "article"
    }
    "citrix-cloud-migration-step-by-step-guide.html" = @{
        Title = "Citrix Cloud Migration Step-by-Step Guide | Gunaseelan Madhavan"
        Desc = "Technical walkthrough for migrating on-premises Citrix Virtual Apps and Desktops to Citrix Cloud. NetScaler configuration, host connections, and profile optimization."
        Type = "article"
    }
    "citrix-licensing-cloud-2026-updates.html" = @{
        Title = "Citrix VDI Licensing & Cloud: 2026 Roadmap | G. Madhavan"
        Desc = "Navigating the mandatory LAS transition, new Platform licensing tiers, and Citrix Cloud innovations for the modern hybrid workplace."
        Type = "article"
    }
    "citrix-platform-flex-2026.html" = @{
        Title = "Citrix Platform Flex: Consumption-Based Licensing | G. Madhavan"
        Desc = "Exploring the new Citrix Platform Flex, a consumption-based model transforming enterprise hybrid cloud and secure access."
        Type = "article"
    }
    "citrix-zero-trust-workspace.html" = @{
        Title = "Citrix Today: Secure Workspace & Zero Trust | G. Madhavan"
        Desc = "Explore how Citrix has evolved into a modern platform for secure application and workspace delivery built fundamentally around Zero Trust principles."
        Type = "article"
    }
    "designing-resilient-landing-zones.html" = @{
        Title = "Designing Resilient Landing Zones | Gunaseelan Madhavan"
        Desc = "A deep-dive into multi-cloud landing zones across Azure, AWS and GCP - principles, anti-patterns, and guardrails for enterprise architects."
        Type = "article"
    }
    "devsecops-pipeline-implementation-guide.html" = @{
        Title = "DevSecOps Pipeline Implementation Guide | Gunaseelan Madhavan"
        Desc = "Technical guide for integrating security scans into CI/CD pipelines. SAST scanners, policy engines, and container vulnerability audits in GitHub and Azure DevOps."
        Type = "article"
    }
    "entra-cloud-sync-multi-cloud.html" = @{
        Title = "Entra Cloud Sync: Multi-Cloud Identity at Scale | G. Madhavan"
        Desc = "Mastering multi-cloud identity with Microsoft Entra Cloud Sync - a practitioner's guide to synchronization, tenant setup, and directory consolidation."
        Type = "article"
    }
    "microsoft-entra-conditional-access.html" = @{
        Title = "Entra Conditional Access: Zero Trust Engine | G. Madhavan"
        Desc = "Deep dive into Microsoft Entra Conditional Access policy evaluation architecture, and how to build a robust Zero Trust security model."
        Type = "article"
    }
    "microsoft-entra-kerberos.html" = @{
        Title = "Entra Kerberos: Modernizing Authentication | G. Madhavan"
        Desc = "Transition from legacy on-premises Kerberos to cloud-native Microsoft Entra Kerberos for seamless hybrid authentication and Azure Files access."
        Type = "article"
    }
    "multi-cloud-governance-framework.html" = @{
        Title = "Multi-Cloud Governance Framework | Gunaseelan Madhavan"
        Desc = "Enterprise framework for multi-cloud governance. Unified identity, cloud compliance tracking, chargeback allocation, and security guardrails across AWS, Azure, and GCP."
        Type = "article"
    }
    "zero-trust-practice.html" = @{
        Title = "Zero Trust in Practice: Policy to Pipeline | G. Madhavan"
        Desc = "How to operationalise Zero Trust inside modern DevOps pipelines using Azure Policy, OPA, and GitHub Actions."
        Type = "article"
    }
}

Write-Host "Starting Technical SEO Auto-Injection (Precision Map)..." -ForegroundColor Cyan
Write-Host "=========================================="

foreach ($fileName in $seoMap.Keys) {
    $filePath = Join-Path $projDir $fileName
    if (-not (Test-Path $filePath)) {
        Write-Host "[WARNING] File $fileName does not exist!" -ForegroundColor Yellow
        continue
    }
    
    $content = Get-Content -Path $filePath -Raw
    $item = $seoMap[$fileName]
    $title = $item.Title
    $desc = $item.Desc
    $pageType = $item.Type
    
    # 2. Compute URLs
    $cleanName = $fileName.Replace(".html", "")
    $canonicalUrl = "https://apexdigits.com/$cleanName"
    if ($fileName -eq "index.html") {
        $canonicalUrl = "https://apexdigits.com/"
    }
    
    # 3. Clean up existing SEO tags to avoid duplicates
    $content = [regex]::Replace($content, '(?i)\s*<title>.*?</title>', '')
    $content = [regex]::Replace($content, '(?i)\s*<meta\s+[^>]*name=["'']description["''][^>]*content=["''](.*?)["''][^>]*>', '')
    $content = [regex]::Replace($content, '(?i)\s*<meta\s+[^>]*content=["''](.*?)["''][^>]*name=["'']description["''][^>]*>', '')
    $content = [regex]::Replace($content, '(?i)\s*<meta\s+[^>]*name=["'']keywords["''][^>]*content=["''](.*?)["''][^>]*>', '')
    $content = [regex]::Replace($content, '(?i)\s*<link\s+[^>]*rel=["'']canonical["''][^>]*href=["''](.*?)["''][^>]*>', '')
    $content = [regex]::Replace($content, '(?i)\s*<meta\s+[^>]*property=["'']og:.*?["''][^>]*>', '')
    $content = [regex]::Replace($content, '(?i)\s*<meta\s+[^>]*name=["'']twitter:.*?["''][^>]*>', '')
    $content = [regex]::Replace($content, '(?i)\s*<script\s+[^>]*type=["'']application/ld\+json["''][^>]*>.*?</script>', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    
    # 4. Generate JSON-LD Structured Data
    $schemas = @()
    
    if ($fileName -eq "index.html") {
        # Homepage gets ProfessionalService, Person, and Organization
        $profService = @"
  {
    "@context": "https://schema.org",
    "@type": "ProfessionalService",
    "name": "ApexDigits",
    "image": "https://apexdigits.com/assets/images/profile.png",
    "@id": "https://apexdigits.com/#organization",
    "url": "https://apexdigits.com",
    "telephone": "+44 7442 316163",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Stafford",
      "addressRegion": "West Midlands",
      "addressCountry": "GB"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 52.8066,
      "longitude": -2.1166
    },
    "openingHoursSpecification": {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday"
      ],
      "opens": "09:00",
      "closes": "18:00"
    },
    "sameAs": [
      "https://www.linkedin.com/in/Gunaseelan1108",
      "https://twitter.com/Gunaseelan1108"
    ]
  }
"@
        
        $personSchema = @"
  {
    "@context": "https://schema.org",
    "@type": "Person",
    "name": "Gunaseelan Madhavan",
    "jobTitle": "Senior Technical Architect &amp; Cloud SME",
    "worksFor": {
      "@type": "Organization",
      "name": "NatWest Group Plc"
    },
    "url": "https://apexdigits.com",
    "image": "https://apexdigits.com/assets/images/profile.png",
    "sameAs": [
      "https://www.linkedin.com/in/Gunaseelan1108",
      "https://twitter.com/Gunaseelan1108"
    ],
    "telephone": "+44 7442 316163",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Stafford",
      "addressRegion": "West Midlands",
      "addressCountry": "GB"
    }
  }
"@

        $orgSchema = @"
  {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "ApexDigits",
    "url": "https://apexdigits.com",
    "logo": "https://apexdigits.com/assets/images/profile.png",
    "contactPoint": {
      "@type": "ContactPoint",
      "telephone": "+44 7442 316163",
      "contactType": "customer service"
    },
    "sameAs": [
      "https://www.linkedin.com/in/Gunaseelan1108",
      "https://twitter.com/Gunaseelan1108"
    ]
  }
"@
        $schemas += "<script type=`"application/ld+json`">`n$profService`n</script>"
        $schemas += "<script type=`"application/ld+json`">`n$personSchema`n</script>"
        $schemas += "<script type=`"application/ld+json`">`n$orgSchema`n</script>"
        
    } elseif ($pageType -eq "service") {
        # Service pages get BreadcrumbList (3 levels: Home -> Services -> Service Name)
        $cleanTitle = $title.Split("|")[0].Trim()
        $breadcrumb = @"
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
        "name": "$cleanTitle",
        "item": "$canonicalUrl"
      }
    ]
  }
"@
        $schemas += "<script type=`"application/ld+json`">`n$breadcrumb`n</script>"
        
    } elseif ($item.ContainsKey("Breadcrumb")) {
        # Core subpages get BreadcrumbList (2 levels: Home -> Page Name)
        $bcName = $item.Breadcrumb
        $breadcrumb = @"
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
        "name": "$bcName",
        "item": "$canonicalUrl"
      }
    ]
  }
"@
        $schemas += "<script type=`"application/ld+json`">`n$breadcrumb`n</script>"
        
    } else {
        # Blog Articles get BlogPosting and BreadcrumbList
        $cleanTitle = $title.Split("|")[0].Trim()
        $articleSchema = @"
  {
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    "mainEntityOfPage": {
      "@type": "WebPage",
      "@id": "$canonicalUrl"
    },
    "headline": "$cleanTitle",
    "description": "$desc",
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
    "datePublished": "2026-07-30"
  }
"@
        $breadcrumb = @"
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
        "name": "$cleanTitle",
        "item": "$canonicalUrl"
      }
    ]
  }
"@
        $schemas += "<script type=`"application/ld+json`">`n$articleSchema`n</script>"
        $schemas += "<script type=`"application/ld+json`">`n$breadcrumb`n</script>"
    }
    
    $ogType = "website"
    if ($pageType -eq "article") {
        $ogType = "article"
    }
    
    # 5. Build SEO Block
    $seoBlock = @"
  <title>$title</title>
  <meta name="description" content="$desc" />
  <link rel="canonical" href="$canonicalUrl" />

  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="$ogType" />
  <meta property="og:title" content="$title" />
  <meta property="og:description" content="$desc" />
  <meta property="og:url" content="$canonicalUrl" />
  <meta property="og:image" content="https://apexdigits.com/assets/images/profile.png" />
  <meta property="og:site_name" content="ApexDigits" />

  <!-- Twitter -->
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="$title" />
  <meta name="twitter:description" content="$desc" />
  <meta name="twitter:image" content="https://apexdigits.com/assets/images/profile.png" />
  <meta name="twitter:creator" content="@Gunaseelan1108" />
  <meta name="twitter:site" content="@Gunaseelan1108" />

  <!-- Structured Data -->
  $($schemas -join "`n  ")
"@
    
    # Insert SEO Block right after <head>
    if ($content -match "(?i)(<head\b[^>]*>)") {
        $headTag = $Matches[1]
        $content = $content.Replace($headTag, "$headTag`n$seoBlock")
        
        # Write back to file as UTF-8 without BOM (Vite/Web-friendly)
        $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllText($filePath, $content, $utf8NoBom)
        
        Write-Host "[SUCCESS] Precision updated $fileName" -ForegroundColor Green
    } else {
        Write-Host "[WARNING] No <head> tag found in $fileName" -ForegroundColor Yellow
    }
}

Write-Host "=========================================="
Write-Host "Technical SEO Precision Auto-Injection Complete!" -ForegroundColor Green
