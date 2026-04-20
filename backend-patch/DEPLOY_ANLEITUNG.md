# Backend-Patch für `/api/subscribe`

Dein `endocraft-api`-Backend hatte **keinen Subscribe-Endpoint** — deswegen liefen alle Email-Signups auf der Landing Page + Roadmap Page ins Leere. Diese Patch fügt den Endpoint hinzu.

## Was zu tun ist (3 Schritte)

### Schritt 1: Environment Variables auf Railway setzen

Geh ins Railway-Dashboard → dein `endocraft-api`-Service → **Variables** → füge **ZWEI** neue Einträge hinzu:

```
SUPABASE_URL = https://dtlzsbhyngafhxkjjlst.supabase.co
SUPABASE_KEY = sb_publishable_J3aiHIpBxzWY8-Ag24lo-Q_GdpRC263
```

(Der `SUPABASE_KEY` steht in deinem Admin-Code, `admin/index.html` Zeile 200.)

**Wenn du einen `service_role`-Key im Supabase-Dashboard hast** (Settings → API → "service_role secret"), nimm den stattdessen für `SUPABASE_KEY` — der hat volle Schreib-Rechte und umgeht RLS-Policies.

### Schritt 2: `server.js` ins Backend-Repo kopieren

Die neue `server.js` liegt in diesem Ordner (`backend-patch/server.js`). Kopier sie in dein `endocraft-api`-Repo-Root und überschreibe die alte Datei.

### Schritt 3: Deployen

Im Backend-Repo:

```bash
git add server.js
git commit -m "Add /api/subscribe endpoint for email signups"
git push origin main
```

Railway deployt in ~30-60 Sekunden automatisch neu.

## Falls Deploy fehlschlägt

### Fehler: "Supabase not configured"
→ Env vars fehlen. Railway → Variables-Tab prüfen.

### Fehler im Railway-Log: `permission denied` / `new row violates RLS`
→ Du nutzt den publishable Key (kein service_role), aber die `subscribers`-Tabelle hat keine RLS-Policy die Inserts erlaubt.

**Fix:** In Supabase Dashboard → Table Editor → `subscribers` → RLS aktivieren → neue Policy:
- **Name:** Allow anon inserts
- **Operation:** INSERT
- **Target roles:** anon, authenticated
- **With check expression:** `true`

Oder einfacher: in Railway den `SUPABASE_KEY` durch den `service_role`-Key ersetzen.

## Testen ob's funktioniert

Nach dem Deploy:

```bash
curl -X POST https://endocraft-production.up.railway.app/api/subscribe \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","source":"manual-test"}'
```

Erwartete Antwort: `{"ok":true}`

Danach im Admin (`endocraft.app/admin`) sollte `test@example.com` mit Source `manual-test` auftauchen.

## Was die neue Route macht

- Nimmt `{ email, source }` im Body
- Validiert Email-Format grob
- Schreibt direkt in die Supabase `subscribers`-Tabelle via REST API
- Bei Duplicate-Email: silent success (kein Fehler für den User, kein doppelter Eintrag)
- Loggt Fehler in Railway-Konsole zum Debuggen
