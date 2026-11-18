# Riset

> Snapshot bertanggal dan bersumber. Isinya **tidak diedit** setelah ditulis. Bila sudah usang, buat riset baru bertanggal dan sebut file lama yang digantikan.
> Template: `templates/riset.md`. Perintah: `/catat-riset`. Agen: `peneliti`.

## Aturan

- Nama file: `YYYY-MM-DD-<topik-kebab>.md`.
- Baris kepala wajib: tanggal riset, bagian yang mudah berubah ("cek ulang sebelum dipakai"), dan keputusan yang memakainya.
- Setiap fakta punya sumber (URL). Tafsiran dipisah dari fakta.

## Daftar

| File | Isi | Dipakai oleh | Cek ulang |
|---|---|---|---|
| [`2026-11-16-riset-awal.md`](2026-11-16-riset-awal.md) | Pesaing (Loot, Museeum, kokososo), patokan harga kamera, `native_cutout`, FFmpegKit, PP Tunas, selera visual Gen Z/Alpha | K-001 (digantikan K-017), K-003, K-010, spesifikasi v1 | Regulasi, harga, status paket |
| [`2026-11-17-usia-pp-tunas-uu-pdp.md`](2026-11-17-usia-pp-tunas-uu-pdp.md) | Teks asli PP 17/2025, Permenkomdigi 9/2026, Kepmenkomdigi 140 dan 142/2026, UU PDP: definisi Anak, persetujuan orang tua, verifikasi usia, geolokasi, pemrofilan, tiga opsi batas usia. Menggantikan bagian "Regulasi" di riset 16 Nov | K-017, K-018 (menjawab Q-001, Q-002, Q-010) | Kepmen turunan, RUU perubahan UU PDP, API usia Apple/Google |
| [`2026-11-17-label-mlkit-kategori.md`](2026-11-17-label-mlkit-kategori.md) | Label map model dasar ML Kit Image Labeling (430 label, ambang bawaan 0,5), tidak ada label teks/papan nama, Text Recognition v2 sebagai alternatif, usulan taksonomi 10 kategori dengan pemetaan label (tafsiran) | K-020 (menjawab Q-004), `data/categories.json` | Versi paket, isi label map, ambang bawaan |
| [`2026-11-17-perangkat-dan-stack.md`](2026-11-17-perangkat-dan-stack.md) | Spesifikasi Infinix Hot 11 Play, Flutter 3.50 + Impeller di Android (fallback OpenGLES, MediaTek/PowerVR), fragment shader, Riverpod vs flutter_bloc vs panduan resmi, RevenueCat vs `in_app_purchase`, cek ulang `native_cutout` | K-016, K-025, K-027 (menjawab Q-011, Q-009, Q-013) | Versi Flutter dan denylist Vulkan, versi paket pub.dev, harga RevenueCat |
| [`2026-11-17-nama-suara-zona-aman.md`](2026-11-17-nama-suara-zona-aman.md) | Kandidat nama aplikasi di App Store dan Google Play (bentrok "Kliping", "Jepret"), lisensi suara (Freesound CC0/CC BY, Pixabay, rekam sendiri), zona aman 9:16 Meta (14/35/6%) dan TikTok (template, angka terukur pihak ketiga) | K-023, K-024 (menjawab Q-006, Q-008), zona aman di acuan kartu share | Daftar aplikasi di toko, status merek PDKI (belum dicek), Syarat Pixabay, angka zona aman |
| [`2026-11-17-kota-mvp-sukabumi.md`](2026-11-17-kota-mvp-sukabumi.md) | Jarak Sukabumi–Bandung, cagar budaya dan bangunan bersejarah Kota Sukabumi | K-029 | Daftar resmi cagar budaya, kondisi bangunan |
| [`2026-11-18-desain-ui-anti-ai-slop.md`](2026-11-18-desain-ui-anti-ai-slop.md) | Penyebab desain AI generik dan prompt "frontend aesthetics"/skill `frontend-design` Anthropic, analisis screenshot referensi pemilik (aplikasi meditasi), pola kartu share (stiker transparan Strava, warna dari data Spotify Wrapped) | Q-017, mockup v3 | Isi skill/cookbook Anthropic, fitur share Strava dan Instagram |
| [`2026-11-18-kritik-v3-dan-rencana-uji.md`](2026-11-18-kritik-v3-dan-rencana-uji.md) | Kritik heuristik mockup v3 (Nielsen, hukum UX, 10 temuan berkeparahan) dan rencana uji pengguna Gen Z 18+ (uji 5 detik, uji tugas, preferensi v3/v4) | Q-017, mockup v4 | Semua temuan kritik masih dugaan sampai diuji |
| [`2026-11-18-acuan-aplikasi-berkarakter.md`](2026-11-18-acuan-aplikasi-berkarakter.md) | Teknik khas aplikasi nyata: momen stiker CapWords (ADA 2025), efek stiker iOS, Decor Pikmin dan Vivillon, Duolingo (bentuk, streak, Year in Review), Letterboxd Four Favourites, Spotify Wrapped 2025 "analog", Material 3 Expressive, Gojek dan Plus Jakarta Sans, huruf vernakular; 10 teknik untuk Kliping Kota (tafsiran) | Q-017 | Angka tren Canva, penghargaan, efek stiker iOS, fitur Pokémon GO/Pikmin, Wrapped dan Letterboxd tiap tahun |
| [`2026-11-18-audit-aksesibilitas-v4.md`](2026-11-18-audit-aksesibilitas-v4.md) | Audit WCAG 2.2 AA mockup v4 (axe-core + pemeriksaan manual): 28 temuan, simulasi buta warna, skala teks 200 %, ukuran target; 12 aturan aksesibilitas untuk sistem desain v5 | Q-017, mockup v5 | Versi axe-core dan WCAG |
| [`2026-11-18-stiker-hiasan-lisensi.md`](2026-11-18-stiker-hiasan-lisensi.md) | Lisensi sumber stiker hiasan: CC0 museum (Smithsonian, Met, Rijksmuseum, Nationaal Archief), Kenney, Openverse/Commons sebagai alat cari, pustaka emoji/ilustrasi (OpenMoji, Twemoji, Noto, Fluent, Streamline, unDraw, Humaaans, Open Peeps), efemera Indonesia/Hindia Belanda, UU 28/2014 (masa perlindungan, hak moral Ps. 57), Permenkominfo 21/2012 (hak cipta prangko), usulan catatan aset | Belum (logika K-024, Q-017) | Syarat lisensi tiap situs, teks resmi UU, status merek PDKI |
| [`2026-11-18-ux-potong-latar-dan-gunting.md`](2026-11-18-ux-potong-latar-dan-gunting.md) | Alat merapikan potongan (Photoroom, remove.bg, Canva, Adobe, Picsart, Shuffles, Instagram, Snapchat, Apple VisionKit), laso poligon/magnetik di sentuh (Procreate, Affinity), gaya tepi (die-cut, guntingan RDP, zigzag, sobek) dan kelayakannya di Flutter, alternatif WCAG 2.5.7; usulan alur "Rapikan potongan" (tafsiran) | Belum (mockup v5) | Menu dan fitur aplikasi, API dart:ui, paket pub.dev, opsi ML Kit |
