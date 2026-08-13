const CACHE = 'camg-v9';
const ASSETS = ['./','./index.html','./module-1.html','./latin.html','./lecon-modele.html','./enfant.html','./manifest.json','./images/daniel-icon.png','./images/francais-illustre.jpg','./images/m1-l1.jpg','./images/m1-l2.jpg','./images/m1-l3.jpg','./images/enfant-jeux.jpg','./audio/m1-l1-enseignement.mp3','./audio/m1-l1-ex1.mp3','./audio/chorale-ensemble.mp3','./audio/enfant-lecon1.mp3','./audio/tuto1.mp3','./audio/tuto2.mp3','./audio/tuto3.mp3','./audio/scene1.mp3','./images/tuto1.jpg','./images/tuto2.jpg','./images/tuto3.jpg','./images/scene1.jpg'];
self.addEventListener('install', e=>{
  e.waitUntil(caches.open(CACHE).then(c=>c.addAll(ASSETS)));
  self.skipWaiting();
});
self.addEventListener('activate', e=>{
  e.waitUntil(caches.keys().then(keys=>Promise.all(keys.filter(k=>k!==CACHE).map(k=>caches.delete(k)))));
  self.clients.claim();
});
self.addEventListener('fetch', e=>{
  // PAGES : toujours le réseau d'abord (version la plus récente garantie), cache seulement si hors connexion
  if(e.request.mode==='navigate'){
    e.respondWith(
      fetch(e.request).then(res=>{ const copy=res.clone(); caches.open(CACHE).then(c=>c.put(e.request,copy)); return res; })
      .catch(()=>caches.match(e.request).then(c=>c||caches.match('./index.html')))
    );
    return;
  }
  // MÉDIAS : cache d'abord (hors connexion), mise à jour en arrière-plan
  e.respondWith(
    caches.match(e.request).then(cached=>{
      const fetchPromise = fetch(e.request).then(res=>{ if(res.ok) caches.open(CACHE).then(c=>c.put(e.request,res.clone())); return res; }).catch(()=>cached);
      return cached || fetchPromise;
    })
  );
});
