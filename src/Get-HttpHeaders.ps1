function Get-HttpHeaders {
    param([string]$Url)

    try {
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing
        $headers = $response.Headers

        $securityHeaders = @(
            "Content-Security-Policy",
            "Strict-Transport-Security",
            "X-Frame-Options",
            "X-Content-Type-Options",
            "Referrer-Policy"
        )

        foreach ($h in $securityHeaders) {
            if ($headers[$h]) {
                Write-Host "[OK] $h presente: $($headers[$h])" -ForegroundColor Green
            } else {
                Write-Host "[!] $h ausente" -ForegroundColor Red
            }
        }
    }
    catch {
        Write-Host "Error al conectar con ${Url}: $_" -ForegroundColor Yellow
    }
}
