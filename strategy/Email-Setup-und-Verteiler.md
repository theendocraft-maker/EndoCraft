# EndoCraft — Email-Setup & Verteiler-Plan

*28.06.2026. Ziel: Sende-Domain endocraft.app verifizieren (Resend), Empfang erhalten, dann das 3-stufige Email-Programm aufsetzen.*

---

## Warum es bisher nicht ging (Root Cause)

Namecheap lässt MX-Records **nur im Modus „Custom MX"** zu — der schaltet aber das genutzte **Email-Forwarding** (Empfang von marco@endocraft.app) ab. SPF, DKIM und DMARC sind korrekt gesetzt; nur der von Resend geforderte **MX `send` → `feedback-smtp.eu-west-1.amazonses.com` (Prio 10)** fehlte und ließ sich in Namecheap nie hinzufügen, ohne den Empfang zu opfern. Das ist kein Fehler von dir — es ist ein Namecheap-Zwang.

**Lösung:** DNS zu **Cloudflare** umziehen. Dort koexistieren **Cloudflare Email Routing** (kostenloser Empfang) und **Resend** (Senden) problemlos.

---

## TEIL A — Cloudflare-Migration (einmalig, ~15 Min)

### A1. Dein Part (Account — kann ich nicht für dich machen)
1. Auf **cloudflare.com** kostenlosen Account anlegen / einloggen.
2. **„Add a site"** → `endocraft.app` → **Free**-Plan wählen.
3. Cloudflare scannt die bestehenden DNS-Records und importiert sie. **Wichtig:** prüfen, dass diese mitkamen (sonst ich/du ergänzen):
   - 4× **A** `@` → `185.199.108.153`, `.109.153`, `.110.153`, `.111.153` (GitHub Pages = die Live-Site) → **Proxy AUS / „DNS only" (graue Wolke)**
   - **CNAME** `www` → `theendocraft-maker.github.io` → **DNS only**
   - **CNAME** `bash` → `theendocraft-maker.github.io` (sieht ungewöhnlich aus — falls nicht gewollt, später löschen)
   - **TXT** `_dmarc` → `v=DMARC1; p=none;`
   - **TXT** `resend._domainkey` → `p=MIGf…` (DKIM, langer Wert)
   - **TXT** `send` → `v=spf1 include:amazonses.com ~all`
   - (Die alte Namecheap-Forwarding-SPF `v=spf1 include:spf.efwd.registrar-servers.com` auf `@` **nicht** übernehmen — die ersetzt Cloudflare Email Routing.)
4. Cloudflare zeigt dir **2 Nameserver** (z. B. `xena.ns.cloudflare.com`). Die brauchen wir gleich.

### A2. Mein Part (autonom, du schaust zu)
5. **Namecheap → endocraft.app → Domain → Nameservers → „Custom DNS"** → die 2 Cloudflare-Nameserver eintragen, speichern. (Propagation meist < 1 h.)
6. Warten bis Cloudflare „Active" zeigt.
7. **Cloudflare → Email → Email Routing → aktivieren** → Zieladresse `cx.ratti@gmx.de` hinzufügen + bestätigen → Regel **marco@endocraft.app → cx.ratti@gmx.de**. (Cloudflare setzt automatisch die korrekten Empfangs-MX + SPF.)
8. **Resend-Records** in Cloudflare sicherstellen/ergänzen: MX `send` → `feedback-smtp.eu-west-1.amazonses.com` (Prio 10), TXT `send` (SPF), TXT `resend._domainkey` (DKIM).
9. **Resend → „Restart"** → alle drei grün.
10. Test: Mail an marco@endocraft.app schicken (kommt sie an?) + Resend-Test-Mail raus (geht sie raus?).

---

## TEIL B — Das Email-Programm (nach Verifizierung)

**Anspruch (fix):** Wir versenden nur, was den Verteiler *wert* ist. Kein Füllmaterial — sonst lieber gar nichts.

### B1. Dankesmail an ALLE bisherigen `/free`-Leads (einmalig)
Dankt fürs Free-Pack, lädt in die Studio-Beta ein, schenkt Credits. **Code-Mechanik nötig:** entweder ein **gemeinsamer Launch-Code** (pro Gerät begrenztes Budget) für alle, oder pro Empfänger ein eigener Code (sauberer, mehr Aufwand). Empfehlung: ein Launch-Code (`EC-WELCOME-…`) mit moderatem Budget — einfach, sofort.

**Entwurf (EN, zur Freigabe — noch nicht senden):**

> **Betreff:** Your free pack — plus a Studio beta invite inside
>
> Hey there,
>
> Thanks for grabbing the free EndoCraft location pack — I hope the loops found a good home at your table.
>
> I wanted to give you something more: early access to **EndoCraft Studio**, our new tool that turns your D&D ideas — NPCs, monsters, locations — into cinematic, animated assets in our signature look.
>
> It's in closed beta, and you're invited. Here are some free credits to create your own:
>
> **Code: `EC-WELCOME-XXXX`** → endocraft.app/studio
>
> No prompt-wrangling, no model-juggling — one curated look, locked in. Make a villain, a tavern, a dragon's lair… whatever your campaign needs.
>
> Build something you love? Just hit reply and show me — I read every one.
>
> — Marco, EndoCraft

### B2. Auto-Welcome für neue Anmeldungen
Gleiche Botschaft, automatisch bei jedem neuen `/free`-Signup. **Infrastruktur existiert schon** (Welcome-Mail-Code + Cron, dormant — wartete nur auf Resend-live). Nach Verifizierung: Resend-Key/Config aktiv → Copy = gekürzte Version von B1 → einschalten.

### B3. Value-Newsletter (laufend)
Kadenz locker (z. B. 1–2×/Monat), nur bei echtem Mehrwert. Mögliche Formate, die unserem Anspruch gerecht werden:
- „Made in Studio" — die besten Tester-Kreationen (kuratiert).
- Ein fertig nutzbares Mini-Asset gratis (eine Location/ein NPC) als Mail-Exklusiv.
- Ein DM-Tipp + passendes EndoCraft-Asset.
- Behind-the-scenes / neue Features.
Technisch via **Resend Broadcasts** (Audience aus `free_pack_leads`) — Opt-out/Unsubscribe-Link pflicht (Resend liefert ihn).

---

## Reihenfolge
Cloudflare-Migration (A) → Resend grün → Launch-Code bauen → Dankesmail B1 (nach Freigabe) → Auto-Welcome B2 an → Newsletter B3 etablieren. Jede Mail-Copy vorab von Marco approven.
