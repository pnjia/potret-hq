# Label ML Kit Image Labeling dan usulan taksonomi kategori Temuan

> Diriset: 2026-11-17 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: versi paket (Gradle, CocoaPods, pub.dev), isi label map (bisa berubah bila Google memperbarui model dasar), ambang bawaan di referensi API.
> Dipakai oleh: Q-004 (belum diputuskan). Terkait K-009, K-014, spesifikasi §4.3 dan §4.6.

## Pertanyaan

1. Label apa saja yang dikeluarkan model dasar ML Kit Image Labeling, berapa jumlahnya, bahasanya apa, dan apakah ada label untuk teks atau papan nama?
2. Bagaimana bentuk output (berapa label per gambar, confidence, ambang bawaan)?
3. Taksonomi 8–10 kategori seperti apa yang cocok untuk Temuan di kota Indonesia, dan label mana yang dipetakan ke tiap kategori?
4. Bila papan nama tidak terdeteksi oleh labeling dasar, alternatif apa yang ada di ML Kit?

## Temuan (fakta bersumber)

- **Isi label map model dasar**
  - Halaman label map memuat tabel indeks dan label. Halaman hanya menyebut "The default model provided with the image labeling API supports 400+ different labels".
  - Tabel berisi **430 baris**, indeks 0 sampai 446, dengan 17 indeks kosong: 6, 15, 23, 44, 60, 124, 136, 198, 200, 264, 325, 326, 334, 381, 396, 418, 444. Jumlah ini dicek tiga kali dengan pengambilan halaman terpisah dan hasilnya konsisten. Halaman tidak mencantumkan tanggal pembaruan, versi model, maupun bahasa.
  - Semua label ditulis dalam bahasa Inggris. Halaman tidak menyebut opsi label berbahasa lain.
  - Sumber: https://developers.google.com/ml-kit/vision/image-labeling/label-map (diakses 2026-11-17); versi teks https://developers.google.com/ml-kit/vision/image-labeling/label-map.md.txt (diakses 2026-11-17)

- **Label yang berhubungan dengan teks atau papan nama**
  - **Tidak ada** label persis `Text`, `Signage`, `Sign`, `Logo`, `Banner`, `Billboard`, `Font`, `Mural`, `Graffiti`, `Art`, `Painting`, `Drawing`, `Sculpture`, `Shop`, `Store`, `Market`, `Stall`, `Street`.
  - Yang ada dan dekat dengan "tulisan": `Poster` (93), `Neon` (140), `Menu` (135), `Flag` (194), `Blackboard` (169), `Whiteboard` (160), `Newspaper` (263), `News` (262), `Comics` (2), `Paper` (273), `Icon` (220), `Receipt` (240), `Web page` (324), `Screenshot` (121), `Passport` (267), `Money` (234).
  - Sumber: label map di atas (diakses 2026-11-17)

- **Label lain yang tidak ada, padahal relevan untuk objek kota Indonesia**
  - Tidak ada: `Tree`, `Leaf`, `House`, `Truck`, `Scooter`, `Cart`, `Rice`, `Noodle`, `Snack`, `Dessert`.
  - Pendekatan terdekat yang ada: `Plant`, `Flora`, `Branch`, `Twig` (untuk pohon); `Building`, `Roof` (untuk rumah); `Vehicle`, `Van`, `Car` (untuk truk dan angkot); `Motorcycle` (untuk skuter); `Wheelbarrow` (82) dan `Rickshaw` (440) (untuk gerobak dan becak); `Food`, `Cuisine`, `Fast food` (untuk jajanan).
  - Sumber: label map di atas (diakses 2026-11-17)

- **Model dasar di Android dan iOS**
  - Panduan Android dan iOS sama-sama menyebut "The base model supports 400+ different labels" dan menautkan ke halaman label map yang sama. Tidak ada label map terpisah per platform.
  - Android: paket bundled `com.google.mlkit:image-labeling:17.0.9` ("About 5.7 MB size increase", model langsung tersedia) atau unbundled lewat Google Play services `com.google.android.gms:play-services-mlkit-image-labeling:16.0.8` ("About 200 KB size increase", model diunduh dinamis dan "Might have to wait for model to download before first use"). Butuh Android API level 23 ke atas.
  - iOS: `pod 'GoogleMLKit/ImageLabeling', '8.0.0'`; hanya berjalan di perangkat 64-bit. Panduan iOS tidak menyebut apakah model dibundel di pod.
  - ML Kit secara umum: "ML Kit's processing happens on-device" dan "works while offline".
  - Sumber: https://developers.google.com/ml-kit/vision/image-labeling/android , https://developers.google.com/ml-kit/vision/image-labeling/ios , https://developers.google.com/ml-kit (semua diakses 2026-11-17)

- **Bentuk output**
  - Hasil berupa daftar objek label: "a list of ImageLabel objects is passed to the success listener". Setiap label punya teks, confidence, dan indeks di label map (`getText()`, `getConfidence()`, `getIndex()` di Android; iOS: "text description, index among all labels supported by the model, and the confidence score").
  - Contoh di halaman ringkasan menampilkan tujuh label untuk satu foto. Dokumentasi tidak menyebut batas jumlah label per gambar dan tidak menyebut apakah daftar diurutkan menurut confidence.
  - Sumber: https://developers.google.com/ml-kit/vision/image-labeling , https://developers.google.com/ml-kit/vision/image-labeling/android , https://developers.google.com/ml-kit/vision/image-labeling/ios (diakses 2026-11-17)

- **Ambang confidence bawaan: 0,5**
  - Android, `ImageLabelerOptions.Builder.setConfidenceThreshold`: "Only labels detected with confidence higher than this threshold are returned." dan "Default is 0.5." Nilai di luar [0.0, 1.0] melempar `IllegalArgumentException`.
  - iOS, `MLKImageLabelerOptions`: "If it remains unset, a default confidence threshold value of 0.5 will be used."
  - Flutter `google_mlkit_image_labeling`: konstruktor `ImageLabelerOptions({double confidenceThreshold = 0.5})`; dokumentasinya menulis "higher or equal" (Android menulis "higher than"; perbedaan kecil ini dicatat apa adanya).
  - Contoh kode di panduan Android dan iOS memakai 0.7, tetapi itu contoh, bukan nilai bawaan.
  - Sumber: https://developers.google.com/android/reference/com/google/mlkit/vision/label/defaults/ImageLabelerOptions.Builder , https://developers.google.com/ml-kit/reference/ios/mlkitimagelabeling/api/reference/Classes/MLKImageLabelerOptions , https://pub.dev/documentation/google_mlkit_image_labeling/latest/google_mlkit_image_labeling/ImageLabelerOptions-class.html (semua diakses 2026-11-17)

- **Paket Flutter**
  - `google_mlkit_image_labeling` 1.0.3, publisher terverifikasi flutter-ml.dev, Android dan iOS. Pada tanggal akses, pub.dev menulis versi 1.0.3 diunggah "4 days ago" (tanggal pasti tidak tampil). Syarat: iOS deployment target 15.0, Android minSdkVersion 21. Pernyataan di halaman: "This plugin is not sponsored or maintained by Google."
  - Model dasar dipakai lewat `ImageLabelerOptions`; model kustom `.tflite` lewat `LocalLabelerOptions` (`maxCount` bawaan 10) atau dari Firebase.
  - Sumber: https://pub.dev/packages/google_mlkit_image_labeling , https://pub.dev/packages/google_mlkit_image_labeling/versions (diakses 2026-11-17)

- **Alternatif untuk papan nama: Text Recognition v2**
  - "can recognize text in any Chinese, Devanagari, Japanese, Korean and Latin character set". Output bertingkat: blok, baris, elemen (kata), simbol; tiap tingkat punya teks, bounding box, confidence, dan bahasa yang dikenali. Bisa real-time.
  - Bahasa Indonesia (`id`, aksara Latin) dan Melayu (`ms`) berstatus didukung; Jawa (`jv`) berstatus eksperimental.
  - Android, aksara Latin: bundled `com.google.mlkit:text-recognition:16.0.1` ("About 4 MB size increase per script per architecture") atau unbundled `com.google.android.gms:play-services-mlkit-text-recognition:19.0.2` ("About 260 KB size increase per script architecture"). Panduan input: "Ideally, each character should be at least 16x16 pixels".
  - Flutter `google_mlkit_text_recognition` 1.0.3 (flutter-ml.dev): di iOS hanya aksara Latin yang didukung saat ini; di Android hanya Latin yang ikut secara bawaan.
  - Sumber: https://developers.google.com/ml-kit/vision/text-recognition/v2 , https://developers.google.com/ml-kit/vision/text-recognition/v2/languages , https://developers.google.com/ml-kit/vision/text-recognition/v2/android , https://pub.dev/packages/google_mlkit_text_recognition (semua diakses 2026-11-17)

- **Alternatif lain: klasifikasi kasar Object Detection**
  - Model bawaan Object Detection and Tracking hanya punya lima kategori: "home goods, fashion goods, food, plants, and places". Berjalan di perangkat. Model klasifikasi kustom bisa dibundel atau diunduh.
  - Sumber: https://developers.google.com/ml-kit/vision/object-detection (diakses 2026-11-17)

## Usulan taksonomi (TAFSIRAN, bukan keputusan)

> Bagian ini tafsiran peneliti untuk bahan Q-004. **Nama label** di kolom ketiga adalah fakta: semuanya dicek ada persis (huruf besar-kecil sama) di label map, diakses 2026-11-17, dengan indeks dalam kurung. **Pengelompokan** ke kategori adalah tafsiran.

| # | id (`category`) | Nama Indonesia | Label ML Kit yang dipetakan (indeks) | Jml |
|---|---|---|---|---|
| 1 | `food` | Makanan | Food (184), Fast food (48), Cuisine (117), Meal (428), Lunch (419), Supper (415), Bread (332), Cake (393), Cookie (126), Pie (433), Pizza (276), Sushi (300), Bento (5), Hot dog (50), Cheeseburger (10), Pho (188), Couscous (120), Pasteles (142), Gelato (162), Icing (177), Fruit (187), Vegetable (388) | 22 |
| 2 | `drink` | Minuman | Coffee (181), Cappuccino (331), Juice (119), Cola (133), Wine (320), Alcohol (430) | 6 |
| 3 | `vehicle` | Kendaraan | Vehicle (316), Car (423), Bus (52), Van (404), Motorcycle (233), Bicycle (42), Rickshaw (440), Train (313), Tractor (11), Boat (45), Speedboat (179), Sailboat (412), Canoe (438), Kayak (238), Skiff (275), Airplane (367), Airliner (382), Aircraft (424), Helicopter (336), Tire (406), Wheel (322), Bumper (172), Windshield (87), Odometer (420), Frigate (195), Brig (36), Submarine (305), Unicycle (389) | 28 |
| 4 | `plant` | Tanaman | Plant (266), Flora (205), Flower (362), Petal (28), Twig (27), Branch (355), Flowerpot (391), Garden (357) | 8 |
| 5 | `animal` | Hewan | Cat (118), Dog (360), Bird (20), Duck (338), Horse (213), Cattle (113), Bull (369), Insect (223), Butterfly (372), Turtle (340), Crocodile (341), Pet (277), Herd (222), Waterfowl (174), Larva (379), Penguin (268), Bear (61), Gerbil (55), Pomacentridae (33), Shetland sheepdog (35), Cairn terrier (192), Dalmatian (178), Basset hound (413), Shikoku (269), Ragdoll (183), Sphynx (405), Pixie-bob (221), Fur (368) | 28 |
| 6 | `building` | Bangunan dan monumen | Building (366), Skyscraper (308), Tower (63), Church (110), Mosque (235), Temple (371), Cathedral (365), Palace (270), Castle (377), Monument (171), Statue (9), Museum (335), Ruins (208), Lighthouse (242), Bridge (18), Roof (290), Wall (350), Brick (64), Stairs (88), Handrail (314), Barn (441), Factory (24), Stadium (43), Skyline (123), Infrastructure (31), Construction (77), Dam (383), Pier (96) | 28 |
| 7 | `sign` | Papan nama dan tulisan | Poster (93), Neon (140), Menu (135), Flag (194), Blackboard (169), Whiteboard (160), Newspaper (263), News (262), Comics (2) | 9 |
| 8 | `fashion` | Pakaian dan aksesori | Dress (58), Jacket (197), Jeans (390), Shorts (51), Sari (137), Scarf (166), Tie (100), Beanie (164), Jersey (165), Outerwear (230), Blazer (255), Gown (358), Veil (416), Tuxedo (148), Tights (19), Leggings (249), Denim (407), Swimwear (68), Shoe (293), Sneakers (343), Hat (161), Cap (159), Sunglasses (30), Glasses (422), Goggles (155), Bag (434), Handbag (317), Jewellery (227), Necklace (84), Bracelet (85), Bangle (225), Ring (345), Textile (384) | 33 |
| 9 | `object` | Barang | Product (78), Toy (8), Stuffed toy (125), Plush (138), Lego (247), Miniature (217), Balloon (74), Umbrella (410), Clock (111), Mobile phone (257), Computer (89), Television (310), Musical instrument (251), Piano (265), Chair (92), Couch (157), Bench (370), Desk (115), Shelf (401), Cushion (29), Pillow (199), Lampshade (318), Tableware (236), Cutlery (134), Cup (315), Saucer (215), Cookware and bakeware (90), Porcelain (26), Crochet (129), Knitting (228), Needlework (375), Quilting (278), Tablecloth (259), Skateboard (280), Surfboard (47), Cage (279) | 36 |
| 10 | `other` | Lainnya | Semua label yang tidak ada di baris 1–9 (232 label), dan kasus tanpa label di atas ambang. Contoh: Person (66), Selfie (439), Baby (421), Smile (46), Sky (54), Sunset (49), Road (287), Asphalt (411), Park (22), Junk (65) | sisa |

Total label terpetakan ke kategori 1–9: 198 dari 430 (tafsiran berdasarkan tabel di atas).

### Varian lebih ringkas (TAFSIRAN)

- **8 kategori**: gabung `drink` ke `food` ("Makanan dan minuman") dan `fashion` ke `object`. Alasan: `drink` hanya 6 label, dan `fashion` biasanya menempel pada orang, bukan objek kota.
- **Kategori alam** (`nature`) bisa menggantikan `fashion`, memakai label seperti Sky (54), Sunset (49), Forest (193), Jungle (114). Catatan: Temuan adalah cutout tanpa latar, jadi pemandangan kemungkinan jarang menjadi subjek yang terpotong rapi (dugaan, belum diuji).

### Label ambigu (TAFSIRAN pengelompokan, label terverifikasi ada)

| Label (indeks) | Kenapa ambigu | Usulan |
|---|---|---|
| Menu (135) | Bisa tulisan atau makanan | `sign`; bila ada label `food` lebih tinggi, aturan di bawah memilih `food` |
| Tableware (236), Cutlery (134), Cup (315), Saucer (215), Cookware and bakeware (90) | Sering muncul di foto jajanan dan minuman | `object`, tetapi diperlakukan sebagai label lemah (lihat aturan) |
| Statue (9), Monument (171) | Patung atau tugu, bukan bangunan | `building` ("Bangunan dan monumen") |
| Helmet (446) | Helm motor atau aksesori | `other` atau `fashion`, perlu diuji dengan foto nyata |
| Wheelbarrow (82) | Gerobak dorong kebun; mungkin muncul untuk gerobak jajanan (dugaan) | `vehicle` atau `other`, perlu diuji |
| Himalayan (3), Cavalier (163), Boxer (83) | Nama ras hewan sekaligus kata lain (gunung, olahraga) | tidak dipetakan (`other`) sampai diuji |
| Seal (400) | Anjing laut atau stempel | tidak dipetakan |
| Clipper (131), Horn (245), Wing (321), Trunk (180), Model (373), Shell (206) | Banyak arti | tidak dipetakan |
| Steaming (387), Eating (62) | Keadaan atau kegiatan, bukan objek | tidak dipetakan |
| Pattern (414), Watercolor paint (37), Tattoo (312) | Kandidat untuk mural atau batik, tetapi tidak spesifik | tidak dipetakan; mural tidak punya label sendiri |
| Paper (273), Icon (220), Web page (324), Screenshot (121) | Tulisan, tetapi bukan papan nama di kota | tidak dipetakan |
| Receipt (240), Passport (267), Money (234) | Dokumen dan uang pribadi | tidak dipetakan; aspek privasinya untuk `penasihat-privasi` |
| Fur (368) | Bulu hewan atau bahan pakaian | `animal` |
| Wine (320), Alcohol (430) | Minuman beralkohol, pengguna termasuk remaja | `drink`; apakah boleh muncul di Misi adalah keputusan produk |

### Aturan pemilihan bila satu gambar cocok ke beberapa kategori (TAFSIRAN)

1. **Usulan utama (sesuai brief)**: ambil daftar label di atas ambang, urutkan menurut confidence secara eksplisit di kode (dokumentasi tidak menjamin urutan), lalu pilih label pertama yang terpetakan. Kategorinya menjadi `category`. Bila tidak ada yang terpetakan → `other`.
2. **Penyempurnaan label lemah**: label yang umum atau pendukung (Tableware, Cutlery, Cup, Saucer, Cookware and bakeware, Product, Wheel, Tire, Wall, Roof, Brick, Textile) hanya dipakai bila tidak ada label terpetakan lain di atas ambang. Tujuannya: foto jajanan di piring tetap `food`, bukan `object`.
3. **Alternatif**: jumlahkan confidence semua label terpetakan per kategori, pilih kategori dengan jumlah tertinggi. Lebih tahan terhadap satu label tinggi yang menyesatkan, tetapi lebih sulit dijelaskan.
4. **Seri**: urutan kategori tetap (mis. `sign` → `food` → `drink` → `vehicle` → `animal` → `plant` → `building` → `fashion` → `object`) sebagai pemecah seri.
5. **Ambang**: mulai dari bawaan 0,5. Menurunkan ambang di `ImageLabelerOptions` lalu menyaring sendiri di kode memberi lebih banyak kandidat; nilai yang tepat belum bersumber dan perlu diuji dengan foto kota nyata.
6. **Penyimpanan pemetaan**: pemetaan bisa dikunci pada teks label atau `index`. Keduanya ada di output; mana yang lebih stabil antar versi model belum bersumber.

### Papan nama (TAFSIRAN)

- Labeling dasar hanya menangkap papan nama secara tidak langsung (Poster, Neon, Menu, Flag). Papan toko dari kayu atau seng dengan cat biasa kemungkinan tidak memunculkan label-label itu (dugaan, belum diuji).
- Opsi yang bersumber: menjalankan Text Recognition v2 (aksara Latin, bahasa Indonesia didukung) pada foto yang sama; bila ada blok teks dengan ukuran cukup besar relatif terhadap cutout, Temuan dikategorikan `sign`. Biayanya: model tambahan (bundled sekitar 4 MB per aksara per arsitektur di Android) dan satu proses tambahan di perangkat.
- Opsi lain: model klasifikasi kustom `.tflite` lewat `LocalLabelerOptions`. Ini butuh data latih sendiri.

## Kesimpulan

Fakta: model dasar ML Kit Image Labeling punya 430 label berbahasa Inggris (halaman menyebut "400+"), berjalan di perangkat, mengembalikan beberapa label per gambar dengan teks, confidence, dan indeks, dengan ambang bawaan 0,5 di Android, iOS, dan plugin Flutter. Label map tidak memuat `Text`, `Signage`, `Mural`, `Tree`, `Truck`, `Scooter`, atau `Cart`. Text Recognition v2 mendukung bahasa Indonesia dan menjadi alternatif bersumber untuk papan nama. Tafsiran: lima contoh kategori di spesifikasi §4.3 bisa dipetakan, tetapi "papan nama" dan "tanaman" (tanpa label pohon) adalah yang paling lemah; taksonomi 10 kategori di atas memberi 198 label terpetakan dan sisanya jatuh ke `other`. Semua pengelompokan perlu diuji dengan foto kota nyata sebelum dikunci.

## Belum terjawab

- Apakah model dasar di Android dan iOS identik (versi dan bobot sama) sehingga confidence untuk foto yang sama juga sama. Dokumentasi hanya menautkan label map yang sama.
- Apakah ada label map berbahasa lain atau API terjemahan label. Tidak ditemukan.
- Batas jumlah label per gambar dan apakah daftar hasil diurutkan menurut confidence. Tidak disebut dokumentasi.
- Apakah indeks label stabil antar versi SDK.
- Apakah model dasar di iOS dibundel di pod atau diunduh. Panduan iOS tidak menyebut.
- Label apa yang benar-benar muncul untuk objek khas Indonesia (angkot, gerobak, becak, jajanan, mural, papan toko), dan apakah menjalankan labeling pada cutout (latar transparan atau putih) memberi hasil berbeda dari foto asli. Butuh uji di perangkat, bukan riset web.
- Tanggal pasti rilis `google_mlkit_image_labeling` 1.0.3 dan `google_mlkit_text_recognition` 1.0.3 (pub.dev hanya menampilkan "4 days ago").
