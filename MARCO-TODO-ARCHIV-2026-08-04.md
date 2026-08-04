# Was du machen musst, wenn du am PC bist — Stand 04.08.2026

---

## ✅ ERLEDIGT 03.08. abends — beides geprueft, nicht geglaubt

**endocraft.app ist wieder online.** Gemessen um 22:40:
- Nameserver laut oeffentlichem DNS: `felicity.ns.cloudflare.com` + `mimi.ns.cloudflare.com` ✔
- A-Records: alle vier GitHub-Pages-IPs ✔
- `https://endocraft.app/`, `/streamers/`, `/free/` → **200** ✔
- `http://endocraft.app` → leitet sauber auf https um ✔
- `https://www.endocraft.app/` → leitet auf die Hauptdomain um, Zertifikat gueltig ✔

Damit funktionieren auch wieder alle Links in den Etsy-Listings, in den Mails und in der TikTok-Bio. Die Warnung von vorhin ("TikTok-Bio darf nicht auf endocraft.app/streamers/ zeigen") ist damit aufgehoben.

**Payhip Vol. I ist live:** `https://payhip.com/b/E8OJP` — 24,00 $, ZIP 71,9 MB haengt dran, 9 Cover, Beschreibung 3.682 Zeichen, Visible.
**Gratis-Produkt:** `https://payhip.com/b/PXU1N` — steht jetzt auf Visible und erscheint im Store.
Store-Uebersicht: `https://payhip.com/EndoCraft`

### Payhip-Store: die fuenf offenen Punkte sind erledigt (03.08., autonom von mir)

1. ~~About Me / Platzhaltertext~~ **erledigt.** Abschnitt "About EndoCraft" traegt jetzt die drei echten Absaetze aus PAYHIP-TEXTE.md. **Das Stockfoto von dem fremden lachenden Mann ist geloescht.**
2. ~~Store tagline~~ **erledigt.** Steht als eigener zentrierter Abschnitt unten: `Cinematic dark fantasy assets for streamers and game masters.` plus eine Spec-Zeile und ein Button "Get the free scene", der auf das Gratis-Produkt zeigt.
3. ~~Tags Vol. I~~ **erledigt.** Kategorie `Films > Video Production & Editing > Video Assets & Loops`, 10 Tags: twitch overlay, stream overlay, animated overlay, starting soon screen, brb screen, dark fantasy, gothic, obs, streamlabs, animated background. **Payhip erlaubt maximal 10** — rausgefallen sind: streamelements, twitch scenes, soulslike, 1080p60, cinematic.
4. ~~"Thank you"-Text nach dem Kauf~~ **erledigt.** Der Text sitzt nicht am Produkt, sondern unter Account → Settings → **Advanced Settings → Email Receipts**. Nachricht = Abschnitt 4 aus PAYHIP-TEXTE.md, wortwoertlich. **Achtung:** die Betreffzeile `Thank you — your EndoCraft download is ready` ist **meine** Formulierung, die stand nicht in deiner Datei. Wenn sie dir nicht passt, aendere sie dort.
5. ~~Auszahlung~~ **geprueft: PayPal steht auf "Connected".** Stripe ist nicht verbunden und muss auch nicht — PayPal nimmt auch Kredit- und Debitkarten an. Ich habe nur gelesen, keine Zahlungsdaten angefasst.

**Der Store ist veroeffentlicht** (Payhip: "Store was published"). Oeffentlich geprueft: `payhip.com/EndoCraft` zeigt beide Produkte, den About-Abschnitt und die Tagline; `payhip.com/b/E8OJP` laedt mit Preis, Beschreibung und Buy-Button.

### Was am Store noch offen ist — dafuer brauche ich dich

- ~~Profilbild im About-Abschnitt~~ **erledigt.** Das Wachssiegel-Logo (`assets/branding/logo-seal.png`) steht jetzt rund im About-Abschnitt, Store ist neu veroeffentlicht. Ich hatte vorher geschrieben, ich kaeme an den Dateidialog nicht heran — das stimmte so nicht: ich konnte die Datei am Dialog vorbei direkt in das Upload-Feld schreiben. Damit sind Bild-Uploads bei Payhip fuer mich generell moeglich.
- ~~Cover-Bild fuer Vol. I~~ **erledigt.** Die neun Cover waren in Ordnung, nur die Reihenfolge war falsch: vorne stand dieselbe Kathedrale wie beim Gratis-Produkt. Jetzt steht das Sechser-Grid `01_Titelbild_Grid.jpg` an Position 1. Im Store sehen die beiden Produkte damit nicht mehr aus wie zwei Varianten desselben Dings.
- **Alle neun Social-Felder sind immer noch leer** (Instagram, YouTube, Facebook, X, Bluesky, TikTok, Discord, Pinterest, LinkedIn) unter Settings → Store. **Du hattest den TikTok-Link freigegeben — ich kann ihn trotzdem nicht eintragen, weil ich deinen Handle nicht kenne.** Gesucht habe ich: im HTML von `endocraft.app` (kein `tiktok.com/@…` zu finden) und im TikTok-Studio-Tab (dort steht nur `@Steger`, das ist nicht der Markenkanal). Der Fiverr-Name `theendocraft` waere geraten, und geraten trage ich nichts ein. **Sag mir den Handle in einem Satz, dann ist das in zwei Minuten drin.**
- **Versteckter Sale-Preis 5,00 bei Vol. I — versucht, geht nicht. (03.08., autonom)** Ich habe drei Wege probiert: Feld leeren und speichern, Feld auf 24.00 setzen, und den Haken "Product is on sale" kurz an- und wieder ausschalten. Alle drei kommen nach dem Neuladen wieder mit 5.00 zurueck. Grund: der ganze Sale-Block ist bei diesem Produkttyp `display:none`, und Payhips Server ignoriert `sale_price` komplett, solange `on_sale` aus ist. **Gefahr besteht keine:** der Store zeigt 24,00 $, `on_sale` ist aus, ein Fehlklick von aussen ist nicht moeglich — das Feld ist tot, nicht scharf. Ich habe nach dem dritten Versuch aufgehoert, statt an einem Live-Store weiterzuexperimentieren. Wenn es dich stoert, ist der Payhip-Support der richtige Weg.
- ~~**Statement descriptor**~~ **erledigt 03.08., autonom.** Steht jetzt auf `ENDOCRAFT`, nach Neuladen geprueft. **Wichtige Einschraenkung:** `PAYHIP*` ist kein Wert, den man ersetzen kann, sondern ein fest eingebauter Praefix vor dem Eingabefeld. Auf dem Kontoauszug deiner Kaeufer steht also `PAYHIP*ENDOCRAFT`, nicht `ENDOCRAFT` allein. Dein OK lautete "PAYHIP* → ENDOCRAFT" — herausgekommen ist ein Anhaengen, kein Ersetzen. Mehr gibt Payhip nicht her.
- ~~Haken "Logo auf Rechnungen/Belegen"~~ **erledigt 03.08., autonom.** Der Haken sitzt (Settings → Account → Logo & Invoice Settings), und das Wachssiegel-Logo ist dort hochgeladen. Beides nach Neuladen geprueft. Der Text der Kaufbestaetigung (Betreff + 823 Zeichen) ist dabei unveraendert geblieben, vorher und nachher kontrolliert.
- **Haken "Geschaeftsadresse auf Rechnungen" bleibt aus.** Den hattest du nicht freigegeben, und ob deine Adresse auf Kaeuferrechnungen gehoert, ist eine Frage fuer deinen Steuerberater, nicht fuer mich.
- Zahlen bisher: Vol. I 0 Views / 0 Verkaeufe, Gratis-Szene 1 View / 0 Downloads. Der Store ist erst seit heute oeffentlich.

---

## ~~0b. Payhip Vol. I — ERLEDIGT 03.08., Produkt ist live (E8OJP)~~ (Verlauf, nur zum Nachlesen)

**Stand 03.08., Tab "Add Digital Product" ist offen.** Der haengende Upload von vorhin war tot, nicht langsam — ich habe das Formular verworfen und neu ausgefuellt. Fertig eingetragen und geprueft:

- **Title:** `Dark Fantasy Stream Scenes Vol. I — 6 Animated Scene Backgrounds (1080p 60fps, OBS / Streamlabs)`
- **Price:** `24.00` USD
- **Description:** kompletter Text aus `_geld-verdienen/PAYHIP-TEXTE.md` (Abschnitt 3) **plus** der FAQ-Block aus Abschnitt 5, weil Payhip kein eigenes FAQ-Feld hat — 3.682 Zeichen
- **Visibility:** Visible

**Was ich technisch nicht kann: Dateien auswaehlen.** Der Datei-Dialog von Windows liegt ausserhalb des Browsers, da komme ich nicht ran. Zwei Klicks fuer dich, im Tab "Add Digital Product":

1. **"+ Upload product file"** → `Desktop\EndoCraft\_geld-verdienen\EndoCraft - Dark Fantasy Stream Scenes Vol.1 (Complete).zip` (71,9 MB). Warte, bis der Balken wirklich 100 % erreicht und der Dateiname mit Groesse dasteht.
2. **"Upload a product image"** → aus `Desktop\EndoCraft\stream-scenes-vol1\2-Listing-Bilder\` in dieser Reihenfolge markieren (Strg gedrueckt halten waehlt die Reihenfolge nicht — zur Not einzeln nacheinander hochladen):
   `02_Starting-Soon.jpg`, `05_Mockup.jpg`, `01_Titelbild_Grid.jpg`, `06_Whats-Included.jpg`, `07_Works-With.jpg`, `03_Just-Chatting.jpg`, `09_Be-Right-Back.jpg`, `08_Intermission.jpg`, `10_Offline.jpg`
   Das erste Bild ist das Vorschaubild im Store — deshalb `02_Starting-Soon.jpg` zuerst.
3. Dann **Add Product**. Den Knopf drueckst du, nicht ich.

**Wenn es wieder bei 99 % haengt:** nicht warten. Seite neu laden, und stattdessen erst das Produkt *ohne* Datei anlegen und die ZIP danach im Edit-Formular nachreichen — der Upload laeuft dort einzeln und haengt seltener.

**Danach ein Klick extra:** Produkt `PXU1N` (das Gratis-Produkt "Free Animated Stream Scene") steht auf **Invisible**. Deshalb zeigt `payhip.com/b/PXU1N` deinen leeren Store statt des Produkts. Auf **Visible** stellen — das ist der Link, der aktuell in der TikTok-Bio steht.

---

## ~~0. endocraft.app war DNS-tot — ERLEDIGT 03.08., Seite laeuft wieder~~ (Verlauf, nur zum Nachlesen)

**Befund (gemessen, nicht geraten):**

- Die **Registrierung ist in Ordnung**: Namecheap, laeuft bis **14.04.2027**, Status normal (nur die uebliche Transfer-Sperre).
- Die Registry delegiert weiter an **dom.ns.cloudflare.com** und **welly.ns.cloudflare.com**.
- Trotzdem liefert jede DNS-Abfrage auf endocraft.app **SERVFAIL** (Google DNS Status=2) — auch mit abgeschalteter DNSSEC-Pruefung. Es gibt keinen DS-Record, also ist DNSSEC nicht die Ursache.
- Die TLD `.app` antwortet normal, Cloudflares Nameserver sind selbst online.

**→ Die Zone `endocraft.app` existiert in deinem Cloudflare-Account nicht mehr.** Cloudflare antwortet fuer die Domain mit "nicht zustaendig", deshalb ist sie weltweit weg — nicht nur /streamers/, sondern **alles**: Startseite, Studio, free-Seite, Hall of Fame, Admin, und jeder Link in Etsy-Listings, TikTok-Bio und den Mails.

**Der Deploy ist NICHT schuld.** Ein Pages-Deploy kann keine DNS-Zone loeschen. Wahrscheinlicher Ablauf: die Zone war schon vorher weg (siehe die Cloudflare-Meldung, die du mir als Screenshot geschickt hattest), die alten Antworten waren nur noch im DNS-Cache — heute ist der Cache abgelaufen.

**STATUS 03.08. — Schritte 1 bis 3 sind erledigt. Ich habe sie in deinem eingeloggten Cloudflare gemacht.**

Die Zone `endocraft.app` ist wieder angelegt (**Free-Plan, 0 $** — nichts gekauft), und alle fuenf Eintraege stehen, jeder auf **DNS only** (graue Wolke):

- `A` @ -> `185.199.108.153`
- `A` @ -> `185.199.109.153`
- `A` @ -> `185.199.110.153`
- `A` @ -> `185.199.111.153`
- `CNAME` www -> `theendocraft-maker.github.io`

**Es bleibt genau eine Sache fuer dich: Namecheap.** Cloudflare hat der neuen Zone **andere** Nameserver zugewiesen als die alten. Damit greift Schritt 5, nicht Schritt 4:

**Neu eintragen (Custom DNS):**
- `felicity.ns.cloudflare.com`
- `mimi.ns.cloudflare.com`

**Alte loeschen:**
- ~~dom.ns.cloudflare.com~~
- ~~welly.ns.cloudflare.com~~

Weg: Namecheap -> Domain List -> `endocraft.app` -> **Manage** -> **Nameservers** -> **Custom DNS** -> beide neuen eintragen -> Haken/Speichern. Danach ist die Seite meist in 15 bis 60 Minuten zurueck, im Extremfall dauert es ein paar Stunden. Das kann ich nicht fuer dich machen: dafuer muesste ich dich bei Namecheap einloggen, und Passwoerter fasse ich nicht an.

Sobald die Domain wieder antwortet: GitHub -> Repo `theendocraft-maker/EndoCraft` -> Settings -> Pages: unter *Custom domain* muss `endocraft.app` stehen, und wenn das Zertifikat ausgestellt ist, *Enforce HTTPS* anhaken. Die Datei `CNAME` im Repo ist korrekt, da ist nichts zu tun.

<details><summary>Urspruengliche Anleitung (Schritte 1 bis 6) — nur noch zum Nachlesen</summary>

1. `dash.cloudflare.com` oeffnen. Steht `endocraft.app` noch in der Liste?
2. Wenn nein: **Add a site** -> `endocraft.app` -> **Free** waehlen.
3. Die fuenf DNS-Eintraege oben anlegen, Proxy jeweils auf **DNS only**.
4. Cloudflare nennt am Ende zwei Nameserver. Sind es genau die alten, ist bei Namecheap nichts zu tun.
5. Sind es andere: bei Namecheap unter Custom DNS eintragen.
6. Danach GitHub Pages pruefen (Custom domain, Enforce HTTPS).

</details>

**Alternative ohne Cloudflare:** bei Namecheap auf **BasicDNS** stellen und die vier A-Records plus den www-CNAME direkt unter *Advanced DNS* eintragen. Ein Zwischenspieler weniger — dafuer ohne Cloudflare-Cache.

**Solange die Domain tot ist:** die TikTok-Bio **nicht** auf `endocraft.app/streamers/` umstellen. Bis dahin ist `https://payhip.com/b/PXU1N` der einzige Link, der funktioniert.

Quelle der IPs: GitHub Docs, "Managing a custom domain for your GitHub Pages site".

---


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

## ⭐ NEU (04.08.): Pin-Batch für Streamer — 3 Schritte, ca. 10 Minuten

12 neue Pins sind fertig und liegen auf deiner Platte. Sie bewerben die Stream
Scenes und zeigen alle auf `endocraft.app/streamers/` — kein Pin verlinkt direkt
auf Etsy oder Payhip, du musst also nie wieder einen Pin anfassen, wenn sich
Preise ändern. Zeitplan: täglich ein Pin, 05.08. bis 16.08., jeweils 18:00.

- Bilder: `free/pins/pin_stream_*.jpg` (12 Stück, 1000 × 1500)
- CSV: `pinterest-bulk-streamers-KW32-33.csv`
- Ausführliche Anleitung: `pinterest-bulk-streamers-KW32-33-README.md`
- Kontaktbogen zum Anschauen: `_review/PIN-BATCH-Uebersicht.jpg`

**Schritt 1 — `deploy.bat` doppelklicken.** Das muss zuerst passieren. Pinterest
lädt die Bilder beim Import von der URL herunter; liegen sie noch nicht auf dem
Server, bleibt der Pin leer. Danach 2 Minuten warten und
`https://endocraft.app/free/pins/pin_stream_six_scenes.jpg` im Browser aufrufen —
du musst das Bild sehen.

**Schritt 2 — Board anlegen** mit exakt diesem Namen:
**Twitch Overlays & Animated Stream Scenes**. Genau so steht er in der CSV.
Boards kann ich nicht selbst anlegen, das musst du machen.

**Schritt 3 — CSV importieren** über Pinterest → Bulk-Erstellung.

**Danach:** Das Häkchen „KI-verändert“ wird beim Bulk-Import nicht mitgesetzt.
Das musst du bei jedem der 12 Pins einzeln einschalten — Pinterest bietet dafür
keinen Sammel-Schalter.

**a) Warum der KW31-Batch nie lief.** Die sechs Pin-Bilder aus dem Produkt-Batch
liegen bis heute in `_pins-upload/` statt in `free/pins/`, deshalb liefert
`endocraft.app/free/pins/pin_prod_arkham.jpg` eine 404 und der Import konnte gar
nicht funktionieren. Es lag nicht am Deploy. Wenn du den Batch noch fahren
willst: sag Bescheid, dann verschiebe ich die sechs Dateien in den richtigen
Ordner — die Termine in der KW31-CSV (28.07. ff.) müssten allerdings neu gesetzt
werden. Ungefragt habe ich nichts verschoben.

**b) Die CSVs liegen öffentlich im Netz.** Der Deploy-Filter in
`.github/workflows/pages.yml` schließt `*.md` und `*.zip` aus, aber nicht `*.csv`.
`https://endocraft.app/pinterest-bulk-produkt-KW31.csv` ist dadurch wirklich
abrufbar, die neue CSV wäre es nach dem Deploy auch. Inhaltlich harmlos, aber
unsauber. Auf ein Wort nehme ich `--exclude='*.csv'` in den Workflow auf.

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

### 6. Fiverr-Gig — Gallery ist gefüllt, es fehlen zwei Klicks von dir (Stand 03.08.)
Schritte 1–5 sind jetzt durch. Ich habe die Gallery autonom bestückt, genau in der Reihenfolge aus `_geld-verdienen\FIVERR-GIG.md` §7:

- **Video:** `00_Etsy-Video.mp4` — liegt oben, Fiverr zeigt „Under review by our Trust & Safety team". Das ist der normale Weg bei jedem Gig-Video, kein Fehler. Vorher durchgesehen: keine URL, keine Kontaktdaten, kein fremdes IP im Bild — nur der Schriftzug ENDOCRAFT. Damit verstößt es nicht gegen Fiverrs Gig-Video-Regeln.
- **Bild 1 (Primary):** das Sechser-Raster
- **Bild 2:** das Mockup „Your layout on top"
- **Bild 3:** „Works with OBS / Streamlabs / StreamElements"
- **PDF-Slot:** leer, wie geplant

**Was ich nicht angeklickt habe, und warum:** unter den Uploads sitzt ein Pflicht-Häkchen — *„I declare that these materials were created by myself or by my team and do not infringe on any 3rd party rights."* Das ist eine Rechtserklärung in deinem Namen gegenüber Fiverr, keine Formalie. Sowas hake ich grundsätzlich nicht für dich ab. **Save & Continue** hat deshalb abgelehnt und rot gemeldet: *„Please confirm that you've read and agreed to our Terms of Service."*

**Deine zwei Klicks:** Häkchen setzen → **Save & Continue**. Danach stehst du auf Schritt 6 „Publish".

**Auf „Publish" klicke ich nicht** — das ist deine Entscheidung. Sag mir ein Wort, dann mache ich es; sonst bleibt es bei dir. Details und alle sieben Abweichungen von meinem Entwurf: `_geld-verdienen\FIVERR-JETZT-DU.md`.

> **Tab 980340454 bitte nicht neu laden**, solange das Häkchen nicht gesetzt und gespeichert ist. Die Dateien liegen zwar schon bei Fiverr, die Zuordnung zum Gig ist aber erst nach *Save & Continue* fest.

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
Tag 22 (Wish vom 13.07.), warmer Cutscene-Lead. Text steht. Ich schreibe, du schickst.

### 12. Resend-Broadcast — Freigabe oder Absage
7 Leads. Du hattest gesagt, für Leads laufen schon automatische Mails. Wenn der Broadcast damit erledigt ist, sag es einmal, dann streiche ich ihn endgültig.

---

## 🟢 Wenn Zeit ist

- **13. philcampion fragen** — Erlaubnis für TRANS-01 (Dragonrider).
- **14. Pinterest:** Waren beim Login am 23.07. Pin-Metriken sichtbar? Davon hängt die Auswertung in `social\prompt-lab\tavern-test\AUSWERTUNG.md` ab. ~~Die 32 geplanten Pins laufen bis 06.08. von selbst~~ **FALSCH — siehe Nachtrag A oben: 16 Pins, Produkt-Alarm, Import nötig.**
- **15. Pinterest-Ads** pausiert seit 13.07. — neu starten oder endgültig beerdigen.
- **16. itch.io:** Devil's Hound ZIP + Cover hochladen.
- **17. Showroom-Messpunkt:** eine Zeile — „Was muss er bis wann zeigen, damit er bleibt."
- ~~**18. Zahlungsmethode bei Payhip** verbinden~~ — **erledigt/geprueft 03.08.: PayPal steht auf "Connected", der Store-Builder ist offen.** Stripe braucht es nicht.
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

**Letzter neuer Lead: Fr 01.08. 21:57** (landing/freepack — die Page konvertiert, wenn Traffic kommt).
