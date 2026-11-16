# Glosarium

> Sumber tunggal istilah proyek potret. Dipakai di dokumen, kode, Trello, dan semua sub-agen.
> Asal: §3 `spesifikasi-sistem-v1.md` (dipindah utuh). Aturan penamaan identifier: K-014.
> Terakhir diverifikasi: 16 Nov 2026.

## 1. Istilah inti (dari spesifikasi v1, tidak diubah)

| Istilah | Arti | Nama di kode |
|---|---|---|
| Temuan | Satu objek hasil potret yang sudah dipotong latarnya | `Finding` |
| Temuan bebas | Temuan apa saja, kategorinya otomatis | `Finding` dengan `landmarkId = null` |
| Landmark | Objek kurasi per kota, punya koordinat dan radius | `Landmark` |
| Kota | Kota tempat temuan dibuat (hanya tingkat kota) | `City` |
| Buku | Satu buku milik tiap pengguna, berisi semua kota | `Book` |
| Bab | Bagian buku untuk satu kota | `Chapter` |
| Halaman | Satu halaman buku berbasis template | `Page` |
| Penempatan | Posisi temuan di halaman | `Placement` |
| Kamera / skin | Bodi visual + filter warna + suara shutter | `Camera` |
| Misi | Tugas mingguan berbasis kategori | `Mission` |
| Lencana | Penghargaan kelengkapan | `Badge` |

## 2. Istilah pendukung

Istilah yang dipakai spesifikasi tetapi belum punya baris sendiri.

| Istilah | Arti | Nama di kode |
|---|---|---|
| Kategori | Label otomatis sebuah temuan (makanan, kendaraan, dll.). Taksonominya belum final (Q-004) | `category` |
| Cutout | Gambar hasil hapus latar (WebP terkompresi) | `cutoutUrl` |
| Masker | Peta piksel yang menentukan bagian mana yang ikut cutout; dirapikan dengan kuas manual | `mask` |
| Kuas manual | Alat merapikan masker | `MaskBrush` |
| Halaman pembatas | Halaman pertama bab: stempel kota + progres landmark | `Page.kind = divider` |
| Halaman landmark | Halaman berisi slot landmark kota (yang belum ditemukan tampil siluet "???") | `Page.kind = landmark` |
| Halaman temuan bebas | Halaman berisi temuan bebas | `Page.kind = free` |
| Siluet | Gambar landmark yang belum ditemukan | `silhouetteAsset` |
| Stempel kota | Grafis kota di halaman pembatas dan kartu share ("Bandung 23/100") | `stampAsset` |
| Sampul | Template + nama + stiker dari cutout milik pengguna | `Book.cover` |
| Kepemilikan | Hak pakai item berbayar (kamera, tema) yang terikat ke akun | `Entitlement` |
| Kamera terkunci | Skin "segera hadir"; ketukannya dicatat sebagai ukuran minat | `Camera.isLocked` |
| Kartu share | Gambar 9:16 untuk media sosial | `ShareCard` |
| Video share | Video 9:16 berisi animasi buka halaman beserta suaranya | `ShareVideo` |
| Page-curl | Animasi halaman melengkung saat dibuka | `PageCurl` |
| Follow | Hubungan pengikut; butuh persetujuan karena akun privat secara default | `Follow` |
| Event | Catatan metrik dasar, termasuk ketukan kamera terkunci | `Event` |

## 3. Aturan penamaan (K-014)

- Teks UI dan dokumen: istilah Indonesia di kolom "Istilah".
- Dart dan JSON di `data/`: bahasa Inggris, `camelCase` untuk field, `PascalCase` untuk kelas.
- Postgres (Supabase): bahasa Inggris, `snake_case` (`birth_year`, `city_id`).
- Nilai enum: bahasa Inggris huruf kecil (`divider`, `pending`).
- Trello: nama kartu memakai istilah Indonesia dari tabel ini.

## 4. Pemetaan field entitas (spesifikasi §5 → kode)

Nama di spesifikasi §5 tetap sah sebagai deskripsi. Kode dan JSON memakai kolom "Kode".

| Entitas | Spesifikasi §5 | Kode (Dart/JSON) | Postgres |
|---|---|---|---|
| `User` | id, username, tahun_lahir, visibilitas | `id`, `username`, `birthYear`, `visibility` | `id`, `username`, `birth_year`, `visibility` |
| `City` | id, nama, provinsi, warna_aksen, stempel, sudah_dikurasi | `id`, `name`, `province`, `accentColor`, `stampAsset`, `isCurated` | `id`, `name`, `province`, `accent_color`, `stamp_asset`, `is_curated` |
| `Landmark` | id, city_id, nama, kategori, lat, lng, radius_m, fakta, siluet | `id`, `cityId`, `name`, `category`, `lat`, `lng`, `radiusM`, `facts`, `silhouetteAsset` | `id`, `city_id`, `name`, `category`, `lat`, `lng`, `radius_m`, `facts`, `silhouette_asset` |
| `Finding` | id, user_id, city_id, landmark_id?, kategori, camera_id, cutout_url, thumb_url, path_foto_asli_lokal, catatan, dibuat_pada | `id`, `userId`, `cityId`, `landmarkId?`, `category`, `cameraId`, `cutoutUrl`, `thumbUrl`, `localOriginalPath`, `note`, `createdAt` | sama dalam `snake_case`; `local_original_path` lihat Q-003 |
| `Book` | id, user_id, tema_id, sampul | `id`, `userId`, `themeId`, `cover` | `id`, `user_id`, `theme_id`, `cover` |
| `Chapter` | id, book_id, city_id, urutan | `id`, `bookId`, `cityId`, `order` | `id`, `book_id`, `city_id`, `sort_order` |
| `Page` | id, chapter_id, jenis (pembatas/landmark/bebas), template_id, urutan | `id`, `chapterId`, `kind` (`divider`/`landmark`/`free`), `templateId`, `order` | `id`, `chapter_id`, `kind`, `template_id`, `sort_order` |
| `Placement` | finding_id, page_id, x, y, skala, rotasi, z, diatur_manual | `findingId`, `pageId`, `x`, `y`, `scale`, `rotation`, `z`, `isManuallyArranged` | `finding_id`, `page_id`, `x`, `y`, `scale`, `rotation`, `z`, `is_manually_arranged` |
| `Camera` | id, nama, lut, overlay, suara, sku?, gratis, terkunci | `id`, `name`, `lut`, `overlay`, `shutterSound`, `sku?`, `isFree`, `isLocked` | `id`, `name`, `lut`, `overlay`, `shutter_sound`, `sku`, `is_free`, `is_locked` |
| `Entitlement` | user_id, item_id, sumber | `userId`, `itemId`, `source` | `user_id`, `item_id`, `source` |
| `Follow` | follower_id, followee_id, status (menunggu/disetujui) | `followerId`, `followeeId`, `status` (`pending`/`approved`) | `follower_id`, `followee_id`, `status` |
| `Mission`, `MissionProgress`, `Badge`, `UserBadge`, `Report`, `Block`, `Event` | belum dirinci | ditetapkan saat skemanya dibuat | ditetapkan saat skemanya dibuat |

Catatan: `order` adalah kata kunci SQL, jadi di Postgres ditulis `sort_order`.

## 5. Sinonim yang dihindari

Pakai istilah di kiri, jangan yang di kanan. `node scripts/cek-hq.mjs` memberi peringatan bila sinonim ini muncul di dokumen yang bukan snapshot.

| Pakai | Hindari |
|---|---|
| Temuan | item koleksi, capture |
| Landmark | spot, POI, titik ikonik |
| Buku | album, jurnal |
| Bab | seksi kota, folder kota |
| Misi | quest, challenge, tantangan |
| Lencana | achievement, trofi |
| Kamera / skin | preset kamera |
