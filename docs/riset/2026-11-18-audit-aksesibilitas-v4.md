# Audit aksesibilitas mockup v4 "Kliping Kota" (WCAG 2.2 AA)

> Diriset: 2026-11-18 · Oleh: sub-agen audit (general-purpose) atas brief sesi utama
> Cek ulang sebelum dipakai untuk keputusan baru: versi axe-core dan kriteria WCAG 2.2; mockup v4 sudah digantikan v5, tetapi 12 aturan di §6 berlaku untuk v5.
> Dipakai oleh: Q-017, mockup v5 (https://claude.ai/artifact/Acc38ZrS9c64zx1VbA3MzE)


Tanggal audit: 18 Nov 2026 · Objek: 10 file V4*.html (versi render dari kk-mockup/project/V4*.dc.html) · Alat: axe-core 4.10.2, Playwright + Chromium, skrip pengukuran sendiri (scratchpad/a11y-tools/).

Layar yang diperiksa: Pembuka, Beranda, Kamera, Temuan, Sukses, Buku, Misi, Bagikan, KartuShare (1080×1920), Sistem (lembar sistem desain "Pop Kota").

## 1. Ringkasan eksekutif

- Dasar v4 sudah kuat. Hampir semua pasangan teks/latar lolos dengan margin besar: tinta di atas lime 14,9:1, tinta di atas warna kategori 7,2–13,5:1, putih di atas kobalt 6,0:1. Tombol ikon sudah berlabel (`aria-label`). Status pilihan sudah memakai `aria-pressed`, `aria-checked`, dan `aria-current`. Atribut `lang="id"` terpasang dan tombol utama berukuran 52–84 px.
- **28 temuan: 0 Kritis, 4 Tinggi, 13 Sedang, 11 Rendah.** Hanya satu yang benar-benar gagal kontras teks, yaitu subjudul layar Sukses dengan rasio 3,69:1. Masalah terbesar justru tidak terlihat oleh axe:
  1. **Skala teks 200 %**: tinggi tetap pada tombol, chip, dan kartu membuat teks terpotong di 8 dari 8 layar aplikasi. Kata Unbounded seperti "sekarang" dan "Sukabumi" tidak bisa dipatah dan meluap keluar kartu.
  2. **Cutout dan stiker tidak punya teks alternatif.** Isi inti aplikasi (koleksi) kosong bagi pembaca layar.
  3. **Gestur tanpa alternatif** pada fitur yang direncanakan: page-curl, atur stiker (cubit/putar/geser), dan kuas masker.
  4. **Status terpilih yang hampir tak terlihat**: segmen terpilih di Bagikan hanya 1,11:1 terhadap track. Track progres kurang dari 3:1.
- Simulasi buta warna: kategori **masih bisa dibedakan karena selalu ada label teks**. Warnanya sendiri tidak cukup. Pada deuteranopia, Makanan dan Tanaman hanya berjarak ΔE2000 7,7, dan Kendaraan dengan lime hanya 1,8. Titik warna 8 px di Beranda dan chip Temuan melanggar aturan sistem v4 sendiri ("selalu bersama ikon").
- Hasil axe sebagian besar artefak HTML (landmark). Yang relevan untuk Flutter adalah satu `color-contrast` dan, dalam bentuk lain, `page-has-heading-one` (judul layar sebagai *header semantics*).

## 2. Interpretasi hasil axe

| Aturan axe | Layar | Relevan untuk app native? | Penjelasan |
|---|---|---|---|
| `landmark-one-main` (moderate) | 10/10 | **Tidak (artefak)** | Flutter tidak punya landmark ARIA. TalkBack/VoiceOver bernavigasi per elemen dan per *heading*. Di mockup cukup tambahkan `<main>` agar laporan bersih. |
| `region` (moderate) | 10/10 | **Tidak (artefak)** | Ini turunan dari tidak adanya landmark. Padanannya di Flutter adalah pengelompokan dengan `Semantics(container: true)` dan `MergeSemantics` pada kartu, yang dibahas di temuan lain. |
| `page-has-heading-one` (moderate) | Beranda, Buku, Kamera, Temuan, Bagikan | **Ya, dalam bentuk lain** | Judul layar ditulis sebagai `<span>`. Di Flutter, judul harus memakai `Semantics(header: true, namesRoute: true)` agar pembaca layar mengumumkan nama layar dan bisa melompat per heading (temuan S-02). |
| `color-contrast` (serious) | Sukses | **Ya** | `#DCE1FF` di atas lingkaran `#4A60FF` = 3,69:1 (temuan T-01). |

Hal yang **tidak** ditangkap axe tetapi ditemukan secara manual: kontras status terpilih dan progres (1.4.11), skala teks, ukuran target di bawah 44 px, teks alternatif gambar yang sengaja disembunyikan dengan `aria-hidden`, gestur, pesan status, teks kecil di pratinjau kartu share, dan kontras kartu share pada ukuran tampil sebenarnya. axe menilai kartu 1080 px pada ukuran kanvas, padahal di layar ponsel kartu itu diperkecil sekitar 0,36×.

## 3. Tabel temuan

Keparahan: **Kritis** = memblokir tugas inti. **Tinggi** = gagal AA atau menghalangi kelompok pengguna yang besar. **Sedang** = gagal AA terbatas atau berisiko tinggi saat dibangun di Flutter. **Rendah** = lolos AA tetapi lemah untuk konteks (matahari, layar 720 px), atau perbaikan praktik baik.

### Tinggi (4)

| ID | Layar | Elemen | Kriteria (level) | Bukti | Perbaikan HTML/CSS → Flutter |
|---|---|---|---|---|---|
| T-01 | Sukses | Subjudul "Sukabumi sekarang 13 dari 100 temuan." | 1.4.3 Kontras (AA) | `#DCE1FF` di atas `#4A60FF` = **3,69:1** (perlu 4,5), 16 px/400 | `color:#FFFFFF` → 4,76:1. Lebih baik lagi: gelapkan lingkaran dekor ke `#3D54FF` (putih 5,37:1) atau letakkan teks di luar lingkaran (kobalt `#3048FF`, putih 6,0:1). Token aturan: di permukaan kobalt hanya teks putih. Flutter: `TextStyle(color: AppColors.onCobalt)` dengan satu token. |
| T-02 | Semua layar app (8) | Tombol, chip, kartu, header, nav bawah | 1.4.4 Ubah ukuran teks (AA), 1.4.10 Reflow (AA) | Simulasi teks 200 % memotong teks: Beranda 10 elemen, Misi 11–13, Bagikan 4–6, Buku 4, Pembuka 4, Sukses 3, Temuan 1–3, Kamera 1. Penyebabnya `height:56px`, `height:40px`, kartu `height:188px` + `overflow:hidden`, header `height:44px`. "Potret sekarang" dan "Sukabumi" (Unbounded) meluap keluar kartu. Lihat render/a11y/*-teks200.png. | CSS: ganti `height` dengan `min-height` + `padding-block`, izinkan *wrap*, hapus `overflow:hidden` pada wadah teks, dan bungkus layar dengan area gulir. Flutter: jangan pakai `SizedBox(height:)` di sekitar `Text`. Pakai `ConstrainedBox(minHeight: 48)`, `SingleChildScrollView`/`CustomScrollView`, bukan `Column` + `Spacer`. Uji `textScaler` 1,3 / 1,5 / 2,0 dan lebar 360 dp (Infinix Hot 11 Play). Pembatasan skala (`textScaler.clamp(maxScaleFactor: 1.5)`) hanya untuk angka hiasan Unbounded ≥ 24 px dan label nav bawah, tidak untuk teks isi. |
| T-03 | Beranda, Buku, Temuan, Sukses, Bagikan, Kamera | Cutout/stiker (ilustrasi SVG `aria-hidden="true"`), thumbnail "Temuan terakhir" | 1.1.1 Konten non-teks (A) | 0 dari ±12 gambar inti punya nama aksesibel. Halaman buku terbaca kosong oleh pembaca layar kecuali keterangan Caveat. | HTML: `<img alt="Stiker menara lonceng, kategori Bangunan">` atau `<svg role="img" aria-label="…">`. Flutter: `Semantics(image: true, label: '$caption, kategori $kategori')` pada setiap stiker. Label dibuat otomatis dari nama landmark/kategori dan bisa diedit lewat kolom keterangan. Ilustrasi dekor di Pembuka tetap `ExcludeSemantics`. |
| T-04 | Buku (+ fitur Rapikan potongan, Atur stiker) | Page-curl (geser), atur stiker (geser/cubit/putar), kuas masker | 2.5.1 Gestur penunjuk (A), 2.5.7 Gerakan seret (AA) | Mockup hanya menunjukkan "Atur stiker" (span 32 px, bukan tombol). Page-curl sudah punya alternatif (thumbnail halaman 9–13). Untuk atur stiker belum ada alternatif satu ketukan. | Mode "Atur stiker": pilih stiker dengan ketukan, lalu tombol Geser (↑↓←→), Putar ±15°, Perbesar/Perkecil, Ke depan/belakang, Hapus. Flutter: `Semantics(customSemanticsActions: {...})` untuk pengguna TalkBack/VoiceOver. Halaman: tombol Sebelumnya/Berikutnya + `Semantics(onScrollLeft/Right)`. Kuas masker termasuk pengecualian "esensial" (gambar bebas), tetapi tetap sediakan Urungkan, slider ukuran kuas, dan "Kembalikan otomatis". **Menjadi Kritis bila dibangun tanpa alternatif.** |

### Sedang (13)

| ID | Layar | Elemen | Kriteria (level) | Bukti | Perbaikan |
|---|---|---|---|---|---|
| S-01 | Bagikan | Kontrol segmen "Halaman / Temuan / Stiker" | 1.4.11 Kontras non-teks (AA) | Segmen terpilih putih vs track `#F3F3F6` = **1,11:1**. Teks berubah `#5B5B66`→`#121212` = 2,79:1 (bukan indikator yang jelas). | Segmen terpilih `background:#121212;color:#FFF` (16,9:1 vs track), sama dengan pola chip. Tambahkan ikon centang. Flutter: `SegmentedButton` dengan `showSelectedIcon: true` dan warna terpilih token tinta. |
| S-02 | Beranda, Buku, Kamera, Temuan, Bagikan | Judul layar ("Beranda", "Sukabumi", "Temuan baru", "Bagikan") ditulis sebagai `<span>` | 1.3.1 Info dan relasi (A), 2.4.6 Judul dan label (AA) | axe `page-has-heading-one`. Urutan heading: Beranda hanya H2, Misi H1→H2 (benar), Pembuka/Sukses H1 (benar). | Jadikan `<h1>`. Flutter: `Semantics(header: true, namesRoute: true, child: Text(...))`. Judul seksi ("Temuan terbaru", "Lencana") memakai `header: true`. |
| S-03 | Kamera, Temuan, Sukses | "Bangunan terdeteksi", "Kamu dekat landmark", "Tertempel di bukumu!" | 4.1.3 Pesan status (AA) | Muncul tanpa perubahan fokus dan tanpa *live region*. | `role="status"` / `aria-live="polite"`. Flutter: `Semantics(liveRegion: true)` atau `SemanticsService.announce()` (cek nama API di versi Flutter yang dipakai). Di Sukses, pindahkan fokus aksesibilitas ke H1. |
| S-04 | Kamera | Tombol lampu kilat | 1.3.1 (A), 4.1.2 Nama, peran, nilai (A) | Status "mati" hanya ada di `aria-label`. Ikon petir tidak berubah, jadi pengguna yang melihat tidak tahu statusnya. | Ikon "flash-off" (dicoret) saat mati. `aria-label="Lampu kilat"` + `aria-pressed`. Flutter: `Semantics(toggled: isOn, label: 'Lampu kilat')`. |
| S-05 | Temuan | Chip kategori + label "Kategori" | 1.3.1 (A), 4.1.2 (A) | Pilihan tunggal tetapi memakai `aria-pressed` (yang menyiratkan bisa pilih banyak). Label "Kategori" adalah `<span>` yang tidak terkait dengan grup. | `<div role="radiogroup" aria-labelledby="lbl-kat">` + chip `role="radio" aria-checked`. Tambahkan ikon centang di chip terpilih. Flutter: `ChoiceChip` di dalam `Semantics(container: true, label: 'Kategori')`, chip dengan `inMutuallyExclusiveGroup: true`. |
| S-06 | Beranda, Temuan | Titik warna kategori (8 px dan 14 px) tanpa ikon | 1.4.1 Penggunaan warna (A, lolos karena ada label), konsistensi sistem | Deuteranopia: Makanan–Tanaman ΔE 7,7; Bangunan–Kendaraan 12,3; Kendaraan–lime 1,8. Titik vs putih 1,96–2,61:1. Bertentangan dengan aturan v4 "selalu bersama ikon". Titik Kendaraan `#E0B400` ≠ token `#FFD84D`. | Ganti titik dengan lingkaran ikon kategori (pola chip di Sistem). Bila titik harus tetap ada, beri cincin `#121212` 1,5 px. Satu token per kategori (warna isi + warna titik/teks gelap). Lime tidak dipakai berdampingan dengan Kendaraan. |
| S-07 | Beranda, Sukses, Pembuka | "Buka buku" 71×18, "Potret lagi" 75×19, tautan "ketentuan" 63×16 dan "privasi" 40×16 | 2.5.8 Ukuran target minimum (AA): **lolos** lewat pengecualian jarak/inline, tetapi < 44 | Diukur dengan `boundingBox`. "Potret lagi" adalah aksi berulang yang utama di layar Sukses. | `display:inline-flex;min-height:44px;padding:0 12px;align-items:center`. Flutter: `TextButton(style: TextButton.styleFrom(minimumSize: Size(48,48)))`. Tautan legal sebaiknya dua tombol terpisah, bukan `TextSpan` + `recognizer` yang area sentuhnya setinggi baris. |
| S-08 | Semua | Teks < 13 px | Keterbacaan (tidak ada SC AA, terkait 1.4.4) | 12 px: label nav bawah (5×), chip "Misi", nomor halaman Buku, label lensa, badge "Saku 35". Pratinjau Bagikan: 8, 10, 11, 12 px. Bertentangan dengan Sistem "minimal 15 px". | Label pendek minimal 13 px/600, teks isi 15 px. Nomor halaman 14 px. Pratinjau kartu share dianggap gambar (beri teks alternatif, lihat R-04) dan bisa diketuk untuk memperbesar. |
| S-09 | KartuShare | "kamera Saku 35", dan semua teks pada ukuran tampil | 1.4.3 (AA) secara semangat, 1.4.5 Gambar teks (pengecualian: hasil ekspor) | `#DCE1FF` / `#4A60FF` = **3,69:1**, 26 px di kanvas ≈ 9,4 pt saat tampil di Stories (skala 0,36). axe meloloskannya karena dianggap "teks besar". | Pakai putih (4,76:1) dan ≥ 36 px di kanvas. Teks penting ≥ 40 px di kanvas 1080. Saat berbagi, isi keterangan/alt text otomatis ("Stiker Gereja Sidang Kristus, landmark ke-5 di Sukabumi, Kliping Kota"). |
| S-10 | Buku, Kamera | "Atur stiker" (`span`), "Temuan terakhir" (`span role=img`) | 4.1.2 (A) | Terlihat bisa diketuk tetapi bukan tombol. "Atur stiker" 32 px tinggi. | `<button>`, min 44 px. Flutter: `Semantics(button: true, label: 'Buka temuan terakhir')` + `InkWell`. |
| S-11 | Semua | Indikator fokus (keyboard, *switch access*, D-pad) | 2.4.7 Fokus terlihat (AA), 2.4.11 Fokus tidak tertutup (AA) | Tidak ada gaya `:focus-visible`. Cincin kobalt di atas kobalt hanya 1,26:1. Nav bawah 86 px bisa menutup elemen yang difokus. | `:focus-visible{outline:3px solid #121212;outline-offset:2px;box-shadow:0 0 0 5px #fff}`. Di permukaan kobalt pakai lime (4,76:1). Flutter: `FocusTheme`/`focusColor` per permukaan, dan `Scrollable.ensureVisible` + padding bawah setinggi nav. |
| S-12 | Buku, Sukses, Pembuka | Page-curl, stiker jatuh, konfeti, sticker "+1 temuan", suara halaman | 2.2.2 Jeda, hentikan, sembunyikan (AA, bila otomatis > 5 dtk), 2.3.3 (AAA), 2.3.1 (A) | Animasi direncanakan (K-012). Belum ada varian gerak minimal. | `@media (prefers-reduced-motion: reduce){…transition:opacity .15s}`. Flutter: `MediaQuery.of(context).disableAnimations` → page-curl diganti *crossfade* 150 ms, stiker langsung muncul, tanpa konfeti. Efek kilat shutter cukup 1×, tidak berulang. Suara halaman mengikuti mode senyap + sakelar di Profil. |
| S-13 | Bagikan (modal), lembar bawah yang direncanakan (pilih kota dari pil "Sukabumi") | Manajemen fokus | 2.4.3 Urutan fokus (A), 2.1.2 (A), 2.5.7 (AA) | Bagikan adalah layar modal dengan "Tutup". v4 belum punya pola dialog/lembar bawah. | Saat dibuka, fokus ke judul. Saat ditutup, fokus kembali ke pemicu ("Bagikan halaman"). Tombol Tutup selalu ada (jangan hanya *swipe down*). Flutter: `showModalBottomSheet` (barrier + `scopesRoute`), `Semantics(namesRoute)`, tombol Kembali Android menutup lembar. |

### Rendah (11)

| ID | Layar | Elemen | Kriteria | Bukti | Perbaikan |
|---|---|---|---|---|---|
| R-01 | Beranda, Sukses, Misi | Bar progres | 1.4.11 (AA): lolos karena ada teks angka | Beranda lime vs track 2,99:1, track vs kartu 1,60. Sukses lime vs track 2,47. Segmen kosong Misi vs lime 1,37. Track Lencana putih vs `#F3F3F6` 1,11. Isi pink vs putih 2,61. | Track `rgba(18,18,18,.35)` di kobalt (lime vs track 7,61:1 di `#3048FF`, 6,40:1 di `#4A60FF`), `#C9C9D1` di permukaan terang. Isi pink → `#D6336C` (4,62:1). `role="progressbar" aria-valuenow/max`. Flutter: `Semantics(value: '12 dari 100')`. |
| R-02 | Beranda | "Koleksi kotamu" `#DCE1FF` / `#3048FF` | 1.4.3: lolos tipis | 4,65:1 (14 px/600). Rawan di bawah matahari. | Putih (6,0:1) atau 15 px/700. |
| R-03 | Semua | Tombol/chip/pil kedua `#F3F3F6` di putih, "Bukan" putih di `#EEF1FF`, "Rapikan potongan" putih di `#FFE3D6` | 1.4.11: lolos (teks mengidentifikasi tombol) | 1,11 / 1,13 / 1,22:1. Bentuk tombol hilang saat silau. | Border 1 px `#8A8A96` (3,41:1 vs putih) pada tombol kedua di layar luar ruang, atau permukaan `#E6E6EC`. |
| R-04 | Bagikan | Pratinjau kartu share | 1.1.1 (A) | Isi hanya teks kecil dalam ilustrasi. | `role="img" aria-label="Pratinjau kartu: …"`. Flutter `Semantics(image: true)`. |
| R-05 | Kamera | Lensa "Segera" terkunci | 4.1.2 (A) | Tidak ada status nonaktif. Nama "Malam Pasar, segera hadir" mengandung kata visible "Segera" (2.5.3 lolos). | `aria-disabled="true"`. Flutter `Semantics(enabled: false)`. |
| R-06 | Buku | Thumbnail halaman | 4.1.2 / 1.3.1 | "sedang dibuka" ditaruh di `aria-label`. Thumbnail 38×50 (< 44 lebar). Badge "12/100" tanpa konteks. | `aria-current="page"`, lebar 44. Badge `aria-label="12 dari 100 temuan"`. Flutter `Semantics(selected: true)`. |
| R-07 | Beranda | Kartu tautan besar | 2.4.4 (A), 2.5.3 | Nama terbaca "Koleksi kotamu Sukabumi 12dari 100 temuan" (tanpa spasi, tanpa tujuan). | `aria-label="Buka buku Sukabumi, 12 dari 100 temuan"`. Flutter `MergeSemantics` + label eksplisit. |
| R-08 | Beranda | Pil "Sukabumi" | 2.4.6 (AA) | Nama hanya "Sukabumi", fungsinya tidak jelas. 114×40. | "Ganti kota, sekarang Sukabumi", min 44 tinggi. |
| R-09 | Beranda, Misi | Nav bawah | 1.4.1: lolos (ikon terisi + tebal) | Aktif vs non-aktif hanya beda luminansi 1,12:1. Tab "Potret" (pil kobalt) tampak "aktif" di semua layar. Item 76×42. | Tambahkan indikator pil di belakang ikon aktif. Bedakan gaya tab Potret (FAB) dari status aktif. Tinggi item 48. Flutter `NavigationBar` sudah memenuhi. |
| R-10 | Buku, Sukses | Keterangan Caveat 22 px | Keterbacaan | Kontras 10,5:1 dan 6,3:1 (lolos). Tulisan tangan sulit bagi pembaca disleksia dan berpenglihatan rendah. | Opsi "Keterangan dengan huruf biasa" di pengaturan. Keterangan juga masuk label semantik stiker. |
| R-11 | Aplikasi | Kunci orientasi | 1.3.4 Orientasi (AA) | Risiko bila app dikunci potret tanpa alasan esensial. | Izinkan lanskap untuk Buku/Misi, atau dokumentasikan alasan esensial (kamera, page-curl). |

Catatan "label form": v4 tidak punya kolom input teks. Satu-satunya grup form adalah chip kategori (S-05). Kolom keterangan stiker yang akan datang wajib berlabel terlihat (bukan placeholder saja). Masuk dengan Apple/Google lolos 3.3.8 Autentikasi yang aksesibel (AA).

## 4. Simulasi buta warna

File (matriks Machado 2009, keparahan 1,0, `feColorMatrix` linearRGB):
render/a11y/V4Beranda-cvd-banding.png, `V4Temuan-cvd-banding.png` (normal | deuteranopia | protanopia), serta per mode `V4Beranda-deuteranopia.png`, `-protanopia.png`, `V4Temuan-*.png`. Tambahan: `V4Sistem-cvd-banding.png`, `V4Kamera-cvd-banding.png`.

Jarak warna kategori (CIEDE2000; < 10 sulit dibedakan pada area kecil, < 20 lemah untuk titik 8 px):

| Pasangan | Normal | Deuteranopia | Protanopia |
|---|---|---|---|
| Makanan `#FF6FA3` – Tanaman `#7FD6A6` | 68,0 | **7,7** | 30,6 |
| Bangunan `#FF8A5B` – Kendaraan `#FFD84D` | 32,7 | **12,3** | 18,9 |
| Bangunan – Tanaman | 52,0 | **15,3** | **15,1** |
| Bangunan – Makanan | 27,2 | 19,2 | 32,4 |
| Makanan – Papan nama `#9DB4FF` | 34,5 | 28,5 | **17,6** |
| Kendaraan – Lime `#D4F25C` (aksen) | 16,4 | **1,8** | **3,7** |
| Ubin latar Bangunan `#FFE3D6` – Kendaraan `#FFF4C7` | 15,9 | **7,3** | **9,1** |

Penilaian:
- **Beranda**: oranye (Bangunan) dan kuning (Kendaraan) sama-sama menjadi zaitun/kuning, dan merah muda (Makanan) menjadi abu-abu. Ubin latar pastel hampir sama. Kategori **tetap bisa dibedakan karena label teks dan bentuk ilustrasi**, bukan karena warna. Kartu lime "Potret sekarang" menjadi kuning yang sama dengan Kendaraan.
- **Temuan**: chip Bangunan (titik oranye di atas tinta) masih jelas sebagai *terpilih* karena isi tinta 16,9:1 vs chip biasa. Titik warnanya tidak membawa informasi yang bisa diandalkan. Tombol kobalt tetap kuat di kedua mode.
- **Kamera** (tambahan): lensa kobalt/pink/kuning tetap bisa dibedakan (ΔE ≥ 21) dan berlabel.
- Kesimpulan: v4 lolos 1.4.1 karena label. Untuk v5, ikon kategori wajib di setiap kemunculan warna kategori (stiker di buku, filter, peta). Lime jangan dipakai sebagai warna status di dekat kuning Kendaraan.

## 5. Tier perbaikan

**Tier 1: sebelum sistem desain v5 dan widget Flutter pertama (prototipe K-012 ikut terdampak)**
- T-01 kontras Sukses (token "teks di kobalt = putih").
- T-02 tata letak tanpa tinggi tetap + uji skala teks 200 % dan lebar 360 dp.
- T-03 label semantik stiker/cutout (masuk model data: keterangan + kategori).
- T-04 alternatif gestur untuk atur stiker dan page-curl (K-012 harus menyertakan tombol/aksi semantik sejak prototipe).
- S-12 varian reduced motion untuk page-curl (masuk prototipe K-012).
- S-11 token cincin fokus.

**Tier 2: saat membangun layar v5/MVP**
- S-01 segmen terpilih, S-02 header semantics, S-03 pengumuman status, S-04 lampu kilat, S-05 grup kategori, S-06 ikon kategori menggantikan titik, S-07 target tautan, S-08 ukuran huruf minimum, S-09 kartu share, S-10 elemen yang tampak interaktif, S-13 fokus modal/lembar bawah.

**Tier 3: penghalusan sebelum rilis**
- R-01 s/d R-11 (progres, kontras tipis, batas tombol kedua, label kontekstual, nav bawah, opsi huruf keterangan, orientasi).

## 6. Aturan aksesibilitas untuk sistem desain v5 (12 butir)

1. **Kontras teks** minimal 4,5:1 (teks besar 3:1). Untuk teks inti yang dibaca di luar ruangan, targetkan ≥ 7:1. Di permukaan kobalt hanya teks putih. `#DCE1FF` dilarang di atas `#4A60FF`.
2. **Ukuran huruf**: isi minimal 15 px, label pendek (nav, badge, nomor) minimal 13 px/600. Tidak ada teks < 13 px kecuali di dalam gambar pratinjau yang punya teks alternatif.
3. **Status dan komponen ≥ 3:1**: indikator terpilih, track progres, batas input, dan cincin fokus. "Terpilih" = isi tinta `#121212` + ikon centang, bukan putih di atas `#F3F3F6`.
4. **Warna kategori tidak pernah sendirian**: selalu ikon + label. Titik warna polos dilarang. Lime bukan warna kategori atau status.
5. **Target sentuh** 48×48 dp (iOS 44 pt), jarak antar-target ≥ 8 dp. Tautan teks di dalam kalimat dibuat tombol tersendiri atau area sentuhnya diperluas.
6. **Tanpa tinggi tetap** pada wadah teks: `min-height` + *wrap* + layar bisa digulir. Setiap layar diuji di skala teks 200 % dan lebar 360 dp. Unbounded hanya untuk 1–3 kata pendek dan harus bisa turun baris.
7. **Satu judul per layar** dengan *header semantics*. Setiap tombol ikon punya label. Setiap stiker/cutout punya label "keterangan, kategori".
8. **Status diumumkan**: deteksi kategori, landmark terdekat, "tertempel", dan error lewat *live region*/announce, tanpa mencuri fokus kecuali di layar hasil.
9. **Setiap gestur punya padanan satu ketukan**: geser halaman, cubit/putar/geser stiker, tarik lembar bawah. Sediakan juga aksi semantik khusus untuk pembaca layar.
10. **Hormati "kurangi gerak"**: page-curl → *crossfade* ≤ 200 ms, stiker jatuh → langsung muncul, tanpa animasi otomatis > 5 detik tanpa tombol henti, tanpa kilat > 3×/detik. Suara mengikuti mode senyap.
11. **Cincin fokus**: 3 px tinta + 2 px putih. Di permukaan kobalt pakai lime. Elemen yang difokus tidak boleh tertutup nav bawah atau lembar bawah.
12. **Teks di atas foto** selalu berada di atas chip/scrim padat dengan kontras ≥ 4,5:1, dihitung pada piksel terterang. Pada kartu share 1080 px, teks penting ≥ 40 px dan ≥ 4,5:1, dan saat berbagi disertakan teks alternatif otomatis.

## 7. Yang sudah baik (pertahankan)

- `lang="id"` dan `<title>` per layar. `aria-label` pada semua tombol ikon (Tutup, Kembali, Lampu kilat, Balik kamera, Potret).
- `aria-pressed` pada lensa dan chip, `role="radiogroup"` pada gaya kartu, `aria-current="page"` pada nav.
- Tombol utama 52–58 px, shutter 84 px, tombol kembali 44 px. Lensa 64×69 px.
- Chip kategori di Sistem sudah memakai ikon + label. Ini pola yang benar dan perlu diterapkan di semua layar.
- Pesan privasi di Bagikan jelas dan dekat dengan aksi.
- Scrim tombol kamera 55 % masih memberi ikon putih ≥ 4,12:1 pada skenario terburuk (foto putih).

## Lampiran A: Rasio kontras semua teks per layar

Dihitung dari warna tercomputasi + tumpukan latar di titik tengah teks (`elementsFromPoint`, komposit rgba). Rumus WCAG 2.x. "Lingkaran dekor" berarti teks berada di atas lingkaran `#4A60FF`. Untuk KartuShare, syarat 3:1 memakai ukuran kanvas. Pada ukuran tampil (×0,36) semua teks < 24 pt kecuali judul dan "13/100", sehingga syarat efektif teks lainnya 4,5:1 (lihat S-09). Teks "Zona aman" adalah artefak mockup.

#### V4Bagikan

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Bagikan | 17px/700 Unbounded | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Landmark ke-5 | 10px/700 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Gereja Sidang Kristus | 19px/800 Unbounded | #FFFFFF / #4A60FF (lingkaran dekor) | 4.76 | 3 | Lolos |
| SUKABUMI | 8px/800 Unbounded | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| 13/100 | 12px/800 Unbounded | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Kliping Kota | 11px/700 Unbounded | #FFFFFF / #4A60FF (lingkaran dekor) | 4.76 | 4.5 | Lolos |
| Halaman | 14px/700 PJS | #5B5B66 / #F3F3F6 | 6.05 | 4.5 | Lolos |
| Temuan | 14px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Stiker | 14px/700 PJS | #5B5B66 / #F3F3F6 | 6.05 | 4.5 | Lolos |
| Hanya nama kota yang ikut. Data lokasi f | 14px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Simpan | 16px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Ke Stories | 16px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |

#### V4Beranda

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Halo, Nadia | 14px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Beranda | 22px/800 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Sukabumi | 14px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Koleksi kotamu | 14px/600 PJS | #DCE1FF / #3048FF | 4.65 | 4.5 | Lolos |
| Sukabumi | 30px/800 Unbounded | #FFFFFF / #3048FF | 6.01 | 3 | Lolos |
| 12 | 26px/800 Unbounded | #FFFFFF / #3048FF | 6.01 | 3 | Lolos |
| dari 100 temuan | 15px/600 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| Potret sekarang | 16px/700 Unbounded | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Misi | 12px/700 PJS | #121212 / #9DB4FF | 9.28 | 4.5 | Lolos |
| 2/5 | 18px/800 Unbounded | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Potret 5 papan nama minggu ini | 15px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Temuan terbaru | 17px/700 Unbounded | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Buka buku | 14px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Bangunan | 13px/600 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Makanan | 13px/600 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Kendaraan | 13px/600 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Beranda | 12px/700 PJS | #3048FF / #FFFFFF | 6.01 | 4.5 | Lolos |
| Buku | 12px/600 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Potret | 12px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Misi | 12px/600 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Profil | 12px/600 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |

#### V4Buku

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Sukabumi | 18px/800 Unbounded | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Halaman 11 dari 24 | 13px/400 PJS | #5B5B66 / #F3F3F6 | 6.05 | 4.5 | Lolos |
| 12/100 | 13px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| angkot ijo, jalur 05 | 22px/400 Caveat | #3A3A44 / #FBF7EE | 10.51 | 4.5 | Lolos |
| mochi oleh-oleh | 22px/400 Caveat | #3A3A44 / #FBF7EE | 10.51 | 4.5 | Lolos |
| menara lonceng | 22px/400 Caveat | #3A3A44 / #FBF7EE | 10.51 | 4.5 | Lolos |
| Atur stiker | 13px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| 9 | 12px/700 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| 10 | 12px/700 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| 11 | 12px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| 12 | 12px/700 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| 13 | 12px/700 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Daftar isi | 15px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Bagikan halaman | 15px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |

#### V4Kamera

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Saku 35 | 12px/700 Unbounded | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| Bangunan terdeteksi | 14px/700 PJS | #121212 / #FF8A5B | 8.06 | 4.5 | Lolos |
| Saku 35 | 12px/700 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| Kotak Pos | 12px/600 PJS | #C9C9D1 / #121212 | 11.38 | 4.5 | Lolos |
| Koran | 12px/600 PJS | #C9C9D1 / #121212 | 11.38 | 4.5 | Lolos |
| Segera | 12px/600 PJS | #9A9AA5 / #121212 | 6.73 | 4.5 | Lolos |

#### V4KartuShare

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Landmark ke-5 di Sukabumi | 34px/700 PJS | #121212 / #D4F25C | 14.86 | 3 | Lolos |
| SUKABUMI | 28px/800 Unbounded | #121212 / #D4F25C | 14.86 | 3 | Lolos |
| 13/100 | 50px/800 Unbounded | #121212 / #D4F25C | 14.86 | 3 | Lolos |
| Gereja Sidang Kristus | 74px/800 Unbounded | #FFFFFF / #4A60FF (lingkaran dekor) | 4.76 | 3 | Lolos |
| Kliping Kota | 32px/700 Unbounded | #FFFFFF / #4A60FF (lingkaran dekor) | 4.76 | 3 | Lolos |
| kamera Saku 35 | 26px/500 PJS | #DCE1FF / #4A60FF (lingkaran dekor) | 3.69 | 3 | Lolos |
| Zona aman atas 270 px | 30px/700 PJS | #FFFFFF / #293BC4 | 8.39 | 3 | Lolos |
| Zona aman bawah 680 px | 30px/700 PJS | #FFFFFF / #3C4DC4 (lingkaran dekor) | 6.92 | 3 | Lolos |

#### V4Misi

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Misi | 26px/800 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Minggu ini | 13px/700 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| Sisa 4 hari | 14px/600 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Potret 5 papan nama atau tulisan | 20px/700 PJS | #121212 / #D4F25C | 14.86 | 3 | Lolos |
| 2/5 | 44px/800 Unbounded | #121212 / #D4F25C | 14.86 | 3 | Lolos |
| Potret papan nama | 16px/700 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| Hadiah: stiker selotip motif untuk bukum | 14px/400 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Lencana | 17px/700 Unbounded | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| 5/25 | 14px/800 Unbounded | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| Semua landmark Sukabumi | 15px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| 7/10 | 14px/800 Unbounded | #121212 / #FF6FA3 | 7.19 | 4.5 | Lolos |
| Pencinta makanan | 15px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Bab pertama | 15px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Didapat 18 November | 13px/400 PJS | #5B5B66 / #F3F3F6 | 6.05 | 4.5 | Lolos |
| Beranda | 12px/600 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Buku | 12px/600 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Potret | 12px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Misi | 12px/700 PJS | #3048FF / #FFFFFF | 6.01 | 4.5 | Lolos |
| Profil | 12px/600 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |

#### V4Pembuka

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| +1 temuan | 18px/800 Unbounded | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Potret kotamu, kumpulkan jadi buku. | 30px/800 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Latar foto hilang otomatis. Hasilnya jad | 16px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Lanjut dengan Apple | 17px/700 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| Lanjut dengan Google | 17px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Untuk usia 18+. Baca | 13px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| ketentuan | 13px/400 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| privasi | 13px/400 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |

#### V4Sistem

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Pop Kota | 44px/800 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Sistem desain v4 · terang, berani, mudah | 17px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Draf untuk diuji | 15px/700 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Warna | 20px/700 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Kobalt | 16px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| #3048FF · aksi utama · 6,0:1 | 13px/400 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| Lime | 16px/700 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| #D4F25C · sorotan, progres | 13px/400 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Tinta | 16px/700 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| #121212 · teks | 13px/400 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| Permukaan | 16px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| #F3F3F6 · teks kedua #5B5B66 | 13px/400 PJS | #5B5B66 / #F3F3F6 | 6.05 | 4.5 | Lolos |
| Warna kategori (selalu bersama ikon yang | 15px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Bangunan | 15px/700 PJS | #121212 / #FF8A5B | 8.06 | 4.5 | Lolos |
| Makanan | 15px/700 PJS | #121212 / #FF6FA3 | 7.19 | 4.5 | Lolos |
| Kendaraan | 15px/700 PJS | #121212 / #FFD84D | 13.54 | 4.5 | Lolos |
| Tanaman | 15px/700 PJS | #121212 / #7FD6A6 | 10.77 | 4.5 | Lolos |
| Papan nama | 15px/700 PJS | #121212 / #9DB4FF | 9.28 | 4.5 | Lolos |
| Huruf | 20px/700 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Sukabumi 12/100 | 34px/800 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Unbounded 700–800: judul layar dan angka | 14px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Potret benda di sekitarmu. Latarnya hila | 17px/400 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Plus Jakarta Sans 400–700: semua teks UI | 14px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| angkot ijo, jalur 05 | 26px/400 Caveat | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Caveat: hanya keterangan tulisan tangan  | 14px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Komponen | 20px/700 Unbounded | #121212 / #FFFFFF | 18.73 | 3 | Lolos |
| Tombol utama | 17px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| Tombol kedua | 17px/700 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Chip terpilih | 14px/700 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| Chip | 14px/600 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Progres kota | 14px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| 12/100 | 14px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Kartu radius 24 · tombol kapsul 56 px ·  | 14px/400 PJS | #5B5B66 / #FFFFFF | 6.70 | 4.5 | Lolos |
| Cutout = stiker | 18px/700 Unbounded | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Setiap temuan tampil sebagai stiker: bin | 15px/400 PJS | #5B5B66 / #F3F3F6 | 6.05 | 4.5 | Lolos |

#### V4Sukses

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Landmark ke-5 ditemukan | 14px/700 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| menara lonceng | 22px/400 Caveat | #5B5B66 / #FBF7EE | 6.27 | 4.5 | Lolos |
| Tertempel di bukumu! | 28px/800 Unbounded | #FFFFFF / #4A60FF (lingkaran dekor) | 4.76 | 3 | Lolos |
| Sukabumi sekarang 13 dari 100 temuan. | 16px/400 PJS | #DCE1FF / #4A60FF (lingkaran dekor) | 3.69 | 4.5 | **Gagal** |
| Lihat di buku | 16px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Bagikan | 16px/700 PJS | #121212 / #D4F25C | 14.86 | 4.5 | Lolos |
| Potret lagi | 15px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |

#### V4Temuan

| Teks | Ukuran/tebal | Warna teks / latar | Rasio | Syarat | Hasil |
|---|---|---|---|---|---|
| Temuan baru | 17px/700 Unbounded | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Rapikan potongan | 14px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Kamu dekat landmark | 14px/600 PJS | #3048FF / #EEF1FF | 5.34 | 4.5 | Lolos |
| Ini Gereja Sidang Kristus? | 18px/700 Unbounded | #121212 / #EEF1FF | 16.65 | 4.5 | Lolos |
| Ya, betul | 16px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |
| Bukan | 16px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Kategori | 14px/700 PJS | #121212 / #FFFFFF | 18.73 | 4.5 | Lolos |
| Bangunan | 14px/700 PJS | #FFFFFF / #121212 | 18.73 | 4.5 | Lolos |
| Papan nama | 14px/600 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Lainnya | 14px/600 PJS | #121212 / #F3F3F6 | 16.92 | 4.5 | Lolos |
| Tempel ke buku | 17px/700 PJS | #FFFFFF / #3048FF | 6.01 | 4.5 | Lolos |

## Lampiran B: Kontras non-teks dan warna kandidat perbaikan

| Pasangan | Warna | Rasio | ≥ 3:1 |
|---|---|---|---|
| Beranda progress: lime fill vs track | #D4F25C / #6476FF | 2.99 | **tidak**
| Beranda progress: track vs kartu kobalt | #6476FF / #3048FF | 1.60 | **tidak**
| Beranda progress: lime fill vs kartu kobalt | #D4F25C / #3048FF | 4.76 | ya
| Sukses progress: lime vs track | #D4F25C / #7788FF | 2.47 | **tidak**
| Sukses progress: track vs #4A60FF | #7788FF / #4A60FF | 1.53 | **tidak**
| Misi segmen: terisi vs kosong | #121212 / #B7D051 | 10.84 | ya
| Misi segmen kosong vs lime | #B7D051 / #D4F25C | 1.37 | **tidak**
| Lencana bar kobalt vs track putih | #3048FF / #FFFFFF | 6.01 | ya
| Lencana bar pink vs track putih | #FF6FA3 / #FFFFFF | 2.61 | **tidak**
| Lencana track putih vs #F3F3F6 | #FFFFFF / #F3F3F6 | 1.11 | **tidak**
| Sistem progress kobalt vs track #F3F3F6 | #3048FF / #F3F3F6 | 5.42 | ya
| Tab aktif #3048FF vs putih | #3048FF / #FFFFFF | 6.01 | ya
| Tab non-aktif #5B5B66 vs putih | #5B5B66 / #FFFFFF | 6.70 | ya
| Tab aktif vs tab non-aktif (beda warna saja) | #3048FF / #5B5B66 | 1.12 | **tidak**
| Shutter cincin #3048FF vs #121212 | #3048FF / #121212 | 3.12 | ya
| Shutter isi putih vs #121212 | #FFFFFF / #121212 | 18.73 | ya
| Lensa: cincin pilih putih vs #121212 | #FFFFFF / #121212 | 18.73 | ya
| Lensa Saku35 #3048FF vs #121212 | #3048FF / #121212 | 3.12 | ya
| Lensa Kotak Pos #FF6FA3 vs #121212 | #FF6FA3 / #121212 | 7.19 | ya
| Lensa Koran #FFD84D vs #121212 | #FFD84D / #121212 | 13.54 | ya
| Lensa Segera #2A2A30 vs #121212 | #2A2A30 / #121212 | 1.31 | **tidak**
| Ikon gembok #C9C9D1 vs #2A2A30 | #C9C9D1 / #2A2A30 | 8.67 | ya
| Tombol balik kamera #2A2A30 vs #121212 | #2A2A30 / #121212 | 1.31 | **tidak**
| Ikon putih vs #2A2A30 | #FFFFFF / #2A2A30 | 14.26 | ya
| Ikon putih vs scrim 55% di atas langit #CFE2EE | #FFFFFF / #677075 | 5.06 | ya
| Ikon putih vs scrim 55% di atas putih (terburuk) | #FFFFFF / #7D7D7D | 4.12 | ya
| Bingkai jendela bidik #3048FF vs langit #CFE2EE | #3048FF / #CFE2EE | 4.51 | ya
| Bingkai jendela bidik #3048FF vs #9C8B6E | #3048FF / #9C8B6E | 1.81 | **tidak**
| Titik Bangunan #FF8A5B vs putih | #FF8A5B / #FFFFFF | 2.32 | **tidak**
| Titik Makanan #FF6FA3 vs putih | #FF6FA3 / #FFFFFF | 2.61 | **tidak**
| Titik Kendaraan #E0B400 vs putih | #E0B400 / #FFFFFF | 1.96 | **tidak**
| Titik Bangunan #FF8A5B vs chip #121212 | #FF8A5B / #121212 | 8.06 | ya
| Titik Papan nama #9DB4FF vs chip #F3F3F6 | #9DB4FF / #F3F3F6 | 1.82 | **tidak**
| Chip terpilih #121212 vs chip biasa #F3F3F6 | #121212 / #F3F3F6 | 16.92 | ya
| Chip biasa #F3F3F6 vs layar putih | #F3F3F6 / #FFFFFF | 1.11 | **tidak**
| Tombol kedua #F3F3F6 vs putih | #F3F3F6 / #FFFFFF | 1.11 | **tidak**
| Tombol Bukan putih vs kartu #EEF1FF | #FFFFFF / #EEF1FF | 1.13 | **tidak**
| Segmen terpilih putih vs track #F3F3F6 | #FFFFFF / #F3F3F6 | 1.11 | **tidak**
| Teks segmen tdk terpilih #5B5B66 vs terpilih #121212 | #5B5B66 / #121212 | 2.79 | **tidak**
| Thumb halaman putih vs #F3F3F6 | #FFFFFF / #F3F3F6 | 1.11 | **tidak**
| Thumb aktif #3048FF vs #F3F3F6 | #3048FF / #F3F3F6 | 5.42 | ya
| Rapikan potongan putih vs #FFE3D6 | #FFFFFF / #FFE3D6 | 1.22 | **tidak**
| Kartu lime #D4F25C vs putih | #D4F25C / #FFFFFF | 1.26 | **tidak**
| Chip Misi #9DB4FF vs #F3F3F6 | #9DB4FF / #F3F3F6 | 1.82 | **tidak**
| Tombol Bagikan lime vs #3048FF | #D4F25C / #3048FF | 4.76 | ya
| Tombol Lihat putih vs #3048FF | #FFFFFF / #3048FF | 6.01 | ya
| Fokus: cincin kobalt di atas kobalt #4A60FF | #3048FF / #4A60FF | 1.26 | **tidak**
| Teks #DCE1FF vs #3048FF | #DCE1FF / #3048FF | 4.65 | ya
| Teks #DCE1FF vs #4A60FF | #DCE1FF / #4A60FF | 3.69 | ya
| Teks putih vs #4A60FF | #FFFFFF / #4A60FF | 4.76 | ya
| Kandidat: putih vs #4A60FF | #FFFFFF / #4A60FF | 4.76 | ya (kandidat)
| Kandidat: #FFFFFF vs #3048FF | #FFFFFF / #3048FF | 6.01 | ya (kandidat)
| Kandidat: #EEF0FF vs #4A60FF | #EEF0FF / #4A60FF | 4.21 | ya (kandidat)
| Kandidat lingkaran #3D54FF: putih | #FFFFFF / #3D54FF | 5.37 | ya (kandidat)
| Kandidat lingkaran #3D54FF: #DCE1FF | #DCE1FF / #3D54FF | 4.16 | ya (kandidat)
| Kandidat #2438E0 kobalt gelap: putih | #FFFFFF / #2438E0 | 7.73 | ya (kandidat)
| Kandidat #2438E0: #DCE1FF | #DCE1FF / #2438E0 | 5.98 | ya (kandidat)
| Kandidat border #8A8A96 vs putih | #8A8A96 / #FFFFFF | 3.41 | ya (kandidat)
| Kandidat border #8A8A96 vs #F3F3F6 | #8A8A96 / #F3F3F6 | 3.08 | ya (kandidat)
| Kandidat titik #C2410C (oranye gelap) vs putih | #C2410C / #FFFFFF | 5.18 | ya (kandidat)
| Kandidat pink bar #D6336C vs putih | #D6336C / #FFFFFF | 4.62 | ya (kandidat)
| Kandidat track Lencana #C9C9D1 vs #F3F3F6 | #C9C9D1 / #F3F3F6 | 1.49 | **tidak** (kandidat)
| Kandidat cincin shutter putih vs #121212 | #FFFFFF / #121212 | 18.73 | ya (kandidat)
| Kandidat cincin lime vs #121212 | #D4F25C / #121212 | 14.86 | ya (kandidat)
| Kandidat Segera #9A9AA5 vs #121212 | #9A9AA5 / #121212 | 6.73 | ya (kandidat)

## Lampiran C: Ukuran target sentuh (Playwright boundingBox, px CSS = dp)

| Layar | Elemen | Ukuran (px) | ≥24 | ≥44 |
|---|---|---|---|---|
| Bagikan | button "Tutup" | 44×44 | ya | ya |
| Bagikan | button[radio] "Halaman" | 111×44 | ya | ya |
| Bagikan | button[radio] "Temuan" | 111×44 | ya | ya |
| Bagikan | button[radio] "Stiker" | 111×44 | ya | ya |
| Bagikan | button "Simpan" | 174×56 | ya | ya |
| Bagikan | button "Ke Stories" | 174×56 | ya | ya |
| Beranda | button "Sukabumi" | 114×40 | ya | tidak |
| Beranda | a "Koleksi kotamu Sukabumi 12dari 100 temua" | 358×188 | ya | ya |
| Beranda | a "Potret sekarang" | 173×132 | ya | ya |
| Beranda | a "Misi 2/5 Potret 5 papan nama minggu ini" | 173×132 | ya | ya |
| Beranda | a "Buka buku" | 71×18 | **tidak** | tidak |
| Beranda | a "Beranda" | 76×42 | ya | tidak |
| Beranda | a "Buku" | 76×42 | ya | tidak |
| Beranda | a "Potret" | 76×58 | ya | ya |
| Beranda | a "Misi" | 76×42 | ya | tidak |
| Beranda | a "Profil" | 76×42 | ya | tidak |
| Buku | button "Kembali ke Beranda" | 44×44 | ya | ya |
| Buku | button "Halaman 9" | 38×50 | ya | tidak |
| Buku | button "Halaman 10" | 38×50 | ya | tidak |
| Buku | button "Halaman 11, sedang dibuka" | 38×50 | ya | tidak |
| Buku | button "Halaman 12" | 38×50 | ya | tidak |
| Buku | button "Halaman 13" | 38×50 | ya | tidak |
| Buku | button "Daftar isi" | 174×52 | ya | ya |
| Buku | a "Bagikan halaman" | 174×52 | ya | ya |
| Kamera | button "Tutup kamera" | 44×44 | ya | ya |
| Kamera | button "Lampu kilat mati" | 44×44 | ya | ya |
| Kamera | button "Saku 35" | 64×69 | ya | ya |
| Kamera | button "Kotak Pos" | 64×69 | ya | ya |
| Kamera | button "Koran" | 64×69 | ya | ya |
| Kamera | button "Malam Pasar, segera hadir" | 64×69 | ya | ya |
| Kamera | button "Potret" | 84×84 | ya | ya |
| Kamera | button "Balik kamera" | 52×52 | ya | ya |
| Misi | a "Potret papan nama" | 318×52 | ya | ya |
| Misi | a "Beranda" | 76×42 | ya | tidak |
| Misi | a "Buku" | 76×42 | ya | tidak |
| Misi | a "Potret" | 76×58 | ya | ya |
| Misi | a "Misi" | 76×42 | ya | tidak |
| Misi | a "Profil" | 76×42 | ya | tidak |
| Pembuka | button "Lanjut dengan Apple" | 342×56 | ya | ya |
| Pembuka | button "Lanjut dengan Google" | 342×56 | ya | ya |
| Pembuka | a "ketentuan" | 63×16 | **tidak** | tidak |
| Pembuka | a "privasi" | 40×16 | **tidak** | tidak |
| Sistem | button "Tombol utama" | 388×56 | ya | ya |
| Sistem | button "Tombol kedua" | 388×56 | ya | ya |
| Sukses | a "Lihat di buku" | 170×56 | ya | ya |
| Sukses | a "Bagikan" | 170×56 | ya | ya |
| Sukses | a "Potret lagi" | 75×19 | **tidak** | tidak |
| Temuan | button "Kembali ke kamera" | 44×44 | ya | ya |
| Temuan | button "Rapikan potongan" | 174×40 | ya | tidak |
| Temuan | button "Ya, betul" | 158×48 | ya | ya |
| Temuan | button "Bukan" | 158×48 | ya | ya |
| Temuan | button "Bangunan" | 110×40 | ya | tidak |
| Temuan | button "Papan nama" | 124×40 | ya | tidak |
| Temuan | button "Lainnya" | 79×40 | ya | tidak |
| Temuan | button "Tempel ke buku" | 358×58 | ya | ya |

Catatan: elemen < 24 px ("Buka buku", "Potret lagi", "ketentuan", "privasi") lolos 2.5.8 lewat pengecualian jarak (lingkaran 24 px tidak bersinggungan dengan target lain) atau pengecualian inline, tetapi tetap dicatat di S-07.

## Lampiran D: Simulasi skala teks 200 %

Metode: setiap `font-size`/`line-height` digandakan lewat Playwright, lebar layar 390 px dan 360 px, lalu dideteksi teks yang melewati wadah bertinggi tetap / `overflow:hidden` / tepi layar. Screenshot: render/a11y/V4{Beranda,Temuan,Buku,Sukses,Bagikan}-teks200.png. Skrip: scratchpad/a11y-tools/zoom.js, `audit.js`, `colors.js`, `de.js`, `cvd.js`.
