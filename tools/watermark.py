#!/usr/bin/env python3
"""EndoCraft Pin-Watermark: dezentes Siegel unten rechts (35%, klein).
Usage:
  python3 watermark.py <bild-oder-ordner> [ziel-ordner]
Ohne Ziel-Ordner: schreibt neben Original als *-wm.jpg
"""
import sys, os
from PIL import Image
HERE = os.path.dirname(os.path.abspath(__file__))
SEAL = os.path.join(HERE, '..', 'assets', 'branding', 'logo-seal-cutout-512.png')
OPACITY = 0.45      # Deckkraft
FRAC    = 0.085     # Siegelbreite relativ zur Bildbreite
PADFRAC = 0.028     # Rand relativ zur Bildbreite

def stamp(path, outpath):
    img = Image.open(path).convert('RGBA')
    s = max(40, int(img.width * FRAC))
    seal = Image.open(SEAL).convert('RGBA').resize((s, s), Image.LANCZOS)
    a = seal.split()[3].point(lambda p: int(p * OPACITY)); seal.putalpha(a)
    pad = int(img.width * PADFRAC)
    img.alpha_composite(seal, (img.width - s - pad, img.height - s - pad))
    img.convert('RGB').save(outpath, quality=90)
    print('  ->', os.path.basename(outpath))

def main():
    if len(sys.argv) < 2:
        print(__doc__); return
    src = sys.argv[1]; dst = sys.argv[2] if len(sys.argv) > 2 else None
    if dst: os.makedirs(dst, exist_ok=True)
    exts = ('.jpg', '.jpeg', '.png')
    if os.path.isdir(src):
        files = [os.path.join(src, f) for f in sorted(os.listdir(src)) if f.lower().endswith(exts)]
    else:
        files = [src]
    for f in files:
        b = os.path.basename(f); stem, _ = os.path.splitext(b)
        out = os.path.join(dst, stem + '.jpg') if dst else os.path.join(os.path.dirname(f), stem + '-wm.jpg')
        stamp(f, out)
    print(f'done: {len(files)} Bild(er) gestempelt.')

if __name__ == '__main__':
    main()
