# Kling A → B — Testlauf

Zwei Clips, zusammen **ca. 1,28 $**. Beide benutzen dasselbe Startbild, damit man
die Ergebnisse direkt vergleichen kann. Startbild ist ein Still aus unserem
eigenen Scene-Pack (`s02-camp-1.jpg`, das Lagerfeuer am Fluss mit den Tarotkarten
auf dem Fass) — kein Demo-Motiv, sondern eins, das wir wirklich verwenden.

## Was drin liegt

| Datei | was es ist |
|---|---|
| `A-camp.jpg` | Startbild, 1920×1080 |
| `B-camp-loop.jpg` | identisch mit A — Endbild für Test 1 |
| `B-camp-pushin.jpg` | 1,5-facher Ausschnitt auf das Feuer, gleiche Maße — Endbild für Test 2 |
| `run-test.bat` | das startest du — mehr musst du nicht anfassen |
| `run-test.ps1` | die eigentliche Arbeit, reines PowerShell |
| `kling_ab.py` | dasselbe in Python, brauchst du nicht mehr |

Das Push-in-Endbild habe ich lokal aus A gerechnet (Crop + Skalierung), nicht neu
generiert. Genau das macht den Test aussagekräftig: der Zielausschnitt steht exakt
fest, also sieht man am letzten Frame sofort, ob Kling ihn getroffen hat.

## Laufen lassen

**Kein Python nötig.** Der erste Versuch ist daran gescheitert: auf deinem Rechner
ist Python nicht installiert, `python` trifft nur den Platzhalter aus dem
Microsoft Store, der die Meldung ausgibt und sich beendet. Der Test läuft jetzt
komplett in PowerShell, das ist auf jedem Windows ohnehin drauf.

Eingabeaufforderung im Ordner öffnen. Erst der kostenlose Trockenlauf — der prüft
Bilder, Payload und Schlüssel, sendet aber nichts:

```
run-test.bat dry
```

Da muss bei beiden Tests `Schluessel gesetzt: ja` stehen, sonst zuerst im selben
Fenster den Schlüssel setzen. Dann der echte Lauf:

```
set AIMLAPI_KEY=sk-dein-schluessel
run-test.bat
```

Der Schlüssel gilt nur für dieses eine Fenster und landet in keiner Datei — auch
nicht im Protokoll.

Jeder Clip dauert erfahrungsgemäß ein bis drei Minuten. Das Skript pollt selbst
und lädt die mp4 am Ende in denselben Ordner.

## Die zwei Tests und was sie beantworten

**Test 1 — `OUT-1-loop.mp4`, A = B.**
Frage: Landet der Clip wieder exakt auf dem Startframe, so dass er nahtlos loopt?
Wenn ja, haben wir ein Verfahren für Stream-Backgrounds und Live-Wallpaper, bei
dem der Loop nicht mehr per Schnitt zusammengezwungen werden muss. Das ist der
Test, der über bare Verwendbarkeit entscheidet.

**Test 2 — `OUT-2-pushin.mp4`, A → engerer Ausschnitt.**
Frage: Wird `tail_image_url` überhaupt beachtet? Der letzte Frame muss die enge
Einstellung zeigen — Feuer groß, Fass mit den Karten links angeschnitten. Endet
der Clip in der weiten Einstellung, hat der Endpunkt den Parameter still
ignoriert, und dann brauchen wir gar nicht weiterzudiskutieren.

## Danach

Schick mir die beiden mp4 zurück (einfach hier in den Chat ziehen). Ich messe
dann objektiv statt nach Gefühl:

- Test 1: Differenz zwischen erstem und letztem Frame — je kleiner, desto
  sauberer der Loop. Dazu ein Blick auf den Übergang, weil Feuer der härteste
  Fall ist, den es für einen Loop gibt.
- Test 2: Differenz zwischen letztem Frame und `B-camp-pushin.jpg`, plus ein
  Kontrollwert gegen `A-camp.jpg`. Wenn der letzte Frame näher an B liegt als an
  A, wurde das Endbild verwendet.

## Wenn etwas schiefgeht

Schick mir in jedem Fall `test-log.txt` mit, da steht die Antwort des Servers
wörtlich drin. Dann muss ich nicht raten.

- **`tail_image_url` wird als unbekanntes Feld abgelehnt** → gegenprüfen mit
  `run-test.bat` und vorher `powershell -NoProfile -ExecutionPolicy Bypass -File .\run-test.ps1 -Model "kling-video/v1/pro/image-to-video"`.
- **HTTP 401** → falscher oder abgelaufener Schlüssel.
- **HTTP 400 wegen Base64** → Bilder irgendwo hochladen und die URLs statt der
  Dateinamen eintragen, das Skript nimmt beides.
- **Clip endet nicht auf B** → Parameter wird ignoriert, siehe oben.

## Wichtig fürs Studio

Der Weg über **unseren eigenen Backend-Endpunkt `/api/video` funktioniert dafür
im Moment nicht.** Der Endpunkt reicht nur `prompt`, `image_url`, `duration`,
`negative_prompt` und `cfg_scale` an aimlapi weiter — `tail_image_url` fällt
dabei stillschweigend raus. Deshalb geht dieser Test direkt gegen aimlapi.

Falls du A→B später auch im Studio anbieten willst, ist es eine Zeile in
`server.js` (bei den anderen `if`-Zeilen um Zeile 2104):

```js
if (tail_image_url) body.tail_image_url = tail_image_url;
```

und `tail_image_url` oben in Zeile 2081 mit aus `req.body` destrukturieren. Dazu
müsste der Default-Model dort (`kling-video/v2.1/standard/image-to-video`) für
diesen Fall auf `kling-video/v1.6/pro/image-to-video` wechseln, sonst läuft es
gegen einen Endpunkt, der das Feld nicht kennt. Das gehört in denselben Deploy
wie die Credit-Pakete — nicht vorher, und ich fasse es nicht an.
