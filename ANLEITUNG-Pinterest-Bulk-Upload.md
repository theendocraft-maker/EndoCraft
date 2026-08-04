# Pin-Batch „Stream Scenes" — 05.–16.08.2026

12 Pins, ein Pin pro Tag um 18:00, alle mit Ziel **endocraft.app/streamers/**.
Erstellt am 04.08.2026.

- CSV: `PINTEREST-UPLOAD-KW32-33.csv`
- Bilder: `free/pins/pin_stream_*.jpg` (12 Stück, 1000 × 1500, 2:3)
- Übersichtsblatt: `PIN-BATCH-Uebersicht.jpg` (nur zum Anschauen, wird nicht gebraucht)

---

## Was du machen musst — 3 Schritte

### 1. Deployen (MUSS zuerst passieren)

`deploy.bat` doppelklicken. Damit gehen die 12 Pin-Bilder live.

**Warum das der wichtigste Schritt ist:** Pinterest lädt beim Import das Bild von
der Media-URL herunter. Liegt das Bild noch nicht auf dem Server, schlägt der
Import fehl bzw. der Pin bleibt leer. Genau das ist beim Batch KW31 passiert:
Die Bilder liegen bis heute nur in `_pins-upload/` und nicht in `free/pins/`,
deshalb liefert `endocraft.app/free/pins/pin_prod_arkham.jpg` bis heute 404 und
der Batch war nie importierbar. Diesmal liegen die Bilder von vornherein im
richtigen Ordner.

Nach dem Deploy 2 Minuten warten und eine URL im Browser prüfen, z. B.
`https://endocraft.app/free/pins/pin_stream_six_scenes.jpg` — du musst das Pin-Bild
sehen. Erst wenn das klappt, weiter zu Schritt 2.

### 2. Board anlegen

Auf Pinterest ein neues Board anlegen mit exakt diesem Namen:

**Twitch Overlays & Animated Stream Scenes**

Der Name steht so in der CSV. Schreibst du ihn anders, findet der Import das
Board nicht. Boards kann ich nicht selbst anlegen, das musst du machen.

### 3. CSV importieren

Pinterest → Bulk-Erstellung → `PINTEREST-UPLOAD-KW32-33.csv` hochladen.

---

## Danach: AI-Kennzeichnung

Der Bulk-Import setzt das Häkchen **„KI-verändert"** nicht mit. Das musst du nach
dem Import bei jedem der 12 Pins einzeln einschalten. Das ist derselbe Punkt wie
bei den früheren Batches — Pinterest bietet dafür keinen Sammel-Schalter.

---

## Was in der CSV steht

| Tag | Datum | Pin |
|---|---|---|
| 1 | 05.08. | Six Animated Dark Fantasy Stream Scenes for Twitch |
| 2 | 06.08. | A Starting Soon Screen That Sets the Mood |
| 3 | 07.08. | Free Animated Stream Scene — Try One on Your Channel |
| 4 | 08.08. | Be Right Back, Beside a Bonfire |
| 5 | 09.08. | Your Layout on Top of a Living Scene |
| 6 | 10.08. | Turn Just Chatting Into a Dark Fantasy Tavern |
| 7 | 11.08. | Animated Stream Backgrounds for OBS & Streamlabs |
| 8 | 12.08. | An Alchemist's Desk for Your Intermission Screen |
| 9 | 13.08. | Stream Scenes for Soulslike, Horror & D&D Streamers |
| 10 | 14.08. | End the Stream in a Ruined Cathedral |
| 11 | 15.08. | 1920 x 1080, 60 fps, Seamless Loop — Twelve MP4 Files |
| 12 | 16.08. | An Offline Screen That Still Looks Like a Film |

Alle 12 Links zeigen auf `endocraft.app/streamers/` mit UTM-Parametern
(`utm_source=pinterest`, `utm_medium=social`, `utm_campaign=stream_<slug>`).
Kein Pin verlinkt direkt auf Etsy oder Payhip — die Landingpage verkauft weiter.
Vorteil: Wenn sich Preise oder Produkte ändern, musst du keinen einzigen Pin
anfassen, nur die Seite.

In Etsy/Payhip siehst du später über die UTM-Kampagne, welches Motiv gezogen hat.

---

## Wie die Bilder gebaut sind

Quellmaterial sind ausschließlich deine eigenen Assets aus dem Repo:
die sechs Szenen-Stills aus `streamers/media/`, das Grid-Titelbild, das
Layout-Mockup und das Hero-Poster. Kein Fremdmaterial, keine Logos Dritter außer
den genannten Software-Namen (OBS, Streamlabs, StreamElements, Twitch Studio,
XSplit, Restream) im Fließtext — das ist beschreibende Nennung, kein Logo-Einsatz.

Typografie ist die Marken-Kombi der Seite: Cinzel für die Headlines in gesperrten
Goldkapitälchen, Cormorant Garamond für die Fließtextzeile, Grundton
Beinahe-Schwarz, Goldton `#e6c878`.

---

## Zwei Sachen, die dir auffallen sollten

**1. Die CSVs liegen öffentlich.** Der Deploy-Filter in `.github/workflows/pages.yml`
schließt `*.md` und `*.zip` aus, aber nicht `*.csv`. Deshalb ist
`https://endocraft.app/pinterest-bulk-produkt-KW31.csv` gerade wirklich im Netz
abrufbar — und diese neue CSV wäre es nach dem Deploy auch. Inhaltlich ist das
harmlos (Marketing-Texte), aber es ist unsauber. Wenn du willst, nehme ich
`--exclude='*.csv'` in den Workflow auf; dann sind die Dateien beim nächsten
Deploy weg vom Server. Sag Bescheid, ich habe es nicht ungefragt geändert.

**2. Der KW31-Batch ist weiterhin offen.** Die sechs Pin-Bilder aus dem
Produkt-Batch liegen in `_pins-upload/` und nicht in `free/pins/`. Wenn du den
Batch noch fahren willst, verschiebe ich die sechs Dateien in den richtigen
Ordner, dann gehen sie beim nächsten Deploy mit live. Auch das habe ich nicht
ungefragt gemacht, weil die Termine in der KW31-CSV (28.07. ff.) inzwischen in
der Vergangenheit liegen und neu gesetzt werden müssten.
