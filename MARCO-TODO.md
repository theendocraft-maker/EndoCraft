# Was du machen musst, wenn du am PC bist — Stand 05.08.2026, nachts

Diese Datei ist heute entrümpelt worden. Alles Erledigte und die ganze
Vorgeschichte (DNS-Ausfall, Payhip-Aufbau, Fiverr-Verlauf) stehen jetzt in
`MARCO-TODO-ARCHIV-2026-08-04.md`. Hier steht nur noch, was offen ist.

---

## Zuerst: deine zwei Aussagen, nachgeprüft

Du hast geschrieben: *„fiverr sollte veröffentlicht sein, bei etsy sehe ich
keinen entwurf mehr"*. Ich habe beides nachgesehen, statt es zu übernehmen.
Einmal hattest du recht, einmal nicht.

### Etsy: du hast recht — und mehr als du wahrscheinlich denkst

Im Shop Manager stehen **26 aktive Artikel und 0 Entwürfe.** Kein einziger
Entwurf ist übrig. Namentlich geprüft:

- **4538798363** — „Custom Cinematic D&D Stream Intro", 89,99 $ → **aktiv**
- **4545650799** — „Dark Fantasy Campaign Starter Kit, TTRPG Zine", 8,99 $ → **aktiv**

Damit ist auch der Etsy-Block durch, der seit Tag 4 hing. Alle vier liegen live:
Zine 8,99 $ · Prop Handouts 12,99 $ · Character Journal 16,99 $ · Stream Scenes
24,00 $ — alle mit Verlängerung am 28.11., also am 28.07. eingestellt. **Die
„written by a human"-Frage hast du damit selbst beantwortet.** Ich hake sie ab
und frage nicht nochmal nach.

### Fiverr: da ist der Gig noch nicht veröffentlicht

Unter **ACTIVE: keine Gigs. Unter PENDING APPROVAL: keine Gigs.** Der Gig steht
unter **DRAFT**. Ich bin den Wizard durchgegangen, um zu sehen wo genau:

Overview ✓ · Pricing ✓ · Description & FAQ ✓ · Requirements ✓ ·
**Gallery ← hier stehst du** · Publish (noch grau)

Und die Gallery ist inhaltlich fertig: drei Bilder liegen drin, eins als Primary,
das Video `endocraft-dark-fantasy-stream-scenes.mp4` ist hochgeladen und hat
einen grünen Haken. Darunter steht „Under review by our Trust & Safety team" —
das ist die normale Videoprüfung, kein Problem.

**Es fehlt genau eine Sache: das Häkchen unter den Dokumenten.** Ohne das kommst
du nicht auf Schritt 6. Ich habe die Schritte 1 bis 4 nochmal gespeichert
(nichts geändert, nur durchgeklickt), damit du nicht bei null anfängst.

Warum ich das Häkchen nicht setze, steht unten unter Punkt 1.

### Nachtrag: dein „arbeite einfach alles ab" — was daraufhin passiert ist

- **Alle 26 Etsy-Live-Listings tragen jetzt `whatContent = ai_gen`.** 14 hatten es
  schon (die neueren), bei 12 älteren fehlte die Angabe komplett — gesetzt,
  gespeichert, jedes einzeln nachgeprüft. Kein Listing stand fälschlich auf
  „original". Der Backlog-Punkt ist damit erledigt.
- **itch.io Devil's Hound war schon fertig** — ZIP (12 MB) seit dem 21.07.
  drauf, Projekt veröffentlicht, KI-Disclosure steht auf „Yes". Der
  Backlog-Punkt war veraltet; gestrichen.
- **Dritte Variante für die 4 IP-Pins:** `PINTEREST-UPLOAD-KW31-IP-SAFE-VARIANTE.csv`
  — gleiche Bilder und Links, aber Titel ohne fremde Produktnamen, terminiert
  19.–22.08. Details unter Punkt 5.
- **Alternativ-Caption für FR-giveaway.mp4** liegt in
  `social\tiktok-week\FR-ALTERNATIV-caption-ohne-giveaway.md` — Details unter
  Punkt 6.
- **Pinterest-Wiedervorlage gesetzt:** ich versuche die letzten 4
  KI-Kennzeichnungen gegen 04:00 automatisch erneut.

---

## 🔴 Was nur du kannst

### 1. Fiverr: das Häkchen setzen und veröffentlichen — 2 Minuten
Gig öffnen → Wizard bis **Gallery** → ganz unten das Häkchen:

> „I declare that these materials were created by myself or by my team and do not
> infringe on any 3rd party rights."

→ *Save & Continue* → Schritt 6 *Publish*.

Das ist eine Erklärung, die du in deinem Namen abgibst, keine Formalie. Deshalb
setze ich sie grundsätzlich nicht für dich — und den Publish-Klick auch nicht.
Ehrlich dazu: dein Material ist KI-generiert und von dir kuratiert. Ob das unter
„created by myself or by my team" fällt, ist eine Einschätzung, die du treffen
musst; ich kenne Fiverrs Auslegung dazu nicht und will sie dir nicht andichten.

### 2. `deploy.bat` doppelklicken — 1 Minute
Drei Dinge warten darauf: die sechs KW31-Pin-Bilder in `free/pins/`, der neue
`*.csv`-Filter im Workflow, und die CSVs verschwinden von der öffentlichen Seite.

### 3. `endocraft.app/streamers/` einmal ansehen — 1 Minute
Laufen das Hero-Video und die sechs Kacheln wirklich? Ich kann nur prüfen, dass
die Seite 200 liefert — abspielen kann mein Browser hier kein H.264.

### 4. ETSY_API_KEY (Shared Secret) in Railway setzen
Das Cockpit zeigt seit dem 18.06. `sales = 0` und `listings = 0`, weil der Key
fehlt. Solange das so ist, sind alle Zahlen dort wertlos. An deine
Etsy-Zugangsdaten komme ich nicht und will ich auch nicht.

---

## 🟡 Entscheidungen, die auf dich warten

### 5. Die IP-Frage — sie blockiert konkret vier Pins
Beim Aufräumen des KW31-Batches ist mir aufgefallen: **vier der sechs Pins tragen
fremde Produktnamen im Titel** — zweimal „Curse of Strahd", „Lost Mine of
Phandelver", „Arkham". Sie zeigen auf genau die Listings, die schon auf der
Risikoliste stehen (4520864968, 4471077244, 4513582241, 4521062054).

Ich habe den Batch deshalb geteilt, statt ihn ungefragt komplett scharf zu
stellen:

- `PINTEREST-UPLOAD-KW31-freigegeben.csv` — die zwei unbedenklichen Pins
  (Dungeon Crawl Essentials 17.08., Forest Encounter Pack 18.08.), fertig
  terminiert, kannst du sofort importieren.
- `PINTEREST-UPLOAD-KW31-IP-OFFEN.csv` — die vier anderen, **ohne Termine**, also
  bewusst nicht importierbar, bis du entschieden hast.
- **Neu:** `PINTEREST-UPLOAD-KW31-IP-SAFE-VARIANTE.csv` — dieselben vier Pins,
  aber mit umgeschriebenen Titeln ohne fremde Produktnamen („Gothic Horror
  Campaign Pack" statt „Curse of Strahd Master Pack" usw.), terminiert
  19.–22.08. jeweils 18:00. Wenn du diesen Weg willst, ist es nur noch dein
  Import-Klick.

Drei Wege: die IP-Safe-Variante importieren, die Originale so lassen, oder die
Pins streichen. Wichtig: die Umschreibung entschärft nur die **Pins** — die vier
**Etsy-Listings** selbst tragen die Namen weiterhin, die Risikoliste bleibt.
Dieselbe Frage steht noch bei drei von 23 Social-Captions offen.

### 6. TikTok-Giveaway: Go oder No-Go
Nur noch `FR-giveaway.mp4` ist betroffen, der Rest ist am 29.07. entschärft
worden. Entweder du stehst zum monatlichen Custom-Clip-Giveaway — dann brauche
ich Regeln und einen Termin — oder du nimmst die fertige Alternativ-Caption in
`social\tiktok-week\FR-ALTERNATIV-caption-ohne-giveaway.md`. Ehrlicher Haken
dabei: die Endcard **im Video** verspricht das Giveaway weiterhin — bei No-Go
muss die Endcard getauscht oder abgeschnitten werden, Caption allein reicht
nicht.

### 7. Resend-Broadcast: freigeben oder streichen
7 Leads. Du hattest gesagt, für Leads laufen ohnehin automatische Mails. Wenn der
Broadcast damit erledigt ist, sag es einmal, dann streiche ich ihn endgültig.

### 8. Angebots-Mail an **deathrider174**
Warmer Cutscene-Lead vom 13.07., der Text steht fertig. Ich schreibe, du
schickst — verschicken tue ich nichts in deinem Namen.

### 9. Drei Preise, die noch fehlen
„The Complete Vault" (Bundle) 34,99 $ · Geschenkgutschein 19,99 $ · Ashen Crown
Vol. 1 auf itch.io 9,99 $. Das sind meine Vorschläge, nicht deine Entscheidung.

---

## 🟢 Wenn Zeit ist

- **21 von 23 TikTok-Entwürfen** sind noch nicht terminiert.
- **Pinterest-Ads** pausiert seit dem 13.07. — neu starten oder beerdigen.
- **philcampion fragen** — Erlaubnis für TRANS-01 (Dragonrider).
- **Digital Art Sampler** ausmustern; die doppelten Listing-Paare zusammenlegen.
- **`_to_delete\` aufräumen** — inzwischen ziemlich voll: `vol1tmp\` (~75 MB),
  `herotmp\` (~20 MB), `root-scratch\` (89 MB), `git-locks-2026-08-03\`,
  `git-locks-2026-08-04\`, `pinterest-alt-2026-08-04\`. Löschen kann ich auf
  deinem Rechner nichts, nur verschieben — das hier musst du selbst wegwerfen.
  Nebenbei: dein `.git`-Ordner ist bei 1,8 GB. Irgendwann ein eigenes Thema.
- **Showroom-Messpunkt:** eine Zeile — „Was muss er bis wann zeigen, damit er
  bleibt."

---

## Was hängt, und woran es liegt

**KI-Kennzeichnung auf den Streamer-Pins: 8 von 12** (05.08. bis 12.08. sind
gesetzt). Bei den letzten vier (13.08. bis 16.08.) lädt der Pinterest-Editor
seit Montagmittag nicht mehr — die Seite bleibt weiß, ein Pinterest-Endpunkt
antwortet mit 503. Zwei weitere Versuche am Abend, unverändert. Das liegt an
Pinterest, nicht an deinem Rechner; Etsy, Fiverr und itch liefen in derselben
Sitzung normal. **Nächster automatischer Versuch: heute gegen 04:00.** Der
erste betroffene Pin geht erst am 13.08. live — Puffer ist reichlich. **Wenn du
es vor mir schaffst:** Pin öffnen → Schalter „Als KI-verändert markieren" an →
Fertig.

---

## Was ohne dich weiterläuft

Daily Briefing 08:00 · Pipeline-Monitor · Welcome-Cron · Self-Review 22:00 ·
die 17 geplanten Pins bis 16.08. · der Streamer-Posting-Plan
(`social\POSTING-PLAN_STREAMER-UMWIDMUNG.md`).

---

## Der ehrliche Satz zum Schluss

Etsy ist komplett: 26 Artikel live, kein Entwurf offen, alle sauber als
KI-generiert gekennzeichnet — da kann dir keiner mehr ans Bein pinkeln.
Pinterest hat 17 Pins in der Schlange, die alle auf deine eigene Domain zeigen.
Fiverr hängt an einem Häkchen. Das Produkt ist da, der Vertrieb steht — was
fehlt, ist weiterhin das Publikum.

Meine Erwartung für die nächsten sechs Wochen bleibt **0 bis 5 Verkäufe**. Wenn
es mehr werden, war ich zu vorsichtig.

**Letzter neuer Lead: Fr 01.08. 21:57** (landing/freepack).
