# ══════════════════════════════════════════════════════════════
#  EndoCraft — Codax MK3 an deathrider174@gmail.com senden
#  VORHER: einmal deployen (free/scenes/ muss live sein).
#  Prüfen:  https://endocraft.app/free/scenes/codax-mk3.jpg
#
#  DANN: Doppelklick auf SEND-EMAIL.bat  (fragt nach deinem ADMIN_KEY)
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
    <img src="https://endocraft.app/free/scenes/codax-mk3.jpg" width="600" alt="Codax MK3" style="width:100%;display:block;border:0;">
  </td></tr>

  <tr><td style="padding:28px 34px 30px;color:#2b2418;font-size:17px;line-height:1.62;">
    <h1 style="font-size:22px;color:#8a5e1e;margin:0 0 18px;">Codax MK3.</h1>

    <p style="margin:0 0 16px;">Hey,</p>

    <p style="margin:0 0 16px;">a pugilist warforged built to look like a child in need &mdash; right up until trust is given. That was too good a brief to do only once, so you get two moments.</p>

    <p style="margin:0 0 16px;">Above: the guard is up. The lie is over.</p>

    <p style="margin:0 0 20px;">Below: the moment before. The open hand. The one that works.</p>

    <p style="margin:0 0 22px;">
      <img src="https://endocraft.app/free/scenes/codax-mk3-pleading.jpg" width="532" alt="Codax MK3 &mdash; the moment before" style="width:100%;display:block;border:0;border-radius:8px;">
    </p>

    <p style="margin:0 0 16px;">I gave him no skin &mdash; brass all the way through, a cracked faceplate and two amber lenses. The deception is in his <i>size</i>, not in his face. That felt truer to what a mad scientist would actually build.</p>

    <p style="margin:0 0 16px;">Both are yours. Full resolution, use them however you like &mdash; VTT token, handout, whatever your table needs.</p>

    <p style="margin:0 0 6px;">Roll high,<br><b>Marco</b></p>

    <div style="background:#f0e2bf;border-left:4px solid #d8b46a;padding:13px 17px;font-size:15px;margin-top:24px;color:#4a3d24;">
      <b>Want to see him move?</b> That raised guard is begging for it. I make custom animated cutscenes of a single character &mdash;
      <a href="https://www.etsy.com/listing/4536112275?utm_source=endocraft&utm_medium=email&utm_campaign=codax_delivery" style="color:#8a5e1e;">here on Etsy</a>.
      And the full cinematic library is in the <a href="https://www.etsy.com/shop/EndoCraft?utm_source=endocraft&utm_medium=email&utm_campaign=codax_delivery" style="color:#8a5e1e;">shop</a> &mdash; <b>WELCOME10</b> gets you 10% off your first pack.
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
  to      = "deathrider174@gmail.com"
  subject = "Codax MK3 is here"
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
