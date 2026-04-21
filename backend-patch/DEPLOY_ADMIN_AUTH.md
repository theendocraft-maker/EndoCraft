# Admin Auth — Proper Security Setup

Weg vom hardcoded Password im Client-JS (das jeder im Page-Source sehen kann) hin zu echtem Supabase Auth + RLS-Lockdown.

## Was sich ändert

**Vorher:**
- Passwort `halal` stand im Client-JS von `admin/index.html` (jeder konnte es lesen)
- RLS-Policies auf `subscribers`, `cards`, `sessions` hatten `select using (true)` — **jeder mit dem publishable key konnte SELECT \* machen**
- Landing-Counter las Subscribers direkt aus Supabase (gleiche Leak-Quelle)

**Nachher:**
- Admin meldet sich mit Email + Passwort über **Supabase Auth** an
- Session-Token (JWT) wird in localStorage gespeichert + automatisch refreshed
- RLS-Policies erlauben SELECT **nur für `authenticated` role** — anonymous Traffic kann die Tabellen nicht mehr auslesen
- Landing-Counter läuft über neuen Backend-Endpoint `/api/subscriber-count` (backend nutzt service_role um RLS zu umgehen, gibt nur die Gesamtzahl zurück — keine Emails)
- **Keine Credentials mehr im Frontend-Code.**

---

## Deploy-Schritte (Reihenfolge wichtig!)

### Schritt 1 — Admin-User in Supabase Auth anlegen (einmalig)

Supabase Dashboard → **Authentication** (linke Sidebar) → **Users** → **Add user** → **Create new user**
- Email: (deine gewünschte Admin-Email, z.B. `cx.ratti@gmx.de`)
- Password: ein starkes Passwort
- Auto Confirm User: **YES** (damit du nicht die Confirmation-Email brauchst)
- Klick **Create user**

**Merk dir die Email + das Passwort** — damit loggst du dich künftig im Admin ein.

Falls du willst, kannst du später über **Authentication → Policies → Email Auth Provider** einstellen dass NEUE User nicht sich selbst registrieren können (sonst könnte technisch jeder einen Auth-User via Supabase API erstellen). Für MVP egal — die Tabellen sind ja per RLS geschützt, nicht per User-Whitelist.

### Schritt 2 — RLS-SQL in Supabase ausführen

Supabase Dashboard → **SQL Editor** → **New Query** → Inhalt aus **`SQL_admin_auth.sql`** (liegt in diesem Ordner) reinpasten → **Run**.

Das:
- Sperrt SELECT auf `subscribers`, `cards`, `sessions` ab — ab jetzt braucht's ein authenticated JWT um die Tabellen zu lesen
- Hält INSERT offen (damit `/api/subscribe`, `/api/save-card` und der Scroll-Flow weiter funktionieren)

Check danach mit dem auskommentierten SQL-Query am Ende der Datei (`SELECT ... FROM pg_policies ...`) dass die Policies korrekt gesetzt sind.

### Schritt 3 — Backend deployen

Neue `server.js` hat einen Endpoint **`/api/subscriber-count`** dazu bekommen (für den Landing-Counter, der nicht mehr direkt auf Supabase darf).

```bash
cd ~/path/to/endocraft-api
# copy server.js from backend-patch/
git add server.js
git commit -m "Add /api/subscriber-count endpoint for public social proof"
git push origin main
```

Railway deployt in ~30-60s.

**Wichtig:** Dein Railway-Backend muss den **service_role** Supabase-Key in `SUPABASE_KEY` als env var haben (nicht den publishable Key), sonst kann das Backend die RLS nicht umgehen. Falls bisher der publishable Key gesetzt war:
- Supabase Dashboard → Settings → API → **service_role** Key kopieren
- Railway Dashboard → dein Service → Variables → `SUPABASE_KEY` auf den service_role-Wert setzen
- Railway redeployt automatisch

### Schritt 4 — Frontend deployen

Im EndoCraft-Repo (deploy.bat):
- `admin/index.html` wurde auf Supabase-Auth umgestellt (Email + Passwort Login, JWT-basiert)
- `index.html` (Landing) ruft jetzt `/api/subscriber-count` statt direkt Supabase

```bash
cd ~/Desktop/EndoCraft
deploy.bat
```

### Schritt 5 — Testen

1. Öffne `endocraft.app/admin` → Login-Form hat jetzt 2 Felder (Email + Passwort)
2. Login mit den Credentials aus Schritt 1
3. Dashboard lädt normal, alle Daten (Subscribers, Cards, Sessions) werden gezeigt
4. Logout testen → localStorage wird geleert, Login-Form kommt zurück
5. **Security-Check:** Öffne ein Incognito-Fenster → versuch aus der Browser-Console direkt Supabase zu queryen:
   ```js
   fetch('https://dtlzsbhyngafhxkjjlst.supabase.co/rest/v1/subscribers?select=email', {
     headers: {
       'apikey': 'sb_publishable_J3aiHIpBxzWY8-Ag24lo-Q_GdpRC263',
       'Authorization': 'Bearer sb_publishable_J3aiHIpBxzWY8-Ag24lo-Q_GdpRC263'
     }
   }).then(r => r.json()).then(console.log);
   ```
   → Erwartete Antwort: leeres Array `[]` (weil RLS blockiert). Vorher hätte es alle Emails zurückgegeben.
6. Landing `endocraft.app` → Social-Proof-Counter funktioniert weiter (hole-Daten über Backend-Endpoint)

---

## Falls was schiefgeht

**"Invalid login credentials" beim Admin-Login:**
→ User in Supabase Auth falsch angelegt. Nochmal Schritt 1 machen, sicherstellen dass "Auto Confirm" an war.

**"No rows returned" bei Admin-Daten nach Login:**
→ JWT wird nicht richtig verschickt. Browser-DevTools → Network → Request-Header checken: Authorization sollte `Bearer eyJ...` enthalten (nicht der publishable key). Wenn nicht: localStorage löschen und neu einloggen.

**Landing-Counter zeigt "Early access open" obwohl 100+ Subscribers:**
→ Backend-Endpoint antwortet falsch. Check `/api/subscriber-count` direkt im Browser. Falls Fehler: Railway env var `SUPABASE_KEY` ist nicht service_role (siehe Schritt 3).

**Scroll-Flow bricht (User kann keine Session mehr generieren):**
→ Wahrscheinlich die `sessions` INSERT-Policy fehlt. SQL-Editor:
```sql
alter table public.sessions enable row level security;
create policy "sessions_insert_anon" on public.sessions
  for insert with check (true);
```

## Was jetzt sicher ist

- Emails der Subscribers sind nicht mehr öffentlich abrufbar
- Card-Metadaten (welche User welche Karten haben) sind nicht mehr öffentlich
- Session-Inhalte sind nicht mehr öffentlich (falls jemand die IDs durchrät)
- Admin-Login nutzt echtes Passwort-Hashing via Supabase Auth (bcrypt)
- Session-Tokens verfallen automatisch, werden refreshed

## Was weiterhin öffentlich ist (by design)

- Subscriber-**Count** (Gesamtzahl, für Social Proof auf der Landing)
- INSERT in subscribers (für Email-Signup) und cards/sessions (für den Scroll-Flow)
- Die Image-URLs der Karten (aimlapi-URLs, die on-chain später ersetzt werden)
