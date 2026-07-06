$ErrorActionPreference = "Stop"
$key = Read-Host "ADMIN_KEY eingeben"
$path = "C:\Users\cxrat\Desktop\EndoCraft\social\mail-test-payload.json"
$body = [System.IO.File]::ReadAllText($path)
Write-Host "Sende Testmail an cx.ratti@gmx.de ..."
try {
  $r = Invoke-RestMethod -Uri "https://endocraft-production.up.railway.app/api/admin/send-email" `
        -Method Post -Headers @{ "x-admin-key" = $key } `
        -ContentType "application/json" -Body $body
  Write-Host "OK:" ($r | ConvertTo-Json -Compress)
} catch {
  $resp = $_.Exception.Response
  if ($resp) {
    $reader = New-Object System.IO.StreamReader($resp.GetResponseStream())
    Write-Host "FEHLER" ([int]$resp.StatusCode) ":" $reader.ReadToEnd()
  } else {
    Write-Host "FEHLER:" $_.Exception.Message
  }
}
Read-Host "Enter zum Schliessen"
