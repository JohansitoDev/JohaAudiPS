param(
    [string]$Url = "https://github.com/JohansitoDev/JohaDoc",
    [string]$ReportPath = ".\reports\sample-report.md"
)


Import-Module .\src\EthicalWebAuditor.psm1 -Force


$report = @()
$report += "# Ethical Web Auditor Report"
$report += "Sitio auditado: $Url"
$report += "Fecha: $(Get-Date)"
$report += ""


$report += "## Headers de Seguridad"
$headers = Get-HttpHeaders -Url $Url
$report += $headers

$report += "`n## Configuración TLS"
$tls = Test-TlsConfig -Url $Url
$report += $tls

$report += "`n## Información Sensible"
$sensitive = Find-SensitiveInfo -Url $Url
$report += $sensitive

$report += "`n## Endpoints Descubiertos"
$endpoints = Crawl-Website -Url $Url
$report += $endpoints


$report | Out-File -FilePath $ReportPath -Encoding UTF8

Write-Host "Auditoría completada. Reporte generado en $ReportPath" -ForegroundColor Green
