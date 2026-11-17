# Perangkat acuan dan stack Flutter (Infinix Hot 11 Play, Impeller, state management, pembayaran, `native_cutout`)

> Diriset: 2026-11-17 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: versi Flutter stabil dan status Impeller di Android (berubah tiap rilis, denylist driver Vulkan sering diubah), versi dan tanggal paket pub.dev (`flutter_riverpod`, `flutter_bloc`, `purchases_flutter`, `in_app_purchase`, `native_cutout`), harga dan fitur paket RevenueCat.
> Dipakai oleh: Q-009, Q-011, Q-013 (belum ada K-)
> Melengkapi (tidak menggantikan): `2026-11-16-riset-awal.md` bagian `native_cutout`.

## Pertanyaan

1. Apa spesifikasi Infinix Hot 11 Play (perangkat acuan Android dari jawaban Q-011)?
2. Per November 2026, bagaimana status renderer Impeller di Android, dukungan fragment shader kustom (`FragmentProgram`), dan perlakuan terhadap GPU kelas bawah (PowerVR/Mali)? Apa versi Flutter stabil terbaru?
3. Bagaimana status Riverpod dan flutter_bloc di pub.dev, dan apa rekomendasi resmi arsitektur Flutter? (Q-013)
4. Berapa harga RevenueCat, bagaimana status `purchases_flutter`, bagaimana mengikat pembelian ke akun Supabase, dan apa yang harus dibangun sendiri bila memakai `in_app_purchase`? (Q-009)
5. Apakah `native_cutout` masih dirawat?

Label: **terbukti** = dibaca langsung di sumber yang disebut; **dugaan** = disimpulkan atau sumbernya sekunder/tidak konsisten.

## Temuan

### 1. Infinix Hot 11 Play

- **SoC dan GPU** (terbukti, dua sumber konsisten)
  - MediaTek Helio G35, 8 inti Cortex-A53 hingga 2,3 GHz, 12 nm. GPU IMG PowerVR GE8320 hingga 680 MHz. Memori yang didukung chip: LPDDR3 dan LPDDR4x.
  - Sumber (chip): https://www.mediatek.com/products/smartphones/mediatek-helio-g35 (diakses 2026-11-17)
  - Sumber (perangkat memakai G35 + GE8320): https://www.notebookcheck.net/Infinix-Hot-11-Play.596223.0.html dan https://devicebeast.com/phones/hot-11-play (diakses 2026-11-17)
- **Arsitektur GPU** (terbukti untuk seri, dugaan untuk versi Vulkan)
  - GE8320 termasuk PowerVR Series8XE (GE8xx0). Notebookcheck tidak konsisten soal Vulkan: teks pengantar menyebut Vulkan 1.0, tabel spesifikasi menyebut Vulkan 1.1. OpenGL ES 3.2.
  - Sumber: https://www.notebookcheck.net/PowerVR-GE8320-Graphics-Card-Benchmarks-and-Specs.372646.0.html (diakses 2026-11-17)
- **RAM dan penyimpanan** (terbukti)
  - 4 GB RAM; varian 64 GB dan 128 GB, microSD.
  - Sumber: https://devicebeast.com/phones/hot-11-play (diakses 2026-11-17); varian 4/64 GB di Indonesia: https://gizmologi.id/gadget/smartphone/infinix-hot-11-play-diresmikan/ (diakses 2026-11-17)
- **Layar** (resolusi terbukti; refresh rate dugaan)
  - 6,82 inci IPS LCD, 720 × 1640 (HD+), sekitar 263 ppi.
  - Sumber: https://devicebeast.com/phones/hot-11-play, https://www.pinoytechnoguide.com/smartphones/infinix-hot-11-play (diakses 2026-11-17)
  - Refresh rate 60 Hz hanya terlihat di cuplikan hasil pencarian 91mobiles dan satu ulasan; halaman 91mobiles menolak diakses (HTTP 403). Satu situs (naijaknowhow.net) menulis 90 Hz. Halaman devicebeast, pinoytechnoguide, notebookcheck, dan Gizmologi tidak mencantumkan refresh rate.
  - Sumber cuplikan: https://www.91mobiles.com/infinix-hot-11-play-price-in-india?ty=specs (diakses 2026-11-17, isi halaman tidak terbaca)
- **Sistem operasi** (terbukti untuk versi bawaan)
  - Android 11 dengan XOS 7.6 saat rilis. Android 11 = API level 30.
  - Sumber: https://www.notebookcheck.net/Infinix-Hot-11-Play.596223.0.html, https://gizmologi.id/gadget/smartphone/infinix-hot-11-play-diresmikan/ (diakses 2026-11-17)
  - Pembaruan ke Android 12 atau lebih baru: tidak ditemukan sumber yang mengonfirmasi (lihat "Belum terjawab").
- **Rilis dan harga Indonesia** (terbukti)
  - Rilis global 15 Nov 2021 (devicebeast). Gizmologi (5 Des 2021): penjualan perdana di Indonesia 6 Des 2021 lewat Tokopedia, harga spesial Rp1,619 juta, klaim AnTuTu sekitar 41 ribu (angka vendor).
  - Sumber: https://gizmologi.id/gadget/smartphone/infinix-hot-11-play-diresmikan/ (diakses 2026-11-17)
- **Catatan sumber**: situs resmi Infinix tidak muncul di pencarian; GSMArena, Kimovil, 91mobiles, Gizmochina, dan Yugatech menolak akses otomatis (HTTP 402/403). Spesifikasi di atas diambil dari basis data pihak ketiga yang bisa dibaca.

### 2. Flutter di Android per November 2026

- **Versi stabil terbaru** (terbukti)
  - Flutter 3.50.0, dirilis 2026-11-11, Dart 3.14.0. Rilis stabil sebelumnya: 3.47.9 (2026-10-29).
  - Sumber: https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json (diakses 2026-11-17)
- **Impeller adalah renderer default di Android API 29+** (terbukti)
  - Halaman resmi: "Impeller is available and enabled by default on Android API 29+. On devices running lower versions of Android or don't support Vulkan, Impeller falls back to the legacy OpenGL renderer." Default sejak 3.27. Opt-out masih didokumentasikan lewat `--no-enable-impeller` dan meta-data `io.flutter.embedding.android.EnableImpeller=false` di `AndroidManifest.xml`. Halaman memuat Flutter 3.50, terakhir diperbarui 2026-08-21.
  - Sumber: https://docs.flutter.dev/perf/impeller (diakses 2026-11-17)
  - Tabel resmi "Can I use Impeller" (terakhir diperbarui 19 Nov 2025): Android 3.27–main = "Default Impeller", artinya "Impeller is the default with no action. But can opt-out and use Skia via flags/manifest options."
  - Sumber: https://docs.flutter.dev/go/can-i-use-impeller → https://docs.google.com/spreadsheets/d/1AebMvprRkxP-D6ndx920lbvDBbhg-sNNRJ64XY2P2t0 (diakses 2026-11-17)
  - Klaim bahwa Skia sudah dihapus untuk Android 10+ sejak 3.44 hanya ada di blog sekunder (levelup.gitconnected.com, cmarix.com) dan bertentangan dengan dokumen resmi di atas. Tidak dipakai sebagai fakta.
- **Fallback ke Impeller OpenGLES dan perlakuan MediaTek/PowerVR** (terbukti untuk 3.29; status di 3.50 sebagian dugaan)
  - Blog resmi Flutter 3.29: perangkat Android tanpa driver Vulkan yang berfungsi memakai Impeller di OpenGLES, bukan Skia. "A large number of black screen and crash reports were the result of using Vulkan on MediaTek/PowerVR soc's"; Vulkan dimatikan di SoC tersebut dan "These devices now only use Impeller OpenGLES".
  - Sumber: https://flutter.dev/blog/whats-new-in-flutter-3-29 (diakses 2026-11-17)
  - Catatan rilis 3.50.0 memuat "Denylists b-series powervr from vulkan" (PR 191808, digabung 27 Agu 2026, karena banyak laporan masalah setelah PowerVR B-series sempat diaktifkan) dan "Avoid most vulkan initialization for known bad vulkan drivers" (PR 193875). GE8320 (Series8XE) tidak disebut namanya.
  - Sumber: https://docs.flutter.dev/release/release-notes/release-notes-3.50.0, https://github.com/flutter/flutter/pull/191808 (diakses 2026-11-17)
  - Kode `driver_info_vk.cc` di cabang `master` (dibaca 2026-11-17): `IsKnownBadDriver()` menolak PowerVR di bawah seri CXT (mengenali nama BXE/BXM/BXS/BXT/CXT/DXT), Adreno 650 ke bawah, semua GPU Huawei, dan Samsung dengan Vulkan < 1.3. Tidak ada aturan untuk Mali dan tidak ada nama GE8xxx. Cabang master bisa berbeda dari 3.50.0.
  - Sumber: https://raw.githubusercontent.com/flutter/flutter/master/engine/src/flutter/impeller/renderer/backend/vulkan/driver_info_vk.cc (diakses 2026-11-17)
  - Impeller Vulkan di Android mewajibkan ekstensi `VK_KHR_swapchain` serta `VK_ANDROID_external_memory_android_hardware_buffer`, `VK_KHR_sampler_ycbcr_conversion`, `VK_KHR_external_memory`, `VK_EXT_queue_family_foreign`, `VK_KHR_dedicated_allocation`; bila tidak ada, perangkat ditolak.
  - Sumber: https://raw.githubusercontent.com/flutter/flutter/master/engine/src/flutter/impeller/renderer/backend/vulkan/capabilities_vk.cc (diakses 2026-11-17)
- **Fragment shader kustom (`FragmentProgram`)** (terbukti)
  - Didukung di Skia dan Impeller lewat `Paint.shader`; `ImageFilter.shader` hanya di Impeller. Hanya shader `.frag`, GLSL 100–460, tanpa UBO/SSBO, hanya `sampler2D`, hanya `texture(sampler, uv)` dua argumen, tanpa varying tambahan, tanpa unsigned int dan bool. Uniform float diatur per komponen.
  - Di OpenGLES koordinat y tekstur terbalik; shader perlu membalik UV dengan `#ifdef IMPELLER_TARGET_OPENGLES`. Pakai `FlutterFragCoord()` alih-alih `gl_FragCoord`.
  - Saran performa: precache `FragmentProgram` sebelum animasi, pakai ulang objek `FragmentShader` antar-frame. Gambar untuk sampler bisa dari `Picture.toImageSync`/`Scene.toImageSync`. Sampler default `TileMode.clamp`.
  - Sumber: https://docs.flutter.dev/ui/design/graphics/fragment-shaders (Flutter 3.50, diperbarui 2026-05-05; diakses 2026-11-17)
- **Data performa page-curl di GE8320**: tidak ditemukan benchmark Flutter atau GFXBench yang bisa dibaca untuk GPU ini. Halaman Notebookcheck GE8320 hanya memuat 3DMark (Wild Life 0 poin). Forum Imagination memuat keluhan pengguna soal driver Vulkan GE8320 (anekdot, bukan data).
  - Sumber: https://www.notebookcheck.net/PowerVR-GE8320-Graphics-Card-Benchmarks-and-Specs.372646.0.html, https://forums.imgtec.com/t/powervr-ge8320-driver-bug-crash/3831 (diakses 2026-11-17)

### 3. State management dan struktur folder (Q-013)

| Paket | Versi terbaru | Tanggal rilis | Likes | Pub points | Penerbit | Catatan |
|---|---|---|---|---|---|---|
| `flutter_riverpod` | 3.5.0 | 2026-11-06 | 2,92 rb | 140 | dash-overflow.net (terverifikasi) | Flutter Favorite; Riverpod 3.0.0 rilis 2025-09-10; butuh Dart SDK `^3.12.0`; contoh README memakai code generation `@riverpod` |
| `flutter_bloc` | 9.1.1 | 2025-05-02 | 8,09 rb | 160 | bloclibrary.dev (terverifikasi) | Flutter Favorite; paket inti `bloc` 9.2.1 rilis 2026-05-12 |
| `provider` | 6.1.5+1 | 2025-08-19 | – | – | – | direkomendasikan dokumen resmi untuk dependency injection |

- Sumber: https://pub.dev/packages/flutter_riverpod, https://pub.dev/api/packages/flutter_riverpod, https://pub.dev/packages/flutter_bloc, https://pub.dev/api/packages/flutter_bloc, https://pub.dev/api/packages/bloc, https://pub.dev/api/packages/provider (semua diakses 2026-11-17)
- **Rekomendasi resmi Flutter** (terbukti)
  - Panduan arsitektur: MVVM (View + ViewModel) "Strongly recommend", logika tidak di widget, aliran data satu arah, repository pattern dengan kelas abstrak, model immutable (freezed/built_value "Recommend"), dependency injection dengan paket `provider` "Strongly recommend", `ChangeNotifier`/`Listenable` "Conditional" ("ultimately the decision comes down to personal preference"), go_router "Recommend", domain layer/use-case "Conditional". Riverpod dan Bloc tidak disebut.
  - Sumber: https://docs.flutter.dev/app-architecture/recommendations (Flutter 3.50, diperbarui 2026-05-05; diakses 2026-11-17)
  - Halaman opsi state management tidak menyebut atau merekomendasikan paket pihak ketiga; hanya `setState`, `ValueNotifier`/`InheritedNotifier`, `InheritedWidget`/`InheritedModel`.
  - Sumber: https://docs.flutter.dev/data-and-backend/state-mgmt/options (diperbarui 2026-07-31; diakses 2026-11-17)
  - Struktur folder contoh (aplikasi Compass): `lib/ui/<fitur>/view_models` + `widgets`, `lib/ui/core/`, `lib/domain/models/`, `lib/data/repositories/`, `lib/data/services/`, `config/`, `utils/`, `routing/`. Alasan resmi: "The ui folder organizes the code by feature ... The data folder organizes code by type, because repositories and services can be used across different features".
  - Sumber: https://docs.flutter.dev/app-architecture/case-study (diperbarui 2026-05-05; diakses 2026-11-17)

### 4. Pembayaran (Q-009)

- **Harga RevenueCat** (terbukti, cek ulang)
  - Paket Pro: gratis selama MTR di bawah US$2,5 ribu per bulan; bila mencapai US$2,5 ribu, biaya 1% dari MTR (contoh resmi: MTR US$2,5 ribu → US$25). MTR = pendapatan yang dilacak RevenueCat dalam USD **sebelum** potongan toko, termasuk pembelian sekali bayar. "Our entire suite of features comes standard and it's free to get started." Kartu kredit opsional; tanpa kartu, sebagian produk tidak bisa dipakai saat MTR mencapai US$2,5 ribu.
  - Sumber: https://www.revenuecat.com/pricing/ (diakses 2026-11-17)
  - Webhook tersedia di paket Pro.
  - Sumber: https://www.revenuecat.com/docs/integrations/webhooks (diakses 2026-11-17)
- **`purchases_flutter`** (terbukti)
  - Versi 11.0.3, rilis 2026-11-16; 925 likes, 140 pub points, penerbit revenuecat.com (terverifikasi); Android, iOS, macOS, web. Butuh Flutter ≥ 3.22, Dart `>=3.4.0 <4.0.0`.
  - Sumber: https://pub.dev/packages/purchases_flutter, https://pub.dev/api/packages/purchases_flutter (diakses 2026-11-17)
  - Instalasi: Kotlin ≥ 2.1.0, `compileSdk` ≥ 35, iOS ≥ 13.0 (CocoaPods). Paywall RevenueCat mewajibkan `MainActivity` turunan `FlutterFragmentActivity`.
  - Sumber: https://www.revenuecat.com/docs/getting-started/installation/flutter (diakses 2026-11-17)
- **Mengikat ke akun sendiri** (terbukti)
  - App User ID kustom bisa diberikan saat `configure` atau lewat `logIn()`; ID baru otomatis dibuat. `logOut()` membuat ID anonim baru, dan aplikasi yang hanya memakai ID kustom disarankan tidak memanggil logout. RevenueCat menyarankan ID acak yang tidak bisa ditebak seperti UUID v4, melarang email dan IDFA, melarang ID berisi `/`, batas 100 karakter, dan daftar nilai terlarang (`null`, `anonymous`, `0`, dll.).
  - Sumber: https://www.revenuecat.com/docs/customers/identifying-customers (diakses 2026-11-17)
  - Webhook: header otorisasi yang diatur di dashboard dikirim pada setiap POST; HMAC opsional (`X-RevenueCat-Webhook-Signature`); balas 200 dalam 60 detik; retry hingga 5 kali (sekitar 80 menit); proses idempoten berdasar `id` event; disarankan memanggil `GET /subscribers` setelah menerima webhook.
  - Sumber: https://www.revenuecat.com/docs/integrations/webhooks (diakses 2026-11-17)
  - Event yang relevan untuk pembelian sekali bayar: `NON_RENEWING_PURCHASE`, `CANCELLATION` (termasuk refund, alasan `CUSTOMER_SUPPORT`), `TRANSFER` (kepemilikan pindah antar App User ID, `transferred_from`/`transferred_to`).
  - Sumber: https://www.revenuecat.com/docs/integrations/webhooks/event-types-and-fields (diakses 2026-11-17)
  - Pembelian sekali bayar: untuk "lifetime unlock" disarankan produk non-consumable yang dipasang ke entitlement. Non-consumable di Android butuh SDK Android RevenueCat ≥ 7.11.0. Untuk menerima semua refund pembelian sekali bayar, Platform Server Notifications harus dikonfigurasi.
  - Sumber: https://www.revenuecat.com/docs/platform-resources/non-subscriptions (diakses 2026-11-17)
- **`in_app_purchase` (paket resmi)** (terbukti)
  - Versi 3.3.1, rilis 2026-09-18; 2,5 rb likes; penerbit flutter.dev (terverifikasi); Android, iOS, macOS. Butuh Flutter ≥ 3.38, Dart `^3.10.0`.
  - Sumber: https://pub.dev/packages/in_app_purchase, https://pub.dev/api/packages/in_app_purchase (diakses 2026-11-17)
  - README: dengarkan `purchaseStream` sedini mungkin; restore lewat `restorePurchases()` (hasil datang lewat `purchaseStream`); purchase yang tidak di-complete dalam 3 hari di Android akan direfund; validasi pembelian mengikuti praktik tiap toko (contoh memanggil `_verifyPurchase` buatan aplikasi sebelum memberi konten).
  - Sumber: https://pub.dev/packages/in_app_purchase (diakses 2026-11-17)
  - Codelab resmi untuk paket ini membangun backend verifikasi sendiri: endpoint `POST /verifypurchase`, service account Google Play Android Publisher API, kredensial App Store, topik Cloud Pub/Sub untuk notifikasi Play, dan penyimpanan status pembelian di basis data backend ("The recommended way to track your users' purchases is in the backend service").
  - Sumber: https://codelabs.developers.google.com/codelabs/flutter-in-app-purchases (diakses 2026-11-17)

### 5. `native_cutout` (cek ulang riset 16 Nov)

- **Versi dan riwayat** (terbukti)
  - Versi 0.4.0, rilis 2026-09-30. Riwayat: 0.1.0 (2026-04-22), 0.2.0 (2026-05-14), 0.3.0 (2026-07-10), 0.4.0 (2026-09-30). Dart `^3.10.0`, Flutter `>=3.3.0`.
  - Sumber: https://pub.dev/api/packages/native_cutout (diakses 2026-11-17)
- **Popularitas dan perawat** (terbukti)
  - 10 likes, 140 pub points, sekitar 1,89 rb unduhan, **unverified uploader**. Repo GitHub `xcc3641/flutter_native_cutout`: 2 bintang, 2 fork, 1 issue terbuka, 9 commit; lisensi MIT di repo (pub.dev menampilkan "unknown").
  - Sumber: https://pub.dev/packages/native_cutout, https://github.com/xcc3641/flutter_native_cutout (diakses 2026-11-17)
- **Platform dan perilaku** (terbukti)
  - Android API 21+ (ML Kit Subject Segmentation), iOS: kompilasi iOS 13, jalan di iOS 17+ (selain itu `UNSUPPORTED_OS`), tidak jalan di Simulator. Model Android diunduh Play services; panggilan pertama tanpa model memblokir sampai unduhan selesai dan gagal saat offline; tersedia `downloadModel()` dengan `downloadProgress`.
  - 0.3.0 menambah `subjectBounds` (dihitung native); 0.4.0 menambah `CutoutRevealAnimation` opsional. Keluaran berupa PNG (file cache atau bytes).
  - Sumber: https://pub.dev/packages/native_cutout, https://pub.dev/packages/native_cutout/changelog (diakses 2026-11-17)
- **ML Kit Subject Segmentation** (terbukti)
  - Berstatus **beta** ("not subject to any SLA or deprecation policy"), butuh Android API 24+ (lebih tinggi dari klaim API 21 di README `native_cutout`), model dinamis lewat Play services (bisa diatur unduh saat instalasi), gambar minimal 512×512, inferensi pertama lebih lambat.
  - Sumber: https://developers.google.com/ml-kit/vision/subject-segmentation/android (diakses 2026-11-17)

## Kesimpulan

**Fakta bersumber.** Infinix Hot 11 Play memakai Helio G35 dengan GPU PowerVR GE8320 (Series8XE), 4 GB RAM, layar 720 × 1640, Android 11 (API 30). Flutter stabil terbaru 3.50.0 (11 Nov 2026). Impeller default di Android API 29+; sejak 3.29 perangkat tanpa Vulkan yang berfungsi memakai Impeller OpenGLES, dan blog resmi 3.29 menyebut Vulkan dimatikan di SoC MediaTek/PowerVR. Fragment shader kustom didukung di semua backend dengan batasan GLSL tertentu dan catatan y-flip di OpenGLES. Dokumen resmi Flutter merekomendasikan MVVM + repository + `provider` untuk DI, tanpa menyebut Riverpod atau Bloc. `flutter_riverpod` 3.5.0 dirilis 10 hari lalu; `flutter_bloc` 9.1.1 terakhir dirilis Mei 2025. RevenueCat gratis di bawah US$2,5 ribu MTR, mendukung App User ID kustom dan webhook; `in_app_purchase` menuntut backend verifikasi sendiri. `native_cutout` rutin rilis (empat versi dalam lima bulan) tetapi dirawat satu orang yang belum terverifikasi, dan ML Kit Subject Segmentation masih beta.

**Tafsiran (bukan keputusan):**

- *Tafsiran, Q-011, risiko 30 fps:* Hot 11 Play hampir pasti menjalankan Impeller **OpenGLES**, bukan Vulkan (MediaTek + PowerVR, berdasar blog 3.29), tetapi ini perlu dibuktikan di perangkat lewat log startup Flutter. Risiko utama untuk 30 fps (anggaran 33,3 ms per frame): (1) page-curl adalah shader layar penuh di sekitar 1,18 juta piksel pada GPU kelas bawah; (2) kompilasi shader oleh driver GLES saat pertama dipakai bisa menimbulkan jank di frame awal, sehingga precache `FragmentProgram` sebelum gestur pertama penting; (3) membuat tekstur halaman (`toImageSync`) saat gestur dimulai bisa memakan anggaran frame; (4) 4 GB RAM membatasi jumlah tekstur halaman yang bisa disimpan sekaligus untuk lazy load; (5) shader harus menangani y-flip OpenGLES, jadi hasil di iPhone (Metal) tidak menjamin tampilan benar di Hot 11 Play. Resolusi layar yang rendah (HD+) mengurangi beban dibanding perangkat FHD+.
- *Tafsiran, Q-009:* Untuk developer solo yang sudah memakai Supabase, RevenueCat memindahkan pekerjaan validasi receipt, restore lintas perangkat, dan notifikasi refund dari backend sendiri ke layanan pihak ketiga, dengan biaya 0 selama pendapatan kotor di bawah US$2,5 ribu per bulan. Pola yang cocok dengan tabel `Entitlement`: App User ID = UUID pengguna Supabase (sesuai saran "UUID v4, bukan email"), lalu Edge Function menerima webhook `NON_RENEWING_PURCHASE`/`CANCELLATION`/`TRANSFER` dan menulis `Entitlement` dengan `source` dari store. `in_app_purchase` tidak menambah biaya per transaksi tetapi menuntut endpoint verifikasi, kredensial Play/App Store, dan penanganan notifikasi server di sisi Supabase. Karena toko belum dibuka di MVP, keputusan ini tidak menghalangi prototipe.
- *Tafsiran, Q-013:* Riverpod 3 aktif dirawat dan menyatukan DI dan state (cocok untuk developer solo yang ingin satu alat), tetapi bergantung pada code generation dan menuntut Dart 3.12+. flutter_bloc paling populer dan stabil, tetapi lebih banyak boilerplate (event + state per fitur) dan rilis terakhirnya 18 bulan lalu. Jalur resmi Flutter (MVVM + `ChangeNotifier` + `provider`) paling sedikit dependensi dan dokumentasinya resmi. Struktur usulan di `docs/teknis/arsitektur.md` (per fitur di `features/`, `data/` bersama) sejalan dengan prinsip resmi "UI per fitur, data per tipe", walau penamaan foldernya berbeda dari contoh Compass (`ui/<fitur>` vs `features/<fitur>`).
- *Tafsiran, `native_cutout`:* Paket masih aktif (rilis terakhir 47 hari lalu), tetapi risiko bus factor tinggi (satu perawat, unverified uploader, 2 bintang). Keluarannya PNG dengan alfa; apakah alfa itu cukup sebagai `mask` untuk kuas manual belum diuji.

## Belum terjawab

- Refresh rate layar Hot 11 Play dari sumber yang bisa dibaca penuh (60 Hz hanya dari cuplikan pencarian; satu situs menulis 90 Hz). Cek di perangkat: Pengaturan → Layar, atau `adb shell dumpsys display`.
- Apakah Hot 11 Play pernah menerima Android 12+ (tidak ada sumber yang mengonfirmasi). Juga apakah build-nya Android 11 Go edition (hanya disebut situs tanya-jawab yang tidak tepercaya).
- Nomor model Hot 11 Play: listing ritel menyebut X688B, sedangkan iFixit memakai X688B untuk Hot 10 Play. Tidak terselesaikan.
- Situs resmi Infinix tidak bisa dijangkau lewat pencarian; spesifikasi resmi pabrikan belum dibaca.
- Backend renderer yang benar-benar dipakai Flutter 3.50 di Hot 11 Play (Vulkan atau OpenGLES). Kode `driver_info_vk.cc` tidak menyebut GE8xxx; jawabannya harus dari log perangkat ("Using the Impeller rendering backend (...)") saat prototipe K-012.
- Versi Vulkan driver GE8320 di Helio G35 (sumber tidak konsisten 1.0 vs 1.1; gpuinfo.org tidak ditemukan).
- Benchmark fragment shader Flutter atau page-curl di PowerVR GE8320 atau GPU sekelas: tidak ditemukan.
- Cara resmi mengunci frame rate Flutter Android ke 30 fps (tidak dicari dalam riset ini).
- Apakah RevenueCat paket gratis membatasi jumlah aplikasi atau integrasi (halaman harga tidak menyebut); apakah `purchases_flutter` 11.x sudah membawa SDK Android ≥ 7.11.0 (syarat non-consumable) tidak dicek di changelog.
- Unduhan 30 hari `flutter_riverpod` (halaman pub.dev tidak menampilkan) sehingga perbandingan unduhan dengan `flutter_bloc` tidak setara.
- Apakah alfa PNG dari `native_cutout` bisa dipakai langsung sebagai `mask` untuk kuas manual.
