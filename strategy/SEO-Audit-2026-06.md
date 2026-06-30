# SEO-Audit endocraft.app — 30.06.2026

## Ehrliches Fazit zuerst
Dass die Subscribes bisher fast nur über Pinterest kommen, liegt **nicht an kaputter SEO** — sondern daran, dass eine junge Domain mit im Kern *einer* Funnel-Seite bei Google für umkämpfte D&D-Begriffe **monatelang nicht rankt**, egal wie sauber die Tags sind. Google-SEO braucht (a) Zeit/Domain-Autorität und (b) **indexierbare Inhalte**, die Long-Tail-Suchen abholen. Pinterest funktioniert, weil es eine *visuelle Suchmaschine* ist, in der neue Accounts schnell sichtbar werden. Pinterest ist also kein Notbehelf, sondern der für diese Phase richtige Kanal.

## Was schon gut war
- `/free/` (das Pinterest-Funnel-Ziel) hatte bereits: sauberer Title, Meta-Description, Open-Graph-Tags + OG-Bild 1200×630. Genau das steuert die Vorschau beim Pinnen/Teilen — das wichtigste On-Page-Asset war also vorhanden.

## Was ich gefixt habe (gestaged, muss deployed werden)
1. **robots.txt** (neu) — erlaubt Crawling, sperrt `/admin/`, verweist auf die Sitemap. (war 404)
2. **sitemap.xml** (neu) — listet `/free/` + `/studio/`. (war 404)
3. **`/studio/`** — hatte **keine** Description/OG/Canonical → ergänzt: Meta-Description, Canonical, vollständige Open-Graph- + Twitter-Card-Tags, eigenes OG-Bild `studio/og-image.jpg` (1200×630). Dadurch zeigt jeder geteilte Studio-Link jetzt eine saubere Vorschau.
4. **`/free/`** — Twitter-Card-Tags + **JSON-LD Organization-Schema** (Name, URL, Logo, verknüpfte Profile Pinterest/Instagram/Etsy) ergänzt → Rich-Result-fähig, klare Entitäts-Signale für Google.

Alles unsichtbar (nur `<head>` + 2 neue Dateien) — **kein Design geändert**. Wirkt erst nach `deploy.bat`.

## Der eigentliche Wachstums-Hebel: Inhalte
Damit organische Google-Suche überhaupt zu greifen beginnt, braucht es ein paar **indexierbare Seiten**, die echte Suchanfragen bedienen — z.B.:
- „free D&D character art", „D&D villain portrait generator", „cinematic D&D battle scene", „dungeon master visual tools", „D&D session intro video".
- Format: ein kleiner Blog/Ressourcen-Bereich (`/blog/` oder `/resources/`) mit je einem Artikel/Tool pro Long-Tail-Thema, der jeweils sanft auf `/free/` + `/studio/` führt.
Das ist eine **Content-Entscheidung für dich** — sag, ob ich dafür einen Plan + erste Entwürfe aufsetzen soll.

## To-Approve / nächste Schritte
- [ ] Deploy (`deploy.bat`) → dann verifiziere ich live, dass robots/sitemap 200 liefern und die Tags greifen.
- [ ] Sitemap bei Google Search Console einreichen (du; Konto nötig) — sag Bescheid, ich gebe dir die Schritte.
- [ ] Entscheiden: Content-Bereich aufbauen? (der eigentliche organische Hebel)
- [ ] Optional: die alten `privacy.html`/`terms.html` im Root mit den neuen `/legal`-Seiten konsolidieren.
