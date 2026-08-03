# Was du machen musst, wenn du am PC bist — Stand 03.08.2026

Ersetzt die Version vom 26.07. ~~Alles, was dort noch offen war, ist hier drin~~ — plus alles Neue aus Payhip, Fiverr und der Streamer-Umwidmung.

> **NACHTRAG 31.07. (autonomer Fix, Self-Review 30.07. #1):** Beim Rewrite am 30.07. sind drei Items verloren gegangen und eine Zahl war falsch. Hier wieder eingetragen:
>
> **A. 🔴 Pins: CSV-Import JETZT — der Alarm läuft.** Nicht „32 Pins bis 06.08. von selbst" (das stand fälschlich in Punkt 14): Monitor 30.07. zählt **16** Scheduled Pins, **Produkt-Runway endet MORGEN 01.08.**, Charakter 02.08. Fix liegt fertig: `_pins-upload`-Bilder deployen + `pinterest-bulk-produkt-KW31.csv` importieren + AI-Modified AN (~10 Min). ⚠️ CSV-Termine ab 28.07. sind inzwischen tot — beim Import neu setzen (oder mir eine Zeile „mach direkt", dann schedule ich die 6 Pins per Browser mit frischen Terminen).
>
> **B. 🔴 Human-Claim (Tag 4 offen):** Entwurf **4545650799** (First Night) behauptet „written by a human" (363 Einträge). Stimmt das? Eine Zeile von dir — blockt sonst den Upload-Block.
>
> **C. 🔴 4 Etsy-Upload-Blöcke (~25 Min):** Ashen · Cursed · First Night (nach B) · Stream Scenes — fertige Entwürfe, nur Uploads/Publish. Vier Produkte live statt im Stapel.
>
> **D. Punkt 10 (Giveaway) ist veraltet:** Die no-giveaway-Bereinigung vom 29.07. hat die Captions bereits entschärft (`social/tiktok-week/no-giveaway/`). Nur noch `FR-giveaway.mp4` betroffen — Entscheid also nur noch für diesen einen Clip nötig.
>
> **E. Bio-Link (Punkt 3):** Nicht erst ab 04.08. zeitkritisch — der Posting-Plan läuft seit 30.07. 19:00 und 11 von 23 Captions sagen „link in bio". Ab dem ersten Post verpuffen Klicks auf den Etsy-Link.

> **NACHTRAG 03.08. (Streamer-Seite entschlackt + Payhip-Cover):**
>
> **F. Punkt 4 ist wieder dran — die Seite ist neu gebaut.** Du hattest gesagt, die Streamer-Seite hat zu viel Text und zu wenig zu sehen. Stimmt. Sie ist jetzt bei **253 statt 729 Wörtern** und **3908 statt 4777 Pixel** Höhe. Das Hero-Video war das eigentliche Problem: es war eine quadratische Werbekachel mit eingebranntem Text und einer kleinen Szene darin. Jetzt läuft dort ein echtes 16:9-Video aus drei textfreien Vol.-1-Szenen (Kathedrale → Taverne → Burgblick, 13 s, blendet aus Schwarz auf und nach Schwarz ab, damit der Loop-Punkt unsichtbar ist). Die sechs Kacheln sind doppelt so groß; ihre Beschriftungen habe ich entfernt, weil die Videos ihre Titel selbst eingebrannt haben. Neue Dateien liegen schon in `Desktop\EndoCraft\streamers\`: `index.html`, `media\hero.mp4`, `media\hero-poster.jpg`. **Es fehlt nur dein `deploy.bat`.** Ehrlich dazu: echtes Abspielen kann ich hier nicht prüfen, der Browser in meiner Umgebung hat keinen H.264-Decoder — Layout und Standbild habe ich geprüft, das Abspielen musst du nach dem Deploy einmal ansehen.
>
> **G. Punkt 7 ist für Produkt A erledigt — aber das war nicht die Ursache.** Du hattest recht, `payhip.com/b/PXU1N` hatte keine Fotos. Ich habe drei Cover hochgeladen und gespeichert (Szene → OBS-Mockup → Sechser-Grid). **Der eigentliche Grund, warum die Seite leer aussieht, ist aber Punkt 1: das Produkt steht auf „Invisible".** Solange das so ist, zeigt der Link nicht das Produkt, sondern deine leere Store-Seite — mit oder ohne Cover. Und der Haupt-Button der neuen Streamer-Seite zeigt genau dorthin. Ein Klick von dir, dann greift alles ineinander.
>
> **H. Payhip Produkt B (Vol. I) existiert noch nicht.** Ich hatte angenommen, es liegt als Entwurf. Nachgesehen: im Dashboard steht genau **ein** Produkt. Das ausgefüllte Formular lebt nur im offenen Tab — siehe Punkt 2, und den Tab bitte weiterhin nicht neu laden.

Sortiert nach Hebel pro Minute. Was hier **nicht** steht, läuft autonom weiter und braucht dich nicht.

---

## 🔴 Diese Woche, sonst kippt der Plan

### 1. Payhip Produkt A auf „Unlisted" schalten — 30 Sekunden
`https://payhip.com/b/PXU1N` · die Gratis-Szene ist fertig angelegt, steht aber auf **Invisible**, also sieht sie niemand.

- **Unlisted** = nur wer den Link hat, kommt rein. Für den Bio-Link genau richtig.
- **Visible** = steht zusätzlich im Store. Erst sinnvoll, wenn der Store nicht mehr leer aussieht.

Ich schalte das nicht selbst — veröffentlichen ist deine Entscheidung.

**Das blockiert Punkt 3.**

### 2. Payhip Produkt B fertig machen — 2 Minuten
Das Formular liegt **fertig ausgefüllt im offenen Browser-Tab** (`payhip.com/product/add/digital`): Titel, 24,00 USD, komplette Beschreibung, Sichtbarkeit auf Invisible.

1. Bei **File(s)** hochladen: `Desktop\EndoCraft\_geld-verdienen\EndoCraft - Dark Fantasy Stream Scenes Vol.1 (Complete).zip` (75,4 MB, 20 Dateien — habe ich aus den fünf Etsy-Teilen zusammengebaut)
2. Unten **Add product** klicken

⚠️ **Lade den Tab vorher nicht neu.** Dann sind meine Eingaben weg.

### 3. TikTok-Bio-Link umstellen — 1 Minute
Steht noch auf **Etsy**. Muss auf `https://payhip.com/b/PXU1N` (nach Punkt 1), später auf `https://endocraft.app/streamers/` (nach Punkt 4).

**Zeitkritisch:** Ab Slot 6 am **04.08.** laufen die ersten Streamer-Posts. Sechs von acht Captions sagen „link in bio". Ein Etsy-Link dahinter verbrennt die Klicks.

### 4. `deploy.bat` laufen lassen — 1 Minute
Ich habe `Desktop\EndoCraft\streamers\index.html` neu gebaut (plus `streamers\media\` mit Hero-Video und sechs Szenenbildern; `sitemap.xml` habe ich erweitert). Die Seite ist die dauerhafte Antwort auf das Bio-Link-Problem: eigene Domain, Streamer-Sprache, Gratis-Szene und Vol. I als CTA.

**Nachtrag 30.07.:** Die sechs Szenen-Kacheln waren Standbilder. Bei einem Produkt, dessen ganzer Verkaufsgrund „es bewegt sich" ist, war das die schwächste denkbare Darstellung. Sie laufen jetzt als echte Loop-Videos — sechs neue Dateien in `streamers\media\previews\`, zusammen 2,1 MB. Geladen wird jede erst, wenn sie ins Bild scrollt; wer Datensparmodus oder „Bewegung reduzieren" an hat, sieht weiter das Standbild.

Live ist sie erst nach deinem Deploy. Ich habe `deploy.bat` und den Pages-Workflow geprüft: `git add .` nimmt den neuen Ordner `streamers\media\previews\` automatisch mit, und der rsync-Filter im Workflow lässt `.mp4` durch. Da musst du nichts anpassen.

Danach prüfen: lädt `https://endocraft.app/streamers/`, laufen die sechs Kacheln, öffnen die beiden Buttons Payhip und Etsy.

**Zwei Dinge, die mir beim Prüfen aufgefallen sind — beide betreffen genau diesen Deploy:**

**a) Ich habe zwei Zeilen geändert, damit dein nächster Deploy nicht 72 MB Müll mitnimmt.** Beim Entpacken der Vol.-1-Videos ist `_to_delete\vol1tmp\` entstanden. `deploy.bat` macht `git add .` — das hätte den Ordner committet **und** auf endocraft.app veröffentlicht, weil `_to_delete\` im Pages-Workflow nirgends ausgeschlossen war. Ich habe deshalb `_to_delete/` in die `.gitignore` und als `--exclude` in `.github\workflows\pages.yml` eingetragen. Nebeneffekt: die 89 MB aus `_to_delete\root-scratch\`, die schon im Repo liegen und aktuell tatsächlich von endocraft.app ausgeliefert werden, verschwinden mit dem nächsten Deploy von der Seite (aus der Git-Historie nicht — dein `.git`-Ordner ist inzwischen 1,8 GB groß, das ist irgendwann ein eigenes Thema). Die Originale liegen als Kopie in `_to_delete\backups-30-07\`, falls du zurück willst.

**b) 🔴 In `Desktop\EndoCraft\` liegt `du bist gut genug (Original).mp3`.** Die Datei ist noch in keinem Commit — aber `git add .` würde sie beim nächsten Deploy erfassen, und der Workflow filtert `.mp3` nicht heraus. Sie läge dann öffentlich unter `https://endocraft.app/du%20bist%20gut%20genug%20(Original).mp3`. Ich habe sie **nicht** angefasst, weil es deine Datei ist. **Schieb sie vor dem Deploy irgendwohin außerhalb des EndoCraft-Ordners** — oder sag mir, dass ich sie in die `.gitignore` schreiben soll.

### 5. Etsy-Listing 4538798363 veröffentlichen — 1 Klick
„Streamer-Intro", 89,99 $. Liegt seit Wochen als **Entwurf**. Fertig, nur der Publish-Klick fehlt. (Stand seit 26.07. unverändert.)

---

## 🟡 Kurz, aber es braucht dich

### 6. Fiverr-Gig: Gallery füllen und veröffentlichen
Schritte 1–4 sind komplett ausgefüllt und gespeichert. Tab ist offen auf `?wizard=4&tab=gallery`. **Reihenfolge beim Hochladen — Video zuerst:**

1. `stream-scenes-vol1\3-Artikelvideo\00_Etsy-Video.mp4` (13 s, 2,1 MB)
2. `stream-scenes-vol1\2-Listing-Bilder\01_Titelbild_Grid.jpg`
3. `05_Mockup.jpg`
4. `07_Works-With.jpg`

PDF-Slot bleibt leer. Dann **Save & Continue**.

**Schritt 6 ist „Publish". Da klicke ich nicht** — das ist deine Entscheidung. Details und alle sieben Abweichungen von meinem Entwurf: `_geld-verdienen\FIVERR-JETZT-DU.md`.

### 7. ~~Cover-Bilder für beide Payhip-Produkte~~ — für Produkt A erledigt (03.08.)
Gratis-Szene hat jetzt drei Cover: `02_Starting-Soon.jpg` (die Szene) · `05_Mockup.jpg` (OBS-Kontext) · `01_Titelbild_Grid.jpg` (alle sechs als Upsell). Gespeichert, Sichtbarkeit dabei unverändert auf Invisible gelassen — ich veröffentliche nichts.

Für Vol. I geht es erst nach Punkt 2, weil das Produkt noch nicht existiert.

### 8. ~~20-%-Rabatt läuft am 03.08. aus~~ — erledigt durch Nichtstun (03.08.)
Meine Empfehlung: **auslaufen lassen.** Drei Verkäufe in vier Monaten liegen nicht am Preis, sondern daran, dass niemand den Shop findet. Ein Dauerrabatt macht daraus nur einen niedrigeren Normalpreis.

Ich fasse deine Etsy-Einstellungen nicht ohne dein Ja an — das ist dein echtes Geld.

### 9. ETSY_API_KEY (Shared Secret) in Railway setzen
Das Cockpit zeigt seit **18.06.** `sales = 0` und `listings = 0`. Nicht weil nichts passiert, sondern weil der Key fehlt. Solange das so ist, sind alle Zahlen im Cockpit wertlos.

### 10. TikTok-Giveaway: Go oder No-Go
Vier von fünf Captions in `social\tiktok-week\` versprechen ein **monatliches Custom-Clip-Giveaway**. Beschlossen hast du das nie. Entweder du stehst dazu (dann brauche ich Regeln und einen Termin) oder ich schreibe die Captions um. Halb geht nicht — ein gebrochenes Versprechen auf TikTok kostet mehr als das Giveaway.

### 11. Angebots-Mail an **deathrider174**
Tag 13, letzter warmer Cutscene-Lead. Text steht. Ich schreibe, du schickst.

### 12. Resend-Broadcast — Freigabe oder Absage
7 Leads. Du hattest gesagt, für Leads laufen schon automatische Mails. Wenn der Broadcast damit erledigt ist, sag es einmal, dann streiche ich ihn endgültig.

---

## 🟢 Wenn Zeit ist

- **13. philcampion fragen** — Erlaubnis für TRANS-01 (Dragonrider).
- **14. Pinterest:** Waren beim Login am 23.07. Pin-Metriken sichtbar? Davon hängt die Auswertung in `social\prompt-lab\tavern-test\AUSWERTUNG.md` ab. ~~Die 32 geplanten Pins laufen bis 06.08. von selbst~~ **FALSCH — siehe Nachtrag A oben: 16 Pins, Produkt-Alarm, Import nötig.**
- **15. Pinterest-Ads** pausiert seit 13.07. — neu starten oder endgültig beerdigen.
- **16. itch.io:** Devil's Hound ZIP + Cover hochladen.
- **17. Showroom-Messpunkt:** eine Zeile — „Was muss er bis wann zeigen, damit er bleibt."
- **18. Zahlungsmethode bei Payhip** (PayPal oder Stripe) verbinden. Ohne das ist der Store-Builder gesperrt — kein Logo, kein Cover, keine Store-Beschreibung. Das machst du selbst; an Zahlungsdaten gehe ich nicht.
- **19. 21 von 23 TikTok-Entwürfen** sind noch nicht terminiert.
- **20. Mailing-Liste / Double-Opt-in:** Der Haken „Automatically subscribe customers to mailing list" ist bei Payhip bewusst **nicht** gesetzt. EU-Käufer ungefragt in einen Verteiler zu schieben ist eine Rechtsfrage, kein Häkchen — das gehört zu einem Anwalt, nicht zu mir.
- **21. `Desktop\EndoCraft\_to_delete\` aufräumen — drei Ordner:** `vol1tmp\` (~75 MB), `herotmp\` (3 Dateien, ~19,8 MB, die textfreien Quellclips fürs neue Hero) und `git-locks-2026-08-03\` (die 13 hängengebliebenen Git-Lock-Dateien vom Deploy-Ärger). Ich kann auf deinem Rechner nichts löschen — nur verschieben. Keiner der drei wird noch gebraucht.

---

## Was ohne dich weiterläuft

Daily Briefing 08:00 · Pipeline-Monitor · Welcome-Cron · Self-Review 22:00 · Pinterest-Drips bis 06.08. · die acht umgewidmeten Streamer-Posts ab 04.08. (Plan: `social\POSTING-PLAN_STREAMER-UMWIDMUNG.md`).

---

## Der ehrliche Satz zum Schluss

Wir haben ein fertiges Produkt und kein Publikum. Das Etsy-Listing ist die Kasse, nicht das Schaufenster. Alles oben zielt auf dasselbe: dass überhaupt jemand die Szenen sieht.

Meine Erwartung für die nächsten sechs Wochen bleibt **0 bis 5 Verkäufe**. Wenn es mehr werden, war ich zu vorsichtig. Wenn es null bleiben, liegt es an der Reichweite und nicht am Produkt — und dann reden wir über Kanäle, nicht über Preise.

**21 Tage ohne neuen Lead** (letzter: 13.07.).
