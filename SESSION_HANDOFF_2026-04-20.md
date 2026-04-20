# EndoCraft — Übergabe aus Cowork-Session vom 20.04.2026

## Scope dieser Session

Integration vom Pack-Opening-Flow in `scroll/index.html`, Rarity-Visuals, Karten-Rückseite mit 3D-Flip, Download-Button, Random-Story-Generator, plus kritischer Fix eines GitHub-Pages-Build-Fehlers.

Alle Änderungen sind **committed, gepushed, live** auf `endocraft.app/scroll/`.

---

## Was jetzt live ist

### 1. Pack-Opening-Flow komplett verdrahtet

Der vorhandene Pack-Reveal-Code in `scroll/index.html` (Zeilen ~1585–1890) war schon technisch integriert, wurde aber nicht aufgerufen bzw. an den falschen Stellen. Jetzt:

- `generate()` → Text-API → Bild-Generierung wird **vorgezogen und ge-awaited** → danach erst Pack
- Loading-Overlay wechselt während der Bild-Generierung auf „Forging your card image…"
- `generateSessionImage()` gibt jetzt ein Promise zurück das auf `img.onload` wartet (mit `onerror`-Handling und 30-s-Safety-Cap)
- Pack erscheint erst wenn Bild im Browser dekodiert ist → keine Spinner mehr nach dem Flip
- Defensive Fallback: wenn `window.showPackOverlay` undefined wäre, wird das Overlay trotzdem sichtbar gemacht + Tap-to-continue als Notausgang
- Console-Logs mit `[PACK]`-Prefix für schnelles Debuggen

### 2. Kartenrücken + 3D-Flip

- Neuer `#tcFlipWrap` als 3D-Scene mit `transform-style: preserve-3d` und sanfter `tcFloat`-Animation (4.5s ease-in-out infinite)
- `#tcBack` Face: EndoCraft-Logo (72px, golden glow), „EndoCraft" Cinzel-Decorative, Diamant-Divider, Tagline „MAKE EVERY SESSION LEGENDARY"
- Front (`#tcCard`) ist 180° rotiert, `backface-visibility: hidden` auf beiden Faces
- Karte startet mit Rückseite sichtbar; `tcToggleFlip()` wechselt `.flipped`-Klasse
- Alte `tcAutoSpin`-Animation entfernt (kollidierte mit Flip), alter Pointer-Tilt-Handler entfernt

### 3. Alle 5 Rarity-Visuals auf der Karte

Je nach `data.rarity` bekommt `#tcCard` eine der fünf Klassen `r-common`, `r-rare`, `r-epic`, `r-legendary`, `r-misprint`. Jede Klasse aktiviert ihre eigenen Overlay-Elemente:

| Rarity | Effekte |
|---|---|
| Common | minimal grauer Border, keine Animation |
| Rare | blauer Glow-Pulse, diagonaler Shimmer-Sweep (3s loop) |
| Epic | lila Glow-Pulse, zwei kreuzweise Sweeps, 4 Ecken-Sparkles mit 0.5s-Stagger |
| Legendary | goldener Glow, rotierender Conic-Gradient-Border, 20 Float-Particles, goldener Licht-Sweep |
| Misprint | roter Glow + 1°-Rotation, Scanlines, periodische Glitch-Bars |

Spark-Count und Palette variieren pro Rarity (30 Gold-Sparks bei Legendary vs. 4 graue bei Common). Pill-Farbe + Border passen sich an.

### 4. Download-Button via html2canvas

- html2canvas @1.4.1 via Cloudflare-CDN im `<head>` (defer)
- `#tcDownloadBtn` („↓ Save Card") im `#tcActions`-Container unter der Karte
- `tcDownload()` flippt automatisch zur Vorderseite, wartet 850 ms, rendert `#tcCard` @3× Scale, saved PNG mit Datumstempel (`endocraft-card-2026-04-20.png`)
- Fallback-Alert falls html2canvas nicht geladen ist oder fehlschlägt

### 5. Random-Story-Generator + „🎲 Surprise me"-Button

- Neues `RANDOM_STORIES`-Array mit **10 hand-kuratierten Szenarien** die garantiert gute Bilder produzieren:
  - 💋 The Unwanted Kiss (Caspian/Harengon Bard — Markengesicht)
  - 🐉 Dragon's Eye (Lyra/Wood Elf Ranger)
  - ⚡ Shadow Strike (Seraphine/Half-Elf Warlock)
  - ✨ Divine Dawn (Brother Aldric/Human Cleric)
  - 🔥 Last Ember (Vex/Tiefling Sorcerer)
  - 🗡️ Silent Strike (Pip/Halfling Rogue)
  - 🐻 Beast Within (Aelwyn/Half-Elf Druid)
  - ❄️ Frost Exhale (Azara/Silver Dragonborn)
  - 🎶 Bard's Charm (Felix/Half-Elf Bard)
  - 💢 Chains of Wrath (Kora/Half-Orc Barbarian)
- Auto-Fill beim Page-Load — User landet auf `/scroll` und sieht sofort fertige Story
- „🎲 Surprise me" Button (lila/golden, prominent) rollt neue Story; vermeidet zweimal dieselbe hintereinander
- Cursor springt automatisch in die `My character:`-Zeile damit User sofort den Namen ändern kann
- Label daneben zeigt welches Szenario gerade aktiv ist
- `EXAMPLES`-Objekt + `fillEx()` bleiben rückwärtskompatibel erhalten

---

## Kritischer Bug der entdeckt + gefixt wurde

**GitHub-Pages-Build war kaputt seit 20.04.2026 21:25:10.** Symptom: Code war auf main committed, aber `endocraft.app` zeigte weiterhin die alte Version von 16:05:37.

**Ursache:** Im Commit `82b77332` wurde versehentlich der Claude-Code-Worktree-Ordner `scroll/.claude/worktrees/dreamy-ptolemy-d54a40` als **Git-Submodul** (mode 160000) ins Repo aufgenommen. GitHub konnte das nicht auflösen → beide Workflows (`Deploy to GitHub Pages` und `pages-build-deployment`) schlugen fehl.

**Fix:** 

1. `C:\Users\cxrat\Desktop\EndoCraft\.gitignore` neu erstellt (excludes `.claude/`, OS-Files, Editor-Junk, `node_modules/`)
2. `C:\Users\cxrat\Desktop\EndoCraft\fix_pages.bat` erstellt — läuft `git rm --cached`, committet, pushed
3. User hat's ausgeführt → `pages-build-deployment #98` = grün

**Zukünftige Sicherung:** Die `.gitignore` ist jetzt im Repo. Wenn Claude-Code-Worktrees nochmal auftauchen, werden sie ignoriert.

---

## Stack-Zusammenfassung

- **Frontend:** GitHub Pages → `endocraft.app`
  - Repo: `github.com/theendocraft-maker/EndoCraft` (Branch `main`)
  - Build: native `pages-build-deployment` von GitHub (custom `deploy.yml` mit peaceiris ist schon seit Wochen kaputt, kann eigentlich gelöscht werden, stört aber nicht)
  - Deploy: `C:\Users\cxrat\Desktop\EndoCraft\deploy.bat` doppelklicken → git add/commit/pull-rebase/push → GitHub Pages baut in ~1 Min
- **Backend:** Railway → `https://endocraft-production.up.railway.app`
  - Repo: `github.com/theendocraft-maker/endocraft-api`
  - Endpoints: `/api/chat` (Text), `/api/image` (Bild)
- **Supabase:** `dtlzsbhyngafhxkjjlst.supabase.co` — sessions + subscribers tables
- **Image Gen:** aimlapi.com → `bytedance/seedream-4-5` ($0.04/Bild)
- **Social:** @theendocraft (TikTok, Instagram)

---

## Was als Nächstes kommt (offener Scope)

### Priority B — Backend (endocraft-api Repo auf Railway)

Diese Änderungen müssen ins **Railway-Backend**, nicht ins Frontend-Repo:

**B1. Server-side Rarity-Seed mit crypto.randomBytes**

```js
const crypto = require('crypto');
function getRarityRoll() {
  const buf = crypto.randomBytes(4);
  return (buf.readUInt32BE(0) % 20) + 1; // 1-20
}
function getRarity(roll) {
  if (roll === 1)  return 'misprint';   // 3%  (Nat 1)
  if (roll <= 6)   return 'common';     // 17% (2-6)
  if (roll <= 13)  return 'rare';       // 35% (7-13)
  if (roll <= 19)  return 'epic';       // 37% (14-19)
  return 'legendary';                   // 8%  (Nat 20)
}
// Im /api/chat Route: roll + rarity an den Response anhängen
// (Frontend greift schon auf data.rarity + data.visible_roll zu)
```

**B2. Neuer Claude System-Prompt**

Komplett neuer Prompt mit `needs_more_info`-Validation und der strukturierten Image-Prompt-Formel. Details siehe `EndoCraft_Briefing.md` (im Repo) — Kernformel:

```
[SHOT] + [CHARACTER] + [EMOTION] + [ENVIRONMENT] + [LIGHTING] + [SUFFIX]
```

mit kuratierten Optionen pro Feld. Nat 20 bekommt Extra-Modifier „ultra-epic composition, god-rays breaking through darkness, peak cinematic hero moment". Nat 1 bleibt bildlich normal, wird durch CSS-Glitch zum Misprint.

**B3. Rate Limiting**

```js
const rateLimit = require('express-rate-limit');
const limiter = rateLimit({
  windowMs: 60 * 60 * 1000,
  max: 10,
  message: 'Too many requests'
});
app.use('/api/chat', limiter);
app.use('/api/image', limiter);
```

### Priority C — Größere Platform-Features (eigene Sessions)

**C1. Landing-Page** auf `endocraft.app/` (root) → aus `landing_mockup.html` übernehmen:

- Hero mit 3 Karten-Fan (Legendary/Epic/Rare) + Nat-20-Badge
- How-it-Works-Flow (3 Schritte)
- D20-System visuell erklärt (alle 5 Raritäten)
- Collection-Preview (3 Karten + 3 Slots)
- Email-CTA Waitlist
- Hintergrund #07060f
- Braucht noch: Alberich-Bild generieren (für Rare/Epic Karten im Mockup — aktuell alle Caspian)

**C2. Supabase-Schema erweitern:**

```sql
ALTER TABLE sessions ADD COLUMN user_id UUID REFERENCES auth.users(id);
ALTER TABLE sessions ADD COLUMN rarity TEXT DEFAULT 'common';
ALTER TABLE sessions ADD COLUMN roll_value INT;
ALTER TABLE sessions ADD COLUMN is_misprint BOOLEAN DEFAULT false;
ALTER TABLE sessions ADD COLUMN rarity_seed TEXT;
ALTER TABLE sessions ADD COLUMN model_name TEXT DEFAULT 'seedream-4-5';
ALTER TABLE sessions ADD COLUMN model_vintage TEXT DEFAULT '2025-Q4';
ALTER TABLE sessions ADD COLUMN card_serial INT;
ALTER TABLE sessions ADD COLUMN session_hash TEXT;
ALTER TABLE sessions ADD COLUMN committed_at TIMESTAMP;
```

**C3. Google OAuth + `/collection`-Page**

- Supabase Auth → Google OAuth Provider aktivieren
- „Save to collection" Button nach Karten­generation → Sign-in-Flow
- `endocraft.app/collection` → Grid aller User-Karten, Click → Flip-Animation

**C4. Commit-System**

- Karte existiert vor Commit nur als Preview (kein DB-Eintrag)
- Bei Commit: Seriennummer permanent (auto-increment global), Seed gesiegelt, `committed_at` gesetzt
- Pre-Launch: Auto-Commit nach 24h

**C5. Credit-System (Post-Launch)**

- 1 Credit = neue Szene, 0.5 Credit = Re-Roll gleiche Szene, 1 Credit = Re-Roll neue Szene
- Free: 3/Monat — Adventurer €5: 30 — Legend €12: 100
- Re-Roll gratis 1–2× direkt nach Generierung

---

## Strategie-Zusammenfassung (falls relevant)

**Vision:** „Dein Moment. Jede Welt." — heute D&D-Sessions, später alle TTRPG, übermorgen jedes Erlebnis das festgehalten werden will.

**Tagline:** „Make Every Session Legendary"

**Caspian** ist das Markengesicht — Harengon Bard, braunes Fell, blaues Hemd, braune Weste, melancholisch. Signature-Karte „The Unwanted Kiss" (Grimhilda-Szene aus Witchlight). Jetzt auch als erster Eintrag im `RANDOM_STORIES`-Array.

**Rarity-Verteilung (Pre-Launch, großzügig):**

| Roll | Rarity | % |
|---|---|---|
| 1 | Misprint | 3% |
| 2–6 | Common | 17% |
| 7–13 | Rare | 35% |
| 14–19 | Epic | 37% |
| 20 | Legendary | 8% |

**NFT-Roadmap:** Metadaten schon jetzt NFT-ready in Supabase speichern (Seed, Serial, Hash, Vintage). On-Chain optional später. Royalties auf Sekundärverkäufe (5–10%). MiCA EU 2025–26 schafft regulatorische Basis.

**TikTok-Plan:**

1. „I turned my D&D session into a trading card 🃏" — Flow: Session → Pack Hold → Explosion → Legendary
2. „Ich hab eine Nat 1 gezogen 💀" — Flow: Pack → Misprint erscheint → C̷a̸s̵p̶i̴a̷n̸ DATA CORRUPTED
3. „My bard got kissed by a hag and accidentally saved a princess 💀🎲" — The Unwanted Kiss zeigen → Flip

---

## Wichtige Dateien im Repo

| Datei | Status |
|---|---|
| `scroll/index.html` | **Alle Änderungen drin, live deployed** |
| `index.html` | Noch altes Landing — `landing_mockup.html` muss noch integriert werden |
| `session/index.html` | Separate Session-Seite, nicht angefasst |
| `admin/index.html` | Admin, nicht angefasst |
| `.gitignore` | **Neu erstellt** — verhindert den Worktree-Bug |
| `fix_pages.bat` | **Neu erstellt** — einmaliger Fix, wird nicht mehr gebraucht |
| `deploy.bat` | Bestand, unverändert |
| `EndoCraft_Briefing.md` | Bestand — Vollständiges strategisches Briefing |
| `pack_final.html`, `card_back_final.html`, `rarity_showcase.html`, `landing_mockup.html` | Referenz-Mockups, die Essenz ist jetzt in scroll/index.html |

---

## Handoff-Instruktion an die neue Session

> Du startest ein EndoCraft-Projekt. Die Frontend-Integration in `scroll/index.html` ist komplett und live (Pack-Flow, Card-Flip, Rarity-Visuals, Download, Random-Story). Nächster Schritt ist **Priority B** (Backend im `endocraft-api`-Repo auf Railway): Server-side Rarity-Seed mit crypto, neuer Claude-System-Prompt aus dem Briefing, Rate-Limiting. Lies die Datei `SESSION_HANDOFF_2026-04-20.md` und das `EndoCraft_Briefing.md` im Repo für den vollen Kontext.

