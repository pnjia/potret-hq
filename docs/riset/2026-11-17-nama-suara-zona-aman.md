# Nama aplikasi, lisensi suara, dan zona aman 9:16

> Diriset: 2026-11-17 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: daftar aplikasi di App Store dan Google Play (berubah tiap hari), status merek di PDKI (belum dicek, lihat "Belum terjawab"), Syarat Layanan Pixabay (terakhir diubah 20 Okt 2026), angka zona aman Meta dan TikTok (pedoman iklan, bisa berubah tanpa pemberitahuan).
> Dipakai oleh: Q-006 (nama aplikasi), Q-008 (sumber dan lisensi suara), `docs/desain/acuan/kartu-share.md` (zona aman). Belum ada keputusan K- yang memakainya.

## Pertanyaan

1. Apakah kandidat nama "Kliping", "Tempel", "Jepret", "Sudut", "Potret", "Tempelan", "Kliping Kota" (plus beberapa kandidat tambahan) sudah dipakai aplikasi lain di App Store dan Google Play, dan adakah konflik merek yang jelas?
2. Apa syarat lisensi Freesound (CC0, CC BY) dan Pixabay untuk efek suara di aplikasi komersial, dan apakah suara itu boleh ikut di video share yang diunggah pengguna ke media sosial? Apa yang dibutuhkan bila suara direkam sendiri (foley)?
3. Berapa margin atas, bawah, dan samping zona aman untuk story, Reels, dan TikTok pada kanvas 1080 × 1920 menurut sumber resmi atau sumber tepercaya?

## Cara pencarian (dibaca dulu)

- App Store: iTunes Search API, negara Indonesia, `entity=software`, 10 hasil teratas per kata (contoh: https://itunes.apple.com/search?term=kliping&country=id&entity=software&limit=10). API ini mencocokkan makna, bukan hanya teks: kata "jepret" dibalas aplikasi bernama "Snap ...", "gunting" dibalas "Scissors ...". Jadi "tidak ditemukan" berarti **tidak muncul di 10 hasil teratas**, bukan "tidak ada".
- Google Play: halaman pencarian `play.google.com/store/search?q=<kata>&c=apps&hl=id&gl=ID`. Halaman terpotong setelah 10 sampai 22 hasil, dan halaman detail aplikasi tidak terbaca (isinya dimuat lewat JavaScript), sehingga kategori, jumlah unduhan, dan tanggal rilis tidak didapat.
- PDKI (pangkalan data merek DJKI): halaman pencarian kosong saat diambil (butuh JavaScript), jadi **status merek tidak dicek**.
- Semua sumber di bawah diakses 2026-11-17.

## Temuan 1: kandidat nama

### Fakta per kandidat

| Kandidat | App Store (ID) | Google Play (ID) | Sumber |
|---|---|---|---|
| Kliping | Ada aplikasi bernama persis **"Kliping"** oleh Kliping d.o.o., kategori News, untuk iPad, butuh iOS 10+ | Ada aplikasi **"Kliping"** oleh pengembang "Kliping" (paket `si.kliping.kliping`), rating 3,5; detail tidak terbaca. Hasil lain: "Project Life - Scrapbooking", "Ternak Klip" | https://itunes.apple.com/search?term=kliping&country=id&entity=software&limit=10 · https://apps.apple.com/id/app/kliping/id434063728 · https://play.google.com/store/search?q=kliping&c=apps&hl=id&gl=ID · https://play.google.com/store/apps/developer?id=Kliping |
| Kliping Kota | Tidak diperiksa terpisah (lihat "Kliping") | Tidak ada nama yang memuat "Kliping"; hasilnya gim membangun kota (Designer City, TheoTown, City Island) | https://play.google.com/store/search?q=kliping%20kota&c=apps&hl=id&gl=ID |
| Tempel | Tidak ada nama yang memuat "Tempel" di 10 teratas; hasilnya Temple Run, "Cut & Paste – Erase Background" | Lima dari 15 teratas memuat "Tempel", semuanya editor foto potong-tempel: "Potong Tempel Foto Mulus Edit", "Potong dan Tempel Foto", "Potong & Tempel Foto Editor", "Potong Tempel Foto", "Potong Tempel Foto & Bingkai V". Juga muncul "PicCollage" | https://itunes.apple.com/search?term=tempel&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=tempel&c=apps&hl=id&gl=ID |
| Tempelan | Tidak ada nama yang memuat "tempel" (5 hasil, semuanya stiker atau bingkai foto berbahasa Inggris) | Tidak ada nama yang memuat "Tempelan"; hasilnya gim dekorasi kamar dan stiker | https://itunes.apple.com/search?term=tempelan&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=tempelan&c=apps&hl=id&gl=ID |
| Jepret | Tidak ada nama yang memuat "jepret" di 25 hasil (yang terbaca sekitar 20); pencarian ID paket `com.digitalglobalgrowth.jepret` di App Store: 0 hasil | Ada **"Jepret: Foto Acara Semua Tamu"** (paket `com.digitalglobalgrowth.jepret`), aplikasi foto acara. Juga "Kamita: Jepret, Foto Terkirim" (meroviq) dan "Paici : Jepret untuk HSK" | https://itunes.apple.com/search?term=jepret&country=id&entity=software&limit=25 · https://itunes.apple.com/lookup?bundleId=com.digitalglobalgrowth.jepret&country=id · https://play.google.com/store/search?q=jepret&c=apps&hl=id&gl=ID |
| Sudut | Tidak ada nama yang memuat "sudut"; 10 teratas semuanya alat ukur sudut (protractor, waterpass) | 4 dari 14 memuat "Sudut", semuanya alat ukur ("Pengukur Sudut & Level", "Waterpass & Pengukur Sudut", "Alat LVL: Pengukur Sudut") | https://itunes.apple.com/search?term=sudut&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=sudut&c=apps&hl=id&gl=ID |
| Potret | Tidak ada nama yang memuat "potret" di 9 hasil yang terbaca; hasilnya kamera potret (Focos, Phocus, ReLens) | Ada "i-Potret" (Pemerintah Kabupaten Indragiri Hilir), "Potret Banten" (Enstra Media Official), "Potret Cat Air", "Potret Pribadi Nabi Muhammad" | https://itunes.apple.com/search?term=potret&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=potret&c=apps&hl=id&gl=ID |
| Gunting (tambahan) | Tidak ada nama yang memuat "gunting"; hasilnya prank cukur dan batu-gunting-kertas | Banyak: "Simulator Gunting", "Gunting - lelucon", **"Gunting & Tempel"** dan "Gunting & Tempel Edisi Muslim" (Solite Kids), "Gunting Layar: Screenshot" | https://itunes.apple.com/search?term=gunting&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=gunting&c=apps&hl=id&gl=ID |
| Lembar (tambahan) | Tidak ada nama yang memuat "lembar"; hasilnya spreadsheet dan lembar kerja | "Lembar: Catatan & Tulis Tangan" (MangJaja), "Zoho Sheet: Lembar Bentang" | https://itunes.apple.com/search?term=lembar&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=lembar&c=apps&hl=id&gl=ID |
| Klise (tambahan) | Tidak ada nama yang memuat "klise"; hasilnya pemindai negatif film (FilmBox, FilmLab) | Tidak ada nama yang memuat "Klise" di 15 teratas | https://itunes.apple.com/search?term=klise&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=klise&c=apps&hl=id&gl=ID |
| Pungut (tambahan) | 0 hasil | Ada "Pungut Mayat Dewa - Roguelike" (gim) | https://itunes.apple.com/search?term=pungut&country=id&entity=software&limit=10 · https://play.google.com/store/search?q=pungut&c=apps&hl=id&gl=ID |

### Fakta aturan toko dan merek

- **Panjang nama di App Store**: nama minimal 2 dan maksimal 30 karakter; subjudul maksimal 30 karakter.
  - Sumber: https://developer.apple.com/help/app-store-connect/reference/app-information/app-information (diakses 2026-11-17)
- **Panjang nama di Google Play**: judul aplikasi maksimal 30 karakter; tanpa emoji, tanpa teks peringkat atau harga.
  - Sumber: https://support.google.com/googleplay/android-developer/answer/9898842?hl=en (diakses 2026-11-17)
- **Nama sudah dipakai di App Store**: dokumentasi resmi Apple yang dibaca tidak menyebut aturan keunikan nama. Di forum pengembang Apple ada laporan pesan galat "The App Name you entered has already used" (Okt 2021, tanpa jawaban staf Apple). Label: **dugaan** bahwa nama yang sudah dipakai pengembang lain bisa ditolak saat membuat catatan aplikasi.
  - Sumber: https://developer.apple.com/forums/thread/691494 (diakses 2026-11-17)
- **Merek yang tidak dapat didaftar (UU 20/2016 Pasal 20)**, menurut kutipan sumber sekunder: antara lain "sama dengan, berkaitan dengan, atau hanya menyebut barang dan/atau jasa yang dimohonkan pendaftarannya", "tidak memiliki daya pembeda", dan "merupakan nama umum dan/atau lambang milik umum". Teks resmi pasal belum dibaca langsung.
  - Sumber: https://smartlegal.id/hki/merek/2022/01/27/awas-ini-kriteria-nama-merek-yang-berpotensi-ditolak/ (diakses 2026-11-17)
  - Rujukan teks UU (tidak dibuka): https://www.hukumonline.com/pusatdata/detail/lt5850fd588be8e/node/13/uu-no-20-tahun-2016-merek-dan-indikasi-geografis

### Tafsiran (bukan fakta)

- **Kliping**: bentrok langsung dengan nama yang sama persis di kedua toko (aplikasi berita/kliping media dari Slovenia). Bila aturan keunikan nama App Store berlaku (dugaan di atas), nama ini mungkin perlu tambahan kata. Kata "kliping" juga dekat dengan tugas sekolah di Indonesia; ini bisa terasa nostalgia atau justru terasa seperti PR anak sekolah. Perlu diuji ke pengguna 16+, tidak ditebak di sini.
- **Kliping Kota**: tidak ada bentrok yang terlihat; lebih panjang dan lebih jelas konteks kotanya. Masih dekat dengan aplikasi "Kliping" di atas.
- **Tempel**: tidak bentrok nama persis, tetapi kata ini dipakai generik oleh banyak editor "potong tempel foto" di Google Play. Risiko: sulit menonjol di pencarian toko, dan bisa terkena alasan "hanya menyebut barang/jasa" atau "nama umum" bila didaftarkan sebagai merek (tafsir hukum, perlu ahli merek).
- **Tempelan**: tidak ada bentrok yang terlihat. Bentuk kata benda yang sama-sama generik dengan "Tempel", tetapi lebih jarang dipakai sebagai nama aplikasi.
- **Jepret**: bentrok di kategori yang sama (aplikasi foto acara "Jepret" di Google Play). Risiko paling tinggi di antara kandidat awal untuk kebingungan pengguna dan potensi sengketa nama.
- **Sudut**: tidak bentrok di kategori foto, tetapi pencarian "sudut" di kedua toko didominasi alat ukur sudut. Risiko: mudah ditemukan sulit; artinya ("sudut kota") perlu konteks.
- **Potret**: dipakai aplikasi pemerintah daerah dan media berita, dan bermakna generik untuk kamera/foto. Risiko: generik (lihat Pasal 20) dan tenggelam di pencarian "portrait".
- **Gunting**: banyak aplikasi lelucon dan aplikasi anak "Gunting & Tempel" (Solite Kids). Risiko: asosiasi kekanak-kanakan, bertentangan dengan arah pengguna 16+.
- **Lembar**: ada aplikasi catatan "Lembar" di Google Play (kategori berbeda). Risiko sedang.
- **Klise**: tidak ada bentrok yang terlihat. Arti ganda: negatif film (cocok dengan kamera) dan "klise" yang berarti basi; arti kedua bisa jadi beban merek.
- **Pungut**: dekat dengan kata "pungutan" dan "pungli"; ada gim bernama "Pungut Mayat Dewa". Risiko konotasi negatif.

## Temuan 2: lisensi suara

### Fakta

- **Freesound memakai tiga lisensi untuk unggahan baru**: CC0, CC BY (Attribution), CC BY-NC (Attribution NonCommercial). Suara lama bisa memakai Sampling+ (mirip CC BY-NC dan tidak boleh untuk iklan komersial). Lisensi berlaku per suara.
  - Sumber: https://freesound.org/help/faq/ (diakses 2026-11-17)
- **Freesound CC0**: boleh dipakai "pretty much what you want", tetapi tidak boleh mengaku sebagai pembuat.
  - Sumber: https://freesound.org/help/faq/ (diakses 2026-11-17)
- **Teks resmi CC0 1.0**: pelepasan hak berlaku "for any purpose whatsoever, including without limitation commercial, advertising or promotional purposes". Hak merek dan paten tidak dilepas; pemberi tidak menjamin bahwa hak orang lain (misalnya hak publisitas) sudah dibereskan.
  - Sumber: https://creativecommons.org/publicdomain/zero/1.0/legalcode.en (diakses 2026-11-17)
- **Freesound CC BY**: boleh dipakai komersial asalkan pembuatnya selalu dicantumkan. Freesound memberi contoh format kredit: nama suara, nama pembuat, tautan ke halaman suara, dan lisensinya; untuk daftar panjang boleh lewat halaman kredit terpisah. Akun Freesound punya daftar atribusi suara yang pernah diunduh. FAQ tidak membahas aplikasi atau gim secara khusus.
  - Sumber: https://freesound.org/help/faq/ (diakses 2026-11-17)
- **Teks resmi CC BY 4.0**:
  - Saat membagikan materi (termasuk versi yang diubah) wajib mencantumkan identitas pembuat, pemberitahuan hak cipta yang diberikan, tautan ke materi "to the extent reasonably practicable", tanda bila materi diubah, dan bahwa materi berlisensi CC BY beserta teks atau tautannya (§3(a)).
  - Syarat itu boleh dipenuhi "in any reasonable manner based on the medium, means, and context" (§3(a)).
  - Tidak boleh menambah syarat atau memasang Effective Technological Measures yang membatasi penerima menjalankan hak lisensi (§2(a)(5)(B)).
  - Hak moral, publisitas, privasi, paten, dan merek tidak ikut dilisensikan (§2(b)).
  - Sumber: https://creativecommons.org/licenses/by/4.0/legalcode.en (diakses 2026-11-17)
- **FAQ Creative Commons soal DRM**: tidak semua enkripsi atau pembatasan akses dilarang; membatasi akses ke sekelompok pengguna (misalnya dengan username dan password) tidak dengan sendirinya membatasi penggunaan lanjutan. FAQ tidak membahas distribusi lewat toko aplikasi.
  - Sumber: https://creativecommons.org/faq/ (diakses 2026-11-17)
- **Pixabay Content License (ringkasan)**: boleh dipakai gratis, boleh diubah menjadi karya baru, tanpa wajib mencantumkan pembuat. Dilarang menjual atau mendistribusikan konten secara "Standalone" (tanpa usaha kreatif). Konten yang memuat merek dagang tidak boleh dipakai komersial terkait barang/jasa. Konten tidak boleh dipakai sebagai bagian merek dagang atau nama usaha.
  - Sumber: https://pixabay.com/service/license-summary/ (diakses 2026-11-17)
- **Pixabay Terms of Service** (tertulis "Last updated: 20 October, 2026"):
  - "Audio" didefinisikan mencakup "music, sounds, sound effects and other audio representations and content".
  - Hak yang diberikan: "irrevocable, worldwide, perpetual ... non-exclusive and royalty-free".
  - Standalone = tidak ada usaha kreatif dan konten tetap dalam bentuk yang pada dasarnya sama; memakai konten dalam bentuk asli atau hanya diberi filter, diubah warna, ukuran, atau dipotong tetap dihitung Standalone. Menggabungkan dengan gambar, video, audio, teks, atau penyuntingan lain sehingga menjadi karya "baru" tidak dihitung Standalone.
  - Bagian lisensi tidak punya aturan khusus audio.
  - Sumber: https://pixabay.com/service/terms/ (diakses 2026-11-17)
- **Pixabay FAQ**:
  - Contoh media yang "significantly altered": "Incorporation into a greater work (e.g. adding it to a book, app, game)".
  - Konten Pixabay boleh dipakai di media sosial; platform seperti Instagram, Facebook, Pinterest punya deteksi otomatis yang bisa membisukan atau memblokir konten.
  - Sebagian kontributor musik mendaftarkan lagunya ke Content ID YouTube, sehingga klaim bisa muncul. FAQ tidak menyebut TikTok dan tidak menyebut efek suara secara khusus soal Content ID.
  - Sumber: https://pixabay.com/service/faq/ (diakses 2026-11-17)
- **Merekam sendiri (foley)**:
  - Blog Freesound (tamu, 20 Mar 2020): perekam portabel bertenaga baterai dengan derau sendiri rendah (contoh kelas Tascam DR atau Zoom, sekitar USD 100–200), headphone tertutup, rekam 48 kHz / 24-bit, ruang kering yang tidak bergema (ruang kecil penuh perabot), perekam dekat sumber, rekam banyak variasi untuk suara berulang, beri nama setiap take, lalu sunting (buang take buruk, fade, high-pass filter, de-noise).
    - Sumber: https://blog.freesound.org/?p=1180 (diakses 2026-11-17)
  - Panduan CalArts (terakhir diperbarui 31 Agu 2026): atur perekam 48 kHz, 24-bit; dengan iPhone lewat aplikasi Voice Record Pro: 48.000 Hz, 24-bit, mono; cari tempat yang sunyi dan tidak bergema untuk rekaman "dry".
    - Sumber: https://2pop.calarts.edu/technicalsupport/recording-foley-at-home/ (diakses 2026-11-17)

### Tafsiran (bukan fakta)

- **Aplikasi komersial**: CC0 Freesound dan Pixabay sama-sama mengizinkan pemakaian komersial tanpa atribusi wajib. CC BY mengizinkan komersial tetapi butuh kredit; di aplikasi, halaman kredit/lisensi di menu pengaturan tampaknya memenuhi "reasonable manner", tetapi itu tafsiran.
- **Video share yang diunggah pengguna**: di sini CC BY paling merepotkan. Setiap kali video share berisi suara CC BY dibagikan, syarat §3(a) berlaku pada pihak yang membagikan. Menaruh kredit di dalam video 9:16 atau di caption pengguna sulit dijamin. CC0 tidak punya syarat itu. Pixabay tidak wajib atribusi, dan suara yang digabung ke animasi buka halaman kemungkinan besar dihitung karya baru (bukan Standalone), tetapi FAQ Pixabay sendiri mengingatkan deteksi otomatis platform bisa membisukan konten. Ini semua tafsiran; tafsir hukum final bukan wewenang peneliti.
- **File suara di dalam paket aplikasi**: file audio asli Pixabay ikut terbawa di paket aplikasi dan secara teknis bisa diekstrak. FAQ Pixabay menyebut penggabungan ke aplikasi sebagai "significantly altered", jadi risikonya tampak rendah, tetapi Syarat Layanan tidak membahas kasus ini secara langsung.
- **Rekaman sendiri** menghilangkan pelacakan lisensi pihak ketiga dan risiko Content ID dari kontributor lain. Biayanya waktu dan alat: perekam portabel kelas pemula, ruangan sunyi, banyak take, dan penyuntingan. Suara buka halaman dan shutter adalah suara pendek yang relatif mudah direkam (kertas tebal, kamera mekanis), tetapi kualitasnya tergantung ruang dan penyuntingan.
- **Shutter kamera bermerek**: merekam bunyi shutter kamera sungguhan tidak memindahkan merek apa pun, tetapi menamai skin dengan nama merek kamera adalah soal lain (di luar riset ini).

## Temuan 3: zona aman 9:16

### Fakta

- **Meta, iklan Instagram Reels (video)**: resolusi rekomendasi 1440 × 2560. "Consider leaving at least 14% of the top, 35% of the bottom, and 6% on each side" bebas teks, logo, dan elemen kreatif penting, supaya tidak terpotong atau tertutup ikon profil dan tombol ajakan (call-to-action).
  - Sumber: https://www.facebook.com/business/ads-guide/update/video/instagram-reels (diakses 2026-11-17; halaman tanpa tanggal, hanya "© 2026 Meta")
- **Meta, iklan Instagram Stories (video dan gambar)**: angka yang sama, "roughly 14% of the top, 35% of the bottom, and 6% on each side"; resolusi 1440 × 2560.
  - Sumber: https://www.facebook.com/business/ads-guide/update/video/instagram-story dan https://www.facebook.com/business/ads-guide/update/image/instagram-story (diakses 2026-11-17)
- **Konversi ke 1080 × 1920** (hitungan peneliti dari persentase Meta, bukan angka di halaman Meta): atas 14% × 1920 = 268,8 ≈ **269 px**; bawah 35% × 1920 = **672 px**; samping 6% × 1080 = 64,8 ≈ **65 px** per sisi.
- **Angka Meta yang lebih lama**: Sprout Social (diperbarui 22 Agu 2025) menulis "Leave 14% (250 pixels) at the top and 20% (340 pixels) of the bottom" untuk iklan Stories. Angka bawah ini lebih kecil daripada halaman Meta saat ini (35%).
  - Sumber: https://sproutsocial.com/insights/instagram-ad-sizes/ (diakses 2026-11-17)
- **TikTok, resmi**: halaman spesifikasi In-Feed Ads (diperbarui Juni 2026) tidak memberi angka piksel atau persen. Zona aman "determined by the dimension... ad caption length, and any additional formats used"; TikTok menyediakan file zip zona aman ("In-Feed-Standard Version LTR .zip" dan versi dengan anchor) untuk ditumpuk di desain. Resolusi minimum vertikal 9:16 ≥ 540 × 960.
  - Sumber: https://ads.tiktok.com/help/article?aid=10002742 (diakses 2026-11-17)
- **TikTok TopView** (diperbarui Okt 2026): juga tanpa angka; "In-feed safe zone is more restrictive than open screen"; teks dan logo harus di dalam zona aman.
  - Sumber: https://ads.tiktok.com/resources/help/article/tiktok-reservation-topview (diakses 2026-11-17)
- **TikTok, diukur dari template resmi oleh pihak ketiga**: ManyPixels (11 Nov 2026) mengukur template "In-Feed Standard LTR" yang diunduh hari itu, pada bingkai 720 × 1280 lalu dikali 1,5: atas **240 px**, bawah **660 px**, kiri dan kanan **120 px**; kolom kanan bawah kehilangan lebar 180 px untuk tombol suka, komentar, bagikan.
  - Sumber: https://www.manypixels.co/blog/social-media-design/tiktok-ad-specs (diakses 2026-11-17)
- **Sumber sekunder lain, angka lebih kecil**: Ignite Social Media ("akurat per Juli 2026"): TikTok atas 108, bawah 320, kiri 60, kanan 120 px; Instagram Reels zona 1010 × 1280 dengan 220 px dari atas dan 420 px dari bawah. Artikel tidak menyebut resolusinya secara eksplisit.
  - Sumber: https://www.ignitesocialmedia.com/content-creation/what-are-the-safe-zones-for-tiktoks-and-instagram-reels/ (diakses 2026-11-17)

### Tafsiran (bukan fakta)

- Angka Meta dan TikTok di atas adalah pedoman **iklan**. UI konten organik (story biasa, Reels biasa) mirip tetapi tidak dijamin sama; sumber resmi untuk konten organik tidak ditemukan.
- Bila satu kartu share harus aman di ketiga tempat, irisan yang paling ketat dari sumber yang paling dekat ke resmi adalah sekitar: atas 269 px (Meta), bawah 672 px (Meta; TikTok terukur 660 px), samping 120 px (TikTok terukur; Meta hanya 65 px), plus kolom kanan bawah TikTok. Sisa area aman kira-kira 840 × 979 px di tengah kanvas. Hitungan ini tafsiran, bukan rekomendasi platform.
- Usulan kerja di `docs/desain/acuan/kartu-share.md` (sekitar 250 px atas dan bawah) cocok dengan angka atas, tetapi angka bawahnya jauh lebih kecil daripada angka Meta saat ini (672 px) dan angka TikTok terukur (660 px).
- Angka 220/1280/420 dari Ignite berjumlah tepat 1920, sehingga kemungkinan besar dimaksudkan untuk kanvas 1080 × 1920 (dugaan).

## Kesimpulan

Fakta bersumber: "Kliping" sudah dipakai persis di App Store dan Google Play (aplikasi berita), "Jepret" sudah dipakai aplikasi foto acara di Google Play, dan "Tempel", "Potret", "Sudut", "Gunting" banyak muncul sebagai kata generik di nama aplikasi lain; "Tempelan", "Kliping Kota", dan "Klise" tidak muncul di hasil teratas kedua toko. Status merek di PDKI belum dicek. Untuk suara, CC0 (Freesound) dan Pixabay sama-sama mengizinkan pemakaian komersial tanpa atribusi wajib, CC BY mengizinkan komersial dengan kredit, dan CC BY-NC tidak untuk komersial; Pixabay melarang distribusi Standalone dan menyebut penggabungan ke aplikasi sebagai perubahan yang cukup. Untuk zona aman, Meta resmi menyarankan 14% atas, 35% bawah, 6% samping (≈269/672/65 px di 1080 × 1920); TikTok resmi tidak memberi angka tertulis, hanya template, yang diukur pihak ketiga ≈240/660/120 px. Tafsiran (berlabel di atas): CC BY merepotkan untuk video share yang diunggah pengguna, kandidat generik sulit menonjol dan berisiko ditolak sebagai merek, dan usulan 250 px bawah di acuan kartu share lebih kecil daripada pedoman platform saat ini.

## Belum terjawab

- **Status merek di PDKI** untuk semua kandidat (halaman pencarian butuh JavaScript, tidak terbaca). Perlu dicek manual di https://pdki-indonesia.dgip.go.id, terutama kelas 9 (perangkat lunak) dan kelas 42 (layanan perangkat lunak). Kelas mana yang relevan juga perlu dipastikan.
- **Teks resmi Pasal 20 UU 20/2016** (dan perubahannya oleh UU Cipta Kerja) belum dibaca dari sumber primer. Tafsir apakah kata generik seperti "Tempel" atau "Potret" bisa didaftar butuh ahli merek.
- **Daftar lengkap di toko**: hanya 10 sampai 25 hasil teratas yang terbaca; kategori, jumlah unduhan, dan tanggal rilis aplikasi "Jepret: Foto Acara Semua Tamu" dan "Kliping" di Google Play tidak terbaca. Apakah "Jepret" juga ada di App Store dengan ID paket lain belum pasti.
- **Aturan keunikan nama App Store** tidak ditemukan di dokumentasi resmi Apple; hanya laporan forum.
- **Ketersediaan domain dan nama akun media sosial** untuk tiap kandidat (tidak diminta, belum dicek).
- **Content ID untuk efek suara**: apakah efek suara Freesound atau Pixabay pernah didaftarkan ke Content ID YouTube, Rights Manager Meta, atau sistem TikTok tidak ditemukan sumbernya; FAQ Pixabay hanya membahas musik.
- **Apakah menaruh file suara CC BY di dalam paket aplikasi yang didistribusikan toko** termasuk Effective Technological Measures menurut CC BY 4.0 tidak dibahas oleh FAQ Creative Commons.
- **Angka zona aman resmi TikTok** dalam piksel: hanya tersedia sebagai file zip template yang tidak dibuka di riset ini.
- **Zona aman untuk konten organik** (bukan iklan) dari sumber resmi Meta atau TikTok tidak ditemukan.
