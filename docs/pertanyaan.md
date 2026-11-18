# Pertanyaan terbuka

> Celah atau konflik yang menunggu keputusan pemilik. Sub-agen **tidak** memutuskan sendiri; mereka menambah baris di sini dan melaporkannya.
> Begitu terjawab: catat sebagai keputusan baru (`/catat-keputusan`), lalu pindahkan baris ke tabel "Terjawab" dengan nomor K-nya. Baris tidak dihapus.
> Terakhir diverifikasi: 17 Nov 2026. Q-001 s/d Q-014 dijawab 17 Nov 2026 (Q-011 oleh pemilik; sisanya diputuskan atas wewenang yang diberikan pemilik).

## Terbuka

| ID | Pertanyaan | Kenapa penting | Terkait |
|---|---|---|---|
| Q-015 | Bundle ID final (Android applicationId dan iOS bundle identifier)? | Permanen begitu terbit di Play/App Store; prototipe memakai placeholder id.potret.prototype | K-023 |
| Q-017 | Arah visual mockup v3 "Kota yang hangat" untuk UI di luar buku: tinta Kopi `#2B1D16`/`#6E5A4E` di latar putih, suasana hero Daun `#C9D6B0` + peach `#F4BE9C`, satu aksen Jeruk `#E8601C` (teks kecil `#C94E10`), warna kota dari data untuk stempel dan share (Sukabumi `#D81B5C`), judul Bricolage Grotesque tebal, teks UI Plus Jakarta Sans, tombol kapsul; isi halaman buku tetap kertas + Fraunces + Caveat. Ditetapkan sebagai K- baru yang menggantikan sebagian K-021 dan `docs/desain/arah-visual.md`? | Pemilik menolak gaya v1 dan v2 karena terasa "AI slop", lalu memberi screenshot referensi (18 Nov 2026). v3 disusun dari riset `docs/riset/2026-11-18-desain-ui-anti-ai-slop.md`, mockup di https://claude.ai/artifact/Acc38ZrS9c64zx1VbA3MzE. K-021 mengunci palet, tipografi, dan radius 6/8, jadi kode dan `data/design-tokens.json` belum boleh ikut sebelum diputuskan | K-021, K-017 |

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
