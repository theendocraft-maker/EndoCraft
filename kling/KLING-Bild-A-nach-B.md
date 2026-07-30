# Bild A → Bild B mit Kling — was geht, was nicht

Kurz: **ja, das geht.** Es ist Klings Start-/Endframe-Funktion. Der Clip startet
exakt auf Bild A, endet exakt auf Bild B, und Kling erfindet dazwischen die
Bewegung. Es gibt aber genau eine Einschränkung, die man vorher wissen muss.

## Die Einschränkung

Auf **deinem** aimlapi-Zugang hat den Endbild-Parameter (`tail_image_url`) laut
Doku nur die 1er-Generation im Pro-Tier:

| Endpunkt | Endbild? |
|---|---|
| `kling-video/v1.6/pro/image-to-video` | **ja** — `tail_image_url` |
| `kling-video/v1/pro/image-to-video` | ja (älter) |
| `kling-video/v1.6/standard/image-to-video` | nein |
| `kling-video/v2.1/standard/image-to-video` | nein |
| `klingai/v2-master-image-to-video` | nein |
| `klingai/v2.1-master-image-to-video` | nein |
| `kling-video/v2.1/pro/image-to-video` | vermutlich ja, **nicht verifiziert** |

Der letzte Punkt ehrlich gesagt: aimlapi listet v2.1 Pro als Modell (0,1029 $/s),
aber die Parameterdoku dazu war nicht abrufbar. Bei fal.ai hat dasselbe Modell
`tail_image_url`, es ist also wahrscheinlich — belegen kann ich es nicht. Das
Skript nimmt deshalb 1.6 Pro als Default; `-m kling-video/v2.1/pro/image-to-video`
probiert die neuere Variante, und wenn der Parameter still ignoriert wird, sieht
man das sofort daran, dass der Clip nicht auf B landet.

Heißt: du tauschst **Modellgeneration gegen A→B-Kontrolle**. 1.6 Pro ist gut,
aber 2.1/2.6 bewegen Stoff, Feuer und Kamera sichtbar sauberer. Wenn ein Shot den
exakten Endzustand nicht braucht, nimm die neuere Generation ohne Endbild.

## Kosten

Kling 1.6 Pro liegt bei aimlapi bei ca. **0,1274 $ pro Videosekunde** → rund
**0,64 $ für 5 s**, **1,27 $ für 10 s**. Ein Fehlversuch kostet dasselbe wie ein
Treffer, deshalb steht unten der Abschnitt über Bild B.

## Was mit den zwei Bildern passieren muss

Das ist der Teil, an dem so etwas normalerweise scheitert.

**Seitenverhältnis kommt von Bild A.** Es gibt keinen `aspect_ratio`-Parameter
beim Image-to-Video — das Ausgabeformat ist das Format von A. B sollte exakt
dieselben Maße haben, sonst wird es hineingequetscht und der letzte Frame springt.
Das Skript prüft das und warnt.

**B muss dieselbe Szene sein, nur später.** Kling interpoliert nicht zwischen
zwei Bildern wie ein Morph — es generiert Bewegung, die plausibel bei B ankommt.
Gleicher Ort, gleiche Lichtstimmung, gleiche Kameraposition oder eine, die man in
fünf Sekunden erreichen kann. Wenn A eine Taverne ist und B ein Drachenhort, wird
daraus ein Matschübergang, kein Schnitt. Für einen echten Szenenwechsel schneidet
man zwei Clips zusammen, das ist Aufgabe des Schnitts, nicht des Modells.

Was dagegen sehr gut funktioniert und für uns die eigentlich interessanten Fälle
sind:

- **Kamerafahrt**: A weit, B nah am selben Motiv. Push-in mit definiertem Ziel.
- **Zustandswechsel am selben Ort**: Kerze brennt → Kerze erloschen; Tür zu →
  Tür offen; Pergament leer → beschrieben; Feuer klein → Feuer hoch.
- **Tag/Nacht oder Verfall** am identischen Bildausschnitt.
- **Loop**: A und B sind *dasselbe Bild*. Dann fängt der Clip da an, wo er
  aufhört — das ist der sauberste Weg zu einem nahtlosen Loop, und genau das
  brauchen wir für Stream-Backgrounds und Live-Wallpaper.

Der letzte Punkt ist wahrscheinlich der wertvollste. Unsere Loops sind bisher
mühsam per Schnitt geschlossen; mit A = B löst das Modell es selbst.

**Der Prompt beschreibt die Bewegung, nicht den Inhalt.** Nicht „eine dunkle
Krypta mit Kerzen", sondern „slow dolly forward, candle flame gutters and dies,
dust drifts through the beam". Das Modell sieht die Bilder ja schon.

## Das Skript

`kling_ab.py` liegt dabei. Es macht den Start-Request, pollt bis fertig, lädt die
mp4 herunter, warnt bei ungleichen Bildmaßen und zeigt vor dem kostenpflichtigen
Aufruf die geschätzten Kosten mit Rückfrage an.

```
export AIMLAPI_KEY=sk-...
python kling_ab.py A.jpg B.jpg -p "slow push in, embers drifting upward" -d 5 -o test.mp4
```

Lokale Dateien werden als Base64 eingebettet (Grenze im Skript: 9 MB pro Bild,
darüber besser eine URL übergeben).

Ich habe **nichts** gegen die echte API laufen lassen — dein Key bleibt bei dir,
wie immer. Der erste Testlauf ist deiner.

## Und die zwei Bilder selbst?

Die kann ich in dieser Sitzung nicht erzeugen: Higgsfields Bildgenerierung ist
hier nicht verfügbar (nur die Website-/Shorts-/TikTok-Tools). Bildgenerierung
läuft also ebenfalls über aimlapi und damit über dich. Was ich machen kann: die
Prompts für A und B so schreiben, dass beide wirklich dieselbe Szene sind —
identischer Ort, identisches Licht, nur ein Parameter verändert. Das ist bei
A→B die halbe Miete, und das ist der Teil, den man leicht falsch macht.

## Mein Vorschlag für den ersten Test

Nimm einen Shot, den wir sowieso brauchen, und nicht einen Demo-Shot: ein
**nahtloser Loop mit A = B** aus einem unserer bestehenden Cinematic-Frames.
Kostet 0,64 $, beantwortet sofort zwei Fragen (kommt der Clip sauber auf dem
Startframe an, und reicht 1.6 Pro qualitativ), und wenn es klappt, haben wir ein
Verfahren für die Stream-Background- und Live-Wallpaper-Schiene, statt nur einen
schönen Übergang.

---

**Quellen:**
[AI/ML API — v1.6-pro/image-to-video](https://docs.aimlapi.com/api-references/video-models/kling-ai/v1.6-pro-image-to-video) ·
[v1-pro/image-to-video](https://docs.aimlapi.com/api-references/video-models/kling-ai/v1-pro-image-to-video) ·
[v1.6-standard/image-to-video](https://docs.aimlapi.com/api-references/video-models/kling-ai/v1.6-standart-image-to-video) ·
[v2.1-standard/image-to-video](https://docs.aimlapi.com/api-references/video-models/kling-ai/v2.1-standard-image-to-video) ·
[v2.1-master/image-to-video](https://docs.aimlapi.com/api-references/video-models/kling-ai/v2.1-master-image-to-video) ·
[Kling-Modellübersicht](https://docs.aimlapi.com/api-references/video-models/kling-ai) ·
[Preis 1.6 Pro](https://aimlapi.com/models/kling-1-6-pro-text-to-video-api) ·
[Preis v2.1 Pro](https://aimlapi.com/models/kling-v2-1-pro-i2v) ·
[fal.ai — Kling 2.1 Pro (tail_image_url)](https://fal.ai/models/fal-ai/kling-video/v2.1/pro/image-to-video) ·
[fal.ai — Kling 2.6 Pro (End Image)](https://fal.ai/models/fal-ai/kling-video/v2.6/pro/image-to-video)
