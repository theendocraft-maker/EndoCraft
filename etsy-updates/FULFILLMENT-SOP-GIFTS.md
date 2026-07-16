# Fulfillment-SOP — Gift-Produkte (Trailer · Memorial · Cutscene)
*Stand 16.07.2026 · Ziel: Auftrag → Auslieferung in <60 Min (Memorial/Cutscene) bzw. <1 Tag (Trailer). Alle Bilder/Clips gehen VOR Versand durch Marcos Review (Standing Rule).*

## 0. Auftragseingang (alle drei Produkte)
1. Etsy-Benachrichtigung → Bestellung öffnen → **Personalisierungsfeld lesen.**
2. Steht dort **GIFT** (oder leer bei Gutschein-Kauf): nichts produzieren! Warten, bis sich der/die Beschenkte per Etsy-Message/hello@ meldet (Bestellnummer = Code). Freundliche Bestätigung an Käufer:in senden (Template T1).
3. Details unvollständig → Rückfrage mit Template T2 (konkrete Fragen, max. 5).
4. **Kosten-/Zeit-Tracking:** pro Auftrag Startzeit notieren + AIML-Belege sammeln (für die Stückkosten-Kalkulation).

## 1. Fallen Hero Memorial ($9,99 · Ziel <45 Min)
1. **Szene generieren** (3–4 Varianten, 2880×1620): Standard = **Memorial-Still-Pattern** (Playbook): `[Waffe/Gegenstand des Charakters] driven into a stone cairn grave, torn [Kleidungsstück] draped over it, [Wetter/Licht passend zur Todesart], a single raven, [Landschafts-Anker]` — quality_lock:false. KEINE Gesichter nötig; wenn Kund:in explizit den Charakter im Bild will → Charakterregeln (Crop-Pflicht!).
2. Marco-Review der Varianten (Kontaktbogen).
3. **Karte rendern:** `memorial-card-template.html` → CARD-Block füllen (Name, Klasse, fate 2 Zeilen, Sessions, Epitaph ≤ 12 Wörter, Serial fortlaufend — Zähler in diesem Ordner in `SERIAL-COUNTER.txt` pflegen!) → chromium-Screenshot 1200×1680.
4. Auslieferung via Etsy-Message (Template T3): Szene (Full-Res JPG) + Karte (PNG).

## 2. Custom Cutscene ($12,99 · Ziel <60 Min)
Bestehender Ablauf (siehe custom-cutscene/ETSY-LISTING.md „Fulfillment-Realität"): 3–4 Bild-Varianten → Marco-Review → beste croppen (Beine/Hände raus) → Kling (5s, Kamera statisch, Welt lebt) → Frame-Check → T3.
**Bekannte Fallen:** Bogensehnen brechen · baumelnde Gliedmaßen werden „Laufen" · Drachen ohne „western wyrm" werden niedlich · quality_lock:false bei Rückenansicht (Geisterhaupt-Falle!).

## 3. Campaign Trailer ($24,99 · Ziel <1 Werktag, Preview in 5–7 Tagen versprochen)
Pipeline = Ashen-Realm-Pilot (`_review/ashen-trailer/` + Skripte in Session-Workspace `trailer/`):
1. **Brief zerlegen:** Kampagnenname, Villain, 2–3 Orte/Momente, Ton → 5–6 Beats mappen (Formel: Ort-Establishing → Held (Threshold/Rücken) → Villain (Silhouette!) → Moment/Verlust → Titelkarte → Endkarte).
2. **Stills generieren** (nur sichere Patterns: Threshold, Silhouette, Story-Objekt, Location+Fantasy-Anker+subtiles Magie-Element) → Marco-Review.
3. **Kling-Clips** (5s je Beat, ~30 ¢/Clip): Kamera statisch, Subjekt still, Welt lebt. `kling.py`-Muster: submit alle → poll → proxy-Download.
4. **VO**: `/api/tts` {voice:'Clyde'}, kurze Zeilen (eine pro Beat), Kampagnenname in Zeile 5.
5. **Musik**: Suno-Bett (bis Musik-Endpoint existiert: vorhandene freigegebene Betten wiederverwenden oder Marco fragt Suno an).
6. **Schnitt** (ffmpeg, Muster im Pilot): 1080×1920; Portrait-Clips scale -2:1920 + crop; Landscape blurred-fill; Text-Overlays als PNG (PIL + Cinzel-TTFs in fonts/); Karten mit `-loop 1 -t`; concat; Audio amix (Musik 0.55 + VO adelay) + Fade-out.
7. **Exporte:** Full 9:16 + 16:9-Variante (bei Bedarf) + Frame-Kontaktbogen → Marco-Review → T3 mit Preview-Link, nach OK finale Dateien.

## Templates (EN, Marcos Ton — kurz, warm, konkret)
**T1 (Gutschein-Kauf bestätigen):** "Thanks for gifting a [product]! Your printable voucher is in your downloads. Whenever the lucky one is ready, they just message me here (or hello@endocraft.app) with order #[NR] — no deadline. Roll high, Marco"
**T2 (Details nachfragen):** "Love the brief — two quick things so I get [Name] right: [Frage 1]? [Frage 2]? A sentence each is plenty. Marco"
**T3 (Preview liefern):** "Here's the preview of [Name/Titel]. If it's not quite them, tell me what's off — one revision round is on me. If you love it, say the word and I'll send the final files. Marco"

## QA-Checkliste vor JEDEM Versand
☐ Hände/Gliedmaßen sauber ☐ kein Real-World-Drift ☐ Charakter-Fidelity zum Brief ☐ kein eingebrannter Text-Fehler ☐ Namen richtig geschrieben (Karte!) ☐ Serial fortgezählt ☐ Marco hat Bilder gesehen ☐ Dateien: Full-Res + ggf. 9:16/16:9 ☐ THANKS15-Hinweis nur im Happy-Flow, nicht doppelt
