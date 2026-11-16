# Acuan: kartu share 9:16

> Status: **draf** (belum ada gambar). Elemen wajib dari spesifikasi §4.8; ukuran dan zona adalah **usulan kerja** yang perlu dicek ulang sebelum dijadikan aktif.
> Terakhir diverifikasi: 16 Nov 2026.

## Elemen wajib (spesifikasi §4.8, K-011)

| Elemen | Isi | Sumber |
|---|---|---|
| Halaman buku | Halaman yang dibagikan, sebagai fokus utama | §4.8 |
| Stempel kota | Nama kota + dua angka, contoh "Bandung 23/100" (arti angka: Q-014) | §4.8 |
| Watermark kamera | Nama skin kamera yang dipakai | §4.8 |
| Metadata | EXIF dan GPS dihapus | §4.8, K-011 |
| Lokasi | Hanya nama kota, tidak pernah koordinat atau nama tempat yang lebih rinci | K-011 |

Catatan: arti "/100" belum dirinci di spesifikasi (Q-014). Jangan ditebak.

## Usulan tata letak (perlu dicek)

- Kanvas 1080 × 1920 px.
- Zona aman: sisakan sekitar 250 px di atas dan bawah tanpa teks penting, karena UI story Instagram/TikTok menutupi area itu. Angka ini asumsi kerja; cek pedoman platform sebelum final.
- Latar: warna kertas dari token (`color.paper.base`), dengan aksen kota (`City.accentColor`) di stempel.
- Video share memakai komposisi yang sama, dengan animasi buka halaman dan suaranya.

## Kriteria cocok dengan acuan

- [ ] Semua elemen wajib ada
- [ ] Tidak ada teks penting di zona aman
- [ ] Terbaca di layar HP pada kecerahan sedang
- [ ] Tidak terasa kekanak-kanakan (bandingkan dengan anti-acuan di [README](README.md))
