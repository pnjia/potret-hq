# Spesifikasi Sistem v1

> Status: **DIKUNCI** · Dikunci: 16 Nov 2026 · Nama aplikasi: belum ada (pakai nama kode)
> Alasan tiap keputusan ada di [`docs/keputusan.md`](../keputusan.md). Sumber riset ada di [`docs/riset/2026-11-16-riset-awal.md`](../riset/2026-11-16-riset-awal.md).
> Terakhir diverifikasi: 16 Nov 2026 (dipindah ke struktur HQ; isi keputusan tidak diubah, hanya tautan dan §3 yang dipindah).

## 1. Ringkasan produk

Aplikasi untuk memotret objek di kota-kota Indonesia. Latar foto terhapus otomatis, lalu hasilnya disimpan sebagai koleksi di dalam sebuah buku digital. Buku ini punya animasi dan suara buka halaman seperti buku sungguhan. Koleksi bisa dipamerkan ke teman di dalam aplikasi dan dibagikan ke media sosial.

**Pembeda dari aplikasi sejenis** (Loot, Museeum, kokososo):
- Konteks kota-kota Indonesia, dengan landmark kurasi.
- Buku sebagai artefak yang terasa nyata.
- Skin kamera digital sebagai identitas visual.

## 2. Pengguna

- **Usia**: 16+ (Gen Z dan angkatan Gen Alpha tertua).
- **Arah visual**: ekspresif, tidak kekanak-kanakan, nuansa zine/scrapbook.
- **Palet**: dasar netral bernuansa kertas. Warna yang ramai dibawa oleh konten (sampul, skin kamera, aksen kota).

## 3. Istilah (glosarium)

Dipindah ke [`docs/produk/glosarium.md`](glosarium.md) supaya hanya ada satu sumber istilah. Isi tabel aslinya dipertahankan utuh di sana.

## 4. Fitur MVP

### 4.1 Akun
- Login wajib, lewat Google dan Sign in with Apple (Supabase Auth).
- Gerbang usia 16+ (tahun lahir) saat pendaftaran.
- Hapus akun dari dalam aplikasi (wajib App Store dan Google Play).
- Animasi buku contoh ditampilkan sebelum layar login.

### 4.2 Kamera
- 3–4 skin gratis.
- 2–3 skin "terkunci, segera hadir". Ketukan pada skin ini dicatat sebagai ukuran minat.
- Skin terdiri dari overlay bodi kamera, filter warna (LUT via shader), dan suara shutter.

### 4.3 Temuan
- Hapus latar di perangkat: `native_cutout` (iOS Vision dan Android ML Kit Subject Segmentation).
- Model Android diunduh di awal (saat onboarding), karena penggunaan pertama butuh internet.
- Kuas manual untuk merapikan masker.
- Kategori otomatis lewat ML Kit Image Labeling, misalnya makanan, kendaraan, tanaman, bangunan, papan nama.

### 4.4 Kota dan landmark
- Kota dideteksi dari lokasi, dan **hanya nama kota yang disimpan**, bukan koordinat.
- Saat pengguna berada dalam radius landmark, aplikasi bertanya "Ini [nama landmark]?" untuk konfirmasi.
- MVP: 1 kota dikurasi dengan 20–30 landmark, sebaiknya kota yang bisa disurvei langsung.
- Kota yang belum dikurasi tetap berfungsi: bab tetap dibuat, temuan bebas tetap masuk, dan halaman landmark bertanda "segera hadir".

### 4.5 Buku
Urutan isi buku:
1. Sampul.
2. Halaman identitas.
3. Daftar isi kota.
4. Bab per kota: halaman pembatas (stempel kota + progres landmark), halaman landmark, lalu halaman temuan bebas.
5. Halaman statistik.

Aturan buku:
- Landmark yang belum ditemukan tampil sebagai siluet "???".
- Tata letak otomatis berbasis template, dengan rotasi acak kecil, selotip, dan keterangan.
- Pengguna bisa mengatur ulang. Halaman yang pernah diatur manual **tidak boleh diacak ulang** oleh sistem.
- Animasi page-curl dan suara buka halaman.
- Halaman dimuat bertahap (lazy load) dengan thumbnail.
- Sampul: template + nama + stiker dari cutout milik pengguna.

### 4.6 Retensi
- Misi mingguan dibuat otomatis dari kategori, sehingga berlaku di kota mana pun.
- Lencana: kelengkapan landmark per kota, tonggak bab, koleksi kategori.
- Hadiah bersifat kosmetik untuk buku (stiker, stempel). Ritme mingguan, bukan harian.

### 4.7 Sosial
- Cari teman lewat username, follow dengan persetujuan, akun privat secara default.
- Buku teman hanya bisa dilihat. Tidak ada komentar, like, atau DM di MVP.
- Buku teman hanya menampilkan nama kota, tidak pernah lokasi tepat.
- Tersedia tombol lapor dan blokir. Laporan ditinjau manual lewat dashboard Supabase.

### 4.8 Share
- Gambar 9:16 dan video 9:16 berisi animasi buka halaman beserta suaranya.
- Stempel kota (contoh: "Bandung 23/100") dan watermark nama kamera.
- **Metadata EXIF/GPS dihapus** dari setiap gambar yang dibagikan.

### 4.9 Sinkronisasi
- Cutout (WebP terkompresi) dan thumbnail diunggah ke cloud.
- Foto asli tetap di perangkat.
- Pembelian terikat ke akun. Ini disiapkan sejak awal meskipun toko belum dibuka.

## 5. Entitas data (garis besar)

- `User`: id, username, tahun_lahir, visibilitas.
- `City`: id, nama, provinsi, warna_aksen, stempel, sudah_dikurasi.
- `Landmark`: id, city_id, nama, kategori, lat, lng, radius_m, fakta, siluet.
- `Finding`: id, user_id, city_id, landmark_id?, kategori, camera_id, cutout_url, thumb_url, path_foto_asli_lokal, catatan, dibuat_pada.
- `Book`: id, user_id, tema_id, sampul.
- `Chapter`: id, book_id, city_id, urutan.
- `Page`: id, chapter_id, jenis (pembatas/landmark/bebas), template_id, urutan.
- `Placement`: finding_id, page_id, x, y, skala, rotasi, z, diatur_manual.
- `Camera`: id, nama, lut, overlay, suara, sku?, gratis, terkunci.
- `Entitlement`: user_id, item_id, sumber.
- `Mission`, `MissionProgress`, `Badge`, `UserBadge`.
- `Follow`: follower_id, followee_id, status (menunggu/disetujui).
- `Report`, `Block`.
- `Event`: untuk ketukan pada kamera terkunci dan metrik dasar.

## 6. Stack

| Bagian | Pilihan |
|---|---|
| Aplikasi | Flutter. Minimum iOS 17 (syarat cutout Vision). Android dengan Google Play services |
| Kamera | `camera` + overlay UI + shader LUT |
| Hapus latar | `native_cutout` |
| Kategori | ML Kit Image Labeling |
| Data lokal | SQLite via drift |
| Backend | Supabase (Auth, Postgres + RLS, Storage) |
| Pembayaran (nanti) | RevenueCat atau `in_app_purchase` |
| Animasi buku | Shader page-curl kustom |
| Video share | Render frame + encoder native (AVAssetWriter / MediaCodec). **Jangan pakai FFmpegKit**, sudah pensiun |

## 7. Kepatuhan (cek ulang teks aslinya sebelum rilis)

- **PP Tunas (PP 17/2025)**: informasi batas usia, verifikasi usia, dan mekanisme pelaporan.
- **UU PDP**: persetujuan pengguna, lokasi disimpan hanya di tingkat kota, kebijakan privasi.
- **Aturan toko aplikasi**: hapus akun, Sign in with Apple, serta lapor, blokir, dan penyaringan untuk konten pengguna.

## 8. Ditunda (bukan MVP)

- Toko kamera dan tema buku.
- Editor sampul lanjutan.
- Tautan web untuk penerima share yang belum memasang aplikasi.
- Komentar, like, dan DM.
- Kota kurasi tambahan.

## 9. Risiko utama

1. **Page-curl kurang mulus di Android kelas menengah.** Ini jantung pengalaman aplikasi, jadi dibuat prototipe paling awal.
2. **Kualitas cutout pada objek yang sulit**, misalnya objek besar atau latar ramai. Mitigasinya kuas manual.
3. **Beban moderasi dari fitur follow.** Dibatasi lewat akun privat, mode hanya-lihat, dan tanpa komentar.
4. **Biaya storage cloud.** Ditekan dengan WebP terkompresi dan foto asli yang tetap di perangkat.
5. **Gesekan login wajib.** Dikurangi dengan demo buku sebelum layar login.

## 10. Urutan kerja

1. Analisis repo `inzta-hq`, lalu rancang struktur HQ versi solo.
2. Susun board Trello.
3. Prototipe animasi buka halaman.
4. Bangun MVP sesuai bagian 4.
