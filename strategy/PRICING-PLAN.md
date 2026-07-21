# DM Studio — Pricing-Rethink vor Livegang (21.07.2026)

## Ist-Zustand (im Code)
| Pack | Preis | Credits | €/Credit |
|---|---|---|---|
| Starter | 4,99 € | 60 | 0,083 € |
| Plus | 9,99 € | 160 | 0,062 € |
| Pro | 19,99 € | 400 | **0,050 €** (Boden) |

- Bild: **1 Credit/Variante** · Video: **8 Credits/Clip** → Verhältnis 8:1
- Neuer Account: **0 Gratis-Credits** (kann nichts testen)

## Zwei Probleme
1. **Video unterbepreist.** Reale Kosten: Bild ~1–3 ct, Kling-Clip ~25–50 ct → echtes Verhältnis 10–30:1, im Code aber nur 8:1. Am Pro-Tier bringt ein Clip 8 × 0,05 € = **0,40 €** — deckt die Kling-Kosten kaum. Vielnutzer = Verlustnutzer.
2. **Keine Gratis-Kostprobe.** Ohne Anfangs-Credits kann sich kein Fremder vom Tool überzeugen → keine Self-Serve-Conversion.

## Empfehlung

### A) Video-Preis anheben: `VIDEO_COST` 8 → **14**
Damit auch am günstigsten Tier (Pro, 0,05 €/cr) ein Clip **0,70 €** bringt — ≥50 % Marge bei ~0,35 € Kling-Kosten. Bilder bleiben bei 1 Credit (schon profitabel, sind der Engagement-Köder).

**BESTÄTIGT (21.07.):** Kling v2.1 **standard** i2v, 5 s kostet **~0,28 $ ≈ 0,26 €** — trianguliert über fal.ai (0,28 $) und aimlapi-Pro × Kling-Standard/Pro-Ratio (0,57 × 0,51 $ = 0,29 $). Mit Aggregator-Aufschlag sicher im Bereich 0,26–0,32 €.

**→ `VIDEO_COST = 14` ist bestätigt** und komfortabel. Margen bei 0,26 € Kosten:

| Pack | €/Credit | Clip-Preis (14 cr) | Marge/Clip |
|---|---|---|---|
| Starter | 0,083 € | 1,16 € | +0,90 € (78 %) |
| Plus | 0,062 € | 0,87 € | +0,61 € (70 %) |
| **Pro (Boden)** | 0,050 € | **0,70 €** | **+0,44 € (63 %)** |

Kein Tarif verliert, invertierte Marge behoben. Optional 12 für aggressiveren Preis (Pro-Clip 0,60 €, 57 % Marge). Letzter Gegencheck: reale aimlapi-Rechnung — aber 14 kann jetzt festgenagelt werden.

### B) Gratis-Starter-Grant: neuen Accounts **6 Credits** — Bilder ja, Clip nein
Kostprobe von der teuren Operation entkoppeln: 6 Credits reichen für ein paar Szenen-/Charakterbilder (~10–15 ct Kosten bei dir), aber **nicht für einen Clip** (14 Credits). Der Nutzer erlebt Look, Kuration, Whisper und Wiki gratis — der Hero-Clip kostet ab dem ersten Credit Geld. **Deine Video-Ausgaben für Gratis-Nutzer: 0 €** (Marcos Vorgabe: kein Gratis-Video vor Umsatz). Der Upgrade-Moment ist der emotionale Höhepunkt „ich will meinen Charakter in Bewegung sehen" — genau da soll gekauft werden. Grant idealerweise an bestätigte E-Mail koppeln (gegen Mehrfach-Accounts).

### C) Pack-Preise bleiben (4,99/9,99/19,99 €)
Gute psychologische Anker. Bei `VIDEO_COST` 14 ergeben sie ~4 / ~11 / ~28 Clips (+ jede Menge Bilder) — so steht es jetzt auf der Founding-Seite. **Wenn du ein anderes `VIDEO_COST` lockst, diese drei Labels auf der Seite anpassen.**

### D) Später (nach Validierung): Abo statt nur Packs
Der eigentliche wiederkehrende Umsatz (die „/Mo"-Idee von der Landingpage) ist ein monatliches Studio-Abo. Für die Validierung bleiben wir bei Credit-Packs (niedrigere Hürde zum ersten Ja). Abo kommt, wenn Fremde nachweislich zahlen.

## Code-Änderungen (fertig zum Einbauen, dein Deploy)

**1 · VIDEO_COST (server.js ~Zeile 2084):**
```js
const VIDEO_COST = 14;   // war 8 — deckt Kling-Kosten an jedem Tier; ggf. auf reale Kosten justieren
```

**2 · Gratis-Grant für neue Codes (server.js ~Zeile 787, bei beta_codes-Insert):**
```js
// war: credits: 0  →  Kostprobe: reicht für Bilder, NICHT für einen Clip (14)
body: JSON.stringify({ code, credits: 6, active: true })
```
*Video bleibt damit von Credit 1 an bezahlt — 0 € Video-Kosten für Gratis-Nutzer. Wenn du noch enger willst, geht auch 3. Grant idealerweise nur an bestätigte E-Mails (gegen Mehrfach-Accounts) — Variante baue ich auf Zuruf.*

## Was das fürs Validieren heißt
Die Founding-Seite zeigt **nachhaltige** Preise (die Packs decken bei VIDEO_COST 14 die Kosten). Damit misst du echte Zahlungsbereitschaft zu einem Preis, der sich auch rechnet — nicht zu einem Verlustpreis. Genau richtig vor dem Livegang.
