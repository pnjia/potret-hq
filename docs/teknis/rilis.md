# Checklist rilis pribadi

> Daftar ingat sebelum mengunggah build ke App Store atau Google Play. Bukan syarat persetujuan; centang sendiri.
> Sumber tiap butir ada di kolom kanan. Cek ulang aturan toko dan regulasi sebelum rilis pertama.
> Terakhir diverifikasi: 17 Nov 2026 (K-017, K-023, K-024).

| | Butir | Sumber |
|---|---|---|
| [ ] | Hapus akun bisa dilakukan dari dalam aplikasi dan benar-benar menghapus data dan objek Storage | K-006, spesifikasi §4.1 |
| [ ] | Sign in with Apple tersedia di iOS | K-006 |
| [ ] | Info batas usia 18+ tampil (pop-up, bahasa sederhana) sebelum pendaftaran | K-017; PP 17/2025 Ps. 11 |
| [ ] | Verifikasi usia berlapis jalan: deklarasi bulan-tahun lahir + sinyal usia platform bila tersedia + jalur keberatan | K-017; PP Ps. 22 |
| [ ] | Bulan-tahun lahir tidak tersimpan di mana pun; hanya `age_verification_method` dan `age_verified_at` | K-018 |
| [ ] | Pengaturan baku setara perlindungan anak untuk semua: akun privat, tanpa geolokasi tepat, `Event` tanpa id pengguna, tanpa dark pattern | K-017; PP Ps. 17–19, 22(4) |
| [ ] | Penilaian mandiri tingkat risiko selesai dan dilaporkan ke Komdigi | K-017; Permenkomdigi 9/2026 Ps. 4–5 |
| [ ] | Penilaian dampak pelindungan data pribadi ditulis | K-017; UU PDP Ps. 34 |
| [ ] | Konsultasi hukum atas kepatuhan PP Tunas dan UU PDP | K-017 |
| [ ] | Lapor dan blokir berfungsi; cara meninjau laporan di dashboard Supabase diketahui | K-008, spesifikasi §4.7 |
| [ ] | Gambar yang dibagikan bebas EXIF/GPS (dicek dengan alat pembaca EXIF) | K-011 |
| [ ] | Tidak ada koordinat di database, log, atau `Event` | K-011 |
| [ ] | Kebijakan privasi terbit dan tertaut di toko serta di aplikasi | spesifikasi §7 |
| [ ] | Model ML Kit diunduh di onboarding; alur offline pertama kali tidak macet | K-010 |
| [ ] | Minimum iOS 17 di konfigurasi build | K-003 |
| [ ] | Nama "Kliping Kota" sudah dicek di PDKI, domain, dan akun media sosial | K-023 |
| [ ] | Setiap file suara tercatat di `data/sounds.json` dengan lisensi yang diizinkan | K-024 |
| [ ] | Page-curl lolos target 30 fps di Infinix Hot 11 Play pada build rilis | K-016 |
| [ ] | Kamera terkunci tercatat sebagai `Event` agregat per kamera | K-007, K-017 |
| [ ] | Teks deklarasi data (App Privacy / Data safety) sesuai data yang benar-benar dikumpulkan | `docs/kepatuhan/privasi-dan-regulasi.md` |
