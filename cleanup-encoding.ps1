# cleanup-encoding.ps1
# Fixes encoding artifacts across all HTML files to ensure Vite can parse them.
# Written using safe ASCII-only regex to prevent parser errors in Windows PowerShell.

$projDir = "C:\Users\Gunas\.gemini\antigravity\scratch\apexdigits"
$htmlFiles = Get-ChildItem -Path $projDir -Filter *.html

Write-Host "Cleaning up encoding artifacts (ASCII-safe regex)..." -ForegroundColor Cyan

foreach ($file in $htmlFiles) {
    $filePath = $file.FullName
    $content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
    $original = $content
    
    # 1. Replace corrupted em-dashes
    # Matches the full double-encoded UTF-8 sequence for em-dash (Ã¢â‚¬â€ / â€”)
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u00E2\u20AC\u201D', ' - '
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u00E2\u20AC\u2014', ' - '
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u00E2\u20AC', ' - '
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u00E2\u2014', ' - '
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u201D', ' - '
    $content = $content -replace '\u00E2\u20AC\u2014', ' - '
    $content = $content -replace '\u00E2\u20AC\u201D', ' - '
    
    # 2. Replace corrupted single quotes / apostrophes
    # Matches the full double-encoded UTF-8 sequence for curly apostrophe (Ã¢â‚¬â„¢ / â€™)
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u201E\u00A2', "'"
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u2122', "'"
    $content = $content -replace '\u00E2\u20AC\u2122', "'"
    
    # 3. Replace corrupted double quotes
    # Matches the full double-encoded UTF-8 sequence for curly quotes (Ã¢â‚¬Å“ / â€œ)
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u0153', '"'
    $content = $content -replace '\u00E2\u20AC\u0153', '"'
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC\u009D', '"'
    
    # Generic catch-all for any remnants of the Ã¢â‚¬ prefix
    $content = $content -replace '\u00C3\u00A2\u00E2\u201A\u00AC[^\s<]*', ' - '
    
    if ($content -ne $original) {
        # Write back as pure UTF-8 without BOM
        $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
        [System.IO.File]::WriteAllText($filePath, $content, $utf8NoBom)
        Write-Host "[CLEANED] $($file.Name)" -ForegroundColor Green
    }
}

Write-Host "Encoding cleanup complete!" -ForegroundColor Green
