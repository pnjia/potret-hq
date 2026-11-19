# Acuan: halaman temuan bebas

> Status: **aktif** (gambar v5, disetujui lewat K-035). Aturan dari spesifikasi §4.5, K-005, K-031, K-037; rupa dari [usulan v5](../usulan-v5-karcis-kliping.md) §3.6 bagian "Buku".
> Terakhir diverifikasi: 19 Nov 2026.

## Gambar acuan

- Membaca halaman: `docs/desain/usulan-v5/V5Buku.png`.
- Editor: `docs/desain/usulan-v5/V5EditHalaman.png`, `docs/desain/usulan-v5/V5EditGayaHalaman.png`, `docs/desain/usulan-v5/V5EditKeterangan.png`.
- **Jangan disalin dari mockup**: pilihan tepi di `V5EditHalaman` masih memakai empat tepi K-031 (putih, tanpa, gunting, bingkai). Yang berlaku adalah K-037: lima gaya tepi `Finding.edgeStyle`, sedangkan bingkai menjadi `Placement.hasFrame`.

## Aturan terkunci

- Tata letak otomatis berbasis template, dengan rotasi acak kecil, selotip, dan keterangan (§4.5).
- Halaman yang pernah diatur manual tidak diacak ulang oleh sistem (K-005). **Acak tata letak** hanya dijalankan pengguna dan bisa diurungkan (K-031).
- Halaman dimuat bertahap dengan thumbnail (K-004).
- Atur manual stiker (K-037): putar 2° per ketukan sampai ±15°, ukuran 60–150% slot, geser 4 dp per ketukan dengan minimal 50% stiker di dalam halaman, urungkan minimal 20 langkah, dan setiap gerakan punya tombol (tidak hanya seret).
- Tepi stiker satu sistem dengan Rapikan potongan (K-037): `Finding.edgeStyle` (`none`/`dieCut`/`snipped`/`pinking`/`torn`, bawaan `dieCut`) dan `Finding.edgeWidth` (`s`/`m`/`l`). Mengubah tepi di halaman mengubah temuan itu di semua tempat.
- Lepas dari halaman menghapus `Placement`; temuan masuk baki "Belum ditempel" dan tidak ditempel ulang otomatis (K-037).

## Anatomi v5

| Bagian | Isi |
|---|---|
| Kertas | `color.paper.book` dengan grain, sudut tajam (`radius.none`), tiga garis tumpukan halaman 1 px di tepi kanan, bayangan jilid kiri berupa raster (bukan gradasi). Kertas latar `Page.paperStyle`: polos, garis, titik, grid |
| Slot temuan | 3–6 per halaman, tergantung template (usulan kerja) |
| Stiker | Tepi die-cut putih bawaan, dua bayangan (tebal vinyl dan jatuh). Rotasi otomatis ±4° (`motion.placementRotationMax`) |
| Selotip | 1–2 per stiker di sudut atau tepi atas; `color.paper.tape` dengan opasitas 82%. Kolom `Placement.tapePosition` dan `Placement.tapePattern` (6 motif) |
| Keterangan | `Finding.note` atau nama kategori; Nanum Pen Script 24 px (`textStyle.bookNote`), rotasi −3° sampai +2° per keterangan. Tinta `Placement.noteInk` dari `color.noteInk`, semuanya ≥ 4,5 di kertas dan selotip |
| Nomor halaman | Tengah bawah, Anybody 13 px |
| Header | Kembali, nama kota (H2), "hlm. 11" (`textStyle.meta`). Tanpa pil progres; angka kota ada di cap halaman pembatas |
| Navigasi halaman | Strip miniatur 40 × 56 dengan nomor; halaman aktif bergaris Tinta 2 px dan stabilo di bawah nomor |
| Gaya halaman | `Page.stylePresetId` (6 gaya siap pakai, K-031) |

## Kriteria cocok dengan acuan

- [ ] Terasa seperti scrapbook nyata, bukan grid galeri
- [ ] Stiker tetap terbaca di kertas (tepi putih dan bayangan); kontrol UI di sekitarnya datar tanpa bayangan
- [ ] Tidak melanggar daftar "jangan" v5 (usulan §4)
- [ ] Data yang disimpan cukup untuk menggambar ulang halaman: `Placement` (`x`, `y`, `scale`, `rotation`, `z`, `isManuallyArranged`, `tapePosition`, `tapePattern`, `noteInk`, `hasFrame`), `Page` (`paperStyle`, `stylePresetId`), dan `Finding` (`edgeStyle`, `edgeWidth`)
