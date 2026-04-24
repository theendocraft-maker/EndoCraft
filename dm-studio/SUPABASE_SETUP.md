# Supabase Setup für DM Studio Cloud-Sync

## 1. Tabelle anlegen

Im Supabase-Dashboard → **SQL Editor** → **New Query** → dieses SQL einfügen und ausführen:

```sql
-- DM Studio state per (user, campaign) pair
CREATE TABLE IF NOT EXISTS dm_studio_state (
  id bigserial PRIMARY KEY,
  user_email text NOT NULL,
  campaign_id text NOT NULL,
  state_json jsonb NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(user_email, campaign_id)
);

-- Index für schnelles List-Lookup pro User
CREATE INDEX IF NOT EXISTS idx_dm_studio_user_email ON dm_studio_state(user_email);
CREATE INDEX IF NOT EXISTS idx_dm_studio_updated_at ON dm_studio_state(updated_at DESC);

-- Row-Level-Security: Tabelle schützen, Zugriff nur über service_role key
ALTER TABLE dm_studio_state ENABLE ROW LEVEL SECURITY;

-- Policy: service_role darf alles (Backend auf Railway nutzt diesen Key)
-- Falls die Policy schon existiert, erst droppen:
DROP POLICY IF EXISTS "service_role_full_access" ON dm_studio_state;
CREATE POLICY "service_role_full_access" ON dm_studio_state
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);
```

## 2. Railway SUPABASE_KEY prüfen

**Wichtig:** Der `SUPABASE_KEY` auf Railway MUSS der **service_role**-Key sein, NICHT der publishable/anon-Key.

- Supabase-Dashboard → **Project Settings** → **API**
- Unter "Project API keys": **service_role (secret)** kopieren
- Railway → Environment Variables → `SUPABASE_KEY` → diesen Key einfügen
- Railway redeploy triggern (oder warten bis Auto-Deploy läuft)

Wenn der publishable-Key gesetzt ist, blockt RLS alle Zugriffe mit 404-artigen Responses — genau das was du vorher gesehen hast.

## 3. Test

Nach Deployment im DM Studio:
1. Einloggen mit Google
2. Browser-Console (F12) offen halten
3. Eine Änderung machen (z.B. Notiz-Text im Briefing)
4. Nach ~3 Sekunden sollte `setSyncStatus('synced', 'Synced ✓')` triggern — Topbar zeigt `☁️ Synced ✓`
5. In Supabase-Dashboard → **Table Editor** → `dm_studio_state` → sollte eine Zeile pro Kampagne zeigen

## 4. Debugging

Falls Sync nicht funktioniert — Browser-Console Logs prüfen:
- `[Sync] Fehler:` → Backend-Fehler, schau Railway-Logs
- `API 500` → wahrscheinlich SUPABASE_KEY falsch oder Tabelle existiert nicht
- `API 401/403` → RLS-Policy blockt, service_role-Key nicht aktiv
- `API 404` → Tabelle existiert gar nicht oder Request-URL falsch

Manuell testen via curl:
```bash
# Campaigns-Liste für User abfragen
curl 'https://endocraft-production.up.railway.app/api/dm-studio/campaigns?email=cx.ratti@gmx.de'
```

Erwartet: `{"campaigns":[{"campaign_id":"cos","updated_at":"..."}, ...]}`
