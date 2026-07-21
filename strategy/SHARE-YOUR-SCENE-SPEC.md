# „Share your Scene" — der virale Loop (Konzept + Bauplan)
*Der einzige Kanal, der konvertiert UND skaliert: Jeder Founding-DM, der einen Clip von seinem Charakter macht, zeigt ihn. Jeder geteilte Clip ist Werbung, die von einem echten Menschen kommt. Ziel: Teilen reibungslos machen + Attribution einbauen, damit der Loop von Tag 1 läuft.*

## Der Loop
Nutzer macht Clip → teilt (1 Klick) → sein Publikum sieht schönen Clip + „made with EndoCraft" + „make your own" → einige klicken → Founding/Studio → neuer Nutzer → macht Clip → teilt. Kompoundiert.

## Was du schon hast (nicht neu bauen!)
- **`/s/:id`** rendert bereits eine öffentliche Asset-Share-Seite im Marken-Look, inkl. „Make your own free"-CTA (`renderAssetSharePage`). Sogar die 404 ist gebrandet („This creation has faded").
- **`/img/:id`**, **`/c/:id`** (Card-Share), Cards mit `owner_slug`, Hall-of-Fame/Trending — Share-Kultur ist im Produkt angelegt.

Der virale Loop ist damit **Erweiterung, kein Neubau.** Vier Bausteine:

## Baustein 1 · Clips bekommen eine Share-Seite (wie Bilder)
Sicherstellen, dass ein generierter **Clip** dieselbe `/s/:id`-Behandlung kriegt wie ein Bild — nur mit `<video>` statt `<img>`: autoplay, muted, loop, playsinline, Poster-Frame, darunter der CTA. Wenn Clips schon als Assets gespeichert werden, ist es ein Template-Zweig in `renderAssetSharePage` (Video vs. Bild). Falls Clips noch keine Share-ID bekommen: beim Video-Abschluss eine Asset-Zeile anlegen (wie bei Bildern).

## Baustein 2 · „Share your scene"-Button im Studio (nach Clip-Fertigstellung)
Direkt am fertigen Clip, drei reibungsarme Optionen:
- **Copy link** → die `/s/:id`-Seite (für Discord/überall — Discord entpackt die og-Vorschau automatisch).
- **Download mp4** → zum direkten Reinziehen in Discord/VTT (viele DMs laden lieber hoch als zu linken).
- **9:16-Export** → vertikale Version für TikTok/Reels (dein bestehendes Master-Rezept kann das).
Der emotionale Höhepunkt („mein Charakter bewegt sich!") ist der richtige Moment für den Share-Prompt — genau da will man zeigen.

## Baustein 3 · Attribution IM Clip (nicht nur auf der Seite)
Ein roher mp4, den jemand ohne die Seite teilt, muss die Marke trotzdem tragen. Also ein **dezenter, premium** Abbinder — kein hässliches Wasserzeichen:
- Option A: **1,5 s Endcard** am Clip-Ende — Seal + „endocraft.app" (wie deine bestehende Endcard, nur kürzer). Sauberste Lösung.
- Option B: kleine Eck-Marke (Seal + „EndoCraft" unten rechts, ~60 % Deckkraft) durchgängig — falls Nutzer den Clip in der Mitte schneiden.
Empfehlung: **A** (Endcard) als Default, weil premium und nicht störend im Spieleinsatz — wer den Clip am Tisch nutzt, hat trotzdem 20 s sauberes Bild, und wer ihn teilt, transportiert die Marke. Beim Gratis-/Giveaway-Clip Endcard immer an; für zahlende Kunden ggf. optional (Premium-Perk: „ohne Branding" ab höherem Tier — zusätzlicher Kaufanreiz).

## Baustein 4 · CTA der Share-Seite → Founding/Studio (nicht nur /free)
Die `/s/:id`-Seite sagt aktuell „Make your own free" → /free. Fürs Studio umlenken: **„Make your own → endocraft.app/studio"** (bzw. Founding, solange in Validierung), mit `?utm=share`. So wird jeder geteilte Clip ein messbarer Zubringer in den Trichter.

## Reihenfolge (klein anfangen)
1. **Endcard beim Giveaway-Clip** (Baustein 3A) — sofort, kein Code, nur dein Render-Rezept. Damit trägt jeder Giveaway-Clip ab sofort die Marke.
2. **CTA der Share-Seite** auf Studio/Founding umstellen (Baustein 4) — Ein-Zeilen-Änderung in `renderAssetSharePage`.
3. **Clip-Share-Seite** (Baustein 1) — wenn Clips im Studio live gehen.
4. **Share-Button + Exporte** (Baustein 2) — die Politur, sobald 1–3 stehen.

## Warum das die eigentliche Antwort auf „Traffic" ist
Deko-Pins: 0,12 % Klickrate. Ein geflexter Charakter-Clip eines echten Spielers in seinem Discord: konvertiert, weil es kein Werbung-, sondern ein „schau was ich hab"-Moment ist. Für die Validierung jetzt noch nicht der Motor (keine Nutzer) — aber ab dem ersten zahlenden Kunden baut sich hier der einzige Kanal auf, der nicht an Marcos Zeit oder Werbebudget hängt. Deshalb: Attribution + Share von Tag 1 einbauen, nicht nachrüsten.
