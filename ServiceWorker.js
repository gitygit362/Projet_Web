const assets = [
    '/Projet_Web/'
];

self.addEventListener('install', evt => { 
    evt.waitUntil( caches.open("easy-stage-cache").then(cache => {
        cache.addAll(assets);
    })
    )
});

self.addEventListener('activate', evt => {
    console.log('le Service Worker a été installé ');
});


//fetch event afin de répondre quand on est en mode hors ligne.
self.addEventListener('fetch', function(event) {
    event.respondWith(
    caches.open('easy-stage-cache').then(function(cache) {
    return cache.match(event.request).then(function (response) {
    return response || fetch(event.request).then(function(response) {
    cache.put(event.request, response.clone());
    return response;
    });
    });
    })
    );
    });

    self.addEventListener('message', function(event) {
        if (event.data && event.data.action === 'clearCache') {
            // Effacer le cache ou les données stockées
            caches.open('easy-stage-cache').then(function(cache) {
                cache.keys().then(function(keys) {
                    keys.forEach(function(key) {
                        cache.delete(key);
                    });
                });
            });
        }
    });