# Etsy Listing — The Complete Vault (Rec. 4)

**Preis: 34,99 USD · Digitaler Sofort-Download**
**Status: Copy fertig. Entwurf noch NICHT angelegt — Grund siehe „Ehrliche Korrektur" unten.**

---

## ⚠ Ehrliche Korrektur vorweg — zwei Annahmen aus der Empfehlung stimmen nicht

**1. „Kostet uns keine einzige neue Datei" — das stimmt nicht.**
So steht es in `SORTIMENT_Empfehlung_2026-07-28.md`. Ich habe nachgesehen: Die Käufer-Dateien der Packs liegen **weder auf deinem PC noch bei mir**. Geprüft: `assets\`, `scene-packs\`, `_review\`, `etsy-updates\`, `resources\`, `studio\` — überall nur Branding oder das Cinematic-Boss-Reveals-Paket. Die verkauften ZIPs existieren nur noch **innerhalb der Etsy-Listings**. Du kannst sie als Verkäufer wieder herunterladen, aber das sind 17 Downloads, 17× entpacken, sortieren und neu packen — realistisch **zwei bis drei Stunden Handarbeit für dich**, nicht null.

**2. „246 Assets" wäre gelogen — die Packs überschneiden sich massiv.**
Ich habe die Beschreibungen der Listings gegeneinander gelesen, statt die Zahlen aus den Titeln zu addieren. Ergebnis:

* **Starter Campaign NPC Pack (26)** und **Goblin Mine Campaign Pack (25)** sind praktisch dasselbe Produkt. Wörtlich in beiden: *the captive knight, the dwarf patron, the bugbear chief, the elf priestess, the guild mistress, the innkeeper* — und dieselben Orte *goblin cave, frontier town, lost mine*. Einziger Unterschied, den ich finden konnte: Goblin Mine nennt zusätzlich *dragon hoard chamber* und *goblin warrens*.
* **Gothic Horror NPC Tokens + Locations (39)** und **Gothic Horror Village Pack (20)** ebenso. In beiden: *the cursed village, the castle on the crag, the lakeside camp*. Das 20er ist mit hoher Wahrscheinlichkeit eine Teilmenge des 39er.
* **Digital Art Sampler (10)** ist laut eigener Beschreibung *„eine Kostprobe des gesamten EndoCraft-Sortiments"* — also **zu 100 % Doppelung**.
* Wahrscheinlich, aber nicht belegt: **Essential NPC Portraits (10)** vs. **NPC Portraits (20)** — beides Archetypen-Kartensets, gleiche Machart.

Die Titelsumme 246 schrumpft damit auf grob **190 Dateien**, und selbst das ist eine Schätzung. **Deshalb steht in der Listing-Copy unten keine Gesamtzahl an Assets, sondern „17 komplette Packs".** Das ist nachprüfbar, klingt genauso stark und kann dir niemand als Falschangabe vorwerfen.

Wenn du das Master-Archiv gepackt hast, bekommst du die echte Zahl mit einem Befehl (PowerShell im Vault-Ordner):

```
(Get-ChildItem -Recurse -File -Include *.png,*.jpg,*.jpeg,*.mp4,*.webm).Count
```

Sag mir die Zahl, dann setze ich sie an den zwei markierten Stellen ein — vorher nicht.

**3. Empfehlung, die sich daraus ergibt:** Der Sampler (2,99 $) gehört nicht mehr ins Sortiment, sobald das Vault steht — er verkauft dasselbe zweimal. Und die beiden Doppel-Paare (Starter/Goblin Mine, Gothic 39/Gothic 20) solltest du mittelfristig auf je ein Listing zusammenführen. Das ist aber eine eigene Entscheidung, ich habe nichts davon angefasst.

---

## Was im Vault steckt — 17 Packs, Einzelwert 163,83 $

| # | Pack | Einzelpreis |
|---|---|---|
| 1 | Dark Fantasy Soulslike TTRPG Pack (12 Stills + 4 MP4 + 1 vertikal) | 9,99 |
| 2 | Starter Campaign NPC Pack | 14,99 |
| 3 | Goblin Mine Campaign Pack | 12,99 |
| 4 | Dungeon Crawl NPC + Map Pack | 12,99 |
| 5 | Gothic Horror NPC Tokens + Locations | 16,99 |
| 6 | Gothic Horror Village Pack | 9,99 |
| 7 | 1920s Cosmic Horror Pack | 9,99 |
| 8 | Giant Campaign NPC Tokens | 9,99 |
| 9 | Forest + Wilderness Pack | 9,99 |
| 10 | NPC Portraits (20 Archetypen) | 11,99 |
| 11 | Essential NPC Portraits (10 Karten) | 3,99 |
| 12 | Animated Ambience Backgrounds (6 MP4-Loops) | 7,99 |
| 13 | Animated Dragons (6 MP4-Loops) | 7,99 |
| 14 | Boss Encounter — The Hollow King | 5,99 |
| 15 | Boss Encounter — The Crowned Colossus | 5,99 |
| 16 | Boss Encounter — The Devil's Hound | 5,99 |
| 17 | Boss Encounter — The Bloomrot Saint | 5,99 |
| | **Summe** | **163,83 $** |

Vault-Preis **34,99 $** → Ersparnis **128,84 $** = **79 %**.
(Digital Art Sampler bewusst nicht mitgezählt — er ist reine Doppelung, ihn mitzurechnen wäre geschönt.)

---

## Auslieferung — das ist die eigentliche Hürde

Etsy erlaubt **5 Dateien à 20 MB, also 100 MB pro Listing**. Das Vault ist ein Vielfaches davon. Ich habe geprüft, ob ein externer Download-Link erlaubt ist:

* Etsys Hilfeseite zu digitalen Listings nennt nur die Grenzen (*„The maximum size for each file is 20MB"*, *„up to five digital files"*) und sagt zu großen Dateien **nichts**.
* Die Seller Policy verbietet ausdrücklich nur, **Transaktionen** von Etsy wegzuleiten („Facilitating or directing off-platform transactions"). Ein Download-Link **nach** bezahltem Kauf ist keine Transaktion außerhalb von Etsy und fällt nicht darunter.
* Verboten ist es also nicht. Das Restrisiko ist praktisch, nicht rechtlich: Ein offener Link kann weitergegeben werden.

**Meine Empfehlung für den Start (Variante A):**

| Etsy-Slot | Datei | Zweck |
|---|---|---|
| 1 | `EndoCraft-Vault-Access.pdf` (~3 MB) | Inhaltsverzeichnis aller 17 Packs, Lizenz, Download-Link |
| 2 | `EndoCraft-Vault-QuickStart.zip` (≤20 MB) | ~20 der stärksten Assets als hochwertige JPG |
| 3–5 | frei | Reserve |

Slot 2 ist wichtig: Damit ist „Instant Download" **wörtlich wahr** — der Käufer hat in Sekunden echte Bilder in der Hand, nicht nur einen Zettel mit einem Link. Genau daran scheitern die meisten Link-Bundles in den Bewertungen.

Hosting: Google Drive oder Dropbox, Ordner auf „Jeder mit dem Link", **kein Konto nötig**. Bei Google Drive gibt es bei sehr vielen Zugriffen die Sperre „Download-Limit überschritten" — bei unseren Stückzahlen kein Thema, aber Dropbox ist da robuster.

**Variante B (später, wenn es läuft):** Eine code-geschützte Download-Seite auf `endocraft.app`. Du hast das Code-System im Studio ohnehin schon. Das schließt Weitergabe wirklich aus, kostet aber einen Abend Entwicklung. Für den Start nicht nötig — die Packs sind einzeln ohnehin frei käuflich, ein Leck kostet uns kaum etwas.

---

## Title (135 Zeichen)

```
The Complete Vault | Every EndoCraft Dark Fantasy Pack | 17 D&D 5e Art Bundles, NPCs, Battle Maps + Animated Loops | Roll20 Foundry VTT
```

> Regelcheck: 135 Zeichen (Limit 140), genau **ein** `&`, kein `%`, kein `:` — Etsy erlaubt jedes dieser drei Zeichen höchstens einmal.

## Tags (13)

```
dnd bundle · dm resource bundle · ttrpg art bundle · dark fantasy art · npc portraits · battle maps · roll20 assets · foundry vtt · dungeon master gift · vtt tokens · dnd 5e bundle · gothic fantasy · animated loops
```

Alle unter 20 Zeichen, keine Dopplung, keine fremden Marken.

## Materials

```
PNG, JPG, MP4, high resolution, VTT ready, printable, digital download
```

## Description

```
THE COMPLETE VAULT — every EndoCraft dark fantasy pack, in one download. 17 packs that cost 163.83 $ separately, for 34.99 $.

This is the whole library. Not a "best of", not a starter selection — everything we have ever released for the table, from the first NPC card to the animated boss reveals, in one place.

WHAT'S IN THE VAULT (17 packs)

Campaigns & locations
• Starter Campaign NPC Pack — the frontier town, the goblin cave, the lost mine
• Goblin Mine Campaign Pack — the ambush trail, the ruined manor, the dragon hoard chamber
• Dungeon Crawl NPC + Map Pack — corridors, chambers, and the people who guard them
• Forest + Wilderness Pack — old trees, older things beneath them

Horror
• Gothic Horror NPC Tokens + Locations — the vampire lord, the castle on the crag, the cursed village
• Gothic Horror Village Pack — the village set, portrait-first
• 1920s Cosmic Horror Pack — lantern light, wrong angles, quiet dread

Characters
• NPC Portraits — 20 archetypes, from the wise elder to the crime boss
• Essential NPC Portraits — 10 cards, each with a name and three playable lines
• Giant Campaign NPC Tokens — the giant-war essentials

Cinematic & animated
• Dark Fantasy Soulslike Pack — 12 cinematic stills, 4 animated cutscenes, 1 vertical reel
• Animated Ambience Backgrounds — 6 seamless 16:9 loops: tavern, old wood, lost library, frozen cave, forgotten dungeon
• Animated Dragons — 6 seamless loops, always watching

Boss encounters (4 packs)
• The Hollow King · The Crowned Colossus · The Devil's Hound · The Bloomrot Saint

HOW IT'S MADE — AI DISCLOSURE
Every image starts as an AI generation from our own prompts, and that is where the machine's part ends. Most of what comes back is thrown away. What survives is corrected, colour-matched, and assembled by hand into a finished set before it ships. You are paying for the curation and the consistency, not for a folder of raw generations. We say so plainly, because you deserve to know what you bought.

COMPATIBILITY
High-resolution PNG and JPG, sized for Roll20, Foundry VTT, Owlbear Rodeo, Tabletop Simulator, or printed handouts at A5/A6. Animated pieces are MP4, 16:9, seamlessly looping — drop them straight into OBS or a VTT scene header.

HOW IT ARRIVES
Download starts the moment you pay. You get a QuickStart set immediately, plus a PDF with your permanent link to the full Vault archive. Nothing is shipped.

LICENCE
For your own table and your own streams. Print as many copies as you like for personal use. Please don't resell, redistribute or share the files.

A NOTE ON THE PACKS
Some packs share a setting and a handful of characters overlap between them — the goblin campaign and the gothic village sets in particular. We would rather tell you that here than let you find it after you buy. The Vault is still by a wide margin the cheapest way to own all of it.

Not affiliated with, endorsed by, or licensed by Wizards of the Coast. No proprietary game content is reproduced here.

Because this is a digital download, it can't be returned — but if anything is wrong with a file, message us and we'll fix it.

— EndoCraft
```

> Der Absatz **„A NOTE ON THE PACKS"** ist Absicht. Käufer, die schon ein Pack besitzen, merken die Überschneidung sowieso — sie vorher zu nennen kostet uns nichts und verhindert genau die eine Bewertung, die ein neues Listing killt.

---

## Deine Schritte (in dieser Reihenfolge)

1. **Die 17 Packs als Verkäufer herunterladen.** Shop-Manager → Listings → jeweils „Bearbeiten" → Abschnitt Digitale Dateien → Datei anklicken.
2. **Entpacken und in einen Ordner `EndoCraft-Vault\` sortieren** — pro Pack ein Unterordner, benannt wie in der Tabelle oben. Doppelte Dateien (Sampler, Gothic-20 in Gothic-39) einfach mit überschreiben lassen.
3. **Dateizahl zählen** mit dem PowerShell-Befehl oben, Zahl an mich.
4. **Ordner zu Google Drive oder Dropbox hochladen**, Freigabe auf „Jeder mit dem Link", Link kopieren.
5. **Link an mich** — dann baue ich `EndoCraft-Vault-Access.pdf` und die 8 Listingbilder (Inhaltsübersicht aller 17 Packs, 163,83 $ → 34,99 $ Wertvergleich, Stil-Collage).
6. **Ich lege dann den Etsy-Entwurf an**, du lädst Bilder + die 2 Dateien hoch und veröffentlichst (0,20 $).

Schritt 1 und 2 kann nur du machen — ich komme an die Verkäufer-Downloads nicht heran.

---

## Quellen

* [How to Manage Your Digital Listings – Etsy Help](https://help.etsy.com/hc/en-us/articles/115015628347-How-to-Manage-Your-Digital-Listings) — 20 MB pro Datei, 5 Dateien pro Listing
* [Etsy Seller Policy — Our House Rules](https://www.etsy.com/legal/sellers/) — Wortlaut zu „off-platform transactions"
* [The Complete Guide to Etsy's Digital Download Limits — OrderFiles](https://orderfiles.app/blog/etsy-file-size-limit-guide)
* [How To Upload Large Files To Etsy — SelfWage](https://www.selfwage.com/how-to-upload-large-files-to-etsy/) — nennt den Link-Weg ausdrücklich als „last resort" wegen Leck-Risiko
* Listing-Beschreibungen 4533613076, 4513582241, 4520864968, 4471077244, 4528132675, 4521082994, 4524206674 — direkt aus dem Etsy-Editor bzw. den Live-Seiten gelesen (Überschneidungs-Nachweis)
