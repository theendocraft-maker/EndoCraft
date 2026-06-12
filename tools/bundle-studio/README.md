# EndoCraft Bundle Studio

Pipeline für digitale D&D Asset-Packs: Generierung → QA → Listings → Cover → Pins → **Etsy-Draft per API**.

## Workflow (Bundle → Etsy-Listing)

1. **pipeline.html** — Bundle produzieren (Seedream-Assets, vorher AIML-Guthaben checken!)
2. **quality.html** — Review + Cleaned-ZIP
3. **splitter.html** — 1 Bundle → 3 Etsy-Listing-Packs (je ZIP mit `listing.json` + Assets)
4. **thumbnail.html** — 2 Etsy-Cover pro Listing (Hero + Grid). Subtitle = Auto-Hook via `/api/cover-hook`; Hook wird in localStorage geteilt
5. **pinterest.html** — 5 Pin-Varianten (Solo-Hero · Included-Grid · Atmosphäre · Hook-dominant · Process/Preis). Nutzt **denselben Hook** wie das Cover
6. **etsy.html** — Listing-ZIP + Cover reinziehen → **Draft-Listing wird komplett per Etsy API erstellt** (Titel, Tags, Description, Preis, Bilder, Digital-Files). Publish danach manuell im Etsy-Editor ($0.20 Gebühr erst beim Publish)
7. Pinterest-Pins schedulen (Drip)

## Etsy-API einmalig einrichten

1. App registrieren: https://www.etsy.com/developers/your-apps (Personal Access reicht für den eigenen Shop)
2. In der App als **Callback URL** exakt eintragen:
   `https://endocraft-production.up.railway.app/api/etsy/callback`
3. Railway → Variables: `ETSY_KEYSTRING` = der API-Keystring der App
4. Supabase → SQL-Editor: `supabase-migrations/007_etsy_tokens.sql` ausführen (Token-Persistenz)
5. `deploy.bat` im API-Repo ausführen (Backend deployen)
6. etsy.html öffnen → „Mit Etsy verbinden" → Etsy-Login → fertig. Token refresht ab dann automatisch (90 Tage Refresh-Window; bei Ablauf einfach neu verbinden)

## Etsy-Limits (im Tool berücksichtigt)

- Digital-Files: **max 5 Files à 20MB** pro Listing — etsy.html splittet große Bundles automatisch in Part-ZIPs (19MB-Marge)
- Tags: 13 Stück, je max 20 Zeichen (Live-Validierung)
- Titel: max 140 Zeichen
- Drafts kosten nichts; $0.20 Listing-Fee erst beim Publish

## Backend-Endpoints (Railway)

| Endpoint | Use |
|---|---|
| `POST /api/cover-hook` | Bundle → 3 Story-Hooks (Haiku) — Cover + Pins |
| `GET /api/etsy/connect` | OAuth2+PKCE Start |
| `GET /api/etsy/callback` | OAuth Callback (Token → Supabase) |
| `GET /api/etsy/status` | Verbindungs-Status |
| `GET /api/etsy/taxonomy?q=` | Kategorie-Suche |
| `POST /api/etsy/draft-listing` | Draft erstellen (type=download) |
| `POST /api/etsy/listing/:id/image` | Cover/Galerie-Upload |
| `POST /api/etsy/listing/:id/file` | Digital-File-Upload |
| `POST /api/image` | Seedream-Generation |
| `POST /api/listing-generator` | Listing-Texte |
| `POST /api/quality-check` | Claude Vision Rating |

## Deploy

1. `C:\Users\cxrat\Desktop\EndoCraft\deploy.bat` (GitHub-Pages, 1-2 Min Cache)
2. Falls `.git/index.lock` blockt: `del .git\index.lock`
3. Backend: deploy.bat im `endocraft-api-deploy`-Repo (Railway)

## Bekannte Gotchas

- **Linter cut files**: Nach jedem Edit großer HTML-Files `tail -5` checken — index.html und pipeline.html hatten Stand Juni 2026 bereits abgeschnittene Tails (Altschaden)
- AIML-Top-Up vor jedem großen Pipeline-Run
- Cover-Regeln: kein Card-Reveal, kein Title auf Gesichtern, keine Compatibility-Badges aufs Cover
