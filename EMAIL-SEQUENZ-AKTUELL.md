# EndoCraft E-Mail-Sequenz — Stand 17.07.2026 (KOMPLETT ÜBERARBEITET)
*Alle Mails neu im aktuellen Design (creme #fbf1dd / dunkelrot #6b1717 / gold #d8b46a — wie Broadcast + Website) und auf aktuellen Content gebracht.*

## Was sich geändert hat
- **Design:** alle Mails jetzt im Marken-HTML (Header-Band, optionales Hero-Bild, gold/rot-Akzente, P.S.-Box, Footer mit WotC-Disclaimer + Unsubscribe). Ein gemeinsamer Baustein (`build_mails.py`) → garantiert konsistent.
- **Kein Free-Cutscene-Versprechen mehr** (überall entfernt — passt zur Website-Bereinigung).
- **Made-to-order-Services sind jetzt der Kern:** Trailer / Cutscene / Memorial / Stream-Intro werden vorgestellt (Mail 3), mit 1-of-1/Zertifikat-Story.
- **NPC-Dreizeiler-Trick (alte Mail 2) rausgenommen** aus dem Drip → wandert in den späteren Newsletter „The Table".
- **Free Pack** = NPC-Portraits + Location-Art (+ Quick-Ref-Doc). Keine Custom-Szene.

## Neue Reihenfolge
| # | Trigger | Betreff | Job | Datei |
|---|---------|---------|-----|-------|
| 1 | sofort bei /free-Signup | Your D&D pack is ready (and what's inside) | Vertrauen + Download | `emails/mail-1-welcome.html` |
| 2 | +2 Tage | A free boss for your table. He is in no hurry. | Überraschung (Sluglord, wird geteilt) | `emails/mail-2-sluglord.html` |
| 3 | +5 Tage | I turned a D&D campaign into a movie trailer | **Angebot** (Made-to-order, Geld-Mail) | `emails/mail-3-madetoorder.html` |
| 4 | +12 Tage (CoS-Segment) | If you're prepping Curse of Strahd next... | Verkauf CoS-Pack | `emails/mail-4-curse-of-strahd.html` |
| ∞ | monatlich | Newsletter „The Table" (1 DM-Trick z.B. NPC-Dreizeiler, 1 neues Kit, 1 Community-Story) | Bindung | Phase 2, via Resend Broadcasts |

## Bilder (müssen live sein, sonst broken images)
- Mail 2: `endocraft.app/free/sluglord/sluglord-wide.jpg` ✅ live
- Mail 3: `endocraft.app/assets/email-trailer-poster.jpg` ✅ live
- Mail 4: `endocraft.app/assets/email-cos-banner.jpg` ⏳ **committet, braucht Deploy**
- Mail 1: kein Hero-Bild (bewusst clean).

## Einbau (Marco)
Die Willkommens-Mails 1–3 hängen im Backend (`server.js`) als HTML-Strings. Zum Aktivieren des neuen Designs: die HTML aus `emails/mail-1..3` in server.js ersetzen (Platzhalter `<TOKEN>` im Unsubscribe-Link bleibt — den ersetzt das Backend pro Empfänger). Mail 4 (CoS) neu einhängen oder als Resend-Broadcast an ein CoS-Segment. **Erst deployen (wegen CoS-Banner), dann aktiv schalten.**
