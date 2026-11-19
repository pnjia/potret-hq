# Pertanyaan terbuka

> Celah atau konflik yang menunggu keputusan pemilik. Sub-agen **tidak** memutuskan sendiri; mereka menambah baris di sini dan melaporkannya.
> Begitu terjawab: catat sebagai keputusan baru (`/catat-keputusan`), lalu pindahkan baris ke tabel "Terjawab" dengan nomor K-nya. Baris tidak dihapus.
> Terakhir diverifikasi: 17 Nov 2026. Q-001 s/d Q-014 dijawab 17 Nov 2026 (Q-011 oleh pemilik; sisanya diputuskan atas wewenang yang diberikan pemilik).

## Terbuka

| ID | Pertanyaan | Kenapa penting | Terkait |
|---|---|---|---|
| Q-015 | Bundle ID final (Android applicationId dan iOS bundle identifier)? | Permanen begitu terbit di Play/App Store; prototipe memakai placeholder id.potret.prototype | K-023 |

## Terjawab

| ID | Pertanyaan | Jawaban | Keputusan |
|---|---|---|---|
| Q-001 | PP Tunas kemungkinan mendefinisikan "anak" sebagai di bawah 18 tahun. Bila benar, pengguna 16–17 tetap anak dan larangan pelacakan lokasi serta profiling tetap berlaku untuk mereka. Apakah batas 16+ tetap cukup, dan apa kewajiban untuk 16–17? **Perlu dicek ke teks asli PP 17/2025**, bukan dari artikel berita | Ya, 16–17 tetap anak (PP 17/2025 Ps. 1 angka 1). Batas dinaikkan ke 18+ dengan perlindungan privasi tingkat anak untuk semua | K-017 |
| Q-002 | Apakah gerbang usia "tahun lahir" (deklarasi mandiri, spesifikasi §4.1) sudah dihitung sebagai "verifikasi usia" menurut PP Tunas? | Tidak cukup sendirian. Verifikasi berlapis: deklarasi + sinyal usia platform + jalur keberatan, plus jaring pengaman PP Ps. 22(4) | K-017 |
| Q-003 | `Finding.path_foto_asli_lokal` hanya disimpan di SQLite perangkat, atau ikut tersinkron ke Supabase? | Hanya di perangkat (drift), tidak tersinkron | K-019 |
| Q-004 | Taksonomi kategori final, dan pemetaan label ML Kit Image Labeling (generik, berbahasa Inggris) ke kategori. "Papan nama" kemungkinan tidak ada sebagai label bawaan | 9 kategori, 174 label ML Kit, aturan pemilihan di `data/categories.json` | K-020 |
| Q-005 | Kota MVP yang dikurasi (20–30 landmark, bisa disurvei langsung)? | Bandung (K-022), lalu diganti Kota Sukabumi karena pemilik berdomisili di sana (K-029) | K-022, K-029 |
| Q-006 | Nama aplikasi (sekarang nama kode "potret") | Kliping Kota (nama kode tetap potret); cek PDKI sebelum mendaftar | K-023 |
| Q-007 | Palet dan tipografi. Token di `data/design-tokens.json` masih placeholder | Palet kertas + aksen merah muda/biru; Fraunces, Plus Jakarta Sans, Caveat | K-021 |
| Q-008 | Sumber dan lisensi suara buka halaman dan suara shutter | Rekam sendiri; cadangan CC0/Pixabay; tercatat di `data/sounds.json` | K-024 |
| Q-009 | RevenueCat atau `in_app_purchase` (untuk nanti, saat toko dibuka) | RevenueCat, App User ID = UUID Supabase, webhook ke Edge Function | K-025 |
| Q-010 | `User.tahun_lahir` disimpan apa adanya, atau cukup penanda "lolos 16+"? | Simpan metode dan waktu verifikasi saja; tahun lahir dibuang | K-018 |
| Q-011 | Perangkat acuan Android kelas menengah dan target performa page-curl (fps, waktu muat halaman) | Infinix Hot 11 Play, konsisten 30 fps (jawaban pemilik) | K-016 |
| Q-012 | Setelah HQ digabung dengan kode (K-013), apakah repo `potret-hq` diganti nama (misalnya `potret`)? | Tetap `potret-hq`; ditinjau saat rilis toko pertama | K-026 |
| Q-013 | State management dan struktur folder Flutter (usulan ada di `docs/teknis/arsitektur.md`) | Riverpod 3 tanpa generator; struktur per fitur | K-027 |
| Q-014 | Arti angka di stempel kota "Bandung 23/100": target tetap per kota, jumlah landmark + slot temuan, atau hal lain? | Jumlah temuan di kota / target temuan kota (default 100) | K-028 |
| Q-016 | Suara yang disintesis sendiri (skrip, tanpa bahan pihak ketiga) boleh dipakai dan dicatat di `data/sounds.json`? | Ya. `source` = `synth`, `license` = `own`; rekaman foley tetap diutamakan dan placeholder diganti sebelum rilis | K-030 |
| Q-022 | Opsi editor v5 hasil riset 18 Nov: mana yang masuk MVP, dan gaya tepi bawaan apa? | Semua opsi masuk MVP (8 template sampul + set hiasan, tepi stiker, 6 tinta, motif selotip, kertas latar, gaya halaman, Acak, Hapus temuan, Rapikan 3 mode + 5 gaya tepi); tepi bawaan Die-cut putih | K-031 |
| Q-023 | Gaya kartu share mana yang masuk MVP, dan format apa saja? | MVP: gaya 1–4 (Halaman Kliping, Video, Stiker Temuan, Temuan Tunggal), format 9:16 + Video + Stiker, chip warna + Acak, tujuan WhatsApp/IG Stories/TikTok/Simpan/Lainnya. Gaya 5–8 dan Feed 3:4 sesudah MVP; gaya 9–10 dan carousel nanti | K-032 |
| Q-024 | Label Pemburu otomatis termasuk pemrofilan? Syarat Tambah Punyamu, Cuci Cetak, dan semua kartu share? | Label Pemburu hanya varian dipilih pengguna; Tambah Punyamu dan Cuci Cetak boleh dengan syarat; semua kartu tanpa username dan jam, metadata dihapus per format, kalimat privasi diperjelas | K-033 |
| Q-025 | Toko di MVP? Struktur jual, harga, dan katalog kamera? | Toko di luar MVP (K-007 tetap), halaman disiapkan; kamera satuan Rp29/39rb, paket tema Rp19rb, Pas Kolektor Rp149rb (harga rencana); 9 kamera (4 gratis, 5 berbayar); cetak buku fisik nanti | K-034 |
| Q-017 | Arah visual v5 "Karcis & Kliping" ditetapkan? | Ya; uji 5 pengguna sebelum rilis sebagai pemeriksaan, bukan gerbang | K-035 |
| Q-018 | Nama landmark atau progres landmark di kartu share? | Tidak; lokasi hanya nama kota, judul dari keterangan pengguna | K-036 |
| Q-019 | Warna 4 kategori yang belum berwarna? | Minuman `#5ED1E0`, Hewan `#C7A6FF`, Barang `#E0C39A`, Lainnya `#D6D6DC`; teks Tinta, label ikon + teks bergaris | K-035 |
| Q-020 | Batas atur manual dan kolom baru `Placement`? | Putar ±15° (2°/ketuk), ukuran 60–150%, geser 4 dp, urungkan 20 langkah; `tapePosition`, `tapePattern`, `noteInk`, `hasFrame`; tepi di `Finding.edgeStyle`; temuan lepas masuk baki "Belum ditempel" | K-037 |
| Q-021 | Isi `Book.cover`? | `templateId`, `title` ≤ 24 karakter, `findingIds` 1–3, `decorationSetId` | K-037 |
| Q-026 | Potongan Pas Kolektor bagi pembeli satuan? | Tidak; satu harga, nilai yang belum dimiliki ditulis terang; ditinjau setelah toko dibuka | K-038 |
| Q-027 | Julukan Label Pemburu per kategori? | 9 julukan netral di `data/categories.json`; angka milik sendiri boleh, tanpa perbandingan | K-038 |
