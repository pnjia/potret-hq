# Arah visual

> Area agen `desainer-visual`. Bagian 1 dari spesifikasi v1 §2 dan K-001 (terkunci); bagian 2 dari riset 16 Nov 2026.
> Terakhir diverifikasi: 16 Nov 2026. Palet dan tipografi belum ditentukan (Q-007); token di `data/design-tokens.json` masih placeholder.

## 1. Yang sudah terkunci

- Pengguna 16+ (Gen Z dan angkatan Gen Alpha tertua). Visual **tidak boleh terasa kekanak-kanakan** (K-001).
- Ekspresif, bernuansa zine/scrapbook.
- Palet: dasar netral bernuansa kertas. Warna ramai dibawa oleh **konten**: sampul, skin kamera, dan aksen kota (`City.accentColor`).
- Buku harus terasa seperti artefak nyata: page-curl, suara halaman, selotip, rotasi kecil, keterangan (spesifikasi §4.5).
- Skin kamera digital adalah identitas visual sekaligus pembeda dari pesaing (spesifikasi §1).

## 2. Masukan riset (snapshot 16 Nov 2026)

- Selera Gen Z terbelah: yang lebih tua menyukai visual lembut dan bersih, yang lebih muda menyukai visual ramai dan ekspresif.
- Gen Alpha cenderung menyukai warna cerah dan optimis dengan banyak pink.
- Tafsiran (bukan keputusan): dasar kertas yang tenang menampung kedua selera, sementara keramaian dikendalikan lewat konten. Pink sebagai salah satu aksen layak diuji, tetapi jangan jadi warna dasar karena bisa terasa kekanak-kanakan.
- Sumber: `docs/riset/2026-11-16-riset-awal.md` bagian Visual.

## 3. Prinsip kerja desain

- Mulai dari token (`data/design-tokens.json`), bukan nilai lepas di layar.
- Setiap layar atau kartu baru dibandingkan dengan contoh acuan di `docs/desain/acuan/`. Bila belum ada acuan untuk jenis itu, buat draf acuannya dulu.
- Teks UI memakai istilah glosarium (`docs/produk/glosarium.md`).
- Kartu share tidak pernah memuat lokasi selain nama kota (K-011).
