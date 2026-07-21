# DM Studio als itch-„Tool" — Scoping & Empfehlung
*Read-only-Analyse, nichts geändert, nichts live. Stand: 2026-07-21.*

## Kurz: Ja, es passt — aber nicht so, wie es jetzt gebaut ist.
itchs **Tools**-Kategorie nimmt browserbasierte HTML5-Tools (hosted oder als Upload, laufen im itch-iframe). Unser `dm-studio/index.html` ist ein echtes, eigenständiges Web-Tool („Your AI Co-DM": Character Wizard, Standort-Briefings, Highlight-/Karten-Pool, Party-Album). Das ist genau das Format, das dort funktioniert — und strategisch stark: es zeigt, dass wir nicht nur Clips verkaufen, sondern *Werkzeuge bauen*.

## Das Problem: es hängt an DEINEM Backend
Der Code spricht mit einem Ziel: deinem **Supabase**-Projekt (`…supabase.co`) — 22 fetch-Calls, 57 Login/Auth-Stellen. Öffentlich gelistet heißt das:

1. **Offener Kostenhahn.** Jeder itch-Nutzer läuft über *dein* Supabase + (via Edge Functions) vermutlich deine AI-Generierung → fremde Leute verbrauchen dein Backend-Kontingent und deine AIML/Kling-Credits. Das ist der eigentliche Blocker.
2. **Login-Pflicht.** 57 Auth-Stellen — ohne Anmeldung ist das Tool auf itch weitgehend leer. Schlechter erster Eindruck.

## ⚠️ Sicherheits-Flag (vor JEDER öffentlichen Listung prüfen)
Die ausgelieferte `index.html` enthält **1× `service_role`** und **2 JWT-förmige Strings** (Werte habe ich bewusst NICHT ausgelesen/gespeichert). Der Supabase **anon key** ist öffentlich unbedenklich — der **service_role key** ist es NICHT: liegt er im Client, kann jeder deine komplette DB lesen/schreiben, an Row-Level-Security vorbei. **Bevor irgendwas public geht, müssen wir sicher sein, dass KEIN service_role-Key im Datei-Build steckt.** Das prüfst am besten du (oder ich, wenn du willst — ich gebe dir nur „drin/nicht drin" zurück, nie den Wert).

## Empfehlung: „Demo-Mode" auf itch, Vollversion auf endocraft.app
Der saubere itch-Play ist eine **Guest-/Demo-Fassung** des Studios:
- kein Login, keine Live-AI-Calls, keine Backend-Kosten;
- läuft mit Beispiel-/Sample-Daten (im Code gibt's schon 39 „guest/demo/sample"-Stellen — da lässt sich anknüpfen);
- zeigt Character Wizard + Briefings als spielbare Vorschau;
- CTA: „Full Co-DM at endocraft.app".

Das ist kostenlos zu betreiben, fällt in itchs Tools-Kategorie, demonstriert unsere Stärke und leitet auf das echte Produkt. Die kostenpflichtige/gebundene Vollversion bleibt hinter Login auf endocraft.app.

## Aufwand / nächste Schritte (nichts davon ohne deine Freigabe)
1. **Du/ich:** service_role-Check (Sicherheit zuerst).
2. **Ich:** eine `studio-demo.html` bauen — Auth & Live-Calls raus, Sample-Daten rein, CTA an. Als Preview, du gibst frei.
3. **Ich:** itch-Tool-Listing-Entwurf (Titel, Beschreibung, Screenshots, Tags) — zur Freigabe, geht nicht ungefragt live.
4. **Du:** hochladen/veröffentlichen.

**Realistisch:** Schritt 2 ist echte Dev-Arbeit (Auth-Pfad sauber rausschneiden, ohne das Tool zu zerlegen) — kein 5-Minuten-Ding, aber gut machbar. Sag, ob ich mit dem service_role-Check + der Demo-Fassung starten soll.
