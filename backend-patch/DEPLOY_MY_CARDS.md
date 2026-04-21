# /my-cards — Collection Page Deploy

Feature: Jeder User der seine Email beim Save eingibt bekommt eine persistente Collection-URL (`endocraft.app/my-cards/?slug=<hash>`). Er kann dort jederzeit alle seine gesiegelten Karten sehen, die Collection teilen, und neue dazufügen.

## Was passiert technisch

1. Beim Save-Card berechnet das Backend einen deterministischen 16-hex-slug aus der Email (SHA-256)
2. Backend speichert `owner_slug` in der `cards`-Tabelle
3. Backend gibt den slug im Save-Response zurück
4. Frontend zeigt "See your collection →" Link mit dem Slug
5. `/my-cards/?slug=<slug>` lädt alle Karten zu diesem Slug via neuem `/api/my-cards` Endpoint

Privacy-Level: **semi-private**. Der Slug ist nicht reverse-engineerable (SHA-256, nur 16 Zeichen exposed), aber wenn jemand deinen Slug kennt, sieht er deine Karten. Für NFT-Launch später wird Wallet-Auth das ersetzen.

## Deploy-Schritte

### 1. SQL in Supabase

Supabase Dashboard → SQL Editor → paste `SQL_my_cards.sql` → Run.

Das:
- Fügt `owner_slug` Spalte zur `cards`-Tabelle hinzu
- Backfill: berechnet Slugs für alle existierenden Karten (damit bestehende Save-Card Tests auch sichtbar sind)
- Index auf `owner_slug` für schnelle Lookups
- Verify-Query am Ende zeigt `total_cards / cards_with_slug / missing` — die Werte sollten `N / N / 0` sein

### 2. Backend deployen

Die neue `server.js` (in `backend-patch/`) hat drei Changes:
- `crypto`-Import am Anfang
- `emailToSlug()` Helper
- `/api/save-card` berechnet + speichert den Slug, gibt ihn im Response zurück
- Neuer `/api/my-cards?slug=...` Endpoint — fetched Karten pro Slug
- Neuer `/api/my-cards/lookup` POST — Email → Slug (für "Find your collection")

Via GitHub Web-UI editieren oder lokal per git push. Railway redeployt automatisch.

**Check nach Deploy:**
```
https://endocraft-production.up.railway.app/api/my-cards?slug=abcdef0123456789
```
Erwartete Antwort: `{"ok":true,"cards":[]}` (bei ungültigem slug — der Validator akzeptiert aber 16-hex also keine Fehlermeldung).

### 3. Frontend deployen

`deploy.bat` im Endocraft-Ordner. Das deployt:
- Neue `/my-cards/index.html` Seite
- Updated `scroll/index.html` (Save-Success linkt zu `/my-cards`, Topbar zeigt "My Collection" wenn Slug in localStorage)

### 4. Testen

1. **Neue Session generieren** auf `/scroll/`
2. Karte bekommen, "Seal it" klicken mit Test-Email
3. Success-State sollte jetzt zeigen: "Sealed on [date]. **See your collection →**" — Link klickbar
4. Klick → landet auf `/my-cards/?slug=[hash]` und sieht die gerade gesiegelte Karte
5. URL in Zwischenablage kopieren, in Incognito öffnen → sieht gleiche Karten
6. Auf `/my-cards/` ohne slug-Parameter → zeigt Lookup-Form ("Find your collection" mit Email-Input)
7. Im Scroll-Topbar sollte jetzt "My Collection" erscheinen (weil slug in localStorage gespeichert)

## Was danach möglich ist (später)

- **Email-Notification**: Nach save schickt Backend eine Email mit "Your collection: endocraft.app/my-cards/[slug]" (braucht Email-Service wie Resend)
- **Magic-Link-Upgrade**: Wenn Privacy wichtiger wird, ersetzt token-based Auth den Slug
- **OG-Tags** auf /my-cards: wenn User die URL auf Twitter/TikTok/Discord teilt, erscheint ein Preview mit der aktuellen Karte
- **Shareable-Collection-Gif**: Button generiert animierte Collection-Übersicht als PNG für Social
- **Wallet-Auth**: on-chain Launch ersetzt den Slug durch die Wallet-Adresse
