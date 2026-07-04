/* EndoCraft Studio — minimal service worker (installability + light offline shell) */
const CACHE = 'ec-studio-v1';
const SHELL = ['./', './index.html', './manifest.webmanifest', '../assets/logo-seal.png', '../assets/favicon-64.png'];
self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(SHELL)).catch(()=>{}));
  self.skipWaiting();
});
self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(ks => Promise.all(ks.filter(k=>k!==CACHE).map(k=>caches.delete(k)))));
  self.clients.claim();
});
self.addEventListener('fetch', e => {
  const req = e.request;
  if (req.method !== 'GET') return;
  // Navigations: network-first, fallback auf gecachte Shell
  if (req.mode === 'navigate') {
    e.respondWith(fetch(req).catch(() => caches.match('./index.html')));
    return;
  }
  // Sonst: cache-first, dann Netzwerk
  e.respondWith(caches.match(req).then(hit => hit || fetch(req)));
});
