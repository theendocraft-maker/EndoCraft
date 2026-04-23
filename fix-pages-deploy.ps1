# fix-pages-deploy.ps1
# Cancelt hangende Pages-Deployments via GitHub API, dann Retry-Push.
#
# SETUP (einmalig):
#   GitHub Token mit 'repo' Scope erstellen:
#   https://github.com/settings/tokens/new?scopes=repo
#
# NUTZUNG:
#   .\fix-pages-deploy.ps1
#   -> Token einfuegen wenn gefragt

$Owner = "theendocraft-maker"
$Repo  = "EndoCraft"

# Token holen
if ($env:GH_TOKEN) {
    $token = $env:GH_TOKEN
    Write-Host "Token aus Umgebungsvariable"
} else {
    Write-Host ""
    Write-Host "GitHub Personal Access Token (Scope: repo)"
    Write-Host "Erstellen: https://github.com/settings/tokens/new?scopes=repo"
    Write-Host ""
    $secure = Read-Host "Token einfuegen" -AsSecureString
    $bstr   = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
    $token  = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
}

if ([string]::IsNullOrWhiteSpace($token)) {
    Write-Host "Kein Token - Abbruch." -ForegroundColor Red
    exit 1
}

$headers = @{
    "Authorization"        = "Bearer $token"
    "Accept"               = "application/vnd.github+json"
    "X-GitHub-Api-Version" = "2022-11-28"
    "User-Agent"           = "fix-pages-deploy"
}

Write-Host ""
Write-Host "Hole Pages-Deployments..."

try {
    $uri = "https://api.github.com/repos/$Owner/$Repo/deployments?environment=github-pages&per_page=30"
    $deploys = Invoke-RestMethod -Uri $uri -Headers $headers
} catch {
    Write-Host "API-Fehler: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

if (-not $deploys -or $deploys.Count -eq 0) {
    Write-Host "Keine Deployments gefunden." -ForegroundColor Yellow
    exit 0
}

Write-Host "Gefunden: $($deploys.Count) Deployments"
Write-Host ""

$cancelled   = 0
$stuckStates = @("queued", "in_progress", "pending", "waiting")

foreach ($d in $deploys) {
    $sha = $d.sha.Substring(0, 7)

    try {
        $statuses = Invoke-RestMethod -Uri $d.statuses_url -Headers $headers
    } catch {
        Write-Host "  [$($d.id)] $sha - Status-Abruf fehlgeschlagen"
        continue
    }

    if ($statuses -and $statuses.Count -gt 0) {
        $state = $statuses[0].state
    } else {
        $state = "no-status"
    }

    $isStuck = $stuckStates -contains $state

    if ($isStuck) {
        Write-Host "  [$($d.id)] $sha - state: $state  -> cancellen..." -ForegroundColor Yellow

        $bodyObj = @{
            state       = "inactive"
            description = "Cancelled by fix-pages-deploy script"
        }
        $body = $bodyObj | ConvertTo-Json

        try {
            $url = "https://api.github.com/repos/$Owner/$Repo/deployments/$($d.id)/statuses"
            Invoke-RestMethod -Uri $url -Headers $headers -Method POST -Body $body -ContentType "application/json" | Out-Null
            Write-Host "    [OK] Cancelled" -ForegroundColor Green
            $cancelled++
        } catch {
            Write-Host "    [FAIL] $($_.Exception.Message)" -ForegroundColor Red
        }
    } else {
        Write-Host "  [$($d.id)] $sha - state: $state" -ForegroundColor DarkGray
    }
}

Write-Host ""

if ($cancelled -eq 0) {
    Write-Host "Keine haengenden Deployments." -ForegroundColor Yellow
    Write-Host "Falls Deploy weiter fehlschlaegt: 10-30 min warten (Lock-Timeout)"
    exit 0
}

Write-Host "$cancelled haengende(s) Deployment(s) freigegeben." -ForegroundColor Green
Write-Host ""
Write-Host "Triggering neuer Deploy..."

if (-not (Test-Path ".git")) {
    Write-Host "Nicht im EndoCraft-Ordner. Manuell:"
    Write-Host "  git commit --allow-empty -m 'Retrigger deploy'"
    Write-Host "  git push"
    exit 0
}

git commit --allow-empty -m "Retrigger deploy after clearing stuck state"
git push

Write-Host ""
Write-Host "Gepusht. Check in ~60 Sekunden:" -ForegroundColor Green
Write-Host "  https://github.com/$Owner/$Repo/actions"
