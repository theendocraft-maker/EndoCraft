# Nächste Pinterest-Promotion — Kampagnen-Spec

Stand 2026-07-09 · Lehre aus letzter Kampagne: €27,93 auf „Consideration"-Ziel ohne Conversion-Tracking = kein messbarer Ertrag. Diese Kampagne dreht genau diese drei Fehler um: richtiges Ziel, Tracking an, bewiesenes Konzept im aktuellen Stil.

---

## 0. Pflicht-Gate (VOR dem Start) — sonst wieder Blindflug
- **Pinterest-Tag + Conversions-API installieren** und das **/free-Signup als Conversion-Event** anlegen.
- Code für /free schreibe ich (Base-Tag + Event) → Marco deployt + legt Tag-ID im Ads-Konto an.
- Ohne diesen Schritt gibt es keine Kampagne. Erfolg lässt sich sonst nicht messen und Pinterest kann nicht optimieren.

## 1. Ziel (Objective)
- **Conversions** (nicht Consideration/Awareness).
- Optimierungsevent: **/free-Signup** (Lead), nicht Kauf. Für kleinen Account günstiger + baut E-Mail-Liste → Nurture → Etsy.

## 2. Creative
- **Ein bewiesenes Konzept im aktuellen Stil.** Kandidaten (frisch generiert, 1800×2400):
  1. `01-tavern-hearth` — leere Taverne, Kaminglut (Konzept des Organik-#1 „Tavern After Closing")
  2. `02-tavern-bar` — Kerzenlicht-Tresen
  3. `03-misty-road` — neblige Straße (Svalich-Konzept)
  4. `04-fog-gate` — Torbogen im Nebel (Gates-of-Barovia-Hybrid)
- Vorgehen: die freigegebenen 2–4 zuerst **~1–2 Wochen organisch** laufen lassen → das Motiv mit der besten Save-/Klickrate wird das Ad-Creative. Dann ist es wieder „bewiesen", nur stil-aktuell.
- Overlay auf dem Ad-Pin: kurzer Value-Hook, z. B. „Free cinematic cutscene of YOUR character" + dezentes Siegel-Wasserzeichen.

## 3. Zielseite
- **endocraft.app/free** (Funnel ist gefixt: Cutscene-Hook + NPC-Pack als Bonus).
- UTM: `?utm_source=pinterest&utm_medium=cpc&utm_campaign=free_leadgen_2026q3`

## 4. Targeting
- **Interessen:** Dungeons & Dragons, Tabletop RPG, Fantasy Art, Roll20/VTT.
- **Keywords:** dnd, dungeons and dragons, curse of strahd, dnd character art, ttrpg, roll20, dnd maps, tavern, dungeon master.
- **Geo:** Start EN-Märkte (US/UK/CA/AU) — größte D&D-Kaufkraft; DE optional als 2. AdGroup.
- **Kein „Automated Campaign"-Blackbox** — manuelles Setup, damit Targeting & Budget kontrollierbar bleiben.

## 5. Budget & Laufzeit
- **€4/Tag**, Laufzeit min. 7 Tage (Lernphase braucht ~50 Conversions-Signale, realistisch bauen wir Richtung „genug Klicks für erste Reads").
- **Harter Stopp-Check nach ~€25–30 Spend.**

## 6. Erfolgswert (vorab definiert)
- **Primär:** Kosten pro /free-Signup. Zielkorridor **< €1,50/Lead** = weiterlaufen/skalieren; €1,50–3 = Creative/Targeting iterieren; > €3 = stoppen.
- **Sekundär:** Signup-Rate der Klicks (Landingpage-Conversion) ≥ 15 %.
- Vergleich gegen Organik-Baseline (die aktuell gratis +541 % Reichweite bringt).

## 7. Aufgabenverteilung
| Schritt | Wer |
|---|---|
| Creatives generieren + zur Freigabe | Claude ✅ (erledigt, wartet auf Marco) |
| Organik-Vortest schedulen | Claude ✅ |
| /free-Tracking-Code schreiben | Claude ✅ |
| Tag-ID anlegen / Ads-Konto-Config | Marco (mit Claude) |
| /free deployen | Marco |
| Kampagne bauen (Draft) | Claude ✅ |
| Kampagne scharf schalten / Budget | **Marco (Go nötig)** |

## 8. Warum das diesmal funktionieren kann
Letzte Kampagne: viel billige Reichweite, null Messbarkeit, kaputter Funnel. Jetzt: messbares Ziel, optimierbares Event, bewiesenes Motiv im aktuellen Look, reparierter Funnel, klarer Stopp-Check. Selbst wenn der Test „nein" sagt, ist er diesmal **auswertbar** — wir wissen dann warum.
