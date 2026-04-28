/* ════════════════════════════════════════════════════════════════════
 * EndoCraft · Shared Card-Layer Header
 * ════════════════════════════════════════════════════════════════════
 * Einheitlicher Header für alle Karten-Layer-Seiten:
 *   - /scroll/         (Karte erstellen)
 *   - /hall-of-fame/   (Trending + Voting)
 *   - /my-cards/       (eigene Sammlung)
 *   - /session/        (öffentliche Karten-Ansicht)
 *
 * Verwendung pro Seite:
 *   <div id="ec-header"></div>
 *   <div id="ec-header-extras">    <-- optional, page-spezifische Buttons
 *     <button>Anmelden</button>
 *   </div>
 *   <script src="/_shared/card-layer-header.js"></script>
 *
 * Active-State wird automatisch aus dem Pfad erkannt, kann via
 * data-active="..."-Attribut auf #ec-header überschrieben werden.
 * ════════════════════════════════════════════════════════════════════ */
(function() {
  'use strict';

  function detectActive() {
    const p = location.pathname.toLowerCase();
    if (p.includes('/hall-of-fame')) return 'hall-of-fame';
    if (p.includes('/scroll')) return 'scroll';
    if (p.includes('/my-cards')) return 'my-cards';
    if (p.includes('/session')) return 'session';
    return '';
  }

  const STYLES = `
    .ec-header {
      padding: 14px 28px;
      display: flex;
      align-items: center;
      gap: 18px;
      border-bottom: 1px solid var(--ec-h-border, rgba(255,255,255,0.08));
      position: sticky; top: 0; z-index: 100;
      background: var(--ec-h-bg, rgba(10,10,15,0.85));
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      flex-wrap: wrap;
    }
    .ec-header-brand {
      display: flex; align-items: center; gap: 10px;
      text-decoration: none;
      font-family: 'Syne', sans-serif;
      font-weight: 800;
      font-size: 17px;
      color: var(--ec-h-text, #f0eff4);
      letter-spacing: -0.01em;
      flex-shrink: 0;
    }
    .ec-header-brand img {
      width: 30px; height: 30px;
      border-radius: 7px;
      object-fit: contain;
    }
    .ec-header-sub {
      font-family: 'Cinzel', serif;
      font-size: 10px;
      letter-spacing: 2.5px;
      color: var(--ec-h-gold, #E8B86D);
      text-transform: uppercase;
      font-weight: 700;
      border-left: 1px solid var(--ec-h-border-strong, rgba(255,255,255,0.18));
      padding-left: 10px;
      margin-left: 4px;
    }
    .ec-header-nav {
      display: flex;
      align-items: center;
      gap: 4px;
      flex-wrap: wrap;
      flex: 1;
      min-width: 0;
    }
    .ec-header-link {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      font-family: 'DM Sans', sans-serif;
      font-size: 13px;
      font-weight: 500;
      color: var(--ec-h-text-dim, rgba(255,255,255,0.55));
      text-decoration: none;
      padding: 7px 12px;
      border-radius: 7px;
      transition: color .15s, background .15s;
      white-space: nowrap;
    }
    .ec-header-link:hover {
      color: var(--ec-h-text, #f0eff4);
      background: var(--ec-h-surface, rgba(255,255,255,0.04));
    }
    .ec-header-link.active {
      color: var(--ec-h-gold, #E8B86D);
      background: var(--ec-h-gold-dim, rgba(232,184,109,0.10));
    }
    .ec-header-link.cockpit {
      border: 1px solid var(--ec-h-border-strong, rgba(255,255,255,0.15));
      color: var(--ec-h-text, #f0eff4);
      margin-left: auto;
    }
    .ec-header-link.cockpit:hover {
      border-color: var(--ec-h-gold, #E8B86D);
      color: var(--ec-h-gold, #E8B86D);
    }
    .ec-header-extras {
      display: flex;
      align-items: center;
      gap: 10px;
      flex-shrink: 0;
    }
    .ec-header-extras:empty { display: none; }

    @media (max-width: 780px) {
      .ec-header { padding: 11px 16px; gap: 12px; }
      .ec-header-brand { font-size: 15px; }
      .ec-header-brand img { width: 26px; height: 26px; }
      .ec-header-sub { font-size: 9px; padding-left: 8px; margin-left: 2px; }
      .ec-header-link { font-size: 12px; padding: 6px 9px; }
      .ec-header-link.cockpit { margin-left: 0; }
    }
  `;

  function buildHTML(active, sub) {
    const link = (href, section, label, extraClass) => {
      const cls = ['ec-header-link'];
      if (extraClass) cls.push(extraClass);
      if (section && active === section) cls.push('active');
      return `<a href="${href}" class="${cls.join(' ')}" data-section="${section || ''}">${label}</a>`;
    };
    const subHtml = sub ? `<span class="ec-header-sub">${sub}</span>` : '';
    return `
      <a href="/" class="ec-header-brand" title="EndoCraft Home">
        <img src="/IMG_8431.PNG" alt="EndoCraft" onerror="this.style.display='none'">
        <span>EndoCraft${subHtml}</span>
      </a>
      <nav class="ec-header-nav">
        ${link('/scroll/', 'scroll', '✦ Karte erstellen')}
        ${link('/hall-of-fame/', 'hall-of-fame', '🏆 Hall of Fame')}
        ${link('/my-cards/', 'my-cards', '📚 My Collection')}
        ${link('/dm-studio/', null, '📖 Cockpit', 'cockpit')}
      </nav>
    `;
  }

  // Default-Sub pro Section. Kann via data-sub="…" am #ec-header überschrieben werden,
  // oder data-sub="" für gar kein Sub-Label.
  function defaultSubForActive(active) {
    if (active === 'hall-of-fame') return 'Hall of Fame';
    if (active === 'scroll') return 'Session Scroll';
    if (active === 'my-cards') return 'My Collection';
    if (active === 'session') return 'Card View';
    return '';  // Landing oder unbekannt → kein Sub
  }

  function injectStyles() {
    if (document.getElementById('ec-header-styles')) return;
    const style = document.createElement('style');
    style.id = 'ec-header-styles';
    style.textContent = STYLES;
    document.head.appendChild(style);
  }

  function init() {
    const slot = document.getElementById('ec-header');
    if (!slot) return;
    const active = slot.dataset.active || detectActive();
    // Sub-Label: data-sub="…" überschreibt, data-sub="" entfernt komplett, sonst Default für die Section
    const sub = slot.hasAttribute('data-sub') ? slot.dataset.sub : defaultSubForActive(active);
    slot.classList.add('ec-header');
    slot.innerHTML = buildHTML(active, sub);

    // Wenn ec-header-extras separat im DOM existiert, NACH dem nav anhängen
    const extras = document.getElementById('ec-header-extras');
    if (extras && extras.parentElement !== slot) {
      slot.appendChild(extras);
    }
  }

  injectStyles();
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
