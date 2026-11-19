# STATUS

> Satu-satunya file status di repo ini. **Ditimpa** setiap akhir sesi lewat `/akhiri-sesi`, bukan ditambah. Batas ±60 baris.
> Riwayat ada di `git log -p STATUS.md`. Daftar tugas ada di Trello, bukan di sini.

Terakhir diperbarui: 19 Nov 2026

## Fokus sekarang

Fase 0 peta jalan MVP v5: ukur prototipe page-curl, cek nama dan bundle ID, kurasi landmark, uji 5 pengguna mockup v5, cek API share.

- Board: https://trello.com/b/8RGssqWK/potret-kliping-kota
- Kartu peta jalan (urutan fase 0–5): https://trello.com/c/i9LI5ikx
- Mockup v5: https://claude.ai/artifact/Acc38ZrS9c64zx1VbA3MzE (halaman "v5")

## Titik berhenti sesi terakhir

- Toolchain Flutter 3.50 + Android SDK terpasang di sesi cloud; `app/` berisi kerangka K-027 dan prototipe page-curl K-012. APK profile sudah diberikan; angka frame time dari Infinix Hot 11 Play belum ada.
- Desain v5 "Karcis & Kliping" diputuskan (K-035, menggantikan K-021): token `data/design-tokens.json` v2.0.0, arah visual dan acuan diperbarui, tema Flutter ikut (flutter test lulus).
- Keputusan baru 18–19 Nov: suara sintesis (K-030), opsi editor (K-031), kartu share 4 gaya MVP (K-032), syarat privasi share (K-033), toko di luar MVP + 9 kamera (K-034), tanpa nama landmark di share (K-036), rincian editor (K-037), Pas Kolektor dan julukan label (K-038).
- Mockup v5 lengkap: alur inti, buku, editor, 10 gaya share, kamera berbodi, etalase, dan toko (disiapkan untuk setelah MVP). Screenshot di `docs/desain/usulan-v5/`.
- Trello: kartu MVP diperbarui ke keputusan terbaru, 6 kartu baru, list "Setelah MVP" (5 kartu), dan kartu peta jalan.

## Langkah berikutnya

1. Pemilik memasang APK profile di Infinix Hot 11 Play dan mengirim angka frame time (kartu K-012, list Menunggu).
2. Kerjakan kartu Fase 0 lain sambil menunggu, lalu Fase 1 dimulai dari kartu "Fondasi UI v5".

## Tertunda

- Status semua tugas lain ada di board Trello.

## Menunggu keputusan

- Q-015: bundle ID final, setelah cek PDKI dan keputusan pemilik membeli domain.
