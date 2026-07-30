<#
  Kling A -> B Test in reinem PowerShell. Kein Python noetig.

  Aufruf ueber run-test.bat, oder direkt:
      $env:AIMLAPI_KEY = "sk-..."
      powershell -NoProfile -ExecutionPolicy Bypass -File .\run-test.ps1
  Nur pruefen, ohne Kosten:
      powershell -NoProfile -ExecutionPolicy Bypass -File .\run-test.ps1 -Dry
#>
param(
  [switch]$Dry,
  [string]$Key = $env:AIMLAPI_KEY,
  [string]$Model = 'kling-video/v1.6/pro/image-to-video'
)

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot
try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 } catch {}
# Ohne das ist der Upload der Base64-Bilder in PowerShell 5.1 quaelend langsam.
$ProgressPreference = 'SilentlyContinue'

$LogPath = Join-Path $PSScriptRoot 'test-log.txt'
"=== Lauf gestartet $(Get-Date -Format 'dd.MM.yyyy HH:mm:ss') ===" | Set-Content -Path $LogPath -Encoding UTF8

function Say([string]$m) {
  Write-Host $m
  Add-Content -Path $LogPath -Value $m -Encoding UTF8
}

function Get-ImageRef([string]$Path) {
  if ($Path -match '^(https?://|data:)') { return $Path }
  $full = Join-Path $PSScriptRoot $Path
  if (-not (Test-Path $full)) { throw "Bild nicht gefunden: $full" }
  $bytes = [IO.File]::ReadAllBytes($full)
  if ($bytes.Length -gt 9MB) { throw "$Path ist zu gross fuer Base64, bitte als URL uebergeben." }
  $mime = if ($Path -match '\.png$') { 'image/png' } else { 'image/jpeg' }
  return "data:$mime;base64," + [Convert]::ToBase64String($bytes)
}

function Show-HttpError($err) {
  $detail = $null
  try { $detail = $err.ErrorDetails.Message } catch {}
  if (-not $detail) {
    try {
      $resp = $err.Exception.Response
      if ($resp) {
        $sr = New-Object IO.StreamReader($resp.GetResponseStream())
        $detail = $sr.ReadToEnd()
      }
    } catch {}
  }
  Say ("  FEHLER: " + $err.Exception.Message)
  if ($detail) { Say ("  Antwort: " + $detail.Substring(0, [Math]::Min(1500, $detail.Length))) }
}

function Invoke-KlingAB {
  param(
    [string]$Name, [string]$ImageA, [string]$ImageB,
    [string]$Prompt, [string]$Negative, [string]$OutFile, [int]$Duration = 5
  )

  Say ""
  Say "=== $Name ==="
  Say "  A: $ImageA"
  Say "  B: $ImageB"
  Say "  Modell: $Model, $Duration s, ca. $([Math]::Round(0.1274 * $Duration, 2)) `$"

  $payload = [ordered]@{
    model           = $Model
    image_url       = (Get-ImageRef $ImageA)
    tail_image_url  = (Get-ImageRef $ImageB)
    prompt          = $Prompt
    negative_prompt = $Negative
    duration        = "$Duration"
    cfg_scale       = 0.5
  }

  if ($Dry) {
    Say "  --dry-run: es wird nichts gesendet."
    Say ("  Payload-Felder: " + ($payload.Keys -join ', '))
    Say ("  Bild A als Base64: " + $payload.image_url.Length + " Zeichen")
    Say ("  Bild B als Base64: " + $payload.tail_image_url.Length + " Zeichen")
    Say ("  Schluessel gesetzt: " + $(if ($Key) { 'ja' } else { 'NEIN' }))
    return
  }

  $headers = @{ Authorization = "Bearer $Key" }
  $json = $payload | ConvertTo-Json -Compress -Depth 4

  try {
    $start = Invoke-RestMethod -Uri 'https://api.aimlapi.com/v2/video/generations' `
      -Method Post -Headers $headers -ContentType 'application/json; charset=utf-8' -Body $json -TimeoutSec 180
  } catch {
    Show-HttpError $_
    return
  }

  $id = $start.id
  if (-not $id) { $id = $start.generation_id }
  if (-not $id) { Say ("  Keine id in der Antwort: " + ($start | ConvertTo-Json -Compress)); return }
  Say "  generation_id: $id"

  $t0 = Get-Date
  $last = ''
  while (((Get-Date) - $t0).TotalSeconds -lt 900) {
    Start-Sleep -Seconds 10
    try {
      $st = Invoke-RestMethod -Uri ('https://api.aimlapi.com/v2/video/generations?generation_id=' + [uri]::EscapeDataString($id)) `
        -Headers $headers -TimeoutSec 120
    } catch {
      Show-HttpError $_
      continue
    }
    if ($st.status -ne $last) {
      $last = $st.status
      Say ("  [{0,4}s] {1}" -f [int]((Get-Date) - $t0).TotalSeconds, $st.status)
    }
    if ($st.status -eq 'completed') {
      $url = $st.video.url
      if (-not $url) { Say ("  fertig, aber keine video.url: " + ($st | ConvertTo-Json -Compress)); return }
      Say "  lade herunter ..."
      Invoke-WebRequest -Uri $url -OutFile (Join-Path $PSScriptRoot $OutFile) -UseBasicParsing -TimeoutSec 600
      $mb = [Math]::Round((Get-Item (Join-Path $PSScriptRoot $OutFile)).Length / 1MB, 1)
      Say "  OK: $OutFile ($mb MB)"
      $used = $null
      try { $used = $st.meta.usage.credits_used } catch {}
      if ($null -eq $used) { $used = $st.credits_used }
      if ($null -ne $used) { Say ("  credits_used: " + $used) }
      return
    }
    if ($st.status -in @('error', 'failed')) {
      Say ("  Generierung fehlgeschlagen: " + ($st | ConvertTo-Json -Compress))
      return
    }
  }
  Say "  Timeout. generation_id zum Nachschauen: $id"
}

if (-not $Key -and -not $Dry) {
  Say "AIMLAPI_KEY ist nicht gesetzt. Im selben Fenster erst:  set AIMLAPI_KEY=sk-..."
  exit 1
}

$NEG1 = 'camera movement, zoom, pan, camera shake, morphing, warping, deformed, extra limbs, text, watermark, fast motion, people walking away'
$NEG2 = 'morphing, warping, deformed, extra limbs, text, watermark, fast motion, hard cut, camera shake, zoom out, dutch angle'

$P1 = 'locked off camera, no camera movement at all: campfire flames flicker and swirl, embers drift upward and fade out, the river flows and glints in the firelight, lantern flames wobble gently, thin smoke drifts across the treeline, the three figures stand perfectly still'
$P2 = 'slow steady dolly in toward the campfire at constant speed, flames flicker and embers rise, the river glints, the three figures stand still while the camera moves closer'

Invoke-KlingAB -Name 'TEST 1 von 2 -- nahtloser Loop (A = B)' `
  -ImageA 'A-camp.jpg' -ImageB 'B-camp-loop.jpg' -Prompt $P1 -Negative $NEG1 -OutFile 'OUT-1-loop.mp4'

Invoke-KlingAB -Name 'TEST 2 von 2 -- Push-in, Endbild vorgegeben' `
  -ImageA 'A-camp.jpg' -ImageB 'B-camp-pushin.jpg' -Prompt $P2 -Negative $NEG2 -OutFile 'OUT-2-pushin.mp4'

Say ""
Say "--- Ergebnis ---"
foreach ($f in @('OUT-1-loop.mp4', 'OUT-2-pushin.mp4')) {
  if (Test-Path (Join-Path $PSScriptRoot $f)) { Say "  OK    $f" } else { Say "  FEHLT $f" }
}
Say ""
Say "Protokoll: test-log.txt"
