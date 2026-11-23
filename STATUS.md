# STATUS

> Satu-satunya file status di repo ini. **Ditimpa** setiap akhir sesi lewat `/akhiri-sesi`, bukan ditambah. Batas ±60 baris.
> Riwayat ada di `git log -p STATUS.md`. Daftar tugas ada di Trello, bukan di sini.

Terakhir diperbarui: 24 Nov 2026

## Fokus sekarang

Aplikasi lokal dulu: Fase 1 tanpa Supabase, lalu Fase 2 (memotret sampai jadi temuan). Fase 0 tinggal pekerjaan lapangan pemilik.

- Board: https://trello.com/b/8RGssqWK/potret-kliping-kota
- Kartu peta jalan (urutan fase 0–5): https://trello.com/c/i9LI5ikx
- Prototipe uji v5 + panel fasilitator: https://claude.ai/artifact/MuiHwmoLuhwqYz4G2SHgJB

## Titik berhenti sesi terakhir

- **Supabase ditahan** atas keputusan pemilik (24 Nov 2026). Ikut tertahan: login Google/Apple, hapus akun di server, sinkronisasi, fitur sosial. Wajib dilanjutkan sebelum Fase 5 (App Store/Play mensyaratkan login yang benar dan hapus akun).
- Data lokal drift selesai: tabel Findings/Books/Chapters/Pages/Placements dengan kolom glosarium, repositori di `app/lib/data/`, katalog dibundel di `assets/catalog/`. Beranda membaca data dari repositori; misi masih contoh. `--dart-define=DEMO_DATA=true` mengisi 13 temuan contoh. 95 tes lulus.
- Hiasan (K-043) dan Fondasi UI v5 (K-042) selesai sebelumnya. Flutter dan Android SDK ada di `/opt` (tambahkan `/opt/flutter/bin` ke PATH).
- Cabang `claude/ecstatic-heisenberg-tbkori` dibangun di atas `claude/affectionate-johnson-o67pob`; keduanya belum di-merge ke `main`.

## Langkah berikutnya

1. Pemilik (lapangan): ukur APK profile di Infinix Hot 11 Play (K-012); survei 21 landmark; jalankan 5 sesi uji; beli klipingkota.id + .com; cek PDKI dan handle Instagram/Threads di peramban; buat Meta App ID.
2. Claude: Aset bodi kamera dan LUT (Fase 2), lalu Kamera berbodi, lalu Hapus latar. Onboarding tanpa server (usia, izin, unduh model) bisa disisipkan dengan login sementara.
3. Setelah 5 sesi uji: baca koleksi `sessions` dari artifact uji dan tulis riset sintesis.

## Tertunda

- Supabase dan semua yang bergantung padanya (lihat di atas).
- Status semua tugas lain ada di board Trello.
- Cabang ini belum di-merge ke `main`.

## Menunggu keputusan

- Q-028: video + stiker ke Instagram Stories (butuh uji perangkat).
- Q-029: akun developer Meta/TikTok atas nama pribadi atau organisasi.
