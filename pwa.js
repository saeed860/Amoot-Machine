/* Amoot Machine PWA install experience */
(function(){
  'use strict';
  if (window.__AMOOT_PWA_INITIALIZED) return;
  window.__AMOOT_PWA_INITIALIZED = true;

  var DISMISS_KEY = 'amoot_pwa_prompt_dismissed_until';
  var DISMISS_DAYS = 14;
  var deferredPrompt = null;
  var promptEl = null;
  var helpEl = null;
  var installBtn = null;
  var isIOS = /iphone|ipad|ipod/i.test(navigator.userAgent) ||
    (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1);
  var isStandalone = window.matchMedia('(display-mode: standalone)').matches ||
    window.navigator.standalone === true;

  function isMobile() {
    return window.matchMedia('(max-width: 768px)').matches ||
      /android|iphone|ipad|ipod/i.test(navigator.userAgent);
  }
  function dismissed() {
    try { return Number(localStorage.getItem(DISMISS_KEY) || 0) > Date.now(); }
    catch (_) { return false; }
  }
  function markDismissed() {
    try { localStorage.setItem(DISMISS_KEY, String(Date.now() + DISMISS_DAYS * 86400000)); }
    catch (_) {}
  }
  function hidePrompt(permanent) {
    if (!promptEl) return;
    promptEl.classList.remove('is-visible');
    window.setTimeout(function(){ if (promptEl) promptEl.hidden = true; }, 260);
    if (permanent) {
      try { localStorage.removeItem(DISMISS_KEY); } catch (_) {}
    }
  }
  function showHelp() {
    if (!helpEl) return;
    helpEl.innerHTML = isIOS
      ? 'برای نصب، دکمه <strong>اشتراک‌گذاری</strong> مرورگر Safari را بزنید و گزینه <strong>Add to Home Screen</strong> یا «افزودن به صفحه اصلی» را انتخاب کنید.'
      : 'در مرورگر Chrome، منوی سه‌نقطه را باز کنید و گزینه <strong>Install app</strong> یا «نصب برنامه» را انتخاب کنید.';
    helpEl.classList.add('is-open');
    installBtn.textContent = 'متوجه شدم';
    installBtn.setAttribute('aria-expanded', 'true');
  }
  function buildPrompt() {
    if (promptEl || !document.body) return;
    promptEl = document.createElement('aside');
    promptEl.className = 'amoot-pwa-prompt';
    promptEl.hidden = true;
    promptEl.setAttribute('role', 'region');
    promptEl.setAttribute('aria-label', 'نصب اپلیکیشن آموت ماشین');
    promptEl.innerHTML =
      '<button type="button" class="amoot-pwa-close" aria-label="بستن">×</button>' +
      '<img class="amoot-pwa-icon" src="./assets/amoot-logo.png" alt="آموت ماشین" width="44" height="44">' +
      '<div class="amoot-pwa-copy"><span class="amoot-pwa-title">نصب اپلیکیشن آموت ماشین</span>' +
      '<span class="amoot-pwa-subtitle">دسترسی سریع‌تر؛ مانند یک اپلیکیشن</span><div class="amoot-pwa-help"></div></div>' +
      '<button type="button" class="amoot-pwa-install">نصب</button>';
    document.body.appendChild(promptEl);
    helpEl = promptEl.querySelector('.amoot-pwa-help');
    installBtn = promptEl.querySelector('.amoot-pwa-install');
    promptEl.querySelector('.amoot-pwa-close').addEventListener('click', function(){
      markDismissed();
      hidePrompt(false);
    });
    installBtn.addEventListener('click', async function(){
      if (helpEl.classList.contains('is-open')) {
        hidePrompt(false);
        markDismissed();
        return;
      }
      if (deferredPrompt) {
        deferredPrompt.prompt();
        try {
          var choice = await deferredPrompt.userChoice;
          if (choice && choice.outcome === 'accepted') hidePrompt(true);
        } catch (_) {}
        deferredPrompt = null;
        return;
      }
      showHelp();
    });
  }
  function reveal() {
    if (!isMobile() || isStandalone || dismissed()) return;
    buildPrompt();
    if (!promptEl) return;
    promptEl.hidden = false;
    window.requestAnimationFrame(function(){ promptEl.classList.add('is-visible'); });
    installBtn.textContent = deferredPrompt ? 'نصب' : (isIOS ? 'راهنمای نصب' : 'نصب');
  }

  window.addEventListener('beforeinstallprompt', function(event){
    event.preventDefault();
    deferredPrompt = event;
    if (promptEl && !promptEl.hidden) installBtn.textContent = 'نصب';
  });
  window.addEventListener('appinstalled', function(){
    deferredPrompt = null;
    hidePrompt(true);
  });

  if ('serviceWorker' in navigator && location.protocol === 'https:') {
    window.addEventListener('load', function(){
      navigator.serviceWorker.register('./sw.js', {scope:'./'}).catch(function(error){
        console.warn('Amoot PWA service worker registration failed:', error);
      });
    });
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function(){ window.setTimeout(reveal, 1100); });
  } else {
    window.setTimeout(reveal, 1100);
  }
})();
