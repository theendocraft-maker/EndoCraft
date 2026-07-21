# EndoCraft Prompt-Playbook (lebendes Dokument)
*Gemeinsamer Stand Marco + Claude · Start 02.07.2026 · nach jeder Review-Runde aktualisieren*

## Die Formel (Stand heute)

**Charaktere/Porträts:**
`[Shot Type] + [Charakter] + [STORY-MOMENT] + [Emotion] + [Environment] + [Lighting]`
- Shot: „Head-and-shoulders portrait" / „Tight head-and-shoulders portrait"
- STORY-MOMENT (Marco-Regel 02.07.): jedes Bild erzählt eine kleine Geschichte — über Umgebungs-Details, NICHT über Hand-Aktionen (verlaufende Kriegsbemalung, brennendes Dorf im Rücken, Hirsch hinter der Schulter, Vogel auf der Schulter, Atem dampft)
- Emotion konkret („grim weary eyes", „quiet trust", „thousand-yard stare softening")
- ⚠️ PFLICHT-NACHBEARBEITUNG: Seedream zwängt IMMER Hände rein (8/8 bestätigt) → 1800×2400 generieren, PIL-Crop obere ~70% + Center auf 3:4 (1260×1680)
- quality_lock: AN (default)

**Locations:**
- 12–20 Wörter, Studio-Stil: `[Setting] + [Licht] + [2–3 Features]`
- `quality_lock: false` (sonst erzwingt der Character-Prefix Figuren/Hände)
- NIE Negation („no people" zieht Leute REIN)
- **Test läuft:** Story-Objekt statt Person — Gegenstände, die eine Geschichte implizieren (dampfender Tee, zurückgelassenes Schwert, einzelnes Banner, Fußspuren im Schnee). Kein Hände-Risiko, voller Moment-Effekt.

## Pin-Mix-Raster (NEU 18.07.2026 — datenbasiert aus 30-Tage-Analyse, ~90 Pins)
**Befund:** CoS-Board = 192 Impr./Pin vs. Character-Board = 61 (Faktor 3). Saves fast nur bei Nutzwert-Titeln („Battlemap", „Token" — Svalich Road allein 19 von 55 Account-Saves). Outbound-Klicks fast nur bei Angebots-Titeln (Bloomrot 5,5 %, Free Kit 8,3 % vs. 0,12 % Account-Schnitt). Drachen-Art (10 Pins) + Animated-Ambience-Videos (5 Pins): zusammen ~0 Saves/Klicks.
**Raster für jeden künftigen Pin-Batch (12er-Batch):**
- **6× CoS-Location im Nutzwert-Frame** — Titel MUSS Werkzeug-Keyword tragen („… DM Scene", „… Session Opener", „… VTT Slide", „… Battlemap"), nominative „Curse of Strahd"-Nennung, SRD-safe (generische Ortsnamen!)
- **3× Angebots-Pin** — konkretes Free-/Produkt-Angebot im Titel UND im Bild (Endcard-Stil)
- **3× Tavern/Cozy-Atmosphäre** als Reichweiten-Träger — auch diese mit Offer-Layer in Beschreibung + Karte im Bild
- **Pausiert:** Drachen-Einzelporträts, generische Character-Art, Loop-Ambience-Videos ohne Hook
- **Jeder Pin:** Vollbleed 2:3 (1568×2352), Hook im Bild (Cinzel), Endcard-Karte unten (Seal + Free-CTA), eigenes UTM (`pin2_<slug>`), AI-Modified an, Marco-Review vor Publish

## Harte Regeln (nie brechen)
1. Keine Negationen im Prompt
2. Keine Projektile/Hand-to-Hand-Choreo/eingebrannter Text
3. Min. 3.686.400 px (safe: 1800×2400, 2880×1620, 2240×1680)
4. Jedes Bild → Marco-Review VOR Veröffentlichung (nur Self-Use-Assets ausgenommen)
5. Charakter-Fidelity: kanonische Persönlichkeit treffen, nicht generisch hübsch
6. **Markenstimme = „Clyde"** (`/api/tts` {voice:'Clyde'}) — Marco-Entscheid 16.07.26 nach 6er-Vergleich. JEDES Voice-Over (Trailer, Stream-Intros, Recaps, Reels) nutzt ausschließlich diese Stimme. Keine anderen Voices ohne neuen Marco-Entscheid — die Wiedererkennbarkeit IST das Audio-Logo.

## Offene Test-Fragen (je Runde eine klären)
- [ ] **R1 (02.07., läuft):** Locations — klassisch-atmosphärisch (A) vs. Story-Objekt (B)?
- [ ] R2: Emotion im Prompt vorn vs. hinten — Einfluss auf Gesichtsausdruck?
- [ ] R3: Lichtfarbe benennen („cold blue night, orange rim") vs. Stimmung („moody twilight")?
- [ ] R4: Welche Story-Objekte funktionieren am besten? (Liste aufbauen)
- [ ] R5: Kling-Motion: welche Location-Stills animieren am ruhigsten?

## Learnings-Log
- 02.07. **R1-Ergebnis (Marco):** 6/8 approved (1A, 2B, 3A+3B, 4A+4B). Kein pauschaler A/B-Sieger — **beide Stile tragen, Ausführung entscheidet**. Story-Objekte (Schwert am Stuhl, Banner, Fußspuren) funktionieren hervorragend; abgelehnt: 1B (Tee-Variante schwächer als klassische Bibliothek), 2A (ungewollter Wirt trotz quality_lock:false — Interiors mit Personal-Erwartung ziehen Figuren → Story-Objekt nutzen).
- 02.07. **R2-Ergebnis (Marco):** 6/8 approved (2A/2B, 3A/3B, 4A/4B). Abgelehnt: 1A/1B — „offerings floating" wurde zu **schwimmenden Obsttellern** (Seedream-Literalismus: abstrakte Ritual-Begriffe werden zu Essen/Alltagsobjekten → konkrete Objekte benennen: „candles", „carved idols", nicht „offerings"). **A/B-Erkenntnis: Lichtfarbe vs. Stimmungswort macht kaum Unterschied** (3A≈3B, 4A≈4B) → Stimmungswörter ok, Lichtfarbe nur für gezielte Palette. R3-Kandidat: Kompositions-Anweisungen testen.
- 03.07. **R3-Ergebnis (Marco): nur 2A approved (7/8 abgelehnt) — aber nicht wegen Komposition, sondern REAL-WORLD-DRIFT.** Kompositions-Anweisungen (low angle, framed through, leading lines, foreground branches) wurden zuverlässig umgesetzt und wirken. ABER: „watchtower" → moderner Industrieturm mit Gerüst; „streetlamps/lamps" → viktorianisch-modern; „temple ruin + columns" → griechische Mythologie statt D&D. **Neue Regel: Jeder Location-Prompt braucht einen Medieval-Fantasy-Anker** (crumbling stone keep, timber-framed, gothic, weathered gargoyles, moss-covered) **und meidet Wörter mit starkem Real-World-Prior** (watchtower, streetlamp, temple+columns). 2B abgelehnt: Doppelbogen-Winkel wirkte komisch — Framing-Anweisungen einfach halten. R4: gleiche Szenen mit Fantasy-Ankern + je 1 Kompositions-Anweisung.
- 03.07. **R4-Ergebnis (Marco): alle 4 approved** — Fantasy-Anker beheben den Real-World-Drift zuverlässig (medieval stone keep, timber-framed, gothic+gargoyles, moss-covered). Aber: „es fehlt noch etwas Fantasy-Touch" → R5.
- 03.07. **R5-Ergebnis (Marco): Magie-Element-Regeln.** ✅ Subtil integriert funktioniert: glühende Runen im Mauerwerk (r5_1), Irrlichter/wisps zwischen Bäumen (r5_2) — DAS ist der Standard für den Location-Pool. ⚠️ „Divine light beam" (r5_3) = Statement-Bild, wirkt wie Portal/Boss-Arena — nur als Kit-Cover/Establishing-Shot einsetzen, nicht als Alltags-Pin. ❌ Glüh-Augen an Statuen (r5_4) — Element wird verschluckt, Bild kippt ins Komische. **Finale Location-Formel: [Setting mit Fantasy-Anker] + [Licht] + [1 Kompositions-Anweisung] + [1 subtiles Magie-Element] + [1-2 Features], 12-20 Wörter, quality_lock:false.**
- 03.07. **NEUES FORMAT „Threshold-Shot" (Marco-Fund, R6):** Einsame Figur von hinten auf erhöhtem Standpunkt + episches Ziel in der Ferne = perfekter Abenteuer-Einstieg. Formel: `Lone [Figur MIT Fantasy-Ausrüstung: travel cloak, sword, leather pack] seen from behind on [Ledge/Ridge/Cliff] overlooking [EPISCHES Motiv] + [Licht/Nebel]`. R6-Ergebnis: Titan (r6t_2) + Weltenbaum (r6t_3) sehr gut approved, Drache (r6t_1) verwendbar. ⚠️ Learnings: „dragon" ohne „wings folded" → Schlange; „wanderer/traveler" ohne Ausrüstungs-Detail → moderne Kleidung. Backdrop-Ideen-Pool: Riss/Portal, Eistor im Gletscher, schwebende Ruinen, Leviathan-Skelett, Kriegslager, brennende Stadt am Horizont.
- 03.07. **NEUES PATTERN „Silhouette-Shot" (Marco: „diese Art merken", bar_3f):** Motiv als Silhouette in MITTLERER Distanz + Vordergrund-Geäst als Rahmen + Mondlicht durch Wolken + Nebelschichten dazwischen. Formel: `distant [Motiv] silhouetted on [Erhebung], layers of drifting mist between, bare twisted trees framing the foreground, pale moonlight breaking through clouds`. Perfekt für Grusel/Barovia-Stimmung.
- 03.07. **Reroll-Werkzeug:** Präfix `Cinematic film still, photoreal:` zieht Ausreißer zurück in den Haus-Stil (gegen Painterly-Drift, z. B. „colorful"-Motive). Barovia-Runde: 4 Rerolls bis Tser Pool saß — Learnings: „colorful painted" → Buntstift-Look; „sparks rising" → Feuerwerk; „looming low angle" → Motiv zu dominant, wenn Atmosphäre gewünscht.
- 02.07. **Kreaturen-Konsistenz (Sluglord-Trailer, Marco-Kritik):** Mehrere unabhängige Generierungen derselben Kreatur = sichtbar verschiedene Tiere (Schnecke mal mit/ohne Haus, andere Farben). **Regel: Für Multi-Shot-Trailer eines Monsters EIN Master-Bild wählen und alle weiteren Cuts als Crops/Zooms daraus + aus dessen Kling-Frames bauen** (Trailer-Close-ups: Kopf, Textur, Detail). Alternative für echte Neue-Winkel-Shots: Seedream Image-Reference über die API testen (DM Studio nutzt das für NPC-Konsistenz).
