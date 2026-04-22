# EndoCraft Prompt-Template für Character-Shots
**Verbindlicher Standard für alle TikTok-Spots + Card-Bilder ab 2026-04-22**

Jeder neue Spot (Series-Folge) nutzt 2 Shots für einen Character:
1. **Moment-Shot** (close-up, reaction/action) — zeigt DEN Moment
2. **Card-Shot** (medium portrait) — zeigt den Character für das Card-Artwork

Beide Shots müssen dieselbe Person darstellen. Das funktioniert nur wenn wir einen **Character Bible** definieren und in BEIDEN Prompts identisch spiegeln.

---

## STRUKTUR (Master Bildstil-Formel)

```
[Shot Type] + [Character Bible] + [Emotion] + [Environment] + [Lighting] + [Fixed Suffix]
```

Jeder Block muss explizit im Prompt stehen. Alle 6 Blöcke = Prompt ist ready.

---

## 1 · SHOT TYPE

**Moment-Shot:** `Extreme close-up portrait shot.`
**Card-Shot:** `Medium shot portrait, framed from head to waist.`

---

## 2 · CHARACTER BIBLE (identisch in beiden Shots)

Füll dieses Template aus einmal pro Character, dann copy-paste in beide Prompts:

```
[AGE]-year-old [GENDER] [RACE] [CLASS] named [NAME],
[FACE SHAPE] face with [FACIAL FEATURES — cheekbones, jawline, etc.],
[RACIAL MARKERS — pointed ears, horns, tusks, etc.],
[HAIR — length, color, texture, current state],
[SKIN — color, marks, textures],
[EYES — size, color, shape, expression baseline],
[EYEBROWS — thin/thick, color],
[SIGNATURE DETAIL — pendant, tattoo, scar, birthmark],
[OUTFIT — material, color, style, condition, detailed embroidery or patterns]
```

**Beispiel (Lyrin, Folge 1 NAT 1):**
```
28-year-old female half-elf wizard named Lyrin,
oval face with delicate high cheekbones,
pointed elven ears clearly visible,
long flowing dark chestnut-brown hair with subtle wavy texture, ends singed black,
pale fair skin with distinct soot smudges across left cheek and bridge of nose,
large bright hazel eyes,
thin dark eyebrows,
small silver moon-and-star pendant on thin chain at throat,
midnight blue wizard robe with fine silver celestial embroidery (stars, moons, constellations), now tattered and burned at shoulders and cuffs
```

**Wichtig:** ~150-250 Wörter Character Bible. Nicht zu kurz (Seedream generiert dann generisch), nicht zu lang (Prompt-Token-Limit).

---

## 3 · EMOTION

Shot-specific. Muss zum narrative beat passen.

**Moment-Shot:** raw, extreme, in-the-moment
- "raw embarrassed shock, catastrophic moment just occurred, frozen in time"
- "triumphant disbelief, blade still raised, dust falling"
- "grief-stricken loss, tears unshed, jaw clenched"

**Card-Shot:** reflective, character-defining
- "contemplative weary dignity, subtle embarrassed half-smile, survived-something-terrible expression, quietly resilient"
- "hard-won triumph, eyes burning with conviction, chin slightly raised"
- "haunted memory, distant gaze, softened posture"

---

## 4 · ENVIRONMENT

Reinforces die Story des Moments. **Concrete, specific, narrative-loaded.**

- **Moment-Shot:** wo der Moment passierte (dungeon aftermath, forest glade, tavern fight)
- **Card-Shot:** wo der Character ruht/reflektiert (arcane chamber, campfire, hillside overlook)

Gute Env-Details:
- "smoldering scorch marks, ember particles drifting"
- "blood-stained stone altar, torchlight flickering"
- "frost-covered pine branches, moonlit snow"

Vermeide generisch ("fantasy background") — immer specific.

---

## 5 · LIGHTING

Reinforces Emotion. Explizit benennen:

- "dramatic cinematic chiaroscuro, strong key-light from below-left with warm amber tone, deep shadows"
- "warm dramatic fantasy lighting from front-left, soft volumetric light rays"
- "cold moonlight from above, stark shadows, blue color grade"
- "golden hour backlight, rim-lit silhouette, warm haze"

Plus shot-specific composition:
- **Moment-Shot:** "shallow depth of field with bokeh in foreground, face fully in focus"
- **Card-Shot:** "face positioned in upper third of vertical frame, generous empty space below for text overlay, darker vignette along bottom third, centered composition"

---

## 6 · FIXED SUFFIX (immer am Ende)

```
cinematic fantasy, photorealistic, sharp focus, 8K, shallow depth of field, no text, no watermark, no blur, no deformed hands
```

**Plus shot-spezifische Negative Prompts:**

**Moment-Shot** (wenn Projektile/Spells involved):
- `no visible [spell/projectile], no open flames in frame, no magical effects in frame`
→ Seedream ist SCHLECHT bei animierten Spells. Zeig nur Aftermath (scorch marks, embers, ruined ground), NIE den aktiven Zauber.

**Card-Shot** (wenn Character Gegenstand hält):
- `no hands in frame, no objects held in hands`
→ Seedream patzt bei Hand-Grip (weapons, wands, cups). Nutze Alternative: weapon/wand "at her side", "sheathed at belt", "visible hanging at waist".

---

## CONSISTENCY-CHECK

Bevor Prompt raus: Character Bible zwischen Shot 1 und Shot 2 identisch? Check:
- Same age ✓
- Same race + class ✓
- Same hair (color + length + texture + current state) ✓
- Same skin tone + marks ✓
- Same eye color + eyebrows ✓
- Same signature detail (pendant, tattoo, scar) ✓
- Same outfit (color + material + pattern + condition) ✓

Wenn ein Detail abweicht → Seedream rendert unterschiedliche Personen.

---

## CHARACTER-ROSTER (für Series-Planung)

Jede Folge = neuer Character. Füll beim Planen einer Folge zuerst die Character Bible, dann die 2 Prompts:

| Folge | Thema | Character | Race/Class/Age | Signature |
|---|---|---|---|---|
| 1 | Nat 1 | **Lyrin** | Half-Elf Wizard · 28 | silver moon-and-star pendant · midnight blue robe |
| 2 | Nat 20 | Torrik | Dragonborn Paladin · ? | ? |
| 3 | Worst DM Call | Mira | Tiefling Warlock · ? | ? |
| 4 | Character Death | Brenn | Dwarf Cleric · ? | ? |
| 5 | Inside Joke | Pippa | Halfling Rogue · ? | ? |
| 6 | Wild Magic Fail | Kaelan | Human Sorcerer · ? | ? |
| 7 | Bard Inspiration | **Caspian** | Harengon Bard · ? | lute · forest green coat · gold trim |

---

## TL;DR — Checkliste pro Character

1. ☐ Name + Race + Class + Age + Gender festlegen
2. ☐ Character Bible ausfüllen (~200 Wörter, alle Features)
3. ☐ Moment-Shot Prompt zusammenbauen: Shot Type + Bible + Raw Emotion + Specific Env + Dramatic Lighting + Suffix + technical Negative Prompts
4. ☐ Card-Shot Prompt: Medium Shot + selbe Bible + Reflective Emotion + Resting Env + Cinematic Lighting + Suffix + "no hands in frame"
5. ☐ Consistency-Check (alle Features identisch zwischen beiden Prompts)
6. ☐ Generate → falls Character nicht konsistent aussieht → re-roll oder Bible enger zusammenziehen

---

*EndoCraft — Some moments are too legendary to forget.*
