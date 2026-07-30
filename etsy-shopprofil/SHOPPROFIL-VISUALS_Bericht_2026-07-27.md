# Shop-Profil: Video, Fotos, Schaufenster

*27.07.2026. Was gebaut ist, was ich live schon eingetragen habe, und die eine
Sache, die ich technisch nicht hochladen konnte.*

---

## Was jetzt schon live im Shop steht

**Schaufenster ist voll — vier statt einem Artikel.** Vorher stand da nur
„Animierte D&D-Hintergründe". Jetzt liegen vier drin, und zwar bewusst je einer
pro Produktkategorie, in dieser Reihenfolge:

1. Dungeon Crawl NSC + Kartenpaket — 14,20 € (Karten & Orte)
2. Der Blührot-Heilige — 6,55 € (Boss-Encounter)
3. D&D-NSC-Porträts, 20 Charakterarchetypen — 13,11 € (Porträts & Tokens)
4. Animierte D&D-Hintergründe — 8,74 € (animierte Szenen)

Zwei Überlegungen dahinter. Erstens deckt das die vier Kategorien ab, die auch
in deiner Shop-Story und im neuen Video stehen — ein Besucher sieht in einer
Zeile, was der Laden kann, statt viermal dasselbe. Zweitens habe ich **bewusst
keins der Listings mit fremden Markennamen genommen** (Curse of Strahd, Lost
Mine of Phandelver, Storm King's Thunder, Call of Cthulhu). Die stehen weiter
im Shop, aber sie ganz oben auf die Startseite zu heben, wäre genau die
Sichtbarkeit, die man bei fremden IP-Namen nicht will. Das Schaufenster ist der
prominenteste Platz, den du hast.

---

## Was gebaut ist und auf den Upload wartet

### Das Shop-Video — `ENDOCRAFT-shop-video.mp4`

36 Sekunden, 1280×720 **quer**, 8,4 MB, neun Bilder mit weichen Überblendungen,
stumme Tonspur.

Warum quer und nicht hochkant wie die Reels: Etsy schreibt in der offiziellen
Doku wörtlich *„We have no requirements but strongly recommend landscape
videos."* Das About-Video läuft in einem breiten Block auf der Shop-Seite —
hochkant würde dort mit schwarzen Balken links und rechts laufen. Deshalb hab
ich das vorhandene Making-of (1080×1920) **nicht** genommen, sondern neu aus den
Querformat-Loops und den 2560er-Stills gebaut.

Die neun Beats sind der Shop in Kurzform: Wortmarke, Karten & Orte, Boss-Encounter,
NSC-Porträts & Tokens, animierte Szenen, VTT-Kompatibilität, „Curated, not just
generated", „Assembled as a set", Schlussbild. Der gleiche Aufbau wie die
Shop-Story, damit Text und Video sich nicht widersprechen.

**Kein `endocraft.app` im Video.** Gleiche Begründung wie bei der
Bestellbestätigung: Die Etsy-Gebührenrichtlinie verbietet, Käufer aus dem
Etsy-Kontext heraus auf einen anderen Verkaufsweg zu ziehen. Im Website-Feld
deines Profils steht der Link ja und ist dort auch erlaubt.

### Die fünf About-Fotos — `about-01.jpg` bis `about-05.jpg`

1600×900, zusammen ca. 1,2 MB.

Hier war die eigentliche Denkarbeit, und ich will dir ehrlich sagen warum. Etsy
fragt an dieser Stelle nach Fotos *„von deinem Arbeitsprozess, deinem
Arbeitsbereich"*. Du hast keine Werkstatt. Ein gestelltes Schreibtischfoto mit
Kaffeetasse und Würfeln wäre erfunden, und erfundene Sachen willst du nicht im
Shop haben — zu Recht.

Also ist **jedes der fünf Fotos ein echtes Artefakt aus der Produktion**, kein
Symbolbild:

* **01 — „One brief, three generations"** zeigt die drei tatsächlichen
  Generierungen aus einem Prompt (`gen/grave-1..3.jpg`). Ich habe bewusst
  **kein Häkchen** an eine davon gesetzt, weil ich nicht nachweisen kann, welche
  am Ende ausgeliefert wurde. Lieber keine Behauptung als eine unbelegte.
* **02 — „Colour-matched as a set"**: vier Szenen aus einem Pack, und darunter
  je fünf Farbfelder, die beim Rendern **live aus dem Bild gemessen** wurden
  (Median-Cut-Quantisierung), nicht nachträglich hingelegt. Die erste Version
  hatte vier Szenen drin, deren Paletten sichtbar *nicht* zusammenpassten — das
  Bild hätte seine eigene Überschrift widerlegt. Jetzt sind es vier
  Nachtszenen, die tatsächlich zueinander passen.
* **03 — „Seamless, and measured"**: erstes gegen letztes Bild eines echten
  Loops, mit dem gemessenen Unterschied. Die Zahl **0,64 %** wird beim Rendern
  aus den beiden Frames berechnet, sie kann also nicht von der Realität
  abweichen. Das ist das einzige harte, überprüfbare Qualitätsargument, das der
  Shop hat — und niemand sonst in dieser Nische zeigt so etwas.
* **04 — „What a pack actually contains"**: alle 24 Dateien eines Scene-Packs,
  12 Orte in je 2 Bildausschnitten. Beantwortet die Frage, die vor dem Kauf
  wirklich im Kopf ist.
* **05 — „Four things this shop makes"**: die vier Kategorien auf einen Blick.

Alle Texte englisch, weil der Shop englisch ist. Kein `endocraft.app`.

### Das Bestellungsbeleg-Banner — `ENDOCRAFT-beleg-banner.png`

760×100 wie von Etsy vorgegeben, 49 KB (Limit 2 MB). Wortmarke, Goldlinie,
Claim. Der leere Slot stand schon im letzten Bericht als offener Punkt.

---

## Was ich nicht hochladen konnte — und warum

Der Upload ins Browser-Fenster ist an einer **Werkzeug-Inkompatibilität**
gescheitert, nicht an Etsy. Die Upload-Funktion meldet wörtlich:

> „file_upload no longer accepts host filesystem paths. […] If you are seeing
> this in Claude Desktop, update the desktop app."

Also eine Versionsdifferenz zwischen der Desktop-App und der
Browser-Steuerung. Ich habe es einmal versucht und dann aufgehört — da ist
nichts, was ich durch Herumprobieren löse.

**Damit es für dich trotzdem zwei Minuten Arbeit sind**, liegen alle sieben
Dateien jetzt direkt auf deinem Rechner:

```
C:\Users\cxrat\Desktop\EndoCraft\etsy-shopprofil\
```

Ablauf: `etsy.com/shop/EndoCraft/edit` öffnen, runter zu „Shop-Profil von
EndoCraft" → „Video hinzufügen" → die MP4 wählen. Dann „Füge bis zu 5 Fotos mit
Beschriftung hinzu" → alle fünf JPGs auf einmal → die Bildunterschriften aus
`about-captions.txt` daneben einsetzen. Das Beleg-Banner sitzt an einer anderen
Stelle (Einstellungen → Info & Aussehen → Bestellungsbeleg).

---

## Neuer Fund: der Standort-Widerspruch ist jetzt geklärt

Im letzten Bericht stand, dein Shop-Standort stehe auf „USA". Ich hab heute
nachgesehen, und es ist genauer, als ich dachte — es sind **zwei verschiedene
Felder**:

* Auf `etsy.com/shop/EndoCraft/edit` steht „Kein Standort festgelegt". Ich habe
  das Feld geöffnet: es ist ein freies Textfeld („Standort des Shops"), aktuell
  **leer**, rein zur Anzeige. Ich habe es nicht ausgefüllt und mit „Abbrechen"
  wieder geschlossen.
* Auf der **öffentlichen** Shop-Seite `etsy.com/shop/EndoCraft` steht trotzdem
  **„USA"** direkt unter dem Shop-Namen.

Das heißt: Die „USA" kommt nicht aus diesem Anzeigefeld, sondern aus dem
hinterlegten Land deines Verkäuferkontos. Das ist die Stelle, die an
Zahlungsabwicklung und Umsatzsteuer hängt — und genau deshalb fasse ich sie
weiter nicht an. Bleibt so, wie besprochen: zusammen mit der Gewerbeanmeldung,
nicht davor und nicht allein.

Ob du das leere Anzeigefeld schon jetzt auf „Deutschland" setzen willst, ist
deine Entscheidung. Es würde die Angabe auf der Seite ehrlicher machen, aber es
stünde dann anders da als das Kontoland — solange das nicht auch stimmt, ist
das eher verwirrend als besser. Ich würde beides in einem Rutsch machen.

---

## Was danach noch offen bleibt

* **Farbschema** ist weiter leer. Kann ich setzen, sobald du sagst, ob es zum
  Banner passen soll (dunkel/gold) oder neutral bleiben.
* **Shop-Mitglieder** ist leer — da steht ein graues Platzhalter-Männchen neben
  „EndoCraft / Kontakt". Dafür bräuchte es ein Foto von dir. Ich baue dir da
  nichts Künstliches hin; entweder ein echtes Bild oder der Block bleibt leer.
  Leer ist besser als ein KI-Gesicht, das behauptet, du zu sein.
* Die vier Punkte aus dem letzten Bericht stehen unverändert: Kontoland, EU-
  Verkäuferstatus, KI-Hinweis in allen 22 Listings, „new packs every month".

Sources: [Etsy Shop Video technical requirements](https://www.etsy.com/help/article/35270402262)
