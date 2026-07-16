# EndoCraft — Vollständige Übergabe (Stand 2026-07-16)

> Dieses Dokument in einem neuen Chat als Erstes einlesen. Es fasst Marke, Regeln, Tech, Produkte, Automations-Fallen und offene Punkte zusammen. Kommunikation mit Marco: **Deutsch**. Marco = cx.ratti@gmx.de.

---

## 1. Wer / Was
- **EndoCraft** — KI-kuratierte, cineastische D&D-/TTRPG-Digital-Asset-Marke für Dungeon Masters. Ästhetik: photorealistisch-cineastisch (Seedream 4.5), NICHT Öl-Gemälde.
- **Kanäle:** Website **endocraft.app** · Etsy **etsy.com/shop/EndoCraft** (shop_id 64988935) · Pinterest **@theendocraft** · TikTok/Instagram **@theendocraft** · itch **endocraft.itch.io** · Backend auf **Railway** (`endocraft-production.up.railway.app`).
- **Positionierung:** kuratierter Look + Keepsake/Emotion + „echter D&D-Moment" als Moat. USP über Qualität + emotionale Hooks (z. B. No-Combat-Pfade), NICHT über breite Generierung.
- **Funnel:** Social (TikTok/Pinterest) → endocraft.app (Free-5-NPC-Pack, E-Mail-Gate) → Etsy-Kauf. **TikTok führt auf die Page (endocraft.app), NICHT direkt auf Etsy.** Pinterest darf direkt aufs Etsy-Listing.

## 2. STANDING RULES (nicht verletzen)
- **Kein Bild/Video veröffentlichen, das Marco nicht persönlich gesehen hat.** Bei Image-Gen immer 3-4 Varianten parallel zeigen.
- **Alle Texte vorab von Marco freigeben** (Korrekturlesen) · D&D-Vokabular muss korrekt sein (z. B. „Battle Map" nur für griddbare Top-Down-Maps, sonst „Scene/Location").
- **Kein CSS/Layout/Design am Live-Produkt ohne Rückfrage** (Marco hat das Design selbst gemacht).
- **Keine bezahlten Ads autonom hochdrehen** (Budget = Marcos Entscheidung).
- **Secrets (ADMIN_KEY, INTERNAL_KEY, ETSY-Keys, Passwörter) NIE in Memory speichern.**
- **Charakter-Fidelity:** jedes Bild muss die kanonische Persönlichkeit/Story treffen, nicht nur „generisch hübsch".
- **SRD-Legal:** Statblocks nur für SRD-Kreaturen; keine benannten WotC-NPCs (Strahd/Ireena/Beholder/Mindflayer). Alles „kompatibel mit / nicht affiliiert mit Wizards of the Coast".
- **Etsy: keine Rezensionen incentivieren** (Policy). Kunden-Bonus (Coupon THANKS15) geht bedingungslos an alle.

## 3. Tech-Stack & APIs (Railway-Backend)
API-Base: **`https://endocraft-production.up.railway.app`** (NICHT endocraft.app — dort nginx → POST/api = 405).

- **Bild-Gen:** `POST /api/image` {model:'bytedance/seedream-4-5', width, height, quality_lock, prompt} → {url}. Kostet AIML-Prepaid-Geld (~3¢). Locations: `quality_lock:false` + kurze 12-20-Wort-Prompts. Characters: quality_lock default ON.
- **Video-Gen (Kling i2v):** `POST /api/video` {code|internal, duration:5, prompt, negative_prompt, image_url:Base64-DataURL} → {id} → poll `GET /api/video/status?id=` → `GET /api/video/proxy?url=<enc>` zum Laden. ~30¢/Clip.
- **Access-Control (2026-07-02 gebaut):** `/api/image` + `/api/video` gegen Fremd-curl gesichert (Origin-Allowlist endocraft.app + Rate-Limit). **`INTERNAL_KEY` (Header `x-internal-key`) = Bypass:** damit generiere ICH Bilder+Video OHNE Code/Credits/Aufladen. Key liegt lokal in `endocraft-api-deploy/.internal-key` (gitignored) → `cat` + als Header senden. **Einziger echter Engpass: AIML-Prepaid-Guthaben muss gefüllt sein** (aimlapi.com), sonst blockt AIML alles.
- **Admin:** `POST /api/admin/set-credits` (ADMIN_KEY-gesichert) — Code-Guthaben setzen. ADMIN_KEY = Railway-Secret (nur Marco).
- **CDN→Sandbox:** Sandbox-`curl` erreicht cdn.aimlapi nicht direkt → über den Backend-Proxy holen (`/api/video/proxy` bzw. `/api/image/proxy`).
- **Deploy:** Marco deployt via `deploy.bat`/Railway. Code-Repo: `C:\Users\cxrat\Desktop\endocraft-api-deploy\server.js`. Vor Deploy immer `node --check server.js`. Bei Edits **bash/python-Heredocs statt Write-Tool** (Mount-Truncation-Gefahr; Read-Tool = Quelle der Wahrheit).

## 4. Produkte & Status
- **The Devil's Hound** (NEU, 2026-07-02): Curse-of-Strahd-Encounter, Katerina die Vampirjägerin (John-Wick-Tragik + „sie kann nicht aufhören" + No-Combat-Erlösungspfad). 3-Seiten-Statblock-PDF, 5 VTT-Tokens, Lore, Reveal-Clip. **Etsy LIVE @ 5,99 $** (Listing 4531234914). Assets in `Desktop\EndoCraft\social\encounters\devils-hound\`.
- **Bloomrot Saint** (Pilot-Kit): 2-Phasen-CR-11-Boss, gefallene Heilige. Etsy-Draft + Pinterest live. Assets in `social/encounters/bloomrot-saint/`.
- **Etsy-Shop:** ~14 aktive Listings (Bundles + Encounter-Kits), 3 Sales, 5.0★. Etsy=USD.
- **Bundle Studio** (`endocraft.app/tools/bundle-studio/`): 5 Tools zum Bundle-Produzieren. Roadmap: Strahd → Phandelver → Storm King → Tomb of Annihilation.
- **EndoCraft Studio** (self-serve Gen für User, Credits+Abo, Stripe-Test-Modus): post-Validation-Build.

### 4b. GESCHENK-SCHIENE (NEU, 14.–16.07.) — Zielgruppe: Geschenkkäufer OHNE D&D-Wissen
- **Preisleiter (Marco-approved):** Fallen Hero Memorial **$9,99** (4537987222) < Custom Cutscene **$12,99** (4536112275, von 19,99 gesenkt) < Campaign Trailer **$24,99** (4537969559). Upgrade-Pfade nach ersten Sales in den ETSY-LISTING.md-Dateien.
- **Gutschein-Mechanik:** Instant-Download = druckbarer Geschenk-Gutschein (Trailer) bzw. How-It-Works-PDF mit ausschneidbarer In-Memoriam-Karte (Memorial). Beschenkte:r meldet sich selbst mit Details ("Write GIFT"-Konvention im Personalisierungsfeld). Deshalb "Wann hergestellt" = **2020–2026, NICHT made-to-order** (made-to-order-Digital killt den Sofort-Download!).
- **Shop-Sektion "Gifts"** (section_id **59396610**) mit allen 3 Custom-Listings · Anlass=Geburtstag + Feiertag=Weihnachten auf beiden neuen Listings · Artikelvideo (Lich-Cutscene) im Trailer-Listing · Geschenk-Foto als Foto 2.
- **Cross-Sell:** 🎁-Absatz am Ende ALLER 18 Nicht-Gift-Listings (führt auf die Gifts-Sektion).
- **SEO:** Pillar-Page endocraft.app/resources/dnd-gift-ideas/ live + GSC-Indexierung beantragt (16.07.).
- **Gift-Pin-Serie:** 4 Pins fertig (etsy-updates/gift-pins/ + PIN-GIFT-PLAN.md), Board "D&D Gifts" wird beim Schedulen angelegt. Q4-Weihnachtsvariante ab Oktober geplant.
- **Beispiel-Trailer "The Ashen Realm":** _review/ashen-trailer/ (33s + 15s-Etsy-Cut), gebaut aus approbten Assets + 5 Kling-Clips + /api/tts (Clyde) + Suno-Bett aus vo-test. Kosten ~1,60 $. Wartet auf Marco-Review — danach als Etsy-Artikelvideo/Social nutzbar. = Pilot für Trailer-/Recap-Fulfillment.

## 5. AUTOMATIONS-FALLEN (bei UI-Arbeit VORHER lesen — spart Stunden)
### Etsy (Web-UI, weil API blockiert)
- **Etsy-API blockiert seit 18.06.:** Data-Calls → 502 „Shared secret required in x-api-key header". Fehlt Railway-Env **`ETSY_API_KEY` = Shared Secret** der App (nur Marco kann setzen). Bis dahin **Etsy nur per Browser (Chrome MCP)**. NICHT neu diagnostizieren.
- **Preis IMMER mit KOMMA** (`form_input` „5,99"). Punkt „5.99" → wird als **599** interpretiert! Nach Publish Listenpreis gegenlesen.
- **Tags:** alle in EINEM `type` mit `\n`-Trennung, jedem Tag ab dem 2. ein **führendes Leerzeichen** (fängt den verschluckten Erst-Char, Etsy trimmt). Bulk-Delete: JS-`setTimeout`-Loop auf `button[aria-label^="Tag "][aria-label$=" löschen"]`.
- **`file_upload`-Limit 10 MB/Call** (nicht Etsys 20 MB) → ZIPs splitten. Digital-File-Input hat leeres `accept=""`.
- Kategorie **Rollenspiele**, Typ **Digitale Dateien**, „Mit einem KI-Generator" (ehrliche AI-Offenlegung), Stückzahl Pflicht (999). $0,20-Gebühr-Dialog beim Publish bestätigen.
- „Wann hergestellt" ist ein NATIVE `<select>` → per JS setzen (`change`-Event).
- **NEU 15./16.07.:** Etsy-Titel erlaubt nur **1× „&"** (2. & → unsichtbarer „Titel"-Fehler). · Titel/Beschreibung im NEUEN Listing-Editor: JS-Native-Setter reicht NICHT immer → `form_input`-Tool oder echtes Tippen; auf EDIT-Seiten funktioniert der Native-Setter (+input/change). · **file_upload-Tool ist in Marcos Desktop-App-Version gesperrt** → Workaround: Dateien ins Repo committen + deployen, dann im Seiten-Kontext `fetch(raw.githubusercontent.com/...)` → `DataTransfer` → `input.files` + change-Event (endocraft.app liefert etsy-updates/ NICHT aus, raw.githubusercontent schon, CORS *). Change-Event kann mehrfach feuern → Foto-Anzahl nachzählen, Duplikate über Kachel-Button mit Klasse `wt-text-brick` löschen. · Attribute (Anlass/Feiertag): Typeahead-Wert setzen + Enter+blur. · Shop-Sektion neu: Dialog „Neue Abteilung" braucht ECHTES Tippen + „Speichern".
- **/api/tts existiert** (ElevenLabs via AIML, x-internal-key): {text, voice:'Clyde'} → MP3. Für VO-Zeilen nutzen.

### Pinterest (Chrome MCP)
- **Renderer friert ein → Screenshots timeouten. Nur `find`/`javascript_tool` nutzen, DOM lebt.**
- Neuer Tab bootstrappt oft leer → erst `de.pinterest.com/` (Home) laden zum Aufwärmen, dann `pin-builder/`.
- Media→`file_upload`; Titel+Link→`form_input`; Beschreibung ist Draft.js-DIV → `execCommand('insertText')`; „Mark as AI-Modified" an; **Publish-Button feuert unzuverlässig → 1-2× klicken, Erfolg = URL wechselt weg von /pin-builder/.**
- **NEU 15./16.07.: SPA-Hydration-Freeze** — Pinterest liefert HTML, aber React-Root bleibt leeres Suspense-Template (innerText=0), über Stunden, alle Seiten, auch frische Tabs. Nichts klickbar; abwarten und später erneut versuchen (Retry-Zeitplan via geplante Aufgabe).
- **Schedulen:** Radio „publish-later"; Datum-Textfeld (MM/DD/YYYY) per **JS-Native-Setter** setzen (nicht tippen): `Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set.call(inp,'07/09/2026')` + input/change-Events. Geplante Pins unter Profil → „Erstellt" → „Scheduled Pins".

### itch.io
- `itch.io/game/new`: Titel/Tagline(≤120 Z.)→`form_input`; Classification-Select = **`physical_game`** (nicht „physical"!) per JS; Preis-Input `game[min_price]`; AI-disclosure „yes"; Beschreibung=contenteditable→`execCommand`; Visibility=Draft. **Datei-/Cover-Upload = nativer Dialog (Gate) → Marco macht das manuell.**

### TikTok/IG — GEGATED
- Autonomes Posten blockiert (nativer Upload-Dialog / Editor öffnet nicht; Metricool gleicher Gate). → Fertige Clips + Captions liefern, Marco postet vom Handy/schedult selbst.

### WhatsApp Web — GEGATED
- Foto-Input weist MP4 ab; synthetischer Drop wird als „untrusted" ignoriert. Videos nicht autonom sendbar.

### Seedream (Bild) Hausregeln
- **NIE Negation** („no people / no hands") — zieht das Konzept REIN. Über Komposition steuern.
- **Vampir/Kapuze → zwanghaft Krallenhände** („Hände überall", Marco-Kritik). Chest-up reicht NICHT. **Lösung: enger Gesichts-Crop per PIL nach der Generierung** (untere Bildzone wegschneiden).
- Min 3.686.400 px (safe: 2880×1620 / 1800×2400 / 2240×1680).

### ffmpeg (Sandbox)
- Text-Overlay-PNG mit **`-loop 1 -t <dur>`** laden, sonst macht Fade es transparent (Text unsichtbar).
- max ~2-3 Encodes pro bash-Call (45s-Timeout). `zoompan` mit `-loop 1` explodiert Frames → simpler fade nutzen.
- Zippen: in `/tmp` zippen, dann `cp` auf den Mount (direktes zip am Mount → unlink-Fehler).
- Slow-Mo: `setpts=1.9*PTS,minterpolate=fps=30:mi_mode=mci`. 9:16 blurred-fill: scale-increase+crop+boxblur als BG, fg zentriert drüber.

### Kling (Video) Motion
- Atmosphäre = premium (Nebel, Licht, Augenglühen, Haar-Wisp), **Kamera fix, Subjekt still, Welt lebt.** KEIN Body-Motion/Epik-Kitsch (wirkt kitschig/rückwärts). Enges Gesicht animiert am ruhigsten.

## 6. GO-TO-MARKET-PLAYBOOK (pro neuem Kit durchziehen)
Kit (PDF+Tokens+Art+ZIP) → 3-4 Hero-Bilder (Gesichts-Crop gg. Hände) → Kling-Clips → 9:16-Reveal-Trailer (Hook→Clip→Reveal→Titel→Endkarte, kein Schwarz-Start) → **Etsy live** (Web-UI) → **Pinterest** (Pins + 2-Wochen-Schedule-Drip) → **itch** (Draft) → **TikTok/IG** (fertige Clips + Schedule-Plan für Marco). Danach Views/Sales tracken → beste Hooks/Tags fürs nächste Kit wiederholen.

## 7. OFFENE PUNKTE (Stand 16.07. nachts)
- **Gift-Pins schedulen** sobald Pinterest-Freeze endet (automatischer Retry 16.07. 09:00; Plan: etsy-updates/gift-pins/PIN-GIFT-PLAN.md; Board „D&D Gifts" beim 1. Pin anlegen).
- **Ashen-Realm-Trailer-Review** (Marco): _review/ashen-trailer/ → bei Go: 15s-Cut als weiteres Etsy-Artikelvideo? + Social-Nutzung.
- **Playbook-Neuzugänge ggf. in Memory spiegeln** (quality_lock-Falle, Memorial-Still-Pattern).
- Ältere Punkte (unverändert):
- **Pinterest Devil's Hound:** 4 Pins LIVE (Cover, Trailer-Video, Hero A, Ruined Chapel) + 8 Pins im Scheduled-Queue. Ein Hero-B-Pin war beim Terminieren (09.07.) — Status unbestätigt, ggf. prüfen. Rest des 2-Wochen-Drips (loc_lodge, loc_grave, gallery_tokens, hound-Bilder) noch offen zum Schedulen.
- **itch Devil's Hound** (Projekt 4736901, Draft): Titel/Tagline/physical_game/5,99/Beschreibung gesetzt. **FEHLT: ZIP-Dateien + Cover hochladen** (nativer Dialog → Marco) + Payout-Setup, dann veröffentlichen.
- **TikTok Launch-Woche:** 7 fertige 9:16-Clips + Caption/Schedule-Plan in `Desktop\EndoCraft\social\tiktok-week\` (`SCHEDULE-tiktok-woche.md`). Marco lädt hoch/schedult (Gate).
- **Etsy `ETSY_API_KEY`=Shared Secret** setzen (entsperrt Direct-Publish + Cockpit-Sync) — Marco.
- **Resend/Welcome-Mail** dormant bis RESEND_API_KEY + DNS (Cloudflare-Migration lief).
- **Kunden-Happy-Flow** (`EndoCraft\Kunden-Happy-Flow.md`): Coupon THANKS15 + Nachricht-an-Käufer noch live setzen.

## 8. Wo alles liegt (Ordner)
- Projekt-Assets: `C:\Users\cxrat\Desktop\EndoCraft\` (social/encounters/… , tiktok-week/, tools/…)
- Backend-Repo: `C:\Users\cxrat\Desktop\endocraft-api-deploy\` (server.js, .internal-key)
- Weitere Arbeitsordner: `C:\Users\cxrat\Documents\Claude\Projects\Endocraft`, `Downloads`.
- **Memory-System:** eine große MEMORY.md + ~45 Einzel-Memories (Playbooks, Feedback-Regeln, Projekt-Status) — dieses Handover ist die verdichtete Version davon.

---
*Erstellt für Modell-/Chat-Übergabe. Bei Detailfragen: die referenzierten Ordner + `SCHEDULE-tiktok-woche.md` + `reference_gtm_playbook`/`reference_shop_operations_playbook` (Memory) enthalten die Feinheiten.*
