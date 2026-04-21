# Backend-Patch — `/api/save-card` + Sequential Numbering

Dieses Update fügt hinzu:
- **Cards-Tabelle in Supabase** mit globaler `number BIGSERIAL` (jede Karte kriegt ihre echte Reihenfolge-Nummer)
- **Separate `misprint_number`-Sequence** (Misprint #32 ist wirklich der 32. Misprint überhaupt)
- **Neuer Endpoint `/api/save-card`** — empfängt Email + Card-Daten, speichert in Supabase, gibt die zugewiesenen Nummern zurück
- **Email-Verknüpfung:** jede gespeicherte Karte ist permanent an die Email gekoppelt → spätere `/my-cards?email=…` Seite möglich

## Schritt 1 — SQL in Supabase ausführen

Supabase Dashboard → **SQL Editor** → neuen Query → Inhalt von **`SQL_cards_table.sql`** (liegt im selben Ordner) reinpasten → **Run**.

Das legt an:
- `public.cards` Tabelle mit `number` (BIGSERIAL, global) + `misprint_number` (nur für Misprints, via Sequence)
- `misprint_seq` Sequence
- Trigger `cards_misprint_number_trigger` der automatisch `misprint_number` füllt wenn `rarity='misprint'`
- RLS-Policies (Lesen für alle, Schreiben nur über service_role)
- Indexes auf email, created_at, number

## Schritt 2 — Environment Variables auf Railway

Wenn noch nicht gesetzt, füg diese zwei hinzu (selbe wie beim Subscribe-Endpoint):

```
SUPABASE_URL = https://dtlzsbhyngafhxkjjlst.supabase.co
SUPABASE_KEY = <dein_service_role_Key>
```

**Wichtig:** Für Schreib-Operationen auf `cards` solltest du unbedingt den **service_role** Key verwenden (Supabase Dashboard → Settings → API → "service_role secret"). Der publishable Key würde mit den RLS-Policies Probleme kriegen.

## Schritt 3 — `server.js` ins Backend-Repo kopieren

Die neue `server.js` liegt in diesem Ordner. Kopier sie in dein `endocraft-api`-Repo-Root und überschreibe die alte.

Enthält zusätzlich zum vorher:
- `/health`, `/api/chat`, `/api/image`, `/api/image/fast`, `/api/subscribe` — unverändert
- **NEU: `/api/save-card`** — empfängt `{ email, card }`, inserted Karte in Supabase, gibt Nummern zurück

## Schritt 4 — Deployen

```bash
git add server.js
git commit -m "Add /api/save-card endpoint with sequential numbering"
git push origin main
```

Railway redeployt in ~30–60s.

## Schritt 5 — Testen

```bash
curl -X POST https://endocraft-production.up.railway.app/api/save-card \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "card": {
      "session_title": "Test Session",
      "legendary_moment": "A test moment",
      "character_name": "Thorne",
      "character_class": "Fighter",
      "rarity": "legendary",
      "visible_roll": 20,
      "image_url": "https://example.com/img.png"
    }
  }'
```

Erwartete Antwort:
```json
{
  "ok": true,
  "card": {
    "id": "uuid-…",
    "number": 1,
    "misprint_number": null,
    "rarity": "legendary",
    "email": "test@example.com",
    "created_at": "2026-04-21T…"
  }
}
```

Bei Misprint:
```json
{
  "ok": true,
  "card": {
    "number": 47,
    "misprint_number": 3,
    "rarity": "misprint",
    ...
  }
}
```

## Was jetzt im Frontend passiert

Wenn User auf der Scroll-Page Email eingibt und "Save card" drückt:

1. Frontend sammelt alle Card-Daten aus dem DOM (session_title, rarity, visible_roll, image_url, etc.)
2. POST an `/api/save-card` mit `{ email, card }`
3. Backend:
   - Upsert Email in `subscribers`-Tabelle (falls noch nicht drin)
   - Insert in `cards`-Tabelle → Postgres vergibt `number` (global sequential)
   - Trigger füllt `misprint_number` falls `rarity='misprint'`
   - Response mit der echten Nummer + UUID
4. Frontend updated das Karten-Display: der Serial auf der Front zeigt jetzt die echte Nummer (z.B. "THORNE #0834 / 9999"), Back-Certificate wird angepasst, Ritual-Prose zeigt echte Misprint-Nummer

Vor dem Save: client-side Pseudo-Nummer als Preview. Nach dem Save: die echte permanente Nummer aus der DB.

## Was für später bleibt

- **`/my-cards?email=…`** Seite — holt alle Karten eines Users aus `cards` via `SELECT * FROM cards WHERE email = ? ORDER BY created_at DESC`
- **Supabase Storage** für permanente Bild-Persistenz (aktuell: `image_url` zeigt noch auf aimlapi, könnte irgendwann ablaufen)
- **on-chain Mint** — `number` wird zur Token-ID, `image_url` + `metadata` gehen auf IPFS, Royalties auf Sekundärverkäufe
