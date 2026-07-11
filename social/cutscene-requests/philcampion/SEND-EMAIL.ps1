# ══════════════════════════════════════════════════════════════
#  EndoCraft — Cutscene an philcampion003@outlook.com senden
#  VORHER: einmal deployen (free/scenes/ muss live sein).
#  Prüfen:  https://endocraft.app/free/scenes/dragonrider.mp4
#
#  DANN: Rechtsklick auf diese Datei -> "Mit PowerShell ausführen"
#  (oder Inhalt in PowerShell einfügen). Fragt nach deinem ADMIN_KEY.
# ══════════════════════════════════════════════════════════════

$AdminKey = Read-Host "ADMIN_KEY" -AsSecureString
$AdminKeyPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
  [Runtime.InteropServices.Marshal]::SecureStringToBSTR($AdminKey))

$html = @'
<!DOCTYPE html><html><head><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#0f1118;">
<table width="100%" cellpadding="0" cellspacing="0" style="background:#0f1118;padding:28px 12px;">
<tr><td align="center">
<table width="600" cellpadding="0" cellspacing="0" style="max-width:600px;width:100%;background:#f6efdd;border-radius:14px;overflow:hidden;font-family:Georgia,'Times New Roman',serif;">

  <tr><td align="center" style="background:#14161f;padding:22px 0 16px;">
    <img src="https://endocraft.app/assets/logo-seal.png" width="46" height="46" alt="EndoCraft" style="display:block;border:0;">
    <div style="color:#d8b46a;letter-spacing:5px;font-size:13px;margin-top:9px;">ENDOCRAFT</div>
  </td></tr>

  <tr><td>
    <a href="https://endocraft.app/free/scenes/dragonrider.mp4">
      <img src="https://endocraft.app/free/scenes/dragonrider-poster.jpg" width="600" alt="Your dragon rider" style="width:100%;display:block;border:0;">
    </a>
  </td></tr>

  <tr><td style="padding:28px 34px 30px;color:#2b2418;font-size:17px;line-height:1.62;">
    <h1 style="font-size:22px;color:#8a5e1e;margin:0 0 18px;">Your dragon rider.</h1>

    <p style="margin:0 0 16px;">Hey,</p>

    <p style="margin:0 0 16px;">you asked for a dark warrior riding a dragon &mdash; armour, bow, the works. Here he is.</p>

    <p style="margin:0 0 22px;text-align:center;">
      <a href="https://endocraft.app/free/scenes/dragonrider.mp4" style="display:inline-block;background:#d8b46a;color:#14161f;font-weight:bold;padding:13px 30px;border-radius:9px;text-decoration:none;font-family:Georgia,serif;">&#9654;&nbsp; Watch your cutscene</a>
    </p>

    <p style="margin:0 0 16px;">Same way I do everything in the shop: the AI does the heavy lifting, then I go over it myself until it&rsquo;s actually worth putting on a screen. This one took a few passes &mdash; the first dragon came out looking a little too friendly. &#128512;</p>

    <p style="margin:0 0 16px;">If your table has a name for him, I&rsquo;d love to hear it. Just hit reply.</p>

    <p style="margin:0 0 6px;">Roll high,<br><b>Marco</b></p>

    <div style="background:#f0e2bf;border-left:4px solid #d8b46a;padding:13px 17px;font-size:15px;margin-top:24px;color:#4a3d24;">
      <b>P.S.</b> &mdash; if you want more like this, the full cinematic library is on
      <a href="https://www.etsy.com/shop/EndoCraft?utm_source=endocraft&utm_medium=email&utm_campaign=scene_delivery" style="color:#8a5e1e;">Etsy</a>.
      <b>WELCOME10</b> gets you 10% off your first pack.
    </div>
  </td></tr>

  <tr><td align="center" style="background:#14161f;padding:16px;color:#8b8f9e;font-size:12px;">
    EndoCraft &middot; cinematic D&amp;D assets &middot; endocraft.app
  </td></tr>
</table>
</td></tr></table>
</body></html>
'@

$body = @{
  to      = "philcampion003@outlook.com"
  subject = "Your dragon rider is here"
  html    = $html
  replyTo = "marco@endocraft.app"
} | ConvertTo-Json -Depth 5

$resp = Invoke-RestMethod -Method Post `
  -Uri "https://endocraft-production.up.railway.app/api/admin/send-email" `
  -Headers @{ "x-admin-key" = $AdminKeyPlain; "Content-Type" = "application/json" } `
  -Body ([System.Text.Encoding]::UTF8.GetBytes($body))

$resp | ConvertTo-Json
Write-Host ""
Write-Host "Gesendet. (ok:true = raus)" -ForegroundColor Green
Read-Host "Enter zum Schliessen"
