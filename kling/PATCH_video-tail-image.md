# Patch — `tail_image_url` durch `/api/video` durchreichen

Zweck: damit A→B-Clips (Startbild → Endbild, u. a. nahtlose Loops) über unseren
eigenen Endpunkt laufen. Ohne diesen Patch fällt der Parameter still raus, weil
`/api/video` den Request-Body auf eine feste Whitelist reduziert.

Zwei Änderungen in `server.js`, beide im Block `app.post('/api/video', ...)`.
Kein Datenbank-Eingriff, keine neue Umgebungsvariable, keine Auswirkung auf
bestehende Aufrufe: wer `tail_image_url` nicht mitschickt, bekommt exakt das
bisherige Verhalten.

## 1) Zeile 2081 — Parameter aus dem Body holen

**vorher**

```js
    const { prompt, image_url, model = 'kling-video/v2.1/standard/image-to-video', duration = 5, negative_prompt, cfg_scale, code } = req.body || {};
```

**nachher**

```js
    const { prompt, image_url, tail_image_url, duration = 5, negative_prompt, cfg_scale, code } = req.body || {};
    // Endbild gibt es bei Kling nur im Pro-Tier der 1er-Generation.
    // Wird eines mitgeschickt, muss das Modell mitwechseln, sonst kennt der
    // Endpunkt das Feld nicht und ignoriert es kommentarlos.
    const model = req.body?.model
      || (tail_image_url ? 'kling-video/v1.6/pro/image-to-video'
                         : 'kling-video/v2.1/standard/image-to-video');
```

## 2) Nach Zeile 2101 — Feld an aimlapi weitergeben

**vorher**

```js
    if (image_url) body.image_url = image_url;
    if (duration) body.duration = String(duration);
```

**nachher**

```js
    if (image_url) body.image_url = image_url;
    if (tail_image_url) body.tail_image_url = tail_image_url;
    if (duration) body.duration = String(duration);
```

## Hinweis zu den Kosten

Kling 1.6 Pro kostet pro Sekunde mehr als der bisherige Default v2.1 Standard.
Solange A→B nur intern läuft (interner Schlüssel, keine Credit-Abbuchung), ist
das egal. Sobald es im Studio für zahlende Nutzer sichtbar wird, muss der
Aufpreis in `VIDEO_COST` nachgerechnet werden — der Wert steht im selben Deploy
ohnehin zur Änderung an (8 → 7 zusammen mit `CREDIT_PACKS` 43/89/181), und die
falsche Kommentarzeile darüber („1 Clip = 4 Credits") fliegt bei der Gelegenheit
raus. Ein A→B-Clip sollte dann eher teurer sein als ein normaler, nicht gleich.

## Test danach

```
curl -s -X POST https://endocraft-production.up.railway.app/api/video \
  -H "x-internal-key: <internal key>" -H "Content-Type: application/json" \
  -d '{"prompt":"slow dolly in","image_url":"<data-uri A>","tail_image_url":"<data-uri B>","duration":5}'
```

Antwort muss eine `id` enthalten. Kommt HTTP 400 mit einem Hinweis auf ein
unbekanntes Feld, akzeptiert der gewählte Endpunkt `tail_image_url` nicht — dann
gegenprüfen mit `"model":"kling-video/v1/pro/image-to-video"`.

**Deployed wird von dir, nicht von mir.** Dieser Patch gehört in denselben
Deploy wie `CREDIT_PACKS` → 43/89/181 und `VIDEO_COST` → 7, damit die
Preislogik in einem Rutsch stimmig ist.
