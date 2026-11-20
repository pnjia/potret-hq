# API berbagi ke Instagram Stories, TikTok, dan WhatsApp untuk Flutter

> Diriset: 2026-11-20 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: dokumentasi Meta "Sharing to Stories" (tanpa tanggal pembaruan), dokumentasi TikTok Share Kit dan App Review Guidelines (diperbarui 4 dan 19 Agu 2026), versi TikTok OpenSDK, sampel Meta WhatsApp Share to Status (commit terakhir 1 Jun 2026), fitur "My Status" di share sheet WhatsApp, dan **semua versi, tanggal rilis, dan jumlah likes paket pub.dev** (diambil 20 Nov 2026).
> Dipakai oleh: belum (calon: K-032 tujuan berbagi, K-033 uji metadata, kartu Trello "[SHARE] Cek API Instagram Stories, TikTok Share Kit, dan WhatsApp (K-032)")

Riset ini memperbarui dan memperdalam bagian C "Spesifikasi teknis" di `docs/riset/2026-11-18-kartu-share-viral.md`. Riset lama itu tidak diedit. Yang berubah dari riset lama:

- **Instagram**: menambah tenggat App ID, cara membuat App ID, kunci pasteboard video (dari dokumen Reels/Facebook), dan dokumen Sharing to Reels.
- **TikTok**: menambah versi SDK, syarat review (aplikasi harus sudah terbit di toko), sandbox, dan jalur Intent tanpa Share Kit di Android.
- **WhatsApp**: menambah isi kode sampel Meta Share to Status dan batas share extension iOS.
- **Baru**: paket Flutter di pub.dev dan pertanyaan metadata.

Label: **primer** = dokumentasi, situs, atau kode resmi pemilik produk; **sekunder** = media atau pihak ketiga. **Terbukti** = tertulis di sumber yang dibuka; **dugaan** = tafsiran, atau sumber yang tidak bisa dibuka penuh.

## Pertanyaan

1. **Instagram Stories**:
   - Apakah intent Android `com.instagram.share.ADD_TO_STORY` dan skema iOS `instagram-stories://share` + pasteboard masih berlaku di 2026?
   - Apa beda lapisan latar dan lapisan stiker, dan berapa ukuran, durasi, serta format yang didukung?
   - Apakah Facebook App ID wajib, dan bagaimana mendapatkannya?
   - Apa isi `LSApplicationQueriesSchemes`?
   - Bisakah video latar digabung dengan stiker?
2. **TikTok Share Kit**:
   - Versi SDK terbaru.
   - Dukungan gambar, multi-gambar, dan video.
   - Pendaftaran dan review di TikTok for Developers, serta client key.
   - Syarat berkas (FileProvider di Android, Photos/local identifier di iOS).
   - Green screen.
3. **WhatsApp**: apa yang benar-benar bisa dilakukan untuk mengirim gambar atau video ke chat atau Status?
4. **Paket Flutter**: mana yang masih dirawat (rilis ≤ 6 bulan), dan mana yang perlu kode native lewat platform channel?
5. **Metadata**: apakah share sheet sistem (`share_plus`) menghapus atau menjaga EXIF/lokasi (relevan untuk K-033)?

## Temuan

### A. Instagram Stories ("Sharing to Stories", Meta)

- **Mekanisme masih terdokumentasi di 2026** · primer · terbukti
  - Android memakai implicit intent dengan action `com.instagram.share.ADD_TO_STORY`. Extras yang dipakai:
    - `source_application` (Facebook App ID);
    - `interactive_asset_uri` (stiker);
    - `top_background_color` dan `bottom_background_color` (string hex).
  - Latar Android dipasang dengan `setDataAndType(uri, <MIME>)`. Contoh resmi hanya memakai placeholder `MEDIA_TYPE_JPEG` dan tidak pernah menyebut MIME video.
  - Izin URI di Android:
    - URI latar memakai `Intent.FLAG_GRANT_READ_URI_PERMISSION`;
    - URI stiker diberi izin lewat `activity.grantUriPermission("com.instagram.android", stickerAssetUri, FLAG_GRANT_READ_URI_PERMISSION)`;
    - kedua aset harus berupa "a content Uri to a local file on the device".
  - Alur Android: periksa `resolveActivity(intent, 0) != null`, lalu `startActivityForResult(intent, 0)`.
  - iOS memakai skema `instagram-stories://share?source_application=<appID>`. `instagram-stories` wajib didaftarkan di `LSApplicationQueriesSchemes` di Info.plist. Data dikirim lewat `UIPasteboard` (`setItems:options:`) dengan masa kedaluwarsa 5 menit di contoh resmi, setelah `canOpenURL:`.
  - Kunci pasteboard yang tertulis di halaman Instagram Stories:
    - `com.instagram.sharedSticker.backgroundImage` (NSData);
    - `com.instagram.sharedSticker.stickerImage` (NSData);
    - `com.instagram.sharedSticker.backgroundTopColor` (NSString);
    - `com.instagram.sharedSticker.backgroundBottomColor` (NSString).
  - Tabel iOS mencantumkan "Background video asset" (NSData), tetapi halaman ini **tidak menyebut nama kuncinya**.
  - Halaman tidak menampilkan tanggal pembaruan.
  - Sumber: https://developers.facebook.com/docs/instagram-platform/sharing-to-stories/ dan versi Markdown-nya https://developers.facebook.com/documentation/instagram-platform/sharing-to-stories.md (keduanya diakses 2026-11-20)

- **Lapisan latar dan lapisan stiker** · primer · terbukti
  - **Latar (Android)**: gambar JPG/PNG atau video H.264/H.265/WebM. Gambar minimal 720×1280, dengan rasio yang disarankan 9:16 atau 9:18. Video boleh 1080p dan paling lama 20 detik.
  - **Latar (iOS)**: spesifikasinya sama, ditambah anjuran ukuran video di bawah 50 MB.
  - **Stiker**: JPG/PNG, ukuran yang disarankan 640×480.
  - **Warna latar**: dua warna hex. Kalau sama, latar berwarna polos; kalau berbeda, menjadi gradasi. Warna diabaikan bila ada aset latar. Bawaannya `#222222`.
  - Minimal satu dari latar atau stiker harus dikirim.
  - Halaman punya contoh "Sharing a Background Asset and a Sticker Asset", tetapi semua contohnya hanya memakai gambar. Kombinasi **video latar + stiker** tidak dinyatakan secara eksplisit di halaman Stories.
  - Sumber: sama dengan di atas (diakses 2026-11-20)

- **Facebook App ID wajib** · primer · terbukti
  - Halaman Stories: "Beginning in January 2023, you must provide a Facebook AppID to share content to Instagram Stories." Tanpa App ID, pengguna melihat pesan "The app you shared from doesn't currently support sharing to Stories".
  - Blog Meta (10 Okt 2022): "Instagram is now requiring that all developers have access to a registered Facebook App with Basic settings configured." Tenggat awal 30 Nov 2022 diperpanjang ke 30 Jan 2023. Menurut FAQ blog, App ID yang sudah ada boleh dipakai ulang. Blog tidak menyebut App Review, Facebook SDK, atau mode Live.
  - Sumber: https://developers.facebook.com/blog/post/2022/10/10/introducing-important-update-to-Instagram-sharing-to-stories/ (diakses 2026-11-20)

- **Cara mendapat App ID** · primer · terbukti
  - "Create an App with Meta":
    1. daftar sebagai developer Meta;
    2. buka https://developers.facebook.com/apps/creation/;
    3. isi nama aplikasi dan email kontak;
    4. pilih use case;
    5. hubungkan business portfolio, atau lewati;
    6. tinjau persyaratan, lalu buka dashboard.
  - Halaman yang sama: "Create an app without a use case to obtain an app ID". Aplikasi itu tidak punya izin, fitur, atau produk. App Review diperlukan bila orang tanpa peran di aplikasi akan **memakai data** lewat aplikasi itu.
  - Sumber: https://developers.facebook.com/documentation/development/create-an-app.md (diakses 2026-11-20)
  - Halaman "No Use Case": bila hanya mengakses data dan aset milik sendiri, aplikasi tidak perlu App Review atau publikasi. Bila berencana publikasi, periksa tautan kebijakan privasi dan ikon aplikasi di pengaturan.
  - Sumber: https://developers.secure.facebook.com/docs/development/create-an-app/no-use-case/ (diakses 2026-11-20)
  - Panduan "Getting Started" Android menyebut pengaturan Android pada App ID (nama paket, kelas activity utama, dan release key hash) serta Client Token. Pengaturan ini untuk integrasi **Facebook SDK**; halaman Stories sendiri tidak mewajibkan SDK.
  - Sumber: https://developers.facebook.com/documentation/android/getting-started#app-id (diakses 2026-11-20)

- **Kunci pasteboard video dan dokumen terkait** · primer · terbukti
  - **Facebook Stories iOS** (dokumen terpisah): skema `facebook-stories://share` (didaftarkan di `LSApplicationQueriesSchemes`). Kunci pasteboard:
    - `com.facebook.sharedSticker.appID` (wajib);
    - `com.facebook.sharedSticker.backgroundImage`;
    - `com.facebook.sharedSticker.backgroundVideo`;
    - `com.facebook.sharedSticker.stickerImage`;
    - dua kunci warna.
  - Spesifikasi video Facebook Stories sama: H.264/H.265/WebM, 1080p, ≤ 20 dtk, < 50 MB.
  - Sumber: https://developers.facebook.com/documentation/sharing/sharing-to-stories/ios-developers (diakses 2026-11-20)
  - **Sharing to Reels Instagram iOS**: skema `instagram-reels://share`. Kunci pasteboard:
    - `com.instagram.sharedSticker.backgroundVideo` (wajib);
    - `com.instagram.sharedSticker.stickerImage` (opsional, tampil di atas video);
    - `com.instagram.sharedSticker.appID` (wajib).
  - Video Reels: 3–60 dtk, 1080p, H.264/H.265/WebM, < 50 MB. Halaman Reels menyatakan aplikasi Meta harus **Go Live** sebelum pengguna bisa berbagi. Pernyataan serupa **tidak ada** di halaman Stories.
  - Sumber: https://developers.facebook.com/documentation/ios/sharing-to-reels-instagram (diakses 2026-11-20)

- **Package visibility Android 11+** · primer · terbukti
  - Aplikasi yang menargetkan API 30+ mendapat hasil yang difilter dari `queryIntentActivities()`, `getPackageInfo()`, dan metode sejenis. Untuk melihat aplikasi lain, aplikasi harus mendeklarasikan elemen `<queries>`. Halaman Instagram tidak memberi panduan `<queries>`.
  - Sumber: https://developer.android.com/training/package-visibility (diakses 2026-11-20)

### B. TikTok Share Kit

- **Versi SDK** · primer · terbukti
  - **Android**:
    - Repo Maven `https://artifact.bytedance.com/repository/AwemeOpenSDK`, artefak `com.tiktok.open.sdk:tiktok-open-sdk-core`, `-auth`, dan `-share`. Dokumentasi memakai `latest.release`.
    - Metadata Maven `tiktok-open-sdk-share`: versi terbaru **2.4.0**, `lastUpdated` 22 Jul 2025.
    - minSdk 21.
    - Wajib `<queries>` untuk `com.zhiliaoapp.musically` dan `com.ss.android.ugc.trill`.
    - Sidik jari sertifikat MD5 dan SHA-256 didaftarkan saat registrasi aplikasi.
  - Sumber: https://developers.tiktok.com/doc/mobile-sdk-android-quickstart (diperbarui 4 Agu 2026) dan https://artifact.bytedance.com/repository/AwemeOpenSDK/com/tiktok/open/sdk/tiktok-open-sdk-share/maven-metadata.xml (keduanya diakses 2026-11-20)
  - Rilis GitHub Android terakhir: `2.3.1-release` (24 Okt 2024, redirect_uri dari deeplink ke HTTPS). Rilis sebelumnya v2.3.0 (25 Mar 2024) membuka Play Store bila TikTok tidak terpasang. Versi Maven 2.4.0 tidak punya catatan rilis di GitHub.
  - Sumber: https://github.com/tiktok/tiktok-opensdk-android/releases.atom (diakses 2026-11-20)
  - **iOS**:
    - SPM `https://github.com/tiktok/tiktok-opensdk-ios`, atau CocoaPods `TikTokOpenSDKCore`/`TikTokOpenAuthSDK`/`TikTokOpenShareSDK`.
    - Minimum iOS 11.
    - Info.plist:
      - `LSApplicationQueriesSchemes`: `tiktokopensdk`, `tiktoksharesdk`, `snssdk1180`, `snssdk1233`;
      - `TikTokClientKey`;
      - client key sebagai `CFBundleURLSchemes`.
  - Sumber: https://developers.tiktok.com/doc/mobile-sdk-ios-quickstart (diperbarui 19 Agu 2026, diakses 2026-11-20)
  - Rilis iOS terakhir **v2.5.0** (4 Sep 2024, dukungan Xcode 16 beta 3). v2.4.0 (1 Apr 2024) menambah Privacy Manifest. Tidak ada rilis SDK iOS sesudah Sep 2024.
  - Sumber: https://github.com/tiktok/tiktok-opensdk-ios/releases.atom (diakses 2026-11-20)

- **Share Kit Android** · primer · terbukti
  - Prasyarat: Android Quickstart selesai, `client_key` dari bagian App details, dan Share Kit ditambahkan lewat Manage apps → "+ Add products".
  - Video:
    - durasi 1–360 dtk;
    - hanya `.mp4`;
    - "The maximum frame size is 1100 px.";
    - multi-video sampai 35.
  - Gambar: "The number of images should be more than 1 and up to 35." Format dan ukuran gambar tidak disebut.
  - Green screen (`Format.GREEN_SCREEN`): "The number of images and videos should only be 1."
  - Berkas `file:///` diubah dulu menjadi `content://` lewat FileProvider. Izin baca diberikan lewat `grantUriPermission` ke **kedua** paket TikTok: `com.zhiliaoapp.musically` dan `com.ss.android.ugc.trill`.
  - Hasil share dibaca dengan `ShareApi.getShareResponseFromIntent`. Activity hasil harus `exported="true"`. Contoh kode galat:
    - `-2` dibatalkan;
    - `-3/10011` sertifikat aplikasi tidak cocok;
    - `-5/20012` format video tidak didukung;
    - `-4/20016` tersimpan sebagai draf.
  - **Tanpa Share Kit**: "Developers can use Intent to share content with TikTok without using our Share Kit." Caranya `ACTION_SEND`/`ACTION_SEND_MULTIPLE` dengan `EXTRA_STREAM` dan `setPackage` ke salah satu paket TikTok. Multi-gambar menjadi slideshow; multi-video disambung menjadi satu video.
  - Share Kit bisa menyertakan "partner hashtags", tetapi cara konfigurasinya tidak dijelaskan. Logo merek atau watermark yang dipakai harus berizin.
  - Sumber: https://developers.tiktok.com/doc/share-kit-android-quickstart-v2 (diperbarui 4 Agu 2026, diakses 2026-11-20)

- **Share Kit iOS** · primer · terbukti
  - Media dikirim sebagai `localIdentifiers` (media di Photos). Satu share hanya boleh berisi satu jenis media: sampai 35 gambar atau 12 video.
  - Rasio aspek harus antara 1/2,2 dan 2,2. Video boleh sampai 10 menit, tetapi batasnya "may vary based on the region". Media di iCloud harus diunduh dulu.
  - "Your app must have access to the user's photo library to successfully share videos to TikTok."
  - `shareFormat = .greenScreen` tersedia (bawaan `.normal`).
  - `redirectURI` adalah "Universal link that's used to callback to your application" (contoh `https://www.example.com/path`).
  - Sumber: https://developers.tiktok.com/doc/share-kit-ios-quickstart-v2 (diperbarui 4 Agu 2026, diakses 2026-11-20)

- **Pendaftaran, review, dan sandbox** · primer · terbukti
  - Membuat aplikasi: Manage apps → "Connect an app" → pilih pemilik (organisasi disarankan; individu bisa, tetapi tidak dianjurkan untuk integrasi nyata) → lengkapi halaman aplikasi dan produk → submit for review.
  - Isian yang diminta:
    - ikon 1024×1024 (JPEG/PNG, ≤ 5 MB);
    - kategori dan deskripsi;
    - URL Terms of Service dan Privacy Policy, yang wajib diverifikasi untuk aplikasi yang dibuat sesudah 9 Sep 2024;
    - Android: nama paket, URL Play Store, app signature, dan signing certificate;
    - iOS: URL App Store dan Bundle ID.
  - Status aplikasi: Draft → In review → Live / Not approved.
  - Sumber: https://developers.tiktok.com/doc/getting-started-create-an-app (diperbarui 4 Agu 2026, diakses 2026-11-20)
  - Quickstart iOS: "Upon approval, you will be provided with a client key and client secret".
  - Sumber: https://developers.tiktok.com/doc/mobile-sdk-ios-quickstart (diakses 2026-11-20)
  - **App Review Guidelines** (diperbarui 4 Agu 2026):
    - "Apps that are still in development or testing will not be approved."
    - iOS: "Your app must be published in the Apple App Store."
    - Android: "Your app must be published in the Google Play Store."
    - Situs resmi harus "fully developed", tidak boleh halaman landing atau login, dengan tautan Privacy Policy dan ToS yang terlihat tanpa membuka menu.
    - Wajib video demo end-to-end: 1–5 video, masing-masing ≤ 50 MB, dimulai dengan membuka aplikasi.
    - Review pertama wajib mendemokan integrasi di sandbox.
    - Tidak ada aturan khusus Share Kit, dan tidak ada perkiraan lama review.
  - Sumber: https://developers.tiktok.com/doc/app-review-guidelines (diakses 2026-11-20)
  - **Sandbox**: lingkungan terbatas untuk mencoba integrasi tanpa review. Maksimal 5 sandbox per aplikasi, dan bisa dibagikan ke maksimal 10 akun TikTok (target users). Halaman tidak menyebut produk mana yang didukung sandbox. Changelog: sandbox diluncurkan 24 Jun 2024. Tidak ada entri changelog 2025–2026 tentang Share Kit.
  - Sumber: https://developers.tiktok.com/blog/introducing-sandbox dan https://developers.tiktok.com/doc/changelog (keduanya diakses 2026-11-20)

### C. WhatsApp

- **Integrasi resmi Android: intent biasa** · primer · terbukti
  - FAQ WhatsApp untuk developer Android menyebut dua cara: custom URL scheme dan intent system Android. Kirim lewat `Intent.ACTION_SEND`. Untuk melewati pemilih aplikasi, pakai `sendIntent.setPackage("com.whatsapp")`. Media juga bisa dikirim lewat intent. Halaman ini **tidak menyebut Status** dan tidak bertanggal.
  - Sumber: https://faq.whatsapp.com/android/28000012 (diakses 2026-11-20)
  - WhatsApp Business memakai paket berbeda (`com.whatsapp.w4b`), sehingga `setPackage("com.whatsapp")` tidak menjangkaunya.
  - Sumber: https://kiwix.lema.org/stackoverflow.com_en_all_2023-11/questions/32309061/sending-message-to-whatsapp-from-android-app (arsip Stack Overflow, sekunder, diakses lewat cuplikan pencarian 2026-11-20; **dugaan kuat**)

- **Integrasi resmi iOS** · primer · terbukti
  - FAQ "How to link to WhatsApp from a different app":
    - universal link `https://wa.me/<nomor>?text=`;
    - skema `whatsapp://` dengan parameter `app`, `send`, dan `text`. Tidak ada parameter media, jadi **hanya teks**;
    - share extension lewat `UIActivityViewController` (sejak iOS 8), disebut "the preferred way of sharing your content onto WhatsApp".
  - Batas share extension:
    - mendukung `public.image` dan `public.movie` (juga audio, PDF, kontak, teks, URL);
    - maksimal 30 berkas;
    - gambar 16 MB, video 200 MB, total 2 GB;
    - konten tidak bisa diedit saat dibagikan.
  - Document Interaction API disebut di pengantar tanpa rincian.
  - Sumber: https://faq.whatsapp.com/iphone/23559013 (diakses 2026-11-20; halaman tidak bertanggal)

- **"Share to Status" Android: hanya kode sampel Meta, bukan dokumentasi** · primer (kode sampel) · terbukti untuk isi kode
  - Repo `fbsamples/whatsapp_status_api_android` (README: "WhatsApp's Share to Status Android API", bisa "with or without a sticker"). Commit:
    - 2 Jun 2025: base commit;
    - 15 Jan 2026: sampel "custom share actions" untuk share sheet OS;
    - 1 Jun 2026: header hak cipta.
  - Lisensi "Meta Platform Policy".
  - Isi `MainActivity.kt`:
    - `Intent.ACTION_VIEW` dengan data `https://wa.me/status` dan `setPackage("com.whatsapp")`;
    - extras: `share_type` = `"SHARE_TO_STATUS"`, `source_app_package_name`, `Intent.EXTRA_STREAM` (media latar), `foreground_media` (stiker/media depan), `background_color`, `color_gradient_top`, `color_gradient_bottom`;
    - `grantUriPermission("com.whatsapp", uri, FLAG_GRANT_READ_URI_PERMISSION)` untuk kedua media, ditambah `FLAG_GRANT_PREFIX_URI_PERMISSION`;
    - di Android 14+ (`UPSIDE_DOWN_CAKE`), sampel meluncurkan share sheet OS dengan custom action yang meneruskan intent Status lewat `WhatsappStatusProxyActivity`.
  - Tidak ada App ID, nomor versi WhatsApp minimum, batas durasi, atau versi iOS di sampel ini.
  - Sumber: https://github.com/fbsamples/whatsapp_status_api_android, https://raw.githubusercontent.com/fbsamples/whatsapp_status_api_android/main/app/src/main/java/com/example/sharetowhatsappstatus/MainActivity.kt, https://github.com/fbsamples/whatsapp_status_api_android/commits/main.atom (semua diakses 2026-11-20)
  - Dokumentasi resmi di developers.facebook.com atau faq.whatsapp.com untuk API ini **tidak ditemukan**. Hasil pencarian 20 Nov 2026 juga tidak menemukan halaman resmi yang menyebut `wa.me/status`.

- **"My Status" di share sheet (fitur pengguna, bukan API)** · sekunder · terbukti untuk iOS
  - WABetaInfo (25 Agu 2025): WhatsApp iOS 25.22.83 menambah opsi "My Status" di share sheet iOS, sehingga foto atau video dari aplikasi mana pun bisa langsung diposting ke Status. Peluncurannya bertahap.
  - Sumber: https://wabetainfo.com/whatsapp-for-ios-25-22-83-whats-new/ (diakses 2026-11-20)
  - 9to5Mac (5 Nov 2025): Apple Music di iOS 26.2 beta 1 punya integrasi "WhatsApp Status" untuk lirik. Ini fitur bawaan Apple, bukan API pihak ketiga.
  - Sumber: https://9to5mac.com/2025/11/05/apple-music-share-whatsapp-status/ (diakses 2026-11-20)
  - Android: Beebom melaporkan uji pintasan Status di share sheet Android, tetapi rilisnya tidak terkonfirmasi (cuplikan pencarian, **dugaan**).
  - Sumber: https://gadgets.beebom.com/news/whatsapp-might-add-share-sheet-shortcut-status-updates (diakses 2026-11-20)

### D. Paket Flutter di pub.dev (diambil 2026-11-20)

Batas "dirawat" = rilis terakhir ≤ 6 bulan, yaitu sesudah 20 Mei 2026. Tanggal diambil dari `https://pub.dev/api/packages/<nama>` kecuali ditandai "≈" (dari teks "x months ago").

| Paket | Versi · tanggal | Publisher · likes | Instagram Stories | TikTok | WhatsApp | Dirawat? |
|---|---|---|---|---|---|---|
| `share_plus` | 13.3.1 · 1 Okt 2026 | fluttercommunity.dev (terverifikasi) · 4,04 rb | lewat share sheet saja | lewat share sheet saja | lewat share sheet saja | Ya |
| `appinio_social_share` | 0.3.3 · 12 Agu 2026 (rilis sebelumnya 1 Agu 2024) | appinio.app (terverifikasi) · 304 | latar gambar/video + stiker + App ID | Android tanpa SDK; iOS via OpenSDK + client key | Android media; iOS **hanya teks** | Ya, tetapi jeda 2 tahun sebelum rilis terakhir |
| `social_story_share` | 0.2.2 · 22 Jul 2026 | tidak terverifikasi · 2 | latar gambar/video + stiker + App ID | tidak | teks | Ya |
| `flutter_social_share_plus` | 1.0.0 · 2 Sep 2026 | takzobye.com (terverifikasi) · 5 | latar gambar **atau** video + stiker + App ID; memakai Meta Share SDK Android 18.2.3 dan Facebook iOS SDK 18.1.x | tidak | tidak | Ya (baru satu versi) |
| `social_share_kit` | 0.2.0 · 7 Agu 2026 | tidak terverifikasi · 0 | Stories (App ID wajib) | Android ke clipboard/intent (35 media); iOS tidak (butuh OpenSDK) | Android berkas; iOS 1 gambar | Ya |
| `social_share_pro` | 1.0.0 · ≈ 31 Okt 2026 | navaghandabhi.dev (terverifikasi) · 0 | latar gambar + stiker (tanpa video) | tidak | Status Android satu gambar; iOS lewat menu "Open in" | Ya (baru satu versi) |
| `android_intent_plus` | 6.1.0 · 23 Jul 2026 | fluttercommunity.dev · 495 | — (intent umum) | — | — | Ya |
| `share_to_social` | 1.0.7 · 8 Mei 2025 | stockert.blogspot.com · 11 | berkas ke Instagram (tanpa mode stiker) | iOS OpenSDK + client key | — | Tidak |
| `tiktok_sdk_login_share` | 1.0.2 · 27 Okt 2025 | tidak terverifikasi · 0 | — | Share Kit (flag gambar/green screen) | — | Tidak |
| `tiktok_sdk_v2` | 0.0.3 · 13 Jun 2025 | tidak terverifikasi · 6 | — | **Login saja** | — | Tidak |
| `social_sharing_plus` | 1.2.3 · 19 Sep 2024 | tidak terverifikasi · 59 | — | — | ya | Tidak |
| `social_share` | 2.3.1 · 23 Nov 2022 | tidak terverifikasi · 409 | latar gambar (tanpa video) | — | — | Tidak |

Rincian dan sumber per paket:

- **`share_plus`** · primer (halaman paket) · terbukti
  - API `SharePlus.instance.share(ShareParams(...))` dengan `files` (XFile), `fileNameOverrides`, `excludedCupertinoActivities`, dan lainnya. API lama `Share.shareXFiles()` sudah deprecated.
  - Syarat: iOS 13.0, Flutter 3.38.1+, Dart 3.10, Java 17, Kotlin 2.2.0, AGP 8.12.1+.
  - **Tidak ada API untuk menargetkan aplikasi tertentu**. Halaman menyebut berbagi ke aplikasi keluarga Facebook "isn't reliable", dan bug kompatibilitas aplikasi pihak ketiga akan ditutup.
  - Sumber: https://pub.dev/packages/share_plus dan https://pub.dev/api/packages/share_plus (diakses 2026-11-20)
- **`appinio_social_share`** · primer (halaman paket) · terbukti
  - Mendukung Instagram/Facebook Stories (latar gambar atau video, stiker, warna, attribution URL, App ID).
  - Pengaturan iOS: `FacebookAppID`, `FacebookClientToken`, skema `fb<app_id>`, dan pemanggilan `FBSDKCoreKit` di AppDelegate. Pengaturan Android: `facebook_app_id` dan `facebook_client_token` di `strings.xml`.
  - TikTok:
    - Android: `shareToTiktokStatus`/`shareToTiktokPost` tanpa SDK;
    - iOS: kode OpenSDK disalin manual ke AppDelegate (method channel `appinio_social_share_tiktok`), memakai client key, dan menyimpan berkas ke Photos lebih dulu.
  - WhatsApp: Android mengirim media; iOS hanya teks ("For Ios only text works").
  - Masalah yang tercatat di halaman:
    - dokumentasi TikTok iOS saling bertentangan;
    - contoh `shareToWhatsApp` memanggil `shareToSMS`;
    - contoh TikTok iOS tidak selalu memanggil `result`;
    - halaman menyinggung izin `MANAGE_EXTERNAL_STORAGE`, yang menurut halaman itu "requires additional permissions from google".
  - Deployment target iOS di contoh: 11.
  - Sumber: https://pub.dev/packages/appinio_social_share dan https://pub.dev/api/packages/appinio_social_share (diakses 2026-11-20)
- **`social_story_share`**: https://pub.dev/packages/social_story_share, repo https://github.com/uemirhanselim/social_story_share (diakses 2026-11-20).
- **`flutter_social_share_plus`**:
  - memakai Meta Share SDK; menyalin berkas ke cache dan membagikannya lewat FileProvider non-exported;
  - video ≤ 50 MiB;
  - menyebut attribution URL "may be ignored";
  - butuh App ID dan client token.
  - Sumber: https://pub.dev/packages/flutter_social_share_plus, repo https://github.com/takzobye/flutter_social_share_plus (diakses 2026-11-20)
- **`social_share_kit`**: tanpa SDK vendor; tabel kemampuan per tujuan. Sumber: https://pub.dev/packages/social_share_kit (diakses 2026-11-20)
- **`social_share_pro`**: contentUrl Instagram hanya menjadi tautan yang bisa diketuk untuk "approved partner apps" (klaim penulis paket). Sumber: https://pub.dev/packages/social_share_pro (diakses 2026-11-20)
- **`android_intent_plus`**:
  - halaman hanya mendokumentasikan `action`, `category`, `data`, dan `arguments`;
  - tidak menyebut `ClipData`, `grantUriPermission`, atau FileProvider;
  - tidak mendukung hasil activity (`startActivityForResult`).
  - Sumber: https://pub.dev/packages/android_intent_plus (diakses 2026-11-20)
- **Lainnya**:
  - https://pub.dev/packages/share_to_social;
  - https://pub.dev/packages/tiktok_sdk_login_share (repo `ganlong-2016/tiktok_sdk_v2`);
  - https://pub.dev/packages/tiktok_sdk_v2;
  - https://pub.dev/packages/social_sharing_plus;
  - https://pub.dev/packages/social_share.
  - Hasil pencarian pub.dev: https://pub.dev/packages?q=instagram+stories+share, https://pub.dev/packages?q=tiktok+share, https://pub.dev/packages?q=whatsapp+share.
  - Semua diakses 2026-11-20.

### E. Metadata EXIF/lokasi lewat share sheet

- **`share_plus`**: halaman paket **tidak menyebut** penghapusan atau penjagaan EXIF/metadata. Sumber: https://pub.dev/packages/share_plus (diakses 2026-11-20). Sumber yang menyatakan `share_plus` atau `UIActivityViewController`/`ACTION_SEND` menghapus EXIF dari berkas yang dikirim aplikasi: **belum ditemukan**.
- **iOS Photos**: tombol Options di share sheet (sejak iOS 13) punya sakelar Location di bagian "Include". Sakelar ini berlaku untuk foto yang dibagikan **dari aplikasi Photos** dan harus diatur per batch. Sumber sekunder (Apple Community dan Computerworld), bukan dokumen Apple:
  - https://discussions.apple.com/thread/256092610
  - https://www.computerworld.com/article/1671419/how-to-use-the-new-share-button-in-ios-13-ipados
  - diakses 2026-11-20 lewat cuplikan pencarian (**dugaan kuat**)
- **Android Photo Picker**: secara bawaan menghapus data lokasi EXIF dari foto yang dipilih pengguna untuk aplikasi lain. Ini terjadi saat aplikasi **mengambil** foto, bukan saat membagikannya. Sumber: https://androidauthority.com/new-android-photo-picker-api-coming-3701717 (cuplikan pencarian, sekunder, diakses 2026-11-20; **dugaan kuat**)
- **Aplikasi penerima**: klaim bahwa aplikasi pesan menghapus metadata saat mengirim sebagai "foto", tetapi menjaganya saat mengirim sebagai "dokumen", hanya ada di blog pihak ketiga. Sumber: https://www.fast.io/resources/whatsapp-telegram-signal-photo-metadata-preservation.md (cuplikan pencarian, diakses 2026-11-20; **dugaan**). Dokumentasi resmi WhatsApp, Instagram, atau TikTok tentang metadata unggahan: belum ditemukan.

## Kesimpulan

**Fakta bersumber (ringkas).**

- **Instagram Stories**:
  - Intent Android `com.instagram.share.ADD_TO_STORY` dan skema iOS `instagram-stories://share` + pasteboard masih terdokumentasi resmi (diakses 20 Nov 2026).
  - Facebook App ID wajib sejak Januari 2023, dan bisa didapat dari aplikasi Meta tanpa use case.
  - Lapisan latar menerima gambar (≥ 720×1280) atau video (H.264/H.265/WebM, 1080p, ≤ 20 dtk). Lapisan stiker menerima JPG/PNG.
  - Kombinasi video latar + stiker tidak dicontohkan di halaman Stories. Kunci pasteboard video untuk Stories tidak disebut di halaman Stories; dokumen Reels dan Facebook memakai `...sharedSticker.backgroundVideo`.
- **TikTok**:
  - SDK terakhir: Android 2.4.0 (Maven, Jul 2025) dan iOS 2.5.0 (Sep 2024).
  - Share Kit butuh aplikasi terdaftar dengan client key. Review mewajibkan aplikasi **sudah terbit** di App Store/Play Store dan didemokan di sandbox.
  - Di Android, TikTok sendiri mendokumentasikan jalur `ACTION_SEND` + `setPackage` **tanpa** Share Kit.
  - Di iOS, Share Kit butuh media di Photos (`localIdentifiers`), akses galeri, dan universal link sebagai `redirectURI`.
- **WhatsApp**:
  - Jalur resmi untuk media adalah intent Android (`setPackage("com.whatsapp")`) dan share extension iOS (gambar ≤ 16 MB, video ≤ 200 MB). `whatsapp://` hanya untuk teks.
  - Share to Status untuk pihak ketiga hanya ada sebagai kode sampel Meta untuk Android (`wa.me/status` + `share_type=SHARE_TO_STATUS`), tanpa dokumentasi resmi dan tanpa padanan iOS. Di iOS, pengguna bisa memilih "My Status" dari share sheet sejak WhatsApp 25.22.83 (Agu 2025).
- **Paket Flutter**:
  - `share_plus` dirawat aktif tetapi tidak bisa menargetkan aplikasi.
  - Paket yang menargetkan Instagram Stories ada yang dirawat (`appinio_social_share`, `social_story_share`, `flutter_social_share_plus`), tetapi likes-nya kecil kecuali `appinio`, dan sebagian menarik Facebook SDK.
  - Tidak ada paket TikTok Share Kit yang dirawat ≤ 6 bulan dengan basis pengguna berarti.
- **Metadata**: tidak ditemukan sumber yang menyatakan share sheet menghapus EXIF dari berkas buatan aplikasi.

**Tafsiran (bukan keputusan; label: tafsiran peneliti).** Semua butir di bawah ini adalah usulan yang perlu diputuskan pemilik atau agen teknis lewat K- baru.

### Rekomendasi pendekatan per tujuan (tafsiran)

| Tujuan | Usulan MVP | Alasan | Kode native? |
|---|---|---|---|
| **WhatsApp** | Android: `ACTION_SEND` + `setPackage("com.whatsapp")` dengan media dari FileProvider; bila WhatsApp tidak terpasang, kembali ke share sheet. iOS: share sheet (`share_plus`), karena `whatsapp://` hanya teks. Jalur `wa.me/status` ditunda sampai ada dokumentasi resmi (sesuai K-032 "bila API-nya terkonfirmasi") | Jalur resmi FAQ; Status iOS sudah bisa dipilih pengguna dari share sheet | Android: sedikit Kotlin (`grantUriPermission`); iOS: tidak |
| **Instagram Stories** | Platform channel sendiri yang tipis (Kotlin + Swift, ±100 baris), mengikuti dokumen Meta: gambar latar 9:16 untuk Halaman Kliping dan Temuan Tunggal, stiker PNG untuk Stiker Temuan (latar warna dari varian warna kartu), video latar untuk Video Buka Halaman. Alternatif: `appinio_social_share`, tetapi menarik Facebook SDK di iOS, punya jeda rilis 2 tahun, dan menyinggung `MANAGE_EXTERNAL_STORAGE` | Mekanismenya sederhana dan stabil sejak 2018–2023. Paket pihak ketiga punya likes kecil atau menambah SDK yang tidak perlu. Kode sendiri mudah diaudit untuk K-033 | Ya (tipis) |
| **TikTok** | Android: intent `ACTION_SEND` + `setPackage` (didokumentasikan TikTok, tanpa client key, tanpa review). iOS: share sheet sistem di MVP; Share Kit menyusul **setelah** aplikasi terbit dan lolos review TikTok | Review TikTok mensyaratkan aplikasi sudah ada di toko, jadi Share Kit tidak bisa siap untuk pengguna umum pada hari rilis. Belum terbukti TikTok muncul di share sheet iOS (lihat "Belum terjawab") | Android: tipis; iOS Share Kit nanti: ya (SPM + AppDelegate + universal link) |
| **Simpan** | Simpan ke galeri (paket galeri yang dirawat; tidak diteliti di sini) | — | — |
| **Lainnya** | `share_plus` | Dirawat aktif, terverifikasi, 4 rb likes | Tidak |

Catatan tafsiran tambahan:

- **Video Buka Halaman** (sekitar 4–8 dtk menurut riset 18 Nov) aman untuk batas Instagram Stories (≤ 20 dtk) dan TikTok (≥ 1 dtk).
- **Batas TikTok yang ambigu**: "maximum frame size 1100 px" (Android) berpotensi bertentangan dengan video 1080×1920. Ini harus diuji di perangkat sebelum resolusi render video share dikunci. Pemilihan resolusi dan encoder adalah keputusan `animasi-buku` (K-003: tanpa FFmpegKit).
- **Gambar tunggal ke TikTok**: "more than 1 and up to 35 images" bisa berarti Share Kit Android menolak satu gambar. Ini juga perlu diuji. Jalur intent tidak menyebut batas itu.
- **Stiker Temuan untuk TikTok dan WhatsApp**: lapisan stiker resmi hanya ada di Instagram (dan di sampel Status WhatsApp). Untuk TikTok, PNG transparan kemungkinan tampil di atas latar hitam atau putih (**dugaan**, belum diuji).
- **K-033 (metadata)**: karena tidak ada sumber yang menjamin share sheet menghapus EXIF, penghapusan sebaiknya dilakukan **saat berkas dibuat** di aplikasi, lalu diuji per format (PNG, JPG, MP4) seperti tertulis di K-033. Untuk TikTok iOS, berkas akan masuk ke galeri lebih dulu. Galeri bisa menambah metadata sendiri saat aset dibuat (misalnya tanggal), jadi perlu diuji (**dugaan**).

### Yang perlu didaftarkan pemilik (tafsiran, berdasarkan sumber di atas)

1. **Meta App ID** (wajib untuk Instagram Stories):
   1. Daftar sebagai developer Meta di https://developers.facebook.com.
   2. Buka https://developers.facebook.com/apps/creation/, isi nama aplikasi dan email kontak.
   3. Pilih jalur tanpa use case ("Create an app without a use case"); business portfolio boleh dilewati.
   4. Salin App ID dari dashboard.
   5. Isi tautan kebijakan privasi dan ikon aplikasi di pengaturan. Halaman "No Use Case" menyebutnya untuk publikasi, sedangkan halaman Stories tidak menyebut syarat Live (lihat "Belum terjawab").

   App ID bukan rahasia (ikut tertanam di aplikasi), tetapi tetap jangan menaruh App Secret atau Client Token di repo. Client Token hanya perlu bila memakai Facebook SDK, seperti di `appinio_social_share` dan `flutter_social_share_plus`.
2. **TikTok client key** (hanya bila Share Kit dipakai; tidak perlu untuk jalur intent Android):
   1. Buat akun di https://developers.tiktok.com → Manage apps → "Connect an app". Pemilik organisasi disarankan.
   2. Lengkapi ikon 1024×1024, kategori, dan deskripsi, serta URL ToS dan Privacy Policy terverifikasi di situs resmi yang "fully developed".
   3. Isi data Android (nama paket, URL Play Store, MD5/SHA-256 sertifikat) dan iOS (URL App Store, Bundle ID).
   4. Tambah produk Share Kit, uji di sandbox (maksimal 10 akun penguji), rekam video demo, lalu submit for review.

   Karena review mensyaratkan aplikasi sudah terbit di toko, langkah ini realistis baru dilakukan **setelah** rilis pertama.
3. **Domain untuk universal link iOS**: hanya diperlukan bila Share Kit iOS dipakai (`redirectURI`).

## Belum terjawab

- **Instagram Stories**:
  - Apakah kombinasi **video latar + stiker** berfungsi. Dokumen Stories tidak memberi contoh; dokumen Reels iOS mendukung video + stiker.
  - Nama kunci pasteboard video di dokumen Instagram Stories. Paket pihak ketiga dan dokumen Reels/Facebook memakai pola `...sharedSticker.backgroundVideo`, tetapi ini tidak tertulis di halaman Stories.
  - MIME video yang benar untuk intent Android (contoh resmi hanya `MEDIA_TYPE_JPEG`).
  - Apakah aplikasi Meta dalam mode pengembangan (belum Live) sudah bisa dipakai untuk Stories. Hanya dokumen Reels yang menyebut Go Live.
  - Apakah Instagram menampilkan nama aplikasi asal di Story, dan cara mendapat attribution link. Klaim "hanya mitra" berasal dari penulis paket, bukan Meta.
  - Isi `<queries>` yang dianjurkan Meta untuk Android 11+.
- **TikTok**:
  - Makna "maximum frame size is 1100 px" untuk video Android.
  - Apakah "more than 1" image berarti minimal 2 gambar.
  - Apakah Share Kit tersedia di sandbox.
  - Lama review.
  - Cara konfigurasi partner hashtags.
  - Apakah TikTok muncul sebagai tujuan di share sheet iOS (`UIActivityViewController`) untuk gambar dan video tanpa SDK.
  - Arti versi Maven 2.4.0 (tidak ada catatan rilis).
- **WhatsApp**:
  - Dokumentasi resmi Share to Status, batas format dan durasi, apakah butuh pendaftaran, versi WhatsApp minimum, dan status dukungan iOS.
  - Apakah opsi "My Status" di share sheet Android sudah dirilis.
  - Apakah intent ke `com.whatsapp` dengan gambar langsung menawarkan Status di daftar penerima. Ini perilaku yang umum dilaporkan, tetapi sumber resminya tidak ditemukan.
- **Metadata**:
  - Sumber resmi tentang apakah `share_plus`, `ACTION_SEND`, atau `UIActivityViewController` mengubah EXIF berkas.
  - Sumber resmi tentang apakah WhatsApp, Instagram, dan TikTok menghapus metadata saat unggah.
  - Apakah `PHAssetCreationRequest` menambah metadata saat berkas disimpan ke galeri untuk Share Kit iOS.
- **Apple**: batas jumlah entri `LSApplicationQueriesSchemes`. Halaman dokumentasi `canOpenURL(_:)` tidak terbaca.
- **Paket Flutter**: kualitas kode dan isu terbuka di GitHub tiap paket belum diperiksa. Penilaian di atas hanya dari halaman pub.dev.
