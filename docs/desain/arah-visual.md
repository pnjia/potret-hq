# Arah visual

> Area agen `desainer-visual`. Bagian 1 dari spesifikasi v1 §2 dan keputusan sesudahnya; bagian 2 dari riset 16 Nov 2026.
> Terakhir diverifikasi: 19 Nov 2026. Arah visual v5 "Karcis & Kliping" sudah diputuskan (K-035); nilainya di `data/design-tokens.json` v2.0.0, rinciannya di [`usulan-v5-karcis-kliping.md`](usulan-v5-karcis-kliping.md) §2–§4 dan screenshot di `docs/desain/usulan-v5/`.

## 1. Yang sudah terkunci

- Pengguna 18+ (Gen Z dewasa, K-017). Visual **tidak boleh terasa kekanak-kanakan**: tanpa maskot, wajah, emoji, konfeti, atau kilau.
- **Konsep v5 (K-035)**: setiap layar adalah guntingan cetakan kota (karcis berlubang, cap pos kota, coretan stabilo), dicetak dua tinta (Kobalt dan Tinta) di atas putih. Tiga lapis:
  - UI = **cetakan**: datar, tanpa bayangan, kontrol tidak dirotasi;
  - temuan = **benda**: stiker die-cut berwarna penuh dengan tebal, bayangan, dan grain (ilustrasi bergaya cetak saring);
  - buku = **kertas**: grain, selotip, tumpukan halaman.
- **Warna**: UI putih `#FFFFFF`; Kobalt `#3048FF` satu-satunya warna aksi (juga tinta cap dan pulpen); Lime `#D4F25C` hanya untuk stabilo dan penanda, tidak pernah teks atau badge; Tinta `#121212`/`#5B5B66`; kertas buku `#F6F5F1` (hanya buku, kliping, Sukses), kertas redup `#EDEDF0`, selotip `#EBE8DC`; galat `#B42318`.
- **9 warna kategori** (`color.category.<id>`, K-035): teks di atasnya selalu Tinta (7,19–13,54). Karena < 3:1 terhadap putih, label kategori selalu ikon + teks dengan garis Tinta.
- Warna ramai dibawa **konten**: stiker temuan, sampul, skin kamera. Aksen kota (`City.accentColor`) harus memberi putih ≥ 4,5 dan Lime ≥ 3 di atasnya; Sukabumi memakai Kobalt.
- **Huruf**: Anybody (display dan angka, lebar 50–150), Plus Jakarta Sans (UI), Nanum Pen Script (keterangan di buku). Semua OFL. Skala ukuran di token `textStyle`.
- **Bentuk**: radius 0/2/4, lingkaran hanya untuk benda bulat; tanpa bayangan UI; target sentuh ≥ 48 px; kontras teks ≥ 4,5:1. Spasi kelipatan 4 px dan rotasi penempatan otomatis ±4° tetap berlaku.
- **Gerak**: satu momen, "Cap!" saat temuan ditempel (±1,1 detik, hanya transform dan opasitas); layar lain transisi standar.
- Buku harus terasa seperti artefak nyata: page-curl, suara halaman, selotip, rotasi kecil, keterangan (spesifikasi §4.5).
- Skin kamera berupa bodi kamera yang memenuhi layar, identitas visual sekaligus pembeda dari pesaing (spesifikasi §1, K-034).
- Daftar "jangan" v5 (usulan §4) berlaku untuk semua layar.
- Riwayat: v1 (palet kertas krem dan aksen merah muda, K-021) sampai v4 "Pop Kota" ditolak pemilik; v1 kini digantikan K-035.

## 2. Masukan riset (snapshot 16 Nov 2026)

- Selera Gen Z terbelah: yang lebih tua menyukai visual lembut dan bersih, yang lebih muda menyukai visual ramai dan ekspresif.
- Gen Alpha cenderung menyukai warna cerah dan optimis dengan banyak pink (di luar target sejak K-017, tetap dicatat sebagai konteks riset).
- Tafsiran (bukan keputusan): dasar kertas yang tenang menampung kedua selera, sementara keramaian dikendalikan lewat konten. Pink sebagai salah satu aksen layak diuji, tetapi jangan jadi warna dasar karena bisa terasa kekanak-kanakan.
- Sumber: `docs/riset/2026-11-16-riset-awal.md` bagian Visual.

## 3. Prinsip kerja desain

- Mulai dari token (`data/design-tokens.json`), bukan nilai lepas di layar.
- Setiap layar atau kartu baru dibandingkan dengan contoh acuan di `docs/desain/acuan/`. Bila belum ada acuan untuk jenis itu, buat draf acuannya dulu.
- Teks UI memakai istilah glosarium (`docs/produk/glosarium.md`).
- Kartu share tidak pernah memuat lokasi selain nama kota, termasuk nama landmark (K-011, K-036).
