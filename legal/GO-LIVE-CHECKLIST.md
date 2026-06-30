# EndoCraft — Go-Live-Checkliste (echter Verkauf)

> Kein Rechts-/Steuerberatung. Anmeldung + §19 final mit Gewerbeamt/Finanzamt bzw. Steuerberater abklären.

## 1. Anmeldung (deine Aufgabe)
- [ ] **Gewerbe anmelden** beim Gewerbeamt deiner Stadt (oft online). Kosten ~20–65 €. Pflicht, sobald mit Gewinnabsicht verkauft wird — unabhängig von der Größe.
- [ ] **Fragebogen zur steuerlichen Erfassung** beim Finanzamt (über ELSTER). Dort **Kleinunternehmerregelung §19 UStG** ankreuzen → keine Umsatzsteuer bis 25.000 € Umsatz (Vorjahr) / 100.000 € (laufendes Jahr).
- [ ] Du erhältst eine **Steuernummer** → für Impressum/Rechnungen.

## 2. Rechtstexte holen (geprüft, Abmahnschutz)
- [ ] **Impressum**: eRecht24 Impressum-Generator (kostenlos).
- [ ] **AGB** (für digitale Inhalte/Guthaben): Händlerbund oder eRecht24.
- [ ] **Widerrufsbelehrung** (digitale Inhalte, kein körperlicher Datenträger): Händlerbund/eRecht24.
- [ ] **Datenschutzerklärung** (DSGVO): eRecht24 Datenschutz-Generator — muss Stripe, Supabase, Railway, GitHub Pages, Resend, Cloudflare, Plausible, AIML nennen.

## 3. Einbauen (mache ich)
- [x] Gestylte Seiten gebaut: `/legal/impressum.html`, `/agb.html`, `/datenschutz.html`, `/widerruf.html`
- [x] Footer-Links im Studio
- [x] Pflicht-Checkbox im Checkout (ausdrückliche Zustimmung + Widerrufs-Verzicht bei sofortiger Nutzung)
- [ ] Du schickst mir die geprüften Texte → ich füge sie in die Seiten ein (ersetze die Platzhalter)
- [ ] Optional: gleiche Footer-Links auf der Landing-Page (root index.html)

## 4. Stripe scharf schalten (deine Aufgabe)
- [ ] Stripe-Konto **aktivieren** (Geschäftsdaten, Identität, Bankverbindung für Auszahlungen).
- [ ] Auf **Live-Modus** umschalten → neue Keys.
- [ ] `STRIPE_SECRET_KEY` in Railway auf `sk_live_…` umstellen.
- [ ] Im **Live-Modus** einen neuen Webhook anlegen (URL `…/api/stripe-webhook`, Event `checkout.session.completed`) → dessen `whsec_…` als Railway `STRIPE_WEBHOOK_SECRET` (live) setzen.
- [ ] In Stripe die **Terms-/Widerruf-URLs** hinterlegen (Branding/Checkout-Settings).

## 5. Final
- [ ] Preise final bestätigen (aktuell Starter €4,99 / Plus €9,99 / Pro €19,99; Bild 3 Cr, Clip 8 Cr).
- [ ] Deploy → ein echter Test-Kauf mit echter Karte (kleiner Betrag) → Gutschrift prüfen → fertig.
