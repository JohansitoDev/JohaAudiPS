function Test-TlsConfig {
    param([string]$Url)

    try {
        $req = [System.Net.HttpWebRequest]::Create($Url)
        $req.Method = "GET"
        $req.Timeout = 5000
        $req.GetResponse() | Out-Null

        $servicePoint = $req.ServicePoint
        $cert = $servicePoint.Certificate

        $expDate = $cert.NotAfter
        $startDate = $cert.NotBefore

        Write-Host "Certificado emitido para: $($cert.Subject)" -ForegroundColor Cyan
        Write-Host "Válido desde: $startDate hasta $expDate" -ForegroundColor Cyan

        if ((Get-Date) -gt $expDate) {
            Write-Host "[!] Certificado expirado" -ForegroundColor Red
        } else {
            Write-Host "[OK] Certificado válido" -ForegroundColor Green
        }
    }
    catch {
        Write-Host "Error al verificar TLS en ${Url}: $_" -ForegroundColor Yellow
    }
}
