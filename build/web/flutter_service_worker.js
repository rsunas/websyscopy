'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9846ba54e597f1c1cdbaa5e548d171f0",
"assets/AssetManifest.bin.json": "02180eeaa022947c7558a680e0d77180",
"assets/AssetManifest.json": "c736245849f0fcb8c11e8b17268821bf",
"assets/assets/AccountInfo/Change.png": "ddb22a731f576f93e7cc98fc2f66d214",
"assets/assets/AccountInfo/Edit.png": "fbf5f65df743a01d4557cfa4312980fe",
"assets/assets/AccountInfo/Logo.png": "9cc4da77707ae2fa22a8efe15afbb7d6",
"assets/assets/activities.png": "6abd25f5c0b0cd9c441199a47ac910e9",
"assets/assets/Admin/Address.png": "14920e0bb6a6e41213902a11940d57c7",
"assets/assets/Admin/Authenticate.png": "2fee3d61d9281a3421d371cbe4d3cb05",
"assets/assets/Admin/BlackLogo.png": "6a6314d160f0b88c840905b58c263829",
"assets/assets/Admin/Call.png": "20574eb5d9d9b806a3085c58b73d46fc",
"assets/assets/Admin/Change.png": "18e36c83509b20168cb01e8af31b94e7",
"assets/assets/Admin/Contain.png": "ab0be6d3e2a8656a3e249126cc1de9c5",
"assets/assets/Admin/Edit.png": "4acf224887e1c01a1d1aa485ade2e236",
"assets/assets/Admin/Email.png": "5f384eccaf3348e407f2fdd6c1add380",
"assets/assets/Admin/Sample.png": "aa43b2791b1fa973480eb5b6c9faea83",
"assets/assets/Admin/SMS.png": "0f1c235f7897407fdddd59c1ba284659",
"assets/assets/Admin/Success.png": "e0bfd92d2b18a6d1d98cea8b59b9cc31",
"assets/assets/Admin/Turn.png": "506aa8607c620c80d4d134a8dbc678bf",
"assets/assets/adminIcon/3stars.png": "ffa1c6fd3e2e46ccbff7105f432378bc",
"assets/assets/adminIcon/4stars.png": "f7e861b5f544144b20e3faaa25041300",
"assets/assets/adminIcon/5stars.png": "ce09b3bb3dd21210e5f16f6f8f44c5ae",
"assets/assets/adminIcon/backarrow.png": "038bdfd85815be7f0cb14fe8f93a7f86",
"assets/assets/adminIcon/bell.png": "ad6b9ea315fa4dc99de5383643a46dc3",
"assets/assets/adminIcon/bluedash.png": "d428a5fd0e2096db477f8d44b4e53639",
"assets/assets/adminIcon/ellipseblue.png": "9d21cd848726c62446078dbbd2830974",
"assets/assets/adminIcon/ellipsewhite.png": "e88f43a7d65fc89b3eb028f3c1c10465",
"assets/assets/adminIcon/Group.png": "39b47f913e15c14d503675f95666df6f",
"assets/assets/adminIcon/happyface.png": "07aaa34cbe70acf6cc6db0406cbb155b",
"assets/assets/adminIcon/home.png": "112a108c598337c1ca20205e26737b46",
"assets/assets/adminIcon/Line.png": "41b0b3a07ad4df5835488e2048378076",
"assets/assets/adminIcon/line1.png": "cfd9d96a92a79f940fa0e073e3b11268",
"assets/assets/adminIcon/neutralface.png": "24ce8cc66cd13f90cb35ef6b4bc69fb1",
"assets/assets/adminIcon/notificationwhite.png": "39fdee55f40592795151868d35d36d33",
"assets/assets/adminIcon/Oval.png": "67657d3a9ec10493e774d7701a46d7cf",
"assets/assets/adminIcon/people.png": "cd04869490032309d9eb0190ef66b5a1",
"assets/assets/adminIcon/Rectangle.png": "9bf10e9771dcf376d134bbe60f3f9716",
"assets/assets/adminIcon/Rectangleblue.png": "8120a87c1cfd7834b1aca86cf11f8969",
"assets/assets/adminIcon/reddot.png": "b161c0a0c06e3387435e5fdcdb70cd64",
"assets/assets/adminIcon/sadface.png": "4ee7b4867cc2b89ec973dbba2182c388",
"assets/assets/adminIcon/servicesicon.png": "8c48c80a8439683a840973652a39b95d",
"assets/assets/adminIcon/star.png": "a279609e9a01f4564be2d96b313cc8a1",
"assets/assets/adminIcon/washonly.png": "cd1979e872b5dcef392d94b7f8faa70d",
"assets/assets/backarrow.png": "5e33547d841d641177458314ce5bdf36",
"assets/assets/backarrowblue.png": "9b308fa9412151a4b278193ac5eeacf2",
"assets/assets/basket.png": "193e142a670276fac056f141301b1edf",
"assets/assets/birthdate.png": "1313746de1e58a7479885f18e5f99223",
"assets/assets/blacklogo.png": "63fc3f3610a224b3aa4f15f95bcec199",
"assets/assets/bluecircle.png": "ee35559728935dbb0db9804697ba988d",
"assets/assets/bluegift.png": "3376635ff8b79f9439be6b63ea01d223",
"assets/assets/bluepeso.png": "286da5bf759cc3edf52b87a666837795",
"assets/assets/blueplus.png": "34406bc03af100cbd8897c1a1840be83",
"assets/assets/circlebackarrow.png": "19802c02f597dc0abc0f9a846b7f4dc0",
"assets/assets/contact.png": "78c674690aab6eaaf493ec131424c321",
"assets/assets/DeclineOrderIcon/NotAvailable.png": "0c7ccd9c559ed2ce7667ea800253e45f",
"assets/assets/DeclineOrderIcon/purplelogo.png": "a53fc985391e48be79b93da1973db54a",
"assets/assets/DeclineOrderIcon/Shop.png": "b46d8f7a6f147f81039e22a579579ba9",
"assets/assets/DeclineOrderIcon/Time.png": "2cb3a8aa9e5e042580cbd3055086248c",
"assets/assets/delivery.png": "d432d9a66571d530fbb8103fcbe46b6f",
"assets/assets/downarrow.png": "37f5e74bf3c2fe48edd9d2638ab15d4b",
"assets/assets/drycleanpic.png": "6d3ed3ab37cc0b508ef1ed83098886d8",
"assets/assets/edit.png": "d6ff6b4a311b717c4776e91db52620c0",
"assets/assets/facebook.png": "5ae74da58bf6fd469b7b801fe1652c3f",
"assets/assets/gender.png": "3860590bb19f0c474495e00e6a28c7e6",
"assets/assets/google.png": "beb32d4c8a381a456510db7f4ff150fc",
"assets/assets/home.png": "1215dcacc6992032c66f533e714a2c18",
"assets/assets/how.png": "8964dcd0539c06dcca103a819b4bcdd8",
"assets/assets/laundryiconmap.png": "8c578111867938e34c9310138585d68e",
"assets/assets/laundryshop.png": "bcdc85740412a9460deb1f76ccb37132",
"assets/assets/lavandera.png": "bbbfc2100574e799b8fa0f116b4d31c2",
"assets/assets/lavanderaakoprfile.png": "ba868d2016457ebce45789b54571f003",
"assets/assets/lavanderakocover.png": "0f768475fd5d995cf76e0e722a9b4f01",
"assets/assets/locationblue.png": "ca7509e8288626da13c62dc84110b1f7",
"assets/assets/locationwhite.png": "2f4b3797cf2aeb364d36086ddd6b47d0",
"assets/assets/Login.png": "a2312e039909084f7cddc0972346bf2b",
"assets/assets/loginadmin.png": "c7ca571d8a582f3940f3fdd7ae62e635",
"assets/assets/logosplash.jpg": "dcf7cb6a66a80e8b47aaa6edfdc9f8c7",
"assets/assets/mail.png": "14a215369a0678875adb31cac37b8bd7",
"assets/assets/mapa.png": "3906ba35b680b6136d5e34a5c9c1c6f3",
"assets/assets/maps.png": "258a7c03d3332cb4dd0796177c44a945",
"assets/assets/OrderScreenIcon/Accepted.png": "2b65e8de19e5ebb63737dd1895a09795",
"assets/assets/OrderScreenIcon/Active.png": "c644c323eb7e4b4040afa611a8673989",
"assets/assets/OrderScreenIcon/All.png": "2f4009e43a5b0dff6a9240f94b80b71b",
"assets/assets/OrderScreenIcon/Cancelled.png": "cf5f5beef3461f604c12d72b5e2ad57d",
"assets/assets/OrderScreenIcon/Checklist.png": "e6b1ed8bbb88df54cd97ede87fc863af",
"assets/assets/OrderScreenIcon/Completed.png": "262c5b41b6762ba67f6bc30ba52e070b",
"assets/assets/OrderScreenIcon/Customers.png": "cd04869490032309d9eb0190ef66b5a1",
"assets/assets/OrderScreenIcon/Home.png": "f48df840245811002c3f079a90fea817",
"assets/assets/OrderScreenIcon/Orders.png": "9c978705b9bbbede47c0eae9d3b69733",
"assets/assets/OrderScreenIcon/Profile.png": "5c6c3cc043bf4b2aba4f98f66f5089dc",
"assets/assets/OrderScreenIcon/Scroll.png": "addb63ccced77b2d291eac78246bc17e",
"assets/assets/OrderScreenIcon/Search.png": "69dce872796bc869d6441d62a11cb0b6",
"assets/assets/OrderScreenIcon/Services.png": "081fb4d3ba4d7f3bb442d9d87c0546c8",
"assets/assets/peso.png": "d1079d4b74af11a80997209600d0ccb8",
"assets/assets/pickuplaundry.png": "447076611def031826500b03ef47502e",
"assets/assets/pinkgift.png": "22d050c001ca3a287cbbfc7796ca6f39",
"assets/assets/profile.png": "d5c17a5c9f9a48a655eac4d688e428c4",
"assets/assets/ProfileScreen/Customers.png": "05e90177f1f9ea2e04ec1660ba87c064",
"assets/assets/ProfileScreen/Header.png": "a9a22634bf706441d4915060d932f8af",
"assets/assets/ProfileScreen/Home.png": "f48df840245811002c3f079a90fea817",
"assets/assets/ProfileScreen/Location.png": "b78ee6b9c9a5b20696c8ef4eb406d59b",
"assets/assets/ProfileScreen/Logout.png": "32fdc3eac6d5150676663b2f18475bc3",
"assets/assets/ProfileScreen/Orders.png": "d674d2a83dfa563e37f9387c89cccdd3",
"assets/assets/ProfileScreen/Payment.png": "8920a424a2adba8808d1148aeefc6b07",
"assets/assets/ProfileScreen/Profile.png": "5c6c3cc043bf4b2aba4f98f66f5089dc",
"assets/assets/ProfileScreen/Security.png": "d55139d6fd8477ca649d76eb40a6cd7a",
"assets/assets/ProfileScreen/Services.png": "8c48c80a8439683a840973652a39b95d",
"assets/assets/ProfileScreen/Shop.png": "a41507ef707c0772414089a1a54e9101",
"assets/assets/ProfileScreen/Star.png": "9d87d5fbf0337636f4252f3c0fd32986",
"assets/assets/search.png": "fc77ab02f3546df87d1ed3bb18b39a19",
"assets/assets/ServicesScreen/householditems.png": "3974211c6a5e9b3f260c560ca2a8e77a",
"assets/assets/ServicesScreen/typeclothes.png": "1cd912e8336e30a99f292b713098c1b0",
"assets/assets/shop.png": "3cb1a197e944a1a59425e894250715d4",
"assets/assets/star.png": "dd83046f6bd53505ba511e427f7825a6",
"assets/assets/steampresspic.png": "2e3b8f969d160a08b15941fb486a0d25",
"assets/assets/Time.png": "a04f1092572583d55fa9224607ff3fb1",
"assets/assets/transaction.png": "d53f2c5aff3dc30be344e82b131ed046",
"assets/assets/viewallicon.png": "5ffc30477349aad12213af5f9466dc1d",
"assets/assets/washingmachine.png": "afc4fe659c15d47f89a94f95046a1d1c",
"assets/assets/washonly.png": "cd1979e872b5dcef392d94b7f8faa70d",
"assets/assets/welcome.png": "fd760a58ba212a0c4f4cda16a9478541",
"assets/assets/whitelogo.png": "0d1e594e1fca44b1e7c2b1118a7c802a",
"assets/assets/yellowgift.png": "9a4e37a70857deba30b3406d42fd7d3b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "fc865d8998759e46c42f329db83a5fba",
"assets/NOTICES": "1a15aaf22dd6c488b294d9036c3bba3a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "baaa3ee5a83c63b80b531ae9122cd002",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9bf4c446db976c8caf3c26dcb29e5ae8",
"/": "9bf4c446db976c8caf3c26dcb29e5ae8",
"main.dart.js": "8ef24c89a880707eb8e94e0c45ad1fa2",
"manifest.json": "519e8d65d857b0c0ab433b0d4abb11bf",
"version.json": "b03fb8f482482332392373b3341f6363"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
