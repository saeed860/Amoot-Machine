/* Amoot Machine service worker - deliberately excludes account/API data */
'use strict';
const CACHE_NAME = 'amoot-shell-v2';
const SHELL_URL = new URL('./index.html', self.registration.scope).toString();
const CORE_URLS = [
  SHELL_URL,
  new URL('./manifest.webmanifest', self.registration.scope).toString(),
  new URL('./assets/pwa-icon-192.svg', self.registration.scope).toString(),
  new URL('./assets/pwa-icon-512.svg', self.registration.scope).toString()
];
self.addEventListener('install', event => {
  event.waitUntil(caches.open(CACHE_NAME).then(cache => cache.addAll(CORE_URLS)).then(() => self.skipWaiting()));
});
self.addEventListener('activate', event => {
  event.waitUntil(caches.keys().then(keys => Promise.all(
    keys.filter(key => key.startsWith('amoot-shell-') && key !== CACHE_NAME).map(key => caches.delete(key))
  )).then(() => self.clients.claim()));
});
self.addEventListener('fetch', event => {
  const request = event.request;
  if (request.method !== 'GET') return;
  const url = new URL(request.url);
  if (url.origin !== self.location.origin) return;
  if (/\/(?:api|auth|admin|supabase)(?:\/|$)/i.test(url.pathname)) return;

  if (request.mode === 'navigate') {
    if (!/(?:^|\/)index\.html$/.test(url.pathname) && !url.pathname.endsWith('/')) return;
    event.respondWith(fetch(request).then(response => {
      if (response && response.ok) {
        const copy = response.clone();
        caches.open(CACHE_NAME).then(cache => cache.put(SHELL_URL, copy));
      }
      return response;
    }).catch(() => caches.match(SHELL_URL)));
    return;
  }

  if (/\.(?:css|js|png|jpe?g|webp|svg|woff2?|ttf|ico|webmanifest)$/i.test(url.pathname)) {
    event.respondWith(caches.match(request).then(cached => {
      const update = fetch(request).then(response => {
        if (response && response.ok) {
          const copy = response.clone();
          caches.open(CACHE_NAME).then(cache => cache.put(request, copy));
        }
        return response;
      });
      return cached || update;
    }));
  }
});
