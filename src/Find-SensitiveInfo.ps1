function Find-SensitiveInfo {
    param([string]$Url)

    try {
        $html = Invoke-WebRequest -Uri $Url -UseBasicParsing
        $content = $html.Content

        $patterns = @(
            "api[_-]?key",
            "token",
            "password",
            "secret",
            "jwt"
        )

        foreach ($p in $patterns) {
            if ($content -match $p) {
                Write-Host "[!] Posible información sensible encontrada: $p" -ForegroundColor Red
            }
        }
    }
    catch {
        Write-Host "Error al analizar contenido en ${Url}: $_" -ForegroundColor Yellow
    }
}
