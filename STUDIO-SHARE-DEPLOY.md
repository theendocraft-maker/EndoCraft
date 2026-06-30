# Studio: Teilen-Link + pro-Typ-Animation — Deploy-Notiz

## Was geändert wurde

**1. Teilen-Link nach jeder Erzeugung** (Bild UND Video)
- Nach Bildauswahl / fertigem Clip wird das Asset still im Hintergrund vor-gespeichert → ein **„↗ Share link"**-Button erscheint in der Leiste neben Download/Reroll/Animate.
- Klick = Link in die Zwischenablage (iOS-clipboard-safe, gleicher Mechanismus wie Session Scroll) bzw. nativer Share-Dialog am Handy.
- Der Link öffnet eine **eigene, gebrandete Share-Seite** `…/s/<id>` mit dem Foto oder Clip + CTA „Make your own free" → `/free` (mit UTM `share/studio`). Funktioniert für **Bild und Video**.
- Pro Asset wird optional der erzeugende **Code** mitgespeichert → fürs Code-Tracking nutzbar.

**2. Animation ohne Vorschläge — unsere optimalen Prompts**
- Das 5-Button-Vorschlagsmenü ist raus. „Animate" startet direkt mit unserem **pro-Typ optimierten** Prompt (Charakter / Monster / Location / Item) nach unserer Kling-Erkenntnis: Subjekt still, Welt lebt, Kamera statisch, langsam.

## Geänderte Dateien
- `studio/index.html` (Frontend) — Share-Button + Wiring + pro-Typ-Animation
- `endocraft-api-deploy/server.js` (Backend) — neue Routen `POST /api/save-asset` + `GET /s/:id` (+ Helfer)
- `endocraft-api-deploy/supabase-migrations/012_studio_assets.sql` (neue Tabelle)

## Deploy-Schritte (eine gebündelte Runde)
1. **SQL** in Supabase ausführen: Inhalt von `012_studio_assets.sql`
2. **Backend** deployen (server.js → Railway)
3. **Frontend** deployen (studio/index.html → GitHub Pages)
4. Test: im Studio Bild erzeugen → „Share link" klicken → Link öffnen → Share-Seite mit Bild + CTA. Dann „Animate" → Clip → erneut „Share link".

## ⚠️ Öffentlicher Text der Share-Seite — bitte freigeben
Die `/s/<id>`-Seite zeigt:
- Marke oben: **„EndoCraft STUDIO"**
- Untertitel: **„Made in the EndoCraft Studio — cinematic, hand-curated D&D art."**
- CTA-Box:
  - Klein: **„Free · no catch"**
  - Überschrift: **„Make your own cinematic D&D art"**
  - Zeile: **„Describe a hero, monster or place — we craft it and send it to your inbox."**
  - Button: **„Get yours free →"**
- Titel/Tab = die Nutzer-Beschreibung des Assets.

Sag Bescheid, wenn der Text passt oder ich etwas anpassen soll.

## Hinweis (kein Blocker)
Die Share-Seite zeigt das Asset über die bestehenden Proxys (`/api/image/proxy`, `/api/video/proxy`). Falls Seedream-/Kling-Original-URLs irgendwann ablaufen, könnte ein sehr alter Share-Link das Medium nicht mehr laden — für später optional: Assets dauerhaft in Supabase-Storage spiegeln. Für den Start kein Problem.
