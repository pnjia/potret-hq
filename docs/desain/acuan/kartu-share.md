# Acuan: kartu share

> Status: **aktif** (gambar v5, disetujui lewat K-035). Isi dari spesifikasi §4.8, K-028, K-032, K-033, K-036; rupa dari [usulan v5](../usulan-v5-karcis-kliping.md) §3.6 bagian "Kartu share" dan "Bagikan dengan 10 gaya kartu"; zona aman dari riset 17 Nov 2026.
> Terakhir diverifikasi: 19 Nov 2026.

## Gaya MVP (K-032)

| Gaya | `shareStyle` | Format | Gambar acuan |
|---|---|---|---|
| 1 Halaman Kliping | `bookPage` | Story 9:16 | `docs/desain/usulan-v5/V5KartuShare.png` |
| 2 Video Buka Halaman | `pageFlipVideo` | Video 9:16 | `docs/desain/usulan-v5/V5ShareVideo.png` |
| 3 Stiker Temuan | `sticker` | Stiker PNG transparan | `docs/desain/usulan-v5/V5BagikanStiker.png` |
| 4 Temuan Tunggal | `singleFinding` | Story 9:16 | `docs/desain/usulan-v5/V5ShareTunggal.png` |

- Gaya 5–10 dan format Feed 3:4 sesudah MVP; gambarnya (`V5SharePos`, `V5ShareEmpat`, `V5ShareLabel`, `V5ShareTonggak`, `V5ShareCetak`, `V5ShareTambah`) hanya arah jangka panjang.
- Chip warna: Kobalt, Tinta, Lime, Kertas, warna Kategori, dan tombol **Acak**. Gaya bawaan: dari Sukses → Temuan Tunggal, dari Buku → Halaman Kliping.
- Layar Bagikan: `docs/desain/usulan-v5/V5Bagikan.png`. **Jangan disalin dari mockup**: hitungan "x dari 10", tombol "Semua gaya" yang memuat gaya terkunci, dan segmen Feed. Di MVP gaya dan format yang belum tersedia tidak ditampilkan sama sekali (K-032).

## Isi wajib dan larangan (semua gaya)

| Elemen | Aturan | Sumber |
|---|---|---|
| Cap pos kota | `<NAMA KOTA> <jumlah>/<City.findingTarget>`, contoh "SUKABUMI 13/100"; melewati target tetap naik. Selalu ada, tidak bisa dimatikan. Utuh di satu permukaan: Kobalt di kertas atau putih, Lime di Kobalt, Tinta di warna kategori. Diameter ≥ 240 px | §4.8, K-028, K-032 |
| Watermark | "Kliping Kota · <kamera>", selalu ada | §4.8, K-032 |
| Judul | Keterangan buatan pengguna; bila kosong, nama kategori | K-036 |
| Lokasi | Hanya nama kota. **Tanpa** nama landmark, nama tempat lain, provinsi, atau progres landmark | K-011, K-028, K-036 |
| Waktu dan akun | Tanpa jam; tanggal paling rinci per pekan; username tidak tampil secara baku | K-033 |
| Metadata | EXIF dan GPS dihapus dari PNG, JPG, dan MP4; diuji per format | §4.8, K-033 |

- Kalimat privasi di layar Bagikan, dekat tombol tujuan: "Hanya nama kota yang ikut. Lokasi dan EXIF dihapus. Cek isi foto: plat nomor, nomor rumah, wajah." (K-033).
- Tujuan berurutan: WhatsApp, Instagram Stories, TikTok, Simpan, Lainnya. Tanpa hadiah untuk berbagi, hitung mundur, tujuan terpilih otomatis, atau ajakan berbagi lagi (K-032).

## Tata letak

- Kanvas 1080 × 1920 px. Zona aman (gabungan angka terbesar Meta dan TikTok, `docs/riset/2026-11-17-nama-suara-zona-aman.md`): **atas 270 px, bawah 680 px, kiri dan kanan 120 px**. Informasi hanya di area tengah ±840 × 970 px; zona bawah hanya raster titik dekoratif.
- Halaman Kliping: latar Kobalt polos, kliping `color.paper.book` 740 × 780 dengan rotasi ±3° (`motion.clippingRotationMax`) dan bayangan, cap Kobalt di dalam kertas (−12° sampai −6°), karcis kategori, keterangan Nanum Pen 64 px Kobalt, "KLIPING KOTA" Anybody 50%/900 64 px dan watermark Plus Jakarta Sans 700 28 px putih.
- Ukuran huruf di kanvas = `textStyle` × 2,5. Teks putih di atas raster titik hanya teks besar (≥ 24 px, atau ≥ 18,7 px tebal di layar); watermark 28 px/700 di raster 4,15.
- Video memakai komposisi yang sama, dengan animasi buka halaman dan suaranya.

## Kriteria cocok dengan acuan

- [ ] Cap kota, watermark, dan judul sesuai tabel; tidak ada nama landmark, provinsi, jam, atau username
- [ ] Tidak ada informasi di zona aman
- [ ] Terbaca di layar HP pada kecerahan sedang; semua teks ≥ 4,5 (atau ≥ 3 untuk teks besar di raster)
- [ ] Tidak melanggar daftar "jangan" v5 (usulan §4) dan anti-acuan di [README](README.md)
