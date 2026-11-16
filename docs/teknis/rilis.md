# Checklist rilis pribadi

> Daftar ingat sebelum mengunggah build ke App Store atau Google Play. Bukan syarat persetujuan; centang sendiri.
> Sumber tiap butir ada di kolom kanan. Cek ulang aturan toko dan regulasi sebelum rilis pertama.
> Terakhir diverifikasi: 16 Nov 2026.

| | Butir | Sumber |
|---|---|---|
| [ ] | Hapus akun bisa dilakukan dari dalam aplikasi dan benar-benar menghapus data dan objek Storage | K-006, spesifikasi §4.1 |
| [ ] | Sign in with Apple tersedia di iOS | K-006 |
| [ ] | Gerbang usia 16+ dan informasi batas usia tampil | K-001, PP Tunas; lihat Q-001, Q-002 |
| [ ] | Lapor dan blokir berfungsi; cara meninjau laporan di dashboard Supabase diketahui | K-008, spesifikasi §4.7 |
| [ ] | Gambar yang dibagikan bebas EXIF/GPS (dicek dengan alat pembaca EXIF) | K-011 |
| [ ] | Tidak ada koordinat di database, log, atau `Event` | K-011 |
| [ ] | Kebijakan privasi terbit dan tertaut di toko serta di aplikasi | spesifikasi §7 |
| [ ] | Model ML Kit diunduh di onboarding; alur offline pertama kali tidak macet | K-010 |
| [ ] | Minimum iOS 17 di konfigurasi build | K-003 |
| [ ] | Kamera terkunci tercatat sebagai `Event` | K-007 |
| [ ] | Teks deklarasi data (App Privacy / Data safety) sesuai data yang benar-benar dikumpulkan | `docs/kepatuhan/privasi-dan-regulasi.md` |
