#!/usr/bin/env python3
"""
kling_ab.py — Bild A -> Bild B Animation ueber AI/ML API (Kling).

Erzeugt einen Clip, der exakt bei Bild A anfaengt und exakt bei Bild B endet.
Das kann bei Kling nur der Parameter `tail_image_url`, und den gibt es auf
aimlapi laut Doku nur bei den Pro-Endpunkten der 1er-Generation:

    kling-video/v1.6/pro/image-to-video   <- Standard, hier voreingestellt
    kling-video/v1/pro/image-to-video     <- aelter, gleiche Parameter

Die 2er-Endpunkte (v2.1/standard, v2-master, v2.1-master) haben KEIN
Endbild-Feld. v2.1/pro ist auf aimlapi gelistet, die Parameterdoku war aber
nicht abrufbar -- wenn du es probieren willst: --model kling-video/v2.1/pro/image-to-video
und schauen, ob tail_image_url akzeptiert wird.

Aufruf:
    export AIMLAPI_KEY=sk-...
    python kling_ab.py A.jpg B.jpg -p "slow push in, embers drifting" -d 5 -o clip.mp4

Nichts wird ohne dich gestartet: das Skript fragt vor dem kostenpflichtigen
Request einmal nach (--yes ueberspringt das).
"""

import argparse
import base64
import json
import mimetypes
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

API = "https://api.aimlapi.com/v2/video/generations"
DEFAULT_MODEL = "kling-video/v1.6/pro/image-to-video"

# Richtwert laut aimlapi-Modellseite fuer Kling 1.6 Pro: ~0,1274 $/Sekunde.
PRICE_PER_SEC = {
    "kling-video/v1.6/pro/image-to-video": 0.1274,
    "kling-video/v1/pro/image-to-video": 0.1274,
    "kling-video/v2.1/pro/image-to-video": 0.1029,
}


def die(msg):
    print("FEHLER: " + msg, file=sys.stderr)
    sys.exit(1)


def as_image_ref(path_or_url):
    """Lokale Datei -> data-URI, URL -> unveraendert durchreichen."""
    if path_or_url.startswith(("http://", "https://", "data:")):
        return path_or_url
    if not os.path.isfile(path_or_url):
        die("Bild nicht gefunden: " + path_or_url)
    mime = mimetypes.guess_type(path_or_url)[0] or "image/jpeg"
    with open(path_or_url, "rb") as fh:
        raw = fh.read()
    if len(raw) > 9 * 1024 * 1024:
        die("%s ist %.1f MB. Base64 blaeht das um ~33 %% auf; lade das Bild "
            "lieber irgendwo hoch und uebergib die URL." % (path_or_url, len(raw) / 1e6))
    return "data:%s;base64,%s" % (mime, base64.b64encode(raw).decode("ascii"))


def check_sizes(a, b):
    """Warnt, wenn A und B nicht dasselbe Seitenverhaeltnis haben."""
    try:
        from PIL import Image
    except ImportError:
        return
    for p in (a, b):
        if p.startswith(("http://", "https://", "data:")):
            return
    ia, ib = Image.open(a), Image.open(b)
    if ia.size != ib.size:
        print("! A ist %dx%d, B ist %dx%d." % (ia.size + ib.size))
        ra, rb = ia.size[0] / ia.size[1], ib.size[0] / ib.size[1]
        if abs(ra - rb) > 0.01:
            print("! Unterschiedliches Seitenverhaeltnis (%.3f vs %.3f). Kling nimmt das "
                  "Format von A und quetscht B hinein -- das gibt am Ende einen Sprung. "
                  "Beide Bilder vorher auf dieselbe Groesse bringen." % (ra, rb))
        else:
            print("  (gleiches Seitenverhaeltnis, nur andere Aufloesung -- unkritisch)")


def post(payload, key):
    req = urllib.request.Request(
        API,
        data=json.dumps(payload).encode("utf-8"),
        headers={"Authorization": "Bearer " + key,
                 "Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(req, timeout=120) as r:
            return json.loads(r.read().decode("utf-8"))
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8", "replace")[:2000]
        die("HTTP %s beim Start:\n%s" % (e.code, body))


def poll(gen_id, key, timeout_s=900):
    url = API + "?generation_id=" + urllib.parse.quote(gen_id)
    req = urllib.request.Request(url, headers={"Authorization": "Bearer " + key})
    t0 = time.time()
    last = None
    while time.time() - t0 < timeout_s:
        try:
            with urllib.request.urlopen(req, timeout=60) as r:
                data = json.loads(r.read().decode("utf-8"))
        except urllib.error.HTTPError as e:
            if e.code in (429, 500, 502, 503, 504):
                time.sleep(10)
                continue
            die("HTTP %s beim Pollen:\n%s" % (e.code, e.read().decode("utf-8", "replace")[:2000]))
        st = data.get("status")
        if st != last:
            print("  [%4ds] %s" % (time.time() - t0, st))
            last = st
        if st == "completed":
            return data
        if st in ("error", "failed"):
            die("Generierung fehlgeschlagen:\n" + json.dumps(data, indent=2)[:2000])
        time.sleep(10)
    die("Timeout nach %d s. Generation-ID zum Nachschauen: %s" % (timeout_s, gen_id))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("image_a", help="Startbild (Pfad oder URL)")
    ap.add_argument("image_b", help="Endbild (Pfad oder URL)")
    ap.add_argument("-p", "--prompt", required=True,
                    help="Beschreibt die BEWEGUNG von A nach B, nicht den Bildinhalt.")
    ap.add_argument("-n", "--negative", default="", help="negative_prompt")
    ap.add_argument("-d", "--duration", default="5", choices=["5", "10"])
    ap.add_argument("-o", "--out", default="kling-ab.mp4")
    ap.add_argument("-m", "--model", default=DEFAULT_MODEL)
    ap.add_argument("--cfg", type=float, default=0.5, help="cfg_scale 0-1")
    ap.add_argument("--yes", action="store_true", help="ohne Rueckfrage starten")
    ap.add_argument("--dry-run", action="store_true",
                    help="Bilder pruefen und Payload zeigen, aber NICHTS senden (kostet nichts)")
    a = ap.parse_args()

    key = os.environ.get("AIMLAPI_KEY", "").strip()
    if not key and not a.dry_run:
        die("AIMLAPI_KEY ist nicht gesetzt.  export AIMLAPI_KEY=sk-...")

    check_sizes(a.image_a, a.image_b)

    est = PRICE_PER_SEC.get(a.model, 0.13) * int(a.duration)
    print("\nModell   : %s" % a.model)
    print("Dauer    : %s s" % a.duration)
    print("Kosten   : ca. %.2f $ (Richtwert)" % est)

    if a.dry_run:
        preview = {
            "model": a.model,
            "image_url": as_image_ref(a.image_a)[:60] + " ...",
            "tail_image_url": as_image_ref(a.image_b)[:60] + " ...",
            "prompt": a.prompt,
            "duration": a.duration,
            "cfg_scale": a.cfg,
        }
        if a.negative:
            preview["negative_prompt"] = a.negative
        print("\n--dry-run: es wird NICHTS gesendet. Payload waere:\n")
        print(json.dumps(preview, indent=2, ensure_ascii=False))
        print("\nSchluessel gesetzt: %s" % ("ja" if key else "NEIN"))
        return

    if not a.yes:
        if input("Starten? [j/N] ").strip().lower() not in ("j", "y", "ja", "yes"):
            print("Abgebrochen.")
            return

    payload = {
        "model": a.model,
        "image_url": as_image_ref(a.image_a),
        "tail_image_url": as_image_ref(a.image_b),
        "prompt": a.prompt,
        "duration": a.duration,
        "cfg_scale": a.cfg,
    }
    if a.negative:
        payload["negative_prompt"] = a.negative

    print("\nStarte ...")
    start = post(payload, key)
    gen_id = start.get("id") or start.get("generation_id")
    if not gen_id:
        die("Keine generation id in der Antwort:\n" + json.dumps(start, indent=2)[:2000])
    print("generation_id: %s" % gen_id)

    done = poll(gen_id, key)
    url = (done.get("video") or {}).get("url")
    if not url:
        die("Fertig, aber keine video.url:\n" + json.dumps(done, indent=2)[:2000])

    print("Lade herunter ...")
    urllib.request.urlretrieve(url, a.out)
    used = ((done.get("meta") or {}).get("usage") or {}).get("credits_used")
    print("\nFertig: %s  (%.1f MB)%s" % (
        a.out, os.path.getsize(a.out) / 1e6,
        "  credits_used=%s" % used if used is not None else ""))


if __name__ == "__main__":
    main()
