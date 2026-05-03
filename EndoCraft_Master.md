# EndoCraft — Master Reference File
**Für Cowork Sessions. Immer zuerst einlesen.**
*Zuletzt aktualisiert: April 2026*

---

## 1. PRODUKT & VISION

**Was ist EndoCraft?**
Ein AI-Tool das D&D / TTRPG Session-Momente in sammelbare Trading Cards verwandelt. Der User beschreibt seinen Moment — EndoCraft generiert ein cinematisches Kartenbild, vergibt eine Rarity per D20-System und versiegelt die Karte mit einer permanenten Seriennummer.

**Core Message:**
> *"Some moments are too legendary to forget."*

**Tagline:**
> *"Make Every Session Legendary"*

**Kernprinzip:**
- Nicht das Tool ist das Produkt — der Moment ist das Produkt
- Karten sind sammelbar, limitiert, NFT-ready
- Ernst wenn es ernst ist. Witzig wenn es witzig ist.

---

## 2. TECH STACK

| Component | Service |
|-----------|---------|
| Frontend | GitHub Pages |
| Backend | Railway (endocraft-production.up.railway.app) |
| Datenbank | Supabase (sessions + subscribers tables) |
| Bildgenerierung | Seedream 4.5 (~€0.04/Bild) |
| KI | Claude (Prompt → Card JSON) |
| Domain | endocraft.app |

---

## 3. MONETARISIERUNG

**Credits System:**
- 1 Credit = Session generieren
- 0.5 Credit = Re-Roll

**Tiers:**
| Tier | Preis | Credits |
|------|-------|---------|
| Free | €0 | 3 Credits |
| Adventurer | €5/Monat | Unlimitiert |
| Legend | €12/Monat | Unlimitiert + Features |
| Party | €15/Monat | Gruppe |

---

## 4. RARITY SYSTEM

**D20 Server-Side Roll (vor Bildgenerierung):**
| Roll | Rarity | Rate | Farbe |
|------|--------|------|-------|
| Nat 20 | Legendary | 8% | Gold |
| 14–19 | Epic | 37% | Lila |
| 7–13 | Rare | 35% | Blau |
| 2–6 | Common | 17% | Silber |
| Nat 1 | Misprint | 3% | Rot/Glitch |

**Wichtig:**
- Rarity wird SERVER-SIDE geseeded — nicht manipulierbar
- Nat 20 → ultra-epic, god-rays im Bildprompt
- Nat 1 → CSS Glitch-Effekt only, kein anderes Bild
- Pity System: nach 25 Re-Rolls ohne Legendary → garantiert Legendary

---

## 5. CARD LAYOUT STANDARD

**Proportionen:**
- Karte: 85% Screenbreite
- Bild: 70% der Kartenfläche
- Text-Zone: 30% der Kartenfläche (unten)
- Rarity Glow: Farbe je nach Rarity, pulsierend

**Text-Zone Inhalt (von oben nach unten):**
1. Charakterklasse · Level (klein, uppercase)
2. Charaktername (groß, Cinzel Decorative Font)
3. Moment-Titel (kursiv, IM Fell English Font)
4. Divider-Linie
5. Seriennummer links / EndoCraft rechts

**Serial-Nummer:**
- Format: `[Name] #[Nummer] / 9999`
- Farbe: Rarity-Farbe, Opacity 0.8
- Muss auf Mobile lesbar sein — Kontrast erhöhen!

**Kartenrückseite:**
- EndoCraft Logo + D20
- Tagline: *"Some moments are too legendary to forget."* ← NEU (war: "Make Every Session Legendary")
- Seriennummer unten

---

## 6. BILDSTIL FORMULA (Seedream 4.5)

**Formel:**
`[Shot Type] + [Character] + [Emotion] + [Environment] + [Lighting]`

**Fixed Suffix (immer anhängen):**
```
cinematic fantasy, photorealistic, sharp focus, 8K, shallow depth of field, no text, no watermark, no blur, no deformed hands
```

**Shot Type für Karten:**
```
medium shot, head and chest visible, centered composition, space above head, darker vignette on bottom third
```

---

## 7. CASPIAN — MASKOTTCHEN & CHARAKTER

### Lore
- **Rasse:** Harengon (aufrechter Hase)
- **Klasse:** Bard, Level III → VI
- **Kampagne:** The Wild Beyond the Witchlight
- **Backstory:** Verlorenes Königreich, melancholischer Ton
- **Bekannter Moment:** Geküsst von Grimhilda (Nat 2 auf Charisma)
- **Erster Demo-Card:** "The Unwanted Kiss" / "The Hag's Mistake"

### Visuelles Profil
| Element | Definition |
|---------|-----------|
| Fellfarbe | Warm Braun |
| Augen | Groß, expressiv, wechselt je nach Situation |
| Kleidung | Eleganter Barden-Mantel, Waldgrün, zerrupft, Golddetails |
| Accessoire | Laute — immer dabei |
| Silhouette | Erkennbar, ikonisch |

### Zwei Versionen
**Version 1 — Cinematic (für Karten-Art):**
```
Anthropomorphic rabbit bard, warm brown fur, large expressive brown eyes, tattered elegant forest green coat with gold trim, lute visible on side, medium shot head to chest, centered composition, space above head, darker vignette on bottom third, enchanted forest background with soft purple magical lights, cinematic fantasy, photorealistic, warm dramatic lighting, shallow depth of field, 8K, sharp focus, no text, no watermark, no blur
```

**Version 2 — Pixar/3D Animated (für TikTok Marketing):**
```
Anthropomorphic rabbit bard, warm brown fur, large expressive brown eyes, tattered elegant forest green coat with gold trim, lute on back, 3D animated style, warm soft forest lighting, emotionally expressive, charming fantasy character, Witchlight forest background with magical purple lights, no text, no watermark
```

### Caspian Story-Shots (für TikTok Spots)

**Shot 1 — Grimhilda Close-Up:**
```
Ancient hag close-up portrait, grey matted hair, deeply wrinkled face, sinister warm smile, glowing amber eyes, misty dark background, cinematic fantasy, photorealistic, dramatic lighting, 8K, sharp focus, no text, no watermark
```

**Shot 2 — Caspian allein (nervös):**
```
Anthropomorphic rabbit bard, warm brown fur, large expressive eyes wide with nervousness, forest green coat, holding lute, standing alone in tavern, warm candlelight background, cinematic fantasy, photorealistic, shallow depth of field, 8K, no text, no watermark
```

**Shot 3 — Der Kuss:**
```
Anthropomorphic rabbit bard shocked expression, ancient hag leaning in close, dramatic moment, warm brown fur, grey matted hair, misty forest background, cinematic fantasy, photorealistic, emotional intensity, 8K, no text, no watermark
```

**Shot 4 — Party-Reaktion:**
```
Group of adventurers laughing and pointing, tavern setting, warm firelight, cinematic fantasy, photorealistic, candid moment, 8K, no text, no watermark
```

**Shot 5 — Caspian danach (melancholisch):**
```
Anthropomorphic rabbit bard sitting alone on stone steps, warm brown fur, forest green coat, holding lute, distant sad expression, soft moonlight, cinematic fantasy, photorealistic, emotional, shallow depth of field, no text, no watermark
```

---

## 8. TIKTOK MARKETING

### Account
- **Handle:** @theendocraft
- **Bio:**
```
Some moments are too legendary to forget.
Turn your D&D session into a collectible card.
🎲 Roll. Reveal. Remember.
🔗 endocraft.app
```
- **Profilbild:** Pixar Caspian (Version 2) — morgen generieren

### Die 3 Spots

**Spot 1 — "The Kiss" (Humor/Cringe)**
| Sekunde | Content |
|---------|---------|
| 0–2s | Caspian Karte erscheint (Hook) |
| 0.5s | Text: *"That moment your party will never let you forget 💀"* |
| 2–9s | Story-Overlays: Grimhilda → Caspian → "Natural 2." → "She kissed him anyway." → "My party hasn't stopped laughing since." |
| 9–16s | Pack Reveal (7s) |
| 16–22s | CTA: *"Turn your moment into a card."* + endocraft.app |
| 22s | Loop |

Caption: `POV: you rolled a 2 and she kissed you anyway 💀 endocraft.app`
Hashtags: `#dnd #dndtiktok #dungeonsanddragons #ttrpg #nat2 #bardlife #dndmemes #dndstory`

---

**Spot 2 — "The Misprint" (FOMO/Curiosity)**
Hook: Misprint Karte sofort sichtbar — Glitch-Effekt
Caption: `Nat 1. I pulled the rarest card. 👀 endocraft.app`
Hashtags: `#dnd #dndtiktok #dungeonsanddragons #ttrpg #nat1 #misprint #rarepull #dndmemes`

---

**Spot 3 — "The Concept" (Produkt)**
Hook: Karte erscheint, kein Story-Framing
Caption: `Your moment deserves to live forever. endocraft.app`
Hashtags: `#dnd #dndtiktok #dungeonsanddragons #ttrpg #dndcommunity #tabletop #rpg #tradingcards`

### Posting Plan
| Spot | Tag | Uhrzeit |
|------|-----|---------|
| Spot 1 | Donnerstag | 19:00 CET |
| Spot 2 | Samstag | 19:00 CET |
| Spot 3 | Dienstag | 19:00 CET |

### Feedback-Regeln (nach Posting)
| Views nach 24h | Bedeutet | Aktion |
|---------------|----------|--------|
| Unter 500 | Hook war falsch | Neuen Hook testen |
| 500–2000 | Concept gut, Hook optimieren | Variante produzieren |
| 2000+ | Funktioniert | Boost mit €20–30 |

---

## 9. TIKTOK SPOT — TECHNISCHE SPECS

**Format:** 9:16 (390 × 844px, iPhone)
**Länge:** 22 Sekunden
**Typ:** HTML Animation, Autoplay, kein User-Input
**Musik:** TikTok trending sound — beim Upload wählen
**Loop:** Nahtlos bei 22s (`setTimeout(() => location.reload(), 22000)`)

**Text-Overlays:**
- Font: Cinzel / gleiche wie Karte
- Farbe: Gold (#FFD700) auf schwarzem Hintergrund
- Position: Unteres Drittel, nie über Gesicht

**Pack Reveal:**
- 7 Sekunden (CSS animation-duration × 2.3)
- Rarity Glow erscheint 1s vor dem Aufgehen
- *"Some moments are too legendary to forget."* als letzter Text

---

## 10. UX FIXES (Für Cowork)

### Priorität 1 — Bugs
- [ ] Share-Link Bug: `/session/?id=` lädt keine Karte (RLS oder falscher Feldname)
- [ ] Serial-Nummer Kontrast auf Mobile erhöhen

### Priorität 2 — Card Layout
- [ ] Karte: 85% Screenbreite
- [ ] Bild: 70% / Text: 30%
- [ ] Rarity Glow stärker und konsistenter
- [ ] Kartenrückseite Tagline updaten → *"Some moments are too legendary to forget."*

### Priorität 3 — Pack Reveal
- [ ] "Hold to Open" → Automatische Animation
- [ ] Pack Reveal auf 7s strecken
- [ ] Rarity Glow pulsiert VOR dem Aufgehen (Farbe verrät Rarity)
- [ ] *"Some moments are too legendary to forget."* erscheint kurz vor Reveal
- [ ] *"Your rarity is already sealed..."* auf Loading Screen

### Priorität 4 — Loading Screen
- [ ] Geometrisches Symbol → Caspian animiert (schreibt in Buch, schaut auf Würfel)
- [ ] *"Generating summary & NPC log"* → *"Painting your moment..."*
- [ ] *"Your rarity is already sealed..."* nach 2-3s einblenden

### Priorität 5 — Landing Page
- [ ] *"See what's coming"* Button → *"See an example card →"*
- [ ] Caspian Karte im Hero sichtbar

### Priorität 6 — Input Screen
- [ ] Kleiner Hinweis: *"The more detail, the better your card."*

### Priorität 7 — Nach Reveal Screen
- [ ] Above the fold: Karte + Share + Seal ohne scrollen
- [ ] Karte nach Reveal: 55% Screenhöhe
- [ ] "Save Card" → "✦ Commit your card"
- [ ] Seal-Text kürzen: *"Seal it with a permanent number. Yours forever."*
- [ ] Flip-Icon wenn Rückseite sichtbar

---

## 11. ROADMAP (NICHT JETZT BAUEN — NUR KOMMUNIZIEREN)

**Post-Launch:**
- Re-Roll System (kostenlos 1-2x, dann Credits)
- Session Upload + Highlights
- Party Code (Multiplayer)
- Campaign Memory
- Stripe / Credits Integration
- Saisonale Card Set Drops
- Settings / Styles (Feywild, Gothic, Spelljammer...)
- Native App (Hold to Open + Haptik)

**NFT Layer:**
- MiCA EU 2025–26 Window
- Seriennummern bereits NFT-ready
- Superstonk als Zielgruppe wenn ready

---

## 12. OFFENE TODOS

- [ ] Caspian Pixar Profilbild generieren und auf TikTok setzen
- [ ] Reddit Post (warten bis Share-Link funktioniert)
- [ ] Superstonk Post (warten bis NFT-Layer ready)
- [ ] Gerald → verschoben auf DM Vorlagen Feature (später)
- [ ] Mobile komplett testen

---

## 13. SCHLÜSSELPRINZIPIEN

1. **Rarity ist heilig** — immer server-side, nie manipulierbar
2. **Commit = Permanenz** — Seriennummer versiegelt den Moment für immer
3. **Pre-Launch großzügig** — Rarity-Verteilung freigiebiger vor dem Launch
4. **Misprint ist ein Feature** — Nat 1 als begehrte Rarity, kein Bug
5. **Fotos sind Story-Assets** — nicht nur Karten-Hintergrund
6. **€0.04 pro Bild** — wir können endlos testen und anpassen
7. **Ernst wenn ernst. Witzig wenn witzig.**

---

## 14. DM STUDIO

**Was ist DM Studio?**
2nd-Screen-Tool für Dungeon Masters. PC-optimiert (min-width 1100px), Mobile später. Companion zu Owlbear Rodeo. Teil des EndoCraft Ökosystems.

**URL:** endocraft.app/dm-studio/
**Status:** Privater MVP — Marco + 1 Freund als Tester

**Key Feature:** `🃏 Als Karte` Button — Session-Moment direkt in EndoCraft-Karte wandeln via `endocraft.app/session/?story=...&source=dm-studio`

**3 Tabs:** Vorbereitung · Session Live · Charaktere

---

### ⚠️ RECHTLICHES — SRD NUTZUNG

**Was erlaubt ist (CC-BY-4.0):**
- Alle 15 SRD Conditions ✅
- Basis Monster Statblocks aus SRD ✅
- D&D Grundregeln ✅
- Kommerziell nutzbar ✅

**Was NICHT erlaubt ist:**
- Curse of Strahd Adventure-Text ❌ — muss vor Public Launch raus
- Ikonische Monster die nicht im SRD stehen (z.B. Beholder) ❌
- Alles was Wizards IP ist aber nicht im SRD steht ❌

**Pflicht-Attribution irgendwo im Tool:**
> *"Based on D&D SRD 5.1/5.2, used under CC-BY-4.0"*

**Wichtig:** CC-BY-4.0 ist irrevokabel — Wizards kann es nie zurückziehen.

---

### Offene Aufgaben DM Studio
1. Optik-Revision (teilweise erledigt)
2. Kartenfunktion vollständig fertigstellen
3. Import-Funktion für JSON-Exports
4. SRD Monster Library auf 300+ erweitern (via separatem API Endpoint)
5. NPC Portrait Consistency (Seedream Seed + Character Bible)
6. Owlbear Extension Phase 1
7. Session Transcript Flow
8. PDF Export
9. Player View (erst wenn DM-Side 100% solid)

---

## 15. GAMIFICATION & NFT VISION

### Das Kernproblem
Ein AI-Bild ersetzt keine Erinnerung — es gibt ihr eine Form. Wie ein Foto, eine Trophäe, ein Tagebucheintrag. Der Trigger. Nicht die Erinnerung selbst.

NFT als reiner Spekulationsmarkt funktioniert nicht für EndoCraft. Der Wert muss intrinsisch sein — durch Bedeutung, nicht durch Hype.

### Der Loop
```
Party spielt Session
→ Jeder generiert seine Karte
→ Party Album entsteht automatisch
→ Community votet auf beste Karten
→ Top-Karten steigen in die Hall of Fame
→ Hall of Fame Karten werden begehrt
→ NFT-Markt entsteht organisch
```

### Die drei Kern-Features

**Party Album (Phase 1 — bald)**
- Jede Party hat ein gemeinsames Album
- Alle Karten einer Session automatisch gruppiert
- 10 gemeinsame Sessions → exklusive Party-Karte
- Nicht generierbar — nur verdient
- Wie ein Raid-Achievement in WoW, aber als Trading Card

**Community Voting + Leaderboard (Phase 2 — nach Launch)**
- Andere Spieler voten auf beste Karten
- Monatlicher Titel: *"Most Legendary Moment"*
- Virale Karten steigen — FOMO entsteht
- Leaderboard pro Party, pro Kampagne, global

**Hall of Fame (Phase 3 — Scale)**
- Top 100 meistgevoteten Karten aller Zeit
- Permanenter *"Hall of Fame"* Badge
- Historisch, selten, nachweislich epic
- Diese Karten werden auf der Blockchain begehrt
- Karte #000001 = Caspians "Unwanted Kiss" — bereits Geschichte

### Warum der Markt nicht sättigt
D&D Sessions sind unendlich. Jede Woche spielen Millionen Menschen. Jeder Moment passiert nur einmal. Der Content-Pool ist unbegrenzt — produziert von den Usern selbst.

**Die echte Gefahr ist nicht Sättigung — sondern Gleichgültigkeit.**

Dagegen schützt das System:
| Mechanismus | Wirkung |
|-------------|---------|
| Seriennummern | Jede Karte einmalig |
| Rarity System | Nicht jeder bekommt Legendary |
| Hall of Fame | Nur die besten 100 |
| Party Album | Persönlicher Wert bleibt |
| Misprint | Selbst Nat 1 ist begehrt |

### Creator Marketplace (Phase 4 — NFT-ready)
DMs und Creator erstellen eigene Sets, limitieren sie, verkaufen sie an ihre Community. EndoCraft nimmt 10-15% Provision. Patreon meets OpenSea meets D&D.

**Wichtig:** Creator Sets sind ein Anbau, kein Umbau. Core bleibt immer *"dein eigener Moment."*

### EndoCraft ist kein Produkt — es ist ein Ritual
Nach jeder Session — Karten öffnen. Wie Pokemon freitags nach der Schule. Rituale sättigen nicht. Sie wachsen mit der Zeit.

---

*EndoCraft — Some moments are too legendary to forget.* 🎲

---

## UPDATE — Heutige Session

### TikTok Status & Warum pausiert
- Erster Spot: 700 Views, 0 Klicks, 2 Sekunden Durchschnittswiedergabe
- Hook funktioniert nicht — User scrollen sofort weiter
- Karten alleine reichen nicht für viral
- Eigene Party findet es gut aber ist nicht begeistert
- **Fazit: Produkt-Problem, kein Marketing-Problem**
- **TikTok bleibt pausiert bis Player View + Party Album fertig**

### Was den ersten viralen Moment auslöst
Party öffnet gleichzeitig ihre Packs nach einer echten Session:
- Jemand zieht Legendary → Schock
- Jemand zieht Misprint → Lachen  
- Echte Emotionen, echte Menschen, kein Facecam nötig
- Das ist der erste TikTok der funktioniert

### Reihenfolge bis zum ersten viralen Moment
```
Player View fertig
→ Party Album fertig
→ Eigene Party testet gemeinsam
→ Alle öffnen gleichzeitig Pack nach Session
→ Reaktionen filmen
→ TikTok
```

### TikTok Strategie wenn ready
- Hook: "My friends and I stayed up until 4am" — universal, kein D&D-Wissen nötig
- Emotion über D&D hinaus — Erinnerungen die jeder kennt
- Posting: Donnerstag + Samstag + Dienstag, 19:00 CET
- Unter 500 Views → Hook ändern
- Über 500 Views → €20-30 boosten

---

### Player View — Was rein muss
**Vor der Session:**
- Personalisierter Recap aus Spieler-Perspektive
- Offene Charakterfäden
- NPC Beziehungslog

**Nach der Session:**
- Pack Reveal
- Eigene Karte
- Party Album
- Session zusammengefasst

**Während der Session:**
- Passiv — Charakterbogen als Referenz
- Kein Live Feed, keine Updates
- Kein extra Input vom DM nötig

**Design:** PC first, Parchment Style wie DM Studio
**Mockup:** player_view_mockup.html

---

### Owlbear Extension — Revidierte Strategie
- Extension = reiner Acquisition-Kanal, kein Feature für bestehende User
- Einziger Job: DMs die Owlbear nutzen zu EndoCraft bringen
- Timing: erst wenn Kernprodukt solid ist
- Konkurrenz existiert bereits für Token Generator, Scene Generation
- Unser Differenzierungsmerkmal: Kampagnen-Kontinuität + EndoCraft Bridge

---

### Gamification & NFT — Revidiert
**Party Album:** Alle Karten einer Session automatisch gruppiert ✅ Priorität
**Community Voting:** Beste Karten nach oben — braucht User-Base
**Hall of Fame:** Top 100 aller Zeit — historisch, begehrt, NFT-ready
**Karte #000001:** Caspians "Unwanted Kiss" — bereits Geschichte

**Warum NFT Markt funktioniert:**
- Nicht Spekulation wie CryptoPunks
- Sondern Bedeutung — Hall of Fame Karten haben externen Wert
- Creator Marketplace später: DMs verkaufen eigene Sets
- Matchmaking / "Airbnb für D&D" — Vision 2028

---

### Zukunft — Die klare Linie
```
Jetzt: DM Studio + Player View + Party Album
→ Eigene Party begeistert
→ Erster viraler TikTok
→ Erste echte User
→ Community Voting + Hall of Fame
→ Owlbear Extension
→ Matchmaking
→ Eigenes Spielbrett
→ NFT Layer
```

**Kernprinzip:** Erst Produkt fertig, dann Marketing.
Nicht umgekehrt.

---

*EndoCraft — Some moments are too legendary to forget.* 🎲

---

## UPDATE 2 — Living Wiki & Neue Positionierung

### Die drei Kern-Positionierungen

| Zielgruppe | Satz |
|------------|------|
| DMs | *"The living wiki for your D&D world"* |
| Spieler | *"Some moments are too legendary to forget"* |
| EndoCraft gesamt | *"Your world. Every moment sealed."* |

---

### Was "Living Wiki" bedeutet

Nicht statisch wie Notion oder World Anvil — sondern:
- Während der Session aktiv genutzt
- Sich selbst ergänzend durch Recaps und Session Logs
- Von der AI abgefragt werden kann
- Connections zwischen NPCs, Locations, Events kennt

**Der Nordstern für alle DM Studio Features:**
> *"Macht das das Wiki lebendiger?"*

---

### Was Living Wiki noch braucht

| Feature | Status | Macht Wiki lebendiger? |
|---------|--------|----------------------|
| PDF Import D&D Beyond | ❌ | ✅ Charaktere leben im Wiki |
| Loot Generator kontextuell | 🔨 | ✅ Items werden Teil der Welt |
| NPC Beziehungslog | ❌ | ✅ Verbindungen sichtbar |
| Location History | ❌ | ✅ Orte haben Gedächtnis |
| Connections AI | ❌ | ✅ AI verbindet vergessene Punkte |
| Kampagne exportieren/teilen | ❌ | ✅ Wiki wird teilbar |
| Würfel komplett (alle D-Types) | 🔨 | 🤔 Nice-to-have |

---

### Karten sind Nebenprodukt — nicht Hauptfeature für DMs

- DM wirbt nicht mit Karten
- Karten entstehen als magisches Nebenprodukt
- Spieler entdecken sie nach der Session selbst
- **Karten sind das Ergebnis — nicht der Grund**

---

### Spieler ansprechen — zwei Kanäle

**Über DM:**
DM nutzt DM Studio → Spieler erleben bessere Sessions → wollen Player View → entdecken Karten

**Direkt:**
TikTok wenn Party Album + Player View fertig sind
Hook: *"My friends and I stayed up until 4am"*
Echter viraler Moment: alle öffnen gleichzeitig ihren Pack

---

### Design
- Claude Design Update bereits gemacht
- Living Wiki braucht eigene visuelle Identität
- Parchment Style für DM Studio bleibt
- EndoCraft Karten bleiben dark/cinematic
- Player View: PC first, Parchment Style

---

*EndoCraft — Your world. Every moment sealed.* 🎲

---

## UPDATE 3 — Syl & Demo Campaign Vision

### Syl — DM Studio Maskottchen

**Was Syl ist:**
Ein junger Drache — immer allein, immer schutzbedürftig, immer eine moralische Entscheidung.
Nicht ein Charakter mit fixierter Geschichte — ein Format.

**Syl's Rolle:**
- Maskottchen für DM Studio (Caspian ist für EndoCraft/Spieler)
- Symbol für den Einstieg — *"Every story starts somewhere."*
- Türöffner, nicht das Produkt selbst

**Was Syl NICHT ist:**
- Kein komplettes Universum mit 20 Abenteuern
- Kein Sammel-Mechanismus (erstmal)
- Keine Ablenkung vom Core Product

---

### The Ashford Wyrmling — Das erste Abenteuer

**Zweck:** Einziges offizielles Starter-Abenteuer. Perfekt, nicht viel.

**Was es lehrt:**
- Wie DM Studio funktioniert
- Wie eine Session aufgebaut wird
- Wie moralische Entscheidungen in D&D funktionieren
- Wie Karten am Ende entstehen

**Der Twist:** Syl's Farbe wird erst am Ende enthüllt — abhängig von der Entscheidung der Gruppe.

| Entscheidung | Farbe | Rarity |
|-------------|-------|--------|
| Töten | Grün (Chromatic) | Rare |
| Retten | Silber (Metallic) | Legendary |
| Vertreiben | Unbekannt | Epic |

**Was danach passiert:**
Jede Gruppe schreibt ihre eigene Geschichte. Ashford war nur der Anfang.
Syl war nur der Türöffner.

---

### Syl Stats — Hatchling (eigene Kreatur, kein offizieller Wyrmling)

Syl ist jünger als ein offizieller Wyrmling — ein "Hatchling."
Eigene Stats damit der Kampf für Level 1-2 Gruppen fair ist:
- HP: 18
- AC: 13
- Breath Weapon: 1x pro Tag, 2d6 (Typ je nach Ending)
- Spricht: "Mine." "Hurt." "Stay."

Offizieller Green Wyrmling wäre CR 2, AC 17, 38 HP — zu stark für Level 1.

---

### Zwei Maskottchen — Zwei Zielgruppen

| Maskottchen | Für wen | Wo |
|------------|---------|-----|
| Caspian | Spieler | EndoCraft, TikTok, Karten |
| Syl | DMs | DM Studio, Onboarding |

*EndoCraft — Your world. Every moment sealed.* 🎲

---

## UPDATE 4 — Jarvis Vision & UX

### DM Studio — Die neue Kernvision

> *"Jarvis for D&D."*

Nicht ein Tool das der DM bedient — ein Assistent der mitdenkt.
Kennt den kompletten Kontext. Gibt Informationen im richtigen Moment.
Macht Vorschläge ohne aufzudrängen.

**Als Nordstern für jede Feature-Entscheidung:**
> *"Would Jarvis do this?"*

---

### Co-DM als aktiver Guide — Beispiele

```
"You have 3 NPCs but no locations — want me to suggest where they live?"
"Your party hasn't rested in 4 sessions — Gattok's infection risk is critical."
"This sounds like a Legendary moment — shall I create a card?"
"You're entering combat — switching to tactical mode."
"I notice you haven't added any NPCs yet — want me to generate some?"
```

---

### UX Philosophie — Priorisieren, nicht verstecken

**Falsch:** Features verstecken bis User bereit ist
**Richtig:** Alles sichtbar, aber mit klarer Hierarchie

Features die noch nicht relevant sind → sichtbar aber deaktiviert
Tooltip erklärt warum: *"Add a location first"*
Sobald relevant → leuchtet auf, bereit

---

### Progressive Disclosure — Der richtige Weg

**Tab Reihenfolge:**
1. Vorbereitung — immer der Start
2. Live — wird prominent wenn Kampagne existiert
3. Sammlung — wird prominent nach erster Karte

**Innerhalb Vorbereitung:**
- Hauptbereich: Location + NPC + Import — groß, prominent
- Sidebar: Co-DM + Szenen-Bild + Lore Codex — sichtbar, kleiner
- Unten: Live Tab + Sammlung — da aber dezent

---

### Onboarding Intros

**Intro A — Ashford Wyrmling:**
Syl erscheint auf schwarzem Screen.
Text erscheint langsam:
*"Somewhere in the Thornwood, something is waiting."*
*"The village of Ashford hasn't heard from its woodcutters in three days."*
*"That's you."*
Button: "Begin →"
Dauer: 8-10 Sekunden. Überspringbar.

**Intro B — Build My Own World:**
Syl schaut neugierig rein.
*"Every legend begins with a blank page."*
*"What's yours called?"*
Direkt darunter: Textfeld für Kampagnenname.
Dauer: 5 Sekunden. Sofort interaktiv.

---

### Reddit Post — Ready wenn alles steht

**Titel:**
*"I built an AI assistant for Dungeon Masters — like Jarvis, but for D&D. Looking for testers."*

**Body:**
> It knows your entire campaign — NPCs, locations, lore, sessions.
> Already have a campaign? Import it.
> Starting fresh? Load our starter adventure.
>
> Prep less. Play more.
>
> Looking for DMs to test it. Free, no strings. Drop a comment.

**Subreddits:** r/DMAcademy → r/DungeonMasters → r/rpg → r/DnD
**Timing:** Erst wenn Englisch komplett + Ashford Demo läuft + kein offensichtlicher Bug

---

### Syl — Visuell definiert für Seedream

**Cinematic:**
```
Young dragon hatchling, pale iridescent scales not yet fully formed, 
large expressive eyes, curled protectively around a large egg, 
enchanted forest clearing, soft golden light through trees, 
cinematic fantasy, photorealistic, emotional, 8K, no text, no watermark
```

**Maskottchen (Pixar Style):**
```
Young dragon hatchling, pale shimmering scales, oversized expressive eyes, 
small wings, charming and vulnerable expression, 3D animated style, 
soft warm lighting, clean forest background, emotionally expressive, 
no text, no watermark
```

**Syl in einem Satz:**
*"Small enough to be vulnerable. Determined enough to be dangerous."*

---

*EndoCraft — Your world. Every moment sealed.* 🎲
