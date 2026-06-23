function Crawl-Website {
    param([string]$Url)

    try {
        $html = Invoke-WebRequest -Uri $Url -UseBasicParsing
        $links = $html.Links | Select-Object href

        Write-Host "Endpoints encontrados en ${Url}:" -ForegroundColor Cyan
        foreach ($l in $links) {
            Write-Host $l.href
        }
    }
    catch {
        Write-Host "Error al hacer crawling en ${Url}: $_" -ForegroundColor Yellow
    }
}
