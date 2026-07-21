# Founding-Mails — Entwürfe zur Freigabe (21.07.2026)
*Standing Rule: Texte vor Versand von Marco freigeben. Ich versende nichts eigenständig. Beide auf Englisch (US-Zielgruppe), in EndoCraft-Stimme, persönlich von Marco.*

---

## MAIL 1 · An die 7 bestehenden Leads (warme Outreach → Founding-Seite)
*Versand über Resend (z. B. `/api/admin/send-email` oder Broadcast). Ziel-Link = deine Founding-Seite, sobald deployed.*

**Betreff:** You've got the arrival scene. Now you can make your own.
**(Alternative Betreffzeile:** The studio behind that scene is opening — you're on the shortlist)

Hey — it's Marco from EndoCraft.

A little while back you grabbed the free arrival scene for your table. I hope it bought you one of those rare moments where everyone actually goes quiet.

Here's the thing that scene came from: **DM Studio.** It's the tool I've been quietly building — an AI that knows your campaign (NPCs, locations, lore), makes scene and character art that fits your world, and turns a description into a cinematic clip like the one you saw. Not a portrait anyone can prompt in ten seconds. A scene. Your scene.

A handful of DMs have been testing it and it's ready to open — and because you were here first, you get a **founding spot**: lock in the launch price for good, before it goes public.

There's nothing to pay today. You just claim your rate and I'll send you the key the moment credits go live:

**→ [Become a Founding DM](https://endocraft.app/studio/founding)**

I'm a one-person studio, so if you hit reply with "what would it cost to animate *my* character stepping out of the mist" — that's not a support ticket, that's just me. I answer.

See you in the valley,
Marco · EndoCraft
*Play it, don't describe it.*

---

## MAIL 2 · Founding-Bestätigung (Auto-Reply bei Anmeldung, source = studio-founding)
*Ersetzt für Founding-Anmelder die Standard-„hier ist dein Gratis-Clip"-Willkommensmail. Wiring-Snippet unten.*

**Betreff:** You're a Founding DM.

Your founding spot is locked.

That means when DM Studio opens, your launch price is held — for good — and you're on the first list through the door. No charge until then.

Here's what happens next: I'm finishing the last piece (self-serve cinematic clips) and calibrating things so it runs smoothly. When it's ready, you get the key before anyone else — with the founding rate you just claimed.

Until then, the free arrival scene is always yours: **[watch it again](https://endocraft.app/free)** — and imagine it's your character stepping out of the mist.

One more thing: if you told me the first scene you'd make, I read it. Every one. If you didn't — just hit reply and tell me. It genuinely shapes what I build next.

Talk soon,
Marco · EndoCraft
*Play it, don't describe it.*

---

## Wiring der Founding-Bestätigung (server.js, im `/api/free-pack/subscribe`-Handler)
*Damit Founding-Anmelder Mail 2 statt der Standard-Willkommensmail bekommen. Ersetzt den `sendWelcomeEmail(1, lead)`-Aufruf (~Zeile 3880):*

```js
if (lead && lead.id && lead.email) {
  if (sourceClean === 'studio-founding') {
    sendFoundingEmail(lead).catch(err => console.warn('[email] founding trigger failed:', err.message));
  } else {
    sendWelcomeEmail(1, lead).catch(err => console.warn('[email] email_1 trigger failed:', err.message));
  }
}
```
*Dazu eine `sendFoundingEmail(lead)`-Funktion analog zu `sendWelcomeEmail`, die Mail 2 (Betreff + Body oben) über Resend verschickt. Kann ich als fertigen Funktions-Block liefern, sobald du den Text freigibst — dann ist es Copy-Paste + dein Deploy.*

**Fürs erste Validieren ohne Backend-Deploy:** Wenn du das Wiring noch nicht machen willst, ist es ok — Founding-Anmelder bekommen dann vorerst die normale Willkommensmail. Die Seite selbst bestätigt ja schon on-screen („You're a Founding DM"). Der saubere Founding-Mail-Flow kann direkt nachgezogen werden, sobald der Test zieht.
