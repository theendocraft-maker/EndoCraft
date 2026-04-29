# EndoCraft · Code-Snapshot

**Stand:** 2026-04-29
**Zweck:** Vollständiger Stand des Codebases für die nächste Session

---

## 🟢 Was funktioniert (deployed + live)

### Backend (Railway · `endocraft-production.up.railway.app`)
- Co-DM Chat (Sonnet 4.6, getrimmt)
- DM-Studio Save/Load/Campaigns
- Card-Generation (Anthropic + Seedream + Flux/Imagen)
- Party-System (create/join/list/sessions/leave) — Legacy
- Hall of Fame (vote/votes/trending/recompute)
- Live Multiplayer Dice (request/roll/stream/cancel) — beide Scopes (party_code + campaignRoom)
- Charakter-Einladungen (create/get/accept/by-campaign/revoke)
- Campaign-Memberships
- Encounter Builder (mit Campaign-Context-Block)
- 27+ Endpoints insgesamt

### Frontend
- **Landing-Page** (`index.html`) — Two-Layers-Vision, 4-Step-Loop, Multi-Path-CTA. Caspian noch fehlt im Hero (zeigt noch Thorne)
- **Shared Card-Layer Header** (`_shared/card-layer-header.js`) auf Landing + Scroll + Hall of Fame + My Cards
- **Hall of Fame Public Page** — Trending/All-Time, Voting, Rarity-Filter
- **Scroll** — Master-Formel-Stories, Auth-Detection, Opus 4.7

**DM Studio (Marco's Design):**
- Briefing mit lpanel-Sidebar (Sessions + Quick-Zugriff)
- Schauplatz-Tab (Prep+Live merged via Mode-Toggle)
- Charaktere mit 🔗 Spieler-Einladen-Button
- Highlights-Pipeline
- Party Album
- Live-Würfel-Stream im Right-Panel (4. Tab)
- Click-on-Statblock-Ability → Roll Request
- Encounter Builder mit Campaign-Context-Checkboxes
- NPC-Initiative auto-gewürfelt

**Player View:**
- Char-Sheet mit D20-Stat-Rolls
- Live-Session-Mode-Card (Schauplatz + Quick-Notes + Combat)
- Highlights-Tiles (öffnen Scroll)
- Party Album mit Progress + Unlocks
- Charakter-Einladungs-Acceptance via `?invite=TOKEN`
- Live-Dice publish + Roll-Request-Banner

---

## 🟡 Code-fertig, muss noch deployed werden

### Backend — `deploy.bat` für die letzten Änderungen
- `/api/encounter/build` mit erweitertem Campaign-Context
- `/api/invites/*` (5 Endpoints)
- `/api/campaigns/by-member`
- Live-Dice mit `campaignRoom`-Scope

### SQL noch auszuführen
- `006_character_invites.sql` (Tables: `character_invites`, `campaign_members` + scope-Spalte für live_rolls/roll_requests)
- `005_live_dice.sql` (Tables: `live_rolls`, `roll_requests`) — wahrscheinlich schon
- `004_hall_of_fame.sql` — schon
- `003_party_unlocks.sql` — schon
- `002_parties.sql` — schon

### Realtime-Aktivierung in Supabase Dashboard
für `live_rolls` + `roll_requests` (sollte schon aktiv sein)

---

## 🔴 Action-Items für dich

1. SQL `006_character_invites.sql` in Supabase ausführen
2. `deploy.bat` (server.js mit Encounter-Builder + Char-Invites + erweitertem Live-Dice)
3. Hard-Refresh DM Studio + Player View
4. End-to-End-Test:
   - Charakter einladen via 🔗 → Magic-Link → Player joint
   - Encounter generieren mit Location-Context → in Combat → NPCs auto-gerollt
   - DM klickt 🎲 auf Statblock-Action → Player kriegt Banner

---

## 🔵 Backlog für nächste Session

### Strategisch (groß)
- **Lore Codex** — Auto-Wiki aus Campaign-Daten (NPCs + Locations + Sessions cross-verlinkt, durchsuchbar)
- **Foreshadowing-Tracker** — Plot-Threads + Auflösungen aus Recaps, alerts wenn Hints überfällig sind
- **Living Cards** — Kling-Animation als €1.99 Premium-Feature

### Drama-Stage (Design + Funktion)
- **3D Würfel** via `@3d-dice/dice-box` mit gold/dark Resin-Theme + Sound
- **Cinematic Crit/Fumble**-Treatment (Slow-Motion + Holo-Flash + Shake)
- **Vollbild-Würfeltakeover** bei DM-Roll-Request (synced animation timing für DM + Player)

### Vom User noch nicht angefasst
- Spieler kann andere Spieler einladen (UX vorbereitet, Backend-Endpoints fehlen — Player-side Invite-Generator)
- Campaign-Marketplace (Phase 4, braucht Creator-Outreach zuerst)

---

## 📁 Wichtige Files

### Workspace (Frontend)
- `C:\Users\cxrat\Desktop\EndoCraft\dm-studio\index.html` — DM Studio (~12k Zeilen)
- `C:\Users\cxrat\Desktop\EndoCraft\player\index.html` — Player View
- `C:\Users\cxrat\Desktop\EndoCraft\scroll\index.html` — Scroll
- `C:\Users\cxrat\Desktop\EndoCraft\hall-of-fame\index.html` — Hall of Fame
- `C:\Users\cxrat\Desktop\EndoCraft\my-cards\index.html` — My Cards
- `C:\Users\cxrat\Desktop\EndoCraft\index.html` — Landing-Page
- `C:\Users\cxrat\Desktop\EndoCraft\_shared\card-layer-header.js` — shared Header

### Workspace (Backend)
- `C:\Users\cxrat\Desktop\endocraft-api-deploy\server.js` — Backend (~1700 Zeilen)
- `C:\Users\cxrat\Desktop\endocraft-api-deploy\supabase-migrations\002–006_*.sql` — DB-Migrationen
- `C:\Users\cxrat\Desktop\endocraft-api-deploy\deploy.bat` — Push-Script (mit pull --rebase)

### Übergabe-Dokumente
- `C:\Users\cxrat\Documents\Claude\Projects\Endocraft\CLAUDE_DESIGN_BRIEF.md` — Übergabe an Claude Design
- `C:\Users\cxrat\Documents\Claude\Projects\Endocraft\CODE_STATUS.md` — diese Datei

---

## 📝 Memory ist aktuell

Alle wichtigen Architekturentscheidungen, Feedback-Regeln und Projekt-States in `MEMORY.md` und Untermemory-Files dokumentiert. Nächste Session findet alle Kontext-Infos automatisch.

Wichtige Memory-Files:
- `reference_endocraft_master.md` — Master-Reference
- `project_dm_studio.md` — DM Studio Projekt-State
- `project_player_view.md` — Player View Status
- `project_party_album.md` — Party Album Phase 1+2
- `project_hall_of_fame.md` — Hall of Fame Backend
- `project_zones_architecture.md` — Cockpit ↔ Card-Layer
- `feedback_design_dont_overwrite.md` — Marco's Design-Regel
- `project_campaign_feed.md` — Phase-4-Idee

---

## 🎯 Empfohlene nächste Aktion

Nach den Action-Items + Test:

**Mein Vorschlag für die nächste Code-Session:** **Lore Codex** angehen.

Begründung:
- Größter Hebel: nutzt deinen Campaign-Graph + Recaps + Highlights vollständig aus
- Macht das Cockpit zum echten "Memory-System" für die Kampagne (vs nur Tool-Sammlung)
- Niedriges Risiko: rein additive Funktion, keine Refactor-Gefahr
- Verbindet bestehende Daten via AI ohne neue UI-Komplexität

Alternative: **Drama-Stage 3D Dice** wenn du erst die Wow-Faktor-Verbesserung willst, bevor wir mehr Features draufpacken. Aber 3D-Dice braucht parallel Claude Design für Theme.
