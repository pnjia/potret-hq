# Glosarium

> Sumber tunggal istilah proyek potret. Dipakai di dokumen, kode, Trello, dan semua sub-agen.
> Asal: §3 `spesifikasi-sistem-v1.md` (dipindah utuh). Aturan penamaan identifier: K-014.
> Terakhir diverifikasi: 23 Nov 2026 (nilai motif selotip, kertas latar, dan set hiasan K-043; istilah kartu share K-032, etalase, paket tema, dan Pas Kolektor K-034, kolom editor K-037, julukan K-038 ditambah; pemetaan field disesuaikan dengan K-017 s/d K-020, K-024, K-028, K-034).

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
| Kategori | Label otomatis sebuah temuan. Sembilan id beserta pemetaan label ML Kit ada di `data/categories.json` (K-020) | `category` |
| Cutout | Gambar hasil hapus latar (WebP terkompresi) | `cutoutUrl` |
| Masker | Peta piksel yang menentukan bagian mana yang ikut cutout; dirapikan dengan kuas manual | `mask` |
| Kuas manual | Alat merapikan masker | `MaskBrush` |
| Halaman pembatas | Halaman pertama bab: stempel kota + progres landmark | `Page.kind = divider` |
| Halaman landmark | Halaman berisi slot landmark kota (yang belum ditemukan tampil siluet "???") | `Page.kind = landmark` |
| Halaman temuan bebas | Halaman berisi temuan bebas | `Page.kind = free` |
| Siluet | Gambar landmark yang belum ditemukan | `silhouetteAsset` |
| Stempel kota | Grafis kota di halaman pembatas dan kartu share. "Bandung 23/100" = jumlah temuan di kota / target temuan kota (K-028) | `stampAsset` |
| Target temuan kota | Angka kedua di stempel kota, default 100 | `City.findingTarget` |
| Sampul | Template + nama + stiker dari cutout milik pengguna | `Book.cover` |
| Kepemilikan | Hak pakai item berbayar (kamera, tema) yang terikat ke akun | `Entitlement` |
| Kamera terkunci | Skin "segera hadir"; ketukannya dicatat sebagai ukuran minat | `Camera.isLocked` |
| Kartu share | Gambar 9:16 untuk media sosial | `ShareCard` |
| Video share | Video 9:16 berisi animasi buka halaman beserta suaranya | `ShareVideo` |
| Page-curl | Animasi halaman melengkung saat dibuka | `PageCurl` |
| Follow | Hubungan pengikut; butuh persetujuan karena akun privat secara default | `Follow` |
| Event | Catatan metrik dasar, termasuk ketukan kamera terkunci. Dicatat agregat, tanpa id pengguna (K-017) | `Event` |
| Verifikasi usia | Bukti pengguna 18+: metode (`self_declared`/`platform_signal`) dan waktu (K-017, K-018) | `ageVerificationMethod`, `ageVerifiedAt` |
| Catatan lisensi suara | Sumber dan lisensi setiap file suara (K-024) | `data/sounds.json` |
| Etalase kamera | Layar memilih kamera; di MVP berisi kamera gratis dan kamera terkunci (K-034) | `CameraShelf` |
| Kamera tampil | Kamera ditampilkan di etalase; `false` untuk kamera toko yang belum tampil di MVP (K-034) | `Camera.isListed` |
| Coba dulu | Memakai bodi dan efek kamera atau paket tema berbayar sebelum membeli, tanpa menyimpan hasil (K-034) | `tryOn` |
| Paket tema | Item berbayar berisi template sampul, hiasan, motif selotip, dan kertas latar (K-034) | `ThemePack` |
| Pas Kolektor | Item berbayar sekali bayar yang membuka semua kamera dan paket tema, termasuk yang terbit nanti (K-034) | `CollectorPass` |
| Gaya kartu share | Satu dari 10 gaya kartu share; MVP: `bookPage`, `pageFlipVideo`, `sticker`, `singleFinding` (K-032) | `ShareCard.style` |
| Varian warna kartu | Warna kartu share: Kobalt, Tinta, Lime, Kertas, Kategori (K-032) | `ShareCard.colorway` |
| Format kartu | `story` (9:16), `video` (9:16), `sticker` (PNG transparan); `feed` (3:4) sesudah MVP (K-032) | `ShareCard.format` |
| Julukan label | Julukan kartu Label Pemburu per kategori, dipilih pengguna (K-033, K-038) | `Category.shareLabel` |
| Baki "Belum ditempel" | Tempat temuan yang dilepas dari halaman; tidak ditempel ulang otomatis (K-037) | temuan tanpa `Placement` |
| Tepi stiker | Gaya tepi cutout, satu sistem di Rapikan dan editor halaman (K-031, K-037) | `Finding.edgeStyle` (`none`/`dieCut`/`snipped`/`pinking`/`torn`), `Finding.edgeWidth` (`s`/`m`/`l`) |
| Selotip | Posisi dan motif selotip penempatan (K-037). Motif: Polos, Garis, Grid, Raster, Karcis, Teks (K-043, `data/decorations.json`) | `Placement.tapePosition`, `Placement.tapePattern` (`plain`/`striped`/`grid`/`halftone`/`ticket`/`text`) |
| Tinta keterangan | Warna keterangan penempatan (K-031, K-037) | `Placement.noteInk` (`ink`/`cobalt`/`sepia`/`stampRed`/`magenta`/`green`) |
| Kertas latar dan gaya halaman | Kertas dan preset gaya halaman (K-031, K-037) | `Page.paperStyle` (`plain`/`lined`/`dotted`/`grid`), `Page.stylePresetId` |
| Hiasan dan set hiasan | Stiker hiasan buatan sendiri untuk sampul, dipilih per set; posisinya diatur template (K-031, K-043, `data/decorations.json`) | `Book.cover.decorationSetId` (`ticket`/`post`/`scribble`); id hiasan di `ornaments[].id` |

## 3. Aturan penamaan (K-014)

- Teks UI dan dokumen: istilah Indonesia di kolom "Istilah".
- Dart dan JSON di `data/`: bahasa Inggris, `camelCase` untuk field, `PascalCase` untuk kelas.
- Postgres (Supabase): bahasa Inggris, `snake_case` (`age_verified_at`, `city_id`).
- Nilai enum: bahasa Inggris huruf kecil (`divider`, `pending`).
- Repositori data: `<Entitas>Repository` per entitas di tabel ini (`FindingRepository`, `BookRepository`), di `app/lib/data/` (K-027).
- Trello: nama kartu memakai istilah Indonesia dari tabel ini.

## 4. Pemetaan field entitas (spesifikasi §5 → kode)

Nama di spesifikasi §5 tetap sah sebagai deskripsi. Kode dan JSON memakai kolom "Kode".

| Entitas | Spesifikasi §5 | Kode (Dart/JSON) | Postgres |
|---|---|---|---|
| `User` | id, username, tahun_lahir, visibilitas | `id`, `username`, `ageVerificationMethod`, `ageVerifiedAt`, `visibility` (tahun lahir tidak disimpan, K-018) | `id`, `username`, `age_verification_method`, `age_verified_at`, `visibility` |
| `City` | id, nama, provinsi, warna_aksen, stempel, sudah_dikurasi | `id`, `name`, `province`, `accentColor`, `stampAsset`, `findingTarget` (K-028), `isCurated` | `id`, `name`, `province`, `accent_color`, `stamp_asset`, `finding_target`, `is_curated` |
| `Landmark` | id, city_id, nama, kategori, lat, lng, radius_m, fakta, siluet | `id`, `cityId`, `name`, `category`, `lat`, `lng`, `radiusM`, `facts`, `silhouetteAsset` | `id`, `city_id`, `name`, `category`, `lat`, `lng`, `radius_m`, `facts`, `silhouette_asset` |
| `Finding` | id, user_id, city_id, landmark_id?, kategori, camera_id, cutout_url, thumb_url, path_foto_asli_lokal, catatan, dibuat_pada | `id`, `userId`, `cityId`, `landmarkId?`, `category`, `cameraId`, `cutoutUrl`, `thumbUrl`, `localOriginalPath`, `note`, `createdAt`, `edgeStyle`, `edgeWidth` (K-037) | sama dalam `snake_case`, **tanpa** `local_original_path` (hanya di drift, K-019) |
| `Book` | id, user_id, tema_id, sampul | `id`, `userId`, `themeId`, `cover` (`templateId`, `title` ≤ 24, `findingIds` 1–3, `decorationSetId`; K-037) | `id`, `user_id`, `theme_id`, `cover` (jsonb) |
| `Chapter` | id, book_id, city_id, urutan | `id`, `bookId`, `cityId`, `order` | `id`, `book_id`, `city_id`, `sort_order` |
| `Page` | id, chapter_id, jenis (pembatas/landmark/bebas), template_id, urutan | `id`, `chapterId`, `kind` (`divider`/`landmark`/`free`), `templateId`, `order`, `paperStyle`, `stylePresetId` (K-037) | `id`, `chapter_id`, `kind`, `template_id`, `sort_order`, `paper_style`, `style_preset_id` |
| `Placement` | finding_id, page_id, x, y, skala, rotasi, z, diatur_manual | `findingId`, `pageId`, `x`, `y`, `scale`, `rotation`, `z`, `isManuallyArranged`, `tapePosition`, `tapePattern`, `noteInk`, `hasFrame` (K-037) | `finding_id`, `page_id`, `x`, `y`, `scale`, `rotation`, `z`, `is_manually_arranged`, `tape_position`, `tape_pattern`, `note_ink`, `has_frame` |
| `Camera` | id, nama, lut, overlay, suara, sku?, gratis, terkunci | `id`, `name`, `lut`, `overlay`, `shutterSound`, `sku?`, `isFree`, `isLocked`, `isListed` (K-034) | `id`, `name`, `lut`, `overlay`, `shutter_sound`, `sku`, `is_free`, `is_locked`, `is_listed` |
| `Entitlement` | user_id, item_id, sumber | `userId`, `itemId`, `source` | `user_id`, `item_id`, `source` |
| `Follow` | follower_id, followee_id, status (menunggu/disetujui) | `followerId`, `followeeId`, `status` (`pending`/`approved`) | `follower_id`, `followee_id`, `status` |
| `Mission`, `MissionProgress`, `Badge`, `UserBadge`, `Report`, `Block`, `Event` | belum dirinci | ditetapkan saat skemanya dibuat; `Event` tanpa `userId` (K-017) | ditetapkan saat skemanya dibuat |

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
