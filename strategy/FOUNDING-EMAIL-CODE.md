# Founding-Bestätigungsmail — fertiger Code zum Einfügen (server.js)
*Texte freigegeben 21.07. Passt 1:1 zu deiner bestehenden `sendWelcomeEmail`-Struktur (RESEND_FROM, Resend REST, Unsubscribe-Token). Dein Deploy.*

## 1 · Funktion einfügen — direkt NACH `sendWelcomeEmail(...)` (nach ~Zeile 340)

```js
// ─── Founding-DM-Bestätigung (source = studio-founding) ───────────────────────
// Ersetzt für Founding-Anmelder die Standard-Willkommensmail. Markiert email_1_sent_at,
// damit der Drip-Cron NICHT zusätzlich die normale Welcome-Mail schickt.
async function sendFoundingEmail(lead) {
  if (!resendActive) {
    console.log(`[email] Skipping founding mail to ${lead.email} — RESEND_API_KEY not set`);
    return { ok: true, skipped: true };
  }
  const unsubToken = lead.unsubscribe_token;
  const subject = "You're a Founding DM.";
  const text =
`Your founding spot is locked.

That means when DM Studio opens, your launch price is held — for good — and you're on the first list through the door. No charge until then.

Here's what happens next: I'm finishing the last piece (self-serve cinematic clips) and calibrating things so it runs smoothly. When it's ready, you get the key before anyone else — with the founding rate you just claimed.

Until then, the free arrival scene is always yours: https://endocraft.app/free — and imagine it's your character stepping out of the mist.

One more thing: if you told me the first scene you'd make, I read it. Every one. If you didn't — just hit reply and tell me. It genuinely shapes what I build next.

Talk soon,
Marco · EndoCraft
Play it, don't describe it.

Unsubscribe: https://endocraft-production.up.railway.app/unsubscribe?token=${unsubToken}`;
  try {
    const sendRes = await fetchWithTimeout('https://api.resend.com/emails', {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${RESEND_API_KEY}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({ from: RESEND_FROM, to: [lead.email], subject, text })
    });
    if (!sendRes.ok) {
      const errBody = await sendRes.text().catch(() => '');
      console.error(`[email] Founding Resend failed (${sendRes.status}):`, errBody.slice(0, 300));
      return { ok: false, error: `Resend HTTP ${sendRes.status}` };
    }
    // email_1_sent_at setzen → Drip-Cron überspringt die Standard-Welcome-Mail
    if (SUPABASE_URL && SUPABASE_KEY) {
      await fetchWithTimeout(`${SUPABASE_URL}/rest/v1/free_pack_leads?id=eq.${lead.id}`, {
        method: 'PATCH',
        headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}`, 'Content-Type': 'application/json', 'Prefer': 'return=minimal' },
        body: JSON.stringify({ email_1_sent_at: new Date().toISOString() })
      });
    }
    console.log(`[email] Founding confirmation sent to ${lead.email}`);
    return { ok: true };
  } catch (err) {
    console.error('[email] sendFoundingEmail error:', err.message);
    return { ok: false, error: err.message };
  }
}
```

## 2 · Aufruf verdrahten — im `/api/free-pack/subscribe`-Handler (~Zeile 3879)

**Ersetze:**
```js
if (lead && lead.id && lead.email) {
  sendWelcomeEmail(1, lead).catch(err => console.warn('[email] email_1 trigger failed:', err.message));
}
```
**Durch:**
```js
if (lead && lead.id && lead.email) {
  if (sourceClean === 'studio-founding') {
    sendFoundingEmail(lead).catch(err => console.warn('[email] founding trigger failed:', err.message));
  } else {
    sendWelcomeEmail(1, lead).catch(err => console.warn('[email] email_1 trigger failed:', err.message));
  }
}
```

Das war der letzte Baustein. Danach ist die Founding-Anmeldung end-to-end: Seite → Backend bucht Lead (source=studio-founding, Tarif im utm) → Founding-Bestätigung raus → kein doppelter Drip.

## Deploy-Reihenfolge (dein Part)
1. Pricing final: echte Kling-Kosten prüfen → `VIDEO_COST` setzen (Default 14) · `credits: 6` für neue Codes.
2. `sendFoundingEmail` + Wiring rein (oben).
3. Railway deployen.
4. `studio\founding.html` + `assets\` deployen (og-Bild), Test-Lead `founding-test-DELETE@endocraft.app` im Cockpit löschen.
5. Mail 1 an die 7 Leads (via `/api/admin/send-email` oder Resend-Broadcast) · TikTok-Bio auf die Founding-Seite.

*Versand von Mail 1 ist bewusst dein Schritt — ich verschicke nichts in deinem Namen. Text liegt in FOUNDING-EMAILS.md.*
