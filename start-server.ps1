# Start-Server.ps1
# A zero-dependency local web server for Windows PowerShell.
# Serves the static website files at http://localhost:8000.

$port = 8000
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")

try {
    $listener.Start()
    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host "   ApexDigits Local Web Server is Running!" -ForegroundColor Green
    Write-Host "   URL: http://localhost:$port/" -ForegroundColor Yellow
    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host "Press Ctrl+C in this terminal window to stop the server." -ForegroundColor Gray
    Write-Host ""
    
    # Open the browser automatically
    Start-Process "http://localhost:$port/"
    
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        # Translate URL path to local file path
        $urlPath = $request.Url.LocalPath.Replace("/", "\")
        if ($urlPath -eq "\") {
            $urlPath = "\index.html"
        }
        
        $filePath = Join-Path $PSScriptRoot $urlPath
        
        # Handle trailing slash directories (e.g. check for index.html if it's a directory link)
        if (Test-Path $filePath -PathType Container) {
            $filePath = Join-Path $filePath "index.html"
        }

        if (Test-Path $filePath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            
            # Determine content type based on extension
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".gif"  { "image/gif" }
                ".svg"  { "image/svg+xml" }
                ".ico"  { "image/x-icon" }
                ".woff" { "font/woff" }
                ".woff2" { "font/woff2" }
                ".ttf"  { "font/ttf" }
                default { "application/octet-stream" }
            }
            
            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            Write-Host "[200] Serving: $urlPath ($contentType)" -ForegroundColor Green
        } else {
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $urlPath")
            $response.ContentType = "text/plain"
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
            Write-Host "[404] Not Found: $urlPath" -ForegroundColor Red
        }
        $response.Close()
    }
} catch {
    Write-Host "Error starting/running server: $_" -ForegroundColor Red
} finally {
    if ($listener.IsListening) {
        $listener.Stop()
    }
}
