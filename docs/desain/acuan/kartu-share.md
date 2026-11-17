# Acuan: kartu share 9:16

> Status: **draf** (belum ada gambar). Elemen wajib dari spesifikasi §4.8 dan K-028; zona aman dari riset 17 Nov 2026.
> Terakhir diverifikasi: 17 Nov 2026.

## Elemen wajib (spesifikasi §4.8, K-011)

| Elemen | Isi | Sumber |
|---|---|---|
| Halaman buku | Halaman yang dibagikan, sebagai fokus utama | §4.8 |
| Stempel kota | `<Nama kota> <jumlah temuan di kota>/<City.findingTarget>`, contoh "Bandung 23/100"; melewati target tetap naik ("123/100") | §4.8, K-028 |
| Watermark kamera | Nama skin kamera yang dipakai | §4.8 |
| Metadata | EXIF dan GPS dihapus | §4.8, K-011 |
| Lokasi | Hanya nama kota, tidak pernah koordinat atau nama tempat yang lebih rinci | K-011 |

Progres landmark ("Landmark 4/25") tidak masuk kartu share; tempatnya di halaman pembatas (K-028).

## Tata letak

- Kanvas 1080 × 1920 px.
- Zona aman (gabungan angka terbesar Meta dan TikTok, `docs/riset/2026-11-17-nama-suara-zona-aman.md`): **atas 270 px, bawah 680 px, kiri dan kanan 120 px**. Elemen penting (halaman, stempel, watermark) hanya di area tengah ±840 × 970 px. Dasarnya: Meta 14% atas, 35% bawah, 6% sisi; template TikTok yang diukur pihak ketiga 240/660/120 px. Keduanya untuk iklan; untuk konten biasa tidak ada angka resmi.
- Latar: `color.paper.base` (`#F3EEE4`); stempel memakai aksen kota (`City.accentColor`) atau `color.accent.primary` bila kota belum punya aksen. Judul dan stempel: font display (Fraunces).
- Video share memakai komposisi yang sama, dengan animasi buka halaman dan suaranya.

## Kriteria cocok dengan acuan

- [ ] Semua elemen wajib ada
- [ ] Tidak ada teks penting di zona aman
- [ ] Terbaca di layar HP pada kecerahan sedang
- [ ] Tidak terasa kekanak-kanakan (bandingkan dengan anti-acuan di [README](README.md))
