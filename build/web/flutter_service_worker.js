'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "33dcf06fa1aab3383d90d418cd23ad51",
"assets/assets/akik.png": "09eb382e723c6670a95624194e877678",
"assets/assets/ametist.png": "4697e5569a075d090a4981575da9ecf5",
"assets/assets/angelico.png": "f85c73e1973c4161d4ff4dae8474a467",
"assets/assets/ant.png": "6401a9ce995ca1f7fa4101d1bd9b5e24",
"assets/assets/aot.jpeg": "0610de5f6db12a4bea2c9e4262e64b66",
"assets/assets/background.png": "b3f7c8d0629ed44a086d32784c979c9d",
"assets/assets/bg.png": "6f62b15b4deca1854239172f8069893d",
"assets/assets/bg2.png": "6db780d0011358a8dee45418650a4aa3",
"assets/assets/cat.png": "c5be738aa7d5926184117f7cb851ee20",
"assets/assets/clove.png": "aec933a004df953ee97835ac9da77ba9",
"assets/assets/clover.png": "cf046dfd14280edd66050584e2ad5c63",
"assets/assets/daisy.png": "b3197219b4a7b938b59a678c35602c64",
"assets/assets/dandelion.png": "345b7060ca415e166262279b7e157d9f",
"assets/assets/elephant.png": "025e4bbd56a9a344fdde54918778f29a",
"assets/assets/enterpage.png": "e5743363550f1e601da7a1ae13eb0f40",
"assets/assets/fal.png": "983bd16d33ed10f152036a9e3c0c21aa",
"assets/assets/fish.png": "0d9844ec0474616ab3f73c80af993184",
"assets/assets/gunlukicon.png": "2ccfafafeeef11badc0e0eb1de739d5b",
"assets/assets/ha.jpg": "32fbde69026934f77064def477dd68e6",
"assets/assets/homeicon.png": "4759f2f713680a2963aa913e02d14341",
"assets/assets/id.jpg": "3623179f6e0bc10d02df2820bf240522",
"assets/assets/instagram.png": "8fe9d904421d75aa48ff1265cddf844c",
"assets/assets/ivy.png": "b45395bd073627c8a809035dc33ef981",
"assets/assets/kuvars.png": "0ca7aabfaab81b5b48ab430f352f3b55",
"assets/assets/kuyu.gif": "d28fade037fc6267489afa0267c9501a",
"assets/assets/kuyuson.gif": "d1a6bb2a1719f41047810d8c18b61c52",
"assets/assets/lavender.png": "9b94ab6cc82f07ba6a48c0166511155a",
"assets/assets/leon.png": "b2b207dda6e17cd7559917cadde40f10",
"assets/assets/lilac.png": "51a43fa98d2a01b6ea2c677f6c1f6100",
"assets/assets/loading.gif": "a5b87538071552fcd0036b37f3c99a35",
"assets/assets/loginpage.png": "e28d916ce05720b5ccb0b67168c5e124",
"assets/assets/logo.png": "534ef78465728bbd9dbc4ed16c161314",
"assets/assets/mail.png": "8f0a6f39bccf47c058461a265109cc14",
"assets/assets/moon.png": "c8379f2fa79e55ef5d86880c9844452c",
"assets/assets/my.jpg": "f2019a99cb5d3408dd5bbfed9d064806",
"assets/assets/ok.jpeg": "b4a516acb381e3bc682bdfa05be7969f",
"assets/assets/owl.png": "cc163b5949406d2e4c637815027c5997",
"assets/assets/profilepic.png": "10107bd8686becb5644d568f9d4b36d3",
"assets/assets/sansicon.png": "3c0631a27067bc0d165a7564fce62d8d",
"assets/assets/selenyt.png": "d087affd563166ab9a90524807b9e639",
"assets/assets/signup.png": "67e0286f5f45bf0531b2e61c51630c4d",
"assets/assets/skyblue.png": "64385ec66d59da80177821f12b143ad7",
"assets/assets/skygreen.png": "315365cf4edf4facf15252e7d6edbaf6",
"assets/assets/skypurple.png": "16c19ba2815d2fe8888f32b19308e3e3",
"assets/assets/skyyellow.png": "ce227bf8201b224896d976045957a4eb",
"assets/assets/splash2.png": "91530096860ba1bd4425a1207501afd5",
"assets/assets/sun.png": "d959e76f7ec78251a336243b0e3fbd86",
"assets/assets/tarotarka.png": "7213f21dc06558e731723901a81c4d90",
"assets/assets/tarotcards/1.png": "29582b9dc4275c285fce1c7938a71e33",
"assets/assets/tarotcards/10.png": "29ee8cab62e8ac0567f118eb6291a799",
"assets/assets/tarotcards/11.png": "1ea814019aa3aa5ed6832f4712f65122",
"assets/assets/tarotcards/12.png": "dc9f11a7ed7118a32bae74ec3843eec9",
"assets/assets/tarotcards/13.png": "2a4b24ea6c3533bd715d7d1b9f827e80",
"assets/assets/tarotcards/14.png": "56beab0da1f6543f0342134c6f421c75",
"assets/assets/tarotcards/15.png": "ed1d4ba1fd054128433d415fe9430962",
"assets/assets/tarotcards/16.png": "7015c2cb9340c8ffe05bb2fe0a7740e7",
"assets/assets/tarotcards/17.png": "675c5a561590755e2222de137ec72985",
"assets/assets/tarotcards/18.png": "3fb08f14cf29ce3a9a8bf5026fdf3688",
"assets/assets/tarotcards/19.png": "b4a8b868655a67baf073393e0e546622",
"assets/assets/tarotcards/2.png": "cef664b343603fc34bc8ebb314853a11",
"assets/assets/tarotcards/20.png": "c19ea6c54ffd1dddcc7668e8ee3c1c50",
"assets/assets/tarotcards/21.png": "2b6727d6a96d5cfa8f602403632248b3",
"assets/assets/tarotcards/22.png": "babe12f59116e7c5a2d16ff7e516e15c",
"assets/assets/tarotcards/23.png": "7af9b2ce99766578b379ae9221d21073",
"assets/assets/tarotcards/24.png": "5a1872fae63684dd5b9bcec73b91d4a3",
"assets/assets/tarotcards/25.png": "820ee6e733f57236623155e36c8a8f63",
"assets/assets/tarotcards/26.png": "0c2aeba3f004c1b329f69e57907e061e",
"assets/assets/tarotcards/27.png": "ac0c4fb7fc5ac2bfcfb2bc0469deb44a",
"assets/assets/tarotcards/28.png": "bf199c30edc20c41c746a5c75c935120",
"assets/assets/tarotcards/29.png": "0c4345c9ec7c85e5a1f60cc8d6da89f1",
"assets/assets/tarotcards/3.png": "443818f6844b466b77aa038ea92b6360",
"assets/assets/tarotcards/30.png": "5a3fe70a66423790f199c71125ee2a7a",
"assets/assets/tarotcards/31.png": "3f3266b1f3c10d43b91a38a5f410360f",
"assets/assets/tarotcards/32.png": "6ea26c7caef8103d1981c86969970118",
"assets/assets/tarotcards/33.png": "37089935a1d55bb784049752876bf966",
"assets/assets/tarotcards/34.png": "3c0c91266ee484626541e50858fa1bfb",
"assets/assets/tarotcards/35.png": "de321af0321d1b6c40162ad168df46a2",
"assets/assets/tarotcards/36.png": "6ab4b03d09dc417d555f82f355c57d4c",
"assets/assets/tarotcards/37.png": "40fb613821571e90e5730761626b800d",
"assets/assets/tarotcards/38.png": "587e6f01b9ce6b94c00572d9ba889cf5",
"assets/assets/tarotcards/39.png": "abaea91d6f00d8bb8348b54ff7213c99",
"assets/assets/tarotcards/4.png": "81be3bdd4e77bb9e84ec69e3a0fd7e45",
"assets/assets/tarotcards/40.png": "42d5bc048d92bae22d81ca888edd45a9",
"assets/assets/tarotcards/41.png": "67b41647fea979e1fb6ad395d0bdebf8",
"assets/assets/tarotcards/42.png": "0315b8b2fcdb1c24760f424f7fc3e356",
"assets/assets/tarotcards/43.png": "8ba78d36976e2673ecce49c0bd436781",
"assets/assets/tarotcards/44.png": "96be86a5d60717e524cece0c809d284a",
"assets/assets/tarotcards/45.png": "612b40a3554e4d91a863b89e078e1007",
"assets/assets/tarotcards/46.png": "0e9d81b371c8eea2916c1ad14024654f",
"assets/assets/tarotcards/47.png": "dd612ec728a2e78b04d7d9d51dcb33c2",
"assets/assets/tarotcards/48.png": "1b61b65aab586d97c9639df95937ea3d",
"assets/assets/tarotcards/49.png": "79ea294e884b41f4c08c495dc8ed1c26",
"assets/assets/tarotcards/5.png": "afc15f78741819fbfc5d5e873cea5fb3",
"assets/assets/tarotcards/50.png": "5d633f081baf6306ab31da60af4d07b5",
"assets/assets/tarotcards/51.png": "454051c722db24ffb401db45449ed3ab",
"assets/assets/tarotcards/52.png": "c634dd30e630ca3b6948b9f49674e524",
"assets/assets/tarotcards/53.png": "1b5a9d07dbee207d34c401b2f8d46f44",
"assets/assets/tarotcards/54.png": "1d903b4cabbfe5026fc5c9abba09b876",
"assets/assets/tarotcards/55.png": "1d58dece65dea2c2b907deb38938a01f",
"assets/assets/tarotcards/56.png": "6a1394ea6a9083496e34d1e15c44e378",
"assets/assets/tarotcards/57.png": "17c413717af2098ceb73062c58cb4f40",
"assets/assets/tarotcards/58.png": "8d699978a4eaf3ea2607fbc22af431df",
"assets/assets/tarotcards/59.png": "7dafc9a38ec42745f047e207e436694d",
"assets/assets/tarotcards/6.png": "df2268bd6dbbadc5a2080fbe5ef9c615",
"assets/assets/tarotcards/60.png": "8fc6ffa4c37246d93778d3d8e109d62d",
"assets/assets/tarotcards/61.png": "095964bdb9af1d3857bb5429a9d54bcb",
"assets/assets/tarotcards/62.png": "2f70812ae124c3aac83d0a0e4b84d4ca",
"assets/assets/tarotcards/63.png": "7987c8cdb3a0fdb9022846a9873746f7",
"assets/assets/tarotcards/64.png": "81ed69949893d33277a9d18ed3bc5d2e",
"assets/assets/tarotcards/65.png": "20ab7f8d87af76577514e607de50ff30",
"assets/assets/tarotcards/66.png": "87575ae4696d4bd91afb7d5320b16daa",
"assets/assets/tarotcards/67.png": "39800756028ad0bb593f9dec096e4a5f",
"assets/assets/tarotcards/68.png": "0fab1784fc7eaf5f86cb3fa6da38c8f1",
"assets/assets/tarotcards/69.png": "d5f1897c5d4ea5dbd281d464ad19a7e1",
"assets/assets/tarotcards/7.png": "0d5268b357ab3dd9970a9f56cd15a1ed",
"assets/assets/tarotcards/70.png": "fd665480beba3d149a03ec546d2f7b5d",
"assets/assets/tarotcards/71.png": "4e8b0b3465208a51ef42ef58fb9b5791",
"assets/assets/tarotcards/72.png": "541833c690d7338faea887334bd2282d",
"assets/assets/tarotcards/73.png": "2d6bcee5400b07eb9f8ab3ad257f55cf",
"assets/assets/tarotcards/74.png": "2c5cd2a1146ef79ab1140cf116513e53",
"assets/assets/tarotcards/75.png": "0df3837040a7d8363cdb9b1f7116b334",
"assets/assets/tarotcards/76.png": "da68d1737677acee87114a0bdbcf0b9b",
"assets/assets/tarotcards/77.png": "7568f2bd54488c198952bca63ed146b3",
"assets/assets/tarotcards/78.png": "c6bfe798a6267de7b3cf9e850bcb6453",
"assets/assets/tarotcards/79.png": "7213f21dc06558e731723901a81c4d90",
"assets/assets/tarotcards/8.png": "554e5618a6a8da4f44c704138df20cc5",
"assets/assets/tarotcards/9.png": "665c3ba6d177926c103a20af05f452c4",
"assets/assets/taroticon.png": "bfebff7df8b80b0e8ecd862ae4f8dbc7",
"assets/assets/turtle.png": "f2379bd3d58f7abcca37709161a85079",
"assets/assets/tygereye.png": "d2117b49c91eac38d2e02340e5d74e52",
"assets/assets/wishcard.png": "91c7a8f4bf6aec857fae96c9527bb1dd",
"assets/assets/ya.jpg": "3118955bee5c54021889d87c6917d6b1",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "5908ba135e52ea97752efb46d1d4a274",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "99f29024aee8f4672a47cc3a81b9b84a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "48ce1bb8a42776caa951cb782d277730",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d8e9b6203ce2657c991f0b339ccb3a6d",
"assets/shaders/ink_sparkle.frag": "ec74b85cf5d5df08f5fceeab93065135",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ed40ddc5f47e3de0c22fc504bf9e2c5b",
"/": "ed40ddc5f47e3de0c22fc504bf9e2c5b",
"main.dart.js": "00482cf6b839926514521cfb30a673bf",
"manifest.json": "6e348859483215cb5658a251aebd589c",
"version.json": "3531d6612adf3ed7b587780c37a08614"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
