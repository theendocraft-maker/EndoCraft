# Google Search Console — Setup-Runbook (machen wir zusammen)

Ziel: endocraft.app bei Google Search Console (GSC) verifizieren → Sitemap einreichen → Indexierung der 7 Pillar-Seiten beantragen. Das ist der Schritt, der die Content-Arbeit in organischen Traffic übersetzt.

Stand der Recon (autonom geprüft):
- robots.txt verweist korrekt auf `https://endocraft.app/sitemap.xml` ✓
- Sitemap live mit **7 Resource-Seiten** ✓
- Noch **keine** GSC-Verifizierung vorhanden (kein Meta-Tag, keine Verify-Datei) → sauberer Erststart

---

## Empfohlener Weg: HTML-Datei-Methode (kein DNS nötig)

Läuft komplett über unseren normalen Deploy — du liest mir nur einen Dateinamen vor, ich lege die Datei an, du deployst.

**Schritt 1 — Property anlegen**
- Öffne `https://search.google.com/search-console`
- „Property hinzufügen" → Kachel **„URL-Präfix"** (NICHT „Domain")
- Eintragen: `https://endocraft.app/` → Weiter

**Schritt 2 — Verify-Datei (hier kommst du zu mir)**
- Google zeigt mehrere Methoden → wähle **„HTML-Datei"**
- Es erscheint ein Download wie `google1a2b3c4d…html`
- **Lies mir den genauen Dateinamen vor** (das `googleXXXXXXXX.html`)
- → Ich lege die Datei sofort in den Web-Root (`EndoCraft/googleXXXXXXXX.html`) mit dem korrekten Inhalt an
- Du **deployst** (wie immer)
- Gegencheck (mache ich): `https://endocraft.app/googleXXXXXXXX.html` muss 200 liefern
- Zurück in GSC → **„Bestätigen"**

**Schritt 3 — Sitemap einreichen**
- Linkes Menü → **„Sitemaps"**
- Feld: `sitemap.xml` → **„Senden"**
- Status sollte „Erfolgreich" werden (kann ein paar Minuten dauern)

**Schritt 4 — Indexierung der 7 Seiten beschleunigen**
- Oben die **URL-Prüfung** nutzen, je URL einfügen → „Indexierung beantragen":
  1. https://endocraft.app/free/
  2. https://endocraft.app/resources/visualize-your-dnd-character/
  3. https://endocraft.app/resources/dnd-villain-ideas/
  4. https://endocraft.app/resources/free-dnd-character-art/
  5. https://endocraft.app/resources/describe-dnd-locations/
  6. https://endocraft.app/resources/cinematic-dnd-boss-fights/
  7. https://endocraft.app/resources/homebrew-monster-ideas/
  8. https://endocraft.app/resources/dnd-session-zero-ideas/
- (Studio-Seite `https://endocraft.app/studio/` optional dazu.)

Fertig. Danach liefert GSC nach einigen Tagen die ersten Impressions/Klicks + zeigt, für welche Suchbegriffe die Seiten ranken — direkte Datengrundlage für die nächste Prompt-/Content-Iteration.

---

## Alternative: Domain-Property (TXT-Record) — falls du es lieber sauber für die ganze Domain willst

Deckt alle Subdomains + http/https ab, braucht aber Zugriff beim DNS-Anbieter.
- GSC → „Property hinzufügen" → Kachel **„Domain"** → `endocraft.app`
- Google zeigt einen **TXT-Record** `google-site-verification=…`
- Beim DNS-Anbieter (vermutlich **Cloudflare** nach dem Mail-Umzug — bestätigen wir live) einen TXT-Record anlegen:
  - Type: `TXT`, Name: `@` (bzw. `endocraft.app`), Content: der `google-site-verification=…`-String, TTL: Auto
  - Bei Cloudflare: **Proxy/Orange-Cloud spielt für TXT keine Rolle** (TXT wird nie proxied)
- ~Minuten warten → in GSC „Bestätigen"
- Dann Schritt 3 + 4 wie oben.

Bei der Cloudflare-Variante helfe ich dir live Feld für Feld.

---

## Was ich beim gemeinsamen Durchgang übernehme
- Verify-Datei anlegen, sobald du den Dateinamen vorliest
- Nach deinem Deploy gegenchecken, dass die Datei + Sitemap sauber erreichbar sind
- Die 8 URLs zum Reinkopieren bereithalten (oben)
- Bei DNS/Cloudflare jeden Schritt ansagen
