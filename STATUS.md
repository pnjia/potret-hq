# STATUS

> Satu-satunya file status di repo ini. **Ditimpa** setiap akhir sesi lewat `/akhiri-sesi`, bukan ditambah. Batas ±60 baris.
> Riwayat ada di `git log -p STATUS.md`. Daftar tugas ada di Trello, bukan di sini.

Terakhir diperbarui: 17 Nov 2026

## Fokus sekarang

Prototipe animasi buka halaman (K-012). HQ siap: Q-001 s/d Q-014 terjawab (K-016 s/d K-029), dan board Trello sudah dibuat.

- Board: https://trello.com/b/8RGssqWK/potret-kliping-kota
- Kartu fokus: https://trello.com/c/z1r8wF0O

## Titik berhenti sesi terakhir

- Kota MVP diganti ke Kota Sukabumi, domisili pemilik (K-029 menggantikan K-022).
- Board Trello "potret · Kliping Kota" dibuat di OK Workspace: 5 list, 3 kartu di "Minggu ini" (prototipe K-012, kurasi landmark Sukabumi, cek nama di PDKI), dan 12 kartu di "Backlog" (fitur MVP §4.1–§4.9, uji kategori, rekam suara, kepatuhan sebelum rilis).
- Flutter dan Android SDK belum terpasang di sesi cloud (baru ada Java dan Gradle). Pengukuran 30 fps harus di Infinix Hot 11 Play fisik milik pemilik.

## Langkah berikutnya

1. **Prototipe animasi buka halaman (K-012).** Pasang Flutter dan Android SDK, buat `app/` dengan struktur K-027, tulis prototipe, lalu build APK profile. Pemilik memasang APK di Infinix Hot 11 Play dan mengirim angka frame time. Acuan: `docs/teknis/buku.md` bagian "Prototipe K-012". Agen: `animasi-buku`.

## Tertunda

- Status semua tugas lain ada di board Trello.

## Menunggu keputusan

Tidak ada Q- terbuka.
