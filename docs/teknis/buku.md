# Teknis: buku

> Area agen `animasi-buku`. Fakta di bagian 1 diambil dari spesifikasi v1 (dikunci); bagian lain boleh diperbarui.
> Terakhir diverifikasi: 18 Nov 2026 (implementasi prototipe K-012, belum ada angka dari perangkat).

## 1. Yang sudah terkunci

- Satu buku untuk semua kota, dibagi per bab kota, dengan daftar isi; halaman dimuat bertahap (K-004).
- Urutan isi: sampul → halaman identitas → daftar isi kota → bab per kota (halaman pembatas, halaman landmark, halaman temuan bebas) → halaman statistik (spesifikasi §4.5).
- Tata letak otomatis berbasis template dengan rotasi acak kecil, selotip, dan keterangan. Pengguna bisa mengatur ulang. Halaman yang pernah diatur manual (`Placement.isManuallyArranged`) **tidak boleh** diacak ulang oleh sistem (K-005).
- Landmark yang belum ditemukan tampil sebagai siluet "???".
- Animasi page-curl dengan shader kustom + suara buka halaman (spesifikasi §6).
- Video share: render frame + encoder native (AVAssetWriter / MediaCodec). **Tanpa FFmpegKit** (K-003).
- Risiko #1: page-curl kurang mulus di Android kelas menengah.

## 2. Prototipe K-012

Tujuan: membuktikan atau membantah risiko #1 sebelum fitur lain dibangun.

**Lingkup (usulan, boleh dipersempit):**
- Satu buku dummy dengan ±20 halaman dan gambar cutout palsu.
- Page-curl maju dan mundur dengan gestur, plus suara buka halaman.
- Lazy load halaman dengan thumbnail.
- Ukur frame time dan waktu muat halaman di **Infinix Hot 11 Play** (perangkat acuan, K-016) dan satu iPhone (iOS 17+).

**Di luar lingkup:** kamera, cutout, backend, login, data asli.

**Selesai bila (K-016):**
- Di Infinix Hot 11 Play, build profile: ≥95% frame (UI dan raster) ≤33,3 ms selama gestur buka halaman, dan tidak ada frame >50 ms setelah shader dipanaskan.
- Backend renderer yang dipakai (Impeller OpenGLES/Vulkan atau Skia) tercatat dari log perangkat.
- Waktu muat halaman dan pemakaian memori tercatat per perangkat.
- Ada keputusan lanjut/ganti pendekatan, dicatat sebagai keputusan baru. Durasi page-curl hasil prototipe diisi ke `data/design-tokens.json` (`motion.pageCurl`).

**Catatan teknis dari riset** (`docs/riset/2026-11-17-perangkat-dan-stack.md`):
- Hot 11 Play: Helio G35, PowerVR GE8320, RAM 4 GB, layar 720×1640. Kemungkinan besar Impeller jalan di OpenGLES, bukan Vulkan.
- Precache `FragmentProgram` sebelum halaman pertama dibuka supaya buka halaman pertama tidak tersendat.
- Di OpenGLES koordinat y tekstur terbalik: UV dibalik di shader.
- `toImageSync` saat gestur dimulai bisa memakan anggaran 33,3 ms. Siapkan gambar halaman sebelum gestur.
- RAM 4 GB membatasi cache tekstur. Simpan hanya halaman sekitar yang sedang dibuka.

## 3. Prototipe K-012: implementasi

Semua klaim performa di bagian ini **dugaan** sampai tabel 3.7 terisi dari perangkat. Yang berlabel **terbukti** sudah dicek dengan perintah atau kode yang disebut.

### 3.1 Pendekatan `PageCurl`

- **Dipilih: fragment shader silinder satu lintasan** (`app/shaders/page_curl.frag`), digambar dengan `Paint.shader` di satu `drawRect` seukuran halaman. Untuk setiap piksel, shader mencari lapisan teratas: punggung lipatan, sisi silinder atas (punggung kertas), sisi silinder bawah (muka halaman), muka halaman datar, atau halaman di bawahnya. Biayanya rata per piksel: maksimal tiga sampel tekstur, satu `asin`, tanpa loop.
- Alasan:
  - Spesifikasi §6 dan K-003 meminta shader kustom. `Paint.shader` didukung di Skia dan Impeller, sedangkan `ImageFilter.shader` hanya di Impeller (riset 17 Nov, `docs/riset/2026-11-17-perangkat-dan-stack.md`).
  - Satu lintasan tanpa mesh: thread UI hanya mengisi 11 float per frame. Beban ada di GPU (fill rate). Layar HD+ Hot 11 Play membantu.
  - Geometri dihitung di Dart (`app/lib/features/book/state/curl_geometry.dart`), jadi bisa dites tanpa GPU. Sudut halaman selalu tepat di bawah jari (ada tesnya).
- **Pembanding: lipatan datar dengan Canvas** (menu ⋮ → "PageCurl: Kanvas"). Tanpa shader: clip, pantulan matriks, dan gradien bayangan. Tujuannya memberi angka kedua bila shader gagal K-016, supaya keputusan lanjut/ganti punya data.
- Durasi animasi otomatis: konstanta lokal `pageCurlDuration` = 520 ms di `curl_geometry.dart`. `TokenMotion.pageCurl` sengaja tetap null sampai ada angka.

### 3.2 Catatan teknis yang dicek saat implementasi

- **Precache dan pemanasan** (`app/lib/features/book/state/book_providers.dart`, `bookAssetsProvider`): `FragmentProgram.fromAsset` dimuat, lalu shader digambar sekali ke gambar offscreen 64×64 dan pikselnya dibaca, sebelum halaman pertama tampil. Waktunya tercatat di laporan (`startup.shaderWarmupMs`).
- **Presisi GLES** (terbukti): keluaran impellerc Flutter 3.50 untuk varian GLES menulis `highp` di semua uniform, input, dan variabel lokal (dicek dengan `impellerc --runtime-stage-gles --runtime-stage-gles3`). Jadi koordinat piksel tidak jatuh ke `mediump` (FP16) di PowerVR.
- **Makro backend per varian** (terbukti, dicek dengan mengompilasi shader uji): varian SkSL mendefinisikan `SKIA_GRAPHICS_BACKEND`, varian GLES dan GLES3 mendefinisikan `IMPELLER_TARGET_OPENGLES`, dan varian Vulkan tidak mendefinisikan keduanya (`IMPELLER_TARGET_VULKAN` tidak ada di runtime stage).
- **Y-flip** (nuansa terhadap §2): dokumen resmi hanya menyebut y terbalik di OpenGLES untuk tekstur dari engine di `ImageFilter.shader`, bukan untuk sampler dari `Picture.toImage` di `Paint.shader` (https://docs.flutter.dev/ui/design/graphics/fragment-shaders, diakses 18 Nov 2026). Karena itu prototipe **tidak** membalik UV secara buta. Probe di aplikasi mengukur arah y untuk jalur tekstur yang sama, lalu mengisi uniform `uFlipY`. Ada sakelar manual (menu ⋮ → "Balik sumbu Y manual") bila hasil probe keliru.
- **Gambar halaman disiapkan sebelum gestur**: `Picture.toImage` (async) saat lazy load, bukan `toImageSync` di awal gestur. Gestur yang dimulai sebelum gambar siap ditolak dan dicatat sebagai `turnWaits`.
- **Sampler**: `ImageSamplerSlot.set` memakai filter `none` (nearest). Prototipe memanggil `setImageSampler(..., filterQuality: low)` lewat indeks slot supaya bagian melengkung tidak bergerigi.

### 3.3 Lazy load dan anggaran memori

- `PageStore` (`app/lib/features/book/state/page_cache.dart`) menyimpan tekstur halaman penuh hanya untuk jendela `halaman sekarang ± 2`, jadi paling banyak 5 tekstur (ada tesnya). Yang keluar jendela langsung `dispose()`.
- Muat satu per satu sesuai prioritas (sekarang, berikutnya, sebelumnya, lalu ±2). Antrean **ditahan selama `PageCurl` berjalan**, supaya render halaman baru tidak berebut thread raster dengan animasi.
- Jalur muat meniru halaman asli: decode cutout terkompresi (PNG buatan prosedural, 384 px) pada ukuran yang dibutuhkan → rekam halaman → `Picture.toImage`. Waktu muat dicatat dari minta sampai gambar siap.
- Thumbnail: lebar 72 px logis, dimuat malas saat item strip dibangun (ikon carousel). Semua 20 thumbnail boleh tinggal di cache.
- Hitungan (dugaan, belum diukur; DPR Hot 11 Play diasumsikan 2,0): halaman sekitar 720×1480 px ≈ 4,3 MB per tekstur, 5 tekstur ≈ 21 MB; thumbnail ≈ 0,17 MB × 20 ≈ 3,4 MB.

### 3.4 Alat ukur di dalam aplikasi

- `FrameTiming` dikumpulkan dengan `SchedulerBinding.addTimingsCallback`, tetapi **hanya frame yang menggambar `PageCurl`** (gestur dan animasi lepas). Penandanya dua: `PlatformDispatcher.frameData.frameNumber` dan `SchedulerBinding.currentSystemFrameTimeStamp`. Dokumentasi `FrameTiming.buildDuration` menyebut nilai kedua sama persis dengan `FramePhase.buildStart`.
- Yang ditampilkan: jumlah frame; % UI ≤33,3 ms, % raster ≤33,3 ms, % keduanya; p50/p90/p99/maks UI dan raster; frame terburuk; frame >50 ms (UI atau raster); jarak vsync antar-frame berurutan (fps efektif); statistik balikan pertama; waktu muat halaman dan thumbnail; `ProcessInfo.currentRss` dan `maxRss`; jumlah dan ukuran tekstur di cache. Vonis "Target K-016" di layar hasil memakai kriteria K-016 dan hanya sah bila mode build = profile.
- **Uji otomatis** (ikon ▶): kembali ke halaman 1, balik 19 halaman maju lalu 19 mundur. Setiap balikan 520 ms (`easeInOut`), jeda 250 ms. Selesai dalam ±30 detik, lalu hasil muncul sendiri. Data direset di awal setiap uji, dan tekan ▶ lagi untuk menghentikannya.
- Tombol "Salin hasil (JSON)" menyalin semuanya ke clipboard. Laporan tidak memuat lokasi.
- Catatan cara baca: `rasterDuration` adalah waktu CPU thread raster. Kerja GPU yang tertunda di OpenGLES biasanya muncul sebagai raster lambat atau jarak antar-frame yang membesar, jadi `intervalMs` ikut dibaca.

### 3.5 Backend renderer

- Di aplikasi: probe `app/shaders/renderer_probe.frag` digambar ke gambar 1×1. Kanal merah = varian shader yang dipilih engine (Skia / Impeller OpenGLES / Impeller lain = Vulkan di Android). Kanal hijau dan biru = arah y tekstur. Impeller aktif atau tidak dibaca dari `ui.ImageFilter.isShaderFilterSupported`, yang mengembalikan `_impellerEnabled` (`painting.dart`). Hasilnya tampil di label kiri atas dan di JSON (`renderer`).
- Tingkat bukti: di `flutter test` (Skia) probe membaca `Skia` dengan benar (terbukti). Di `flutter test --enable-impeller`, shader runtime apa pun, termasuk shader warna polos, menghasilkan piksel kosong, sedangkan readback gambar biasa jalan. Jadi jalur Impeller probe **belum terbukti** di luar perangkat. Bila label menulis "tidak diketahui", pakai cara adb.
- **Butuh adb** (cadangan, hanya bila pemilik punya kabel dan adb): `adb logcat | grep -i impeller` saat aplikasi dibuka. Cari baris "Using the Impeller rendering backend (...)".

### 3.6 Paket (dicek di pub.dev 18 Nov 2026, cek ulang sebelum dipakai)

| Paket | Versi | Rilis | Dipakai? | Alasan |
|---|---|---|---|---|
| `audioplayers` | 6.8.1 | 2026-06-27 | Ya | Penerbit terverifikasi blue-fire.xyz, 150 pub points, ±3,4 rb likes. Mode `PlayerMode.lowLatency` (SoundPool di Android) cocok untuk efek pendek. Fokus audio `mixWithOthers` supaya musik pengguna tidak berhenti. |
| `flutter_soloud` | 5.3.0 | 2026-11-13 | Tidak | Mesin audio C++ lewat FFI: latensi rendah, tetapi menambah pustaka native. Berlebihan untuk satu efek. |
| `just_audio` | 0.10.6 | 2026-06-29 | Tidak | Fokus streaming dan playlist; tidak ada mode SoundPool. |
| `soundpool` | 2.4.1 | 2023-08-25 | Tidak | Ditandai *discontinued* di pub.dev. |

Sumber: `https://pub.dev/api/packages/<nama>` dan `/score` (diakses 2026-11-18). `audioplayers` membawa dependensi transitif `path_provider`, `http`, `uuid`, `synchronized`, dan `file`. Tidak ada FFmpegKit.

Suara placeholder `app/assets/sounds/page-turn-placeholder.wav` (0,42 s, mono 22,05 kHz, 18,5 KB) dibuat dengan `app/tool/make_page_turn_sound.py` (pustaka standar Python, seed tetap). Pencatatannya di `data/sounds.json` menunggu Q-016.

### 3.7 Cara pemilik mengukur

1. Pasang APK profile di Infinix Hot 11 Play (izinkan "Instal dari sumber tidak dikenal"). Satu APK berisi arm64-v8a, armeabi-v7a, dan x86_64, jadi cocok untuk ROM 64-bit maupun 32-bit.
2. Isi baterai di atas 50%, matikan mode hemat daya, tutup aplikasi lain.
3. Buka "Kliping Kota" dan tunggu tulisan "Menyiapkan shader dan halaman…" hilang. Catat tulisan di label kiri atas (nama renderer).
4. Tekan ▶ (uji otomatis) dan jangan sentuh layar sekitar 35 detik. Hasil muncul sendiri.
5. Tekan "Salin hasil (JSON)" dan tempel ke chat. Ulangi langkah 4–5 dua kali lagi (total tiga kali).
6. Buka ikon speedometer → "Hapus data ukur". Balik halaman dengan jari sekitar 20 kali: tarik dari sisi kanan untuk maju, dari sisi kiri untuk mundur. Lalu buka speedometer lagi → salin JSON.
7. Menu ⋮ → "PageCurl: Kanvas", lalu ulangi langkah 4–5 sekali.
8. Periksa dengan mata: isi halaman yang melengkung tidak terbalik atas-bawah, dan suara terdengar. Bila terbalik: menu ⋮ → "Balik sumbu Y manual", ulangi langkah 4–5, dan sebutkan di chat.

Membangun ulang APK (dari `app/`): `flutter build apk --profile`. Hasilnya `app/build/app/outputs/flutter-apk/app-profile.apk`.

### 3.8 Hasil ukur

Diisi dari JSON yang ditempel pemilik. Satu baris per uji. "Uji" = otomatis (O) atau jari (J).

| Tanggal | Perangkat | Mode build | Renderer (probe) | PageCurl | Uji | Frame | % UI ≤33,3 | % raster ≤33,3 | % keduanya | p90 UI / raster (ms) | Maks (ms) | >50 ms | Muat halaman p50 / p90 (ms) | RSS / puncak (MB) | Lolos K-016 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | Infinix Hot 11 Play | profile | | Shader | O | | | | | | | | | | |
| | Infinix Hot 11 Play | profile | | Shader | O | | | | | | | | | | |
| | Infinix Hot 11 Play | profile | | Shader | O | | | | | | | | | | |
| | Infinix Hot 11 Play | profile | | Shader | J | | | | | | | | | | |
| | Infinix Hot 11 Play | profile | | Kanvas | O | | | | | | | | | | |
| | iPhone (iOS 17+) | profile | | Shader | O | | | | | | | | | | |

Build iOS butuh macOS dan Xcode, jadi baris iPhone menunggu.

### 3.9 Risiko dan dugaan

- **Dugaan utama:** beban terbesar ada di fill rate GPU GE8320: shader layar penuh sekitar 1,07 juta piksel per frame, plus satu `drawImageRect` untuk halaman diam. Bila gagal, gejalanya raster p90 di atas 33 ms atau jarak antar-frame melebar. Pilihan berikutnya, berurutan: (a) render `PageCurl` ke resolusi lebih rendah lalu diskalakan, (b) batasi area shader ke kotak di sekitar lengkungan dan gambar sisanya sebagai gambar biasa, (c) lipatan Kanvas.
- Balikan pertama bisa tetap tersendat bila driver GLES mengompilasi ulang pipeline untuk ukuran atau format target layar. Statistik `firstFlip` dipisah untuk melihat ini.
- `maxRss` tidak menghitung semua memori grafis di semua driver, jadi angka memori adalah batas bawah.
- Mesin tata letak (`app/lib/features/book/state/page_layout.dart`) adalah jalur tata ulang otomatis satu-satunya. Halaman dengan `isManuallyArranged` dikembalikan apa adanya; temuan baru hanya mengisi slot kosong. Temuan yang tidak muat di slot kosong belum ditangani (cukup untuk prototipe).

## 4. Belum ditetapkan

| Hal | Status |
|---|---|
| Pendekatan shader (fragment shader Flutter vs alternatif) | Diusulkan di §3.1 (shader silinder, pembanding Kanvas); diputuskan setelah tabel §3.8 terisi |
| Sumber suara buka halaman | Rekam sendiri, tercatat di `data/sounds.json` (K-024); prototipe memakai placeholder sintesis (Q-016) |
| Format template halaman (slot, rotasi, posisi selotip) | Dirumuskan bersama `desainer-visual`; lihat `docs/desain/acuan/halaman-buku.md` |
