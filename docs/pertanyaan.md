# Pertanyaan terbuka

> Celah atau konflik yang menunggu keputusan pemilik. Sub-agen **tidak** memutuskan sendiri; mereka menambah baris di sini dan melaporkannya.
> Begitu terjawab: catat sebagai keputusan baru (`/catat-keputusan`), lalu pindahkan baris ke tabel "Terjawab" dengan nomor K-nya. Baris tidak dihapus.
> Terakhir diverifikasi: 16 Nov 2026.

## Terbuka

| ID | Pertanyaan | Kenapa penting | Terkait |
|---|---|---|---|
| Q-001 | PP Tunas kemungkinan mendefinisikan "anak" sebagai di bawah 18 tahun. Bila benar, pengguna 16–17 tetap anak dan larangan pelacakan lokasi serta profiling tetap berlaku untuk mereka. Apakah batas 16+ tetap cukup, dan apa kewajiban untuk 16–17? **Perlu dicek ke teks asli PP 17/2025**, bukan dari artikel berita | Dasar K-001 ("16+ paling aman") bisa tidak berlaku sepenuhnya | K-001, K-011, `docs/kepatuhan/privasi-dan-regulasi.md` |
| Q-002 | Apakah gerbang usia "tahun lahir" (deklarasi mandiri, spesifikasi §4.1) sudah dihitung sebagai "verifikasi usia" menurut PP Tunas? | Bisa menambah langkah di onboarding | K-001 |
| Q-003 | `Finding.path_foto_asli_lokal` hanya disimpan di SQLite perangkat, atau ikut tersinkron ke Supabase? | Bila tersinkron: path perangkat tidak berguna di perangkat lain dan membocorkan struktur folder | K-010, spesifikasi §4.9 |
| Q-004 | Taksonomi kategori final, dan pemetaan label ML Kit Image Labeling (generik, berbahasa Inggris) ke kategori. "Papan nama" kemungkinan tidak ada sebagai label bawaan | Misi mingguan dan lencana koleksi bergantung pada kategori | K-009, spesifikasi §4.3, §4.6 |
| Q-005 | Kota MVP yang dikurasi (20–30 landmark, bisa disurvei langsung)? | Isi `data/cities.json`, survei landmark | K-002, spesifikasi §4.4 |
| Q-006 | Nama aplikasi (sekarang nama kode "potret") | Branding, bundle ID, nama di toko | spesifikasi header |
| Q-007 | Palet dan tipografi. Token di `data/design-tokens.json` masih placeholder | Semua desain visual dan acuan | spesifikasi §2 |
| Q-008 | Sumber dan lisensi suara buka halaman dan suara shutter | Suara ikut di video share yang diunggah ke media sosial | spesifikasi §4.2, §4.8 |
| Q-009 | RevenueCat atau `in_app_purchase` (untuk nanti, saat toko dibuka) | Skema `Entitlement` dan `sku` | K-007, spesifikasi §6 |
| Q-010 | `User.tahun_lahir` disimpan apa adanya, atau cukup penanda "lolos 16+"? | Minimisasi data (UU PDP) | K-001, K-011 |
| Q-011 | Perangkat acuan Android kelas menengah dan target performa page-curl (fps, waktu muat halaman) | Kriteria "selesai" prototipe K-012 tidak bisa diukur tanpa angka ini | K-012, risiko #1 |
| Q-012 | Setelah HQ digabung dengan kode (K-013), apakah repo `potret-hq` diganti nama (misalnya `potret`)? | Nama clone, URL, sesi cloud | K-013 |
| Q-013 | State management dan struktur folder Flutter (usulan ada di `docs/teknis/arsitektur.md`) | Agen `arsitek-flutter` butuh kepastian sebelum `app/` dibuat | K-003 |
| Q-014 | Arti angka di stempel kota "Bandung 23/100": target tetap per kota, jumlah landmark + slot temuan, atau hal lain? | Kartu share, halaman pembatas, dan lencana kelengkapan memakai angka yang sama | spesifikasi §4.8, `docs/desain/acuan/kartu-share.md` |

## Terjawab

| ID | Pertanyaan | Jawaban | Keputusan |
|---|---|---|---|
| – | – | – | – |
