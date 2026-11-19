# Laporan desainer-visual: bedah v4 "Pop Kota" dan spesifikasi v5 "Karcis & Kliping"

> Ditulis: 18 Nov 2026 · Agen: `desainer-visual` · Status isi: **usulan** untuk Q-017. Tidak ada file repo yang diubah.
> Lampiran di `docs/desain/usulan-v5/`: `gereja.svg` (contoh gaya stiker), `cap.svg` (stempel kota), `kontras.py` (hitung kontras), `spesimen.png` dan `uji-gereja.png`, serta screenshot 30 layar v5 (`V5*.png`). Mockup hidup: https://claude.ai/artifact/Acc38ZrS9c64zx1VbA3MzE (halaman "v5").
> Terakhir diverifikasi: 18 Nov 2026.

Yang dipertahankan dari v4, sesuai permintaan pemilik: struktur Beranda (hero kota, aksi Potret, misi, temuan terbaru), navigasi 5 tab berlabel, warna terang dan berani (Kobalt, Lime, warna kategori), dan cutout sebagai stiker.

---

## 1. Diagnosis "AI slop" v4

Semua 10 screenshot di `.../render/shots/` sudah dilihat. Sumber HTML di `.../kk-mockup/project/V4*.dc.html`. Dampak: **tinggi** = langsung terasa dalam 5 detik pertama, **sedang** = terasa setelah beberapa layar, **rendah** = rapikan saja.

| # | Layar · elemen | Apa yang generik, dan kenapa | Prinsip | Dampak | Bukti |
|---|---|---|---|---|---|
| 1 | Semua layar · bentuk wadah | Setiap wadah adalah persegi panjang membulat atau kapsul. Ada 15 nilai radius berbeda (4, 5, 6, 7, 8, 14, 15, 16, 18, 20, 22, 24, 26, 28, 29 px) tanpa satu pun sudut tajam. Kartu, chip, tombol, tile, dan segmented control jadi satu keluarga "UI kit". Hasilnya terasa seperti template, bukan benda kertas. | Default AI "kartu SaaS membulat identik" (skill `frontend-design`); anti-acuan "sudut membulat berlebihan" | Tinggi | **Terbukti**: `grep border-radius V4*.dc.html`; mis. `V4Beranda.dc.html:31` (28), `:50` (24), `:71` (20) |
| 2 | Pembuka, Sukses, Bagikan, Kartu share · lingkaran latar | Motif yang sama dipakai empat kali: lingkaran `#4A60FF` raksasa di atas Kobalt. Bentuk ini tidak mewakili apa pun di dunia produk (bukan stempel, bukan lensa, bukan halaman). Inilah "blob dekoratif" khas template landing page. | Latar harus kontekstual, bukan dekorasi kosong (cookbook Anthropic); dekorasi yang tidak melayani brief dibuang (skill) | Tinggi | **Terbukti**: `V4Pembuka.dc.html:20`, `V4KartuShare.dc.html:17`, `V4Bagikan.dc.html:28`, layar Sukses |
| 3 | Semua layar · ilustrasi stiker | Ilustrasi disusun dari primitif `rect`/`polygon`/`circle` dengan isi datar, ditambah stroke putih lewat `paint-order`. Mochi berupa tiga lingkaran di atas persegi (lebih mirip kue lapis atau sushi). Angkot berupa bus generik dengan `rx=16`. Gereja tidak mengacu ke bangunan apa pun. SVG yang sama dipakai ulang di 7 tempat tanpa variasi skala detail. Inilah wajah clip-art vektor, padahal stiker adalah **konten inti**. | Aesthetic-usability; kritik v3 #5 | Tinggi | **Terbukti**: `V4Beranda.dc.html:72-84`, `V4Pembuka.dc.html:23-64` |
| 4 | Semua layar · tipografi | Semuanya tebal: Unbounded 700–800 dan Plus Jakarta Sans 600–700, tanpa bobot ringan. Lompatan ukuran kecil (isi 15 px ke judul 17–30 px, sekitar 2×); hanya Misi yang memakai 44 px. Unbounded adalah huruf lebar yang dibuat untuk Polkadot Network (Web3), jadi nuansanya "startup kripto". Nama landmark panjang langsung patah dua baris (Kartu share: "Gereja Sidang / Kristus"). | Kontras ekstrem 100/200 lawan 800/900 dan lompatan ≥3× (cookbook Anthropic) | Tinggi | **Terbukti**: tally `font-size` per layar; deskripsi resmi `google/fonts/ofl/unbounded/DESCRIPTION.en_us.html` (diakses 2026-11-18) |
| 5 | Sistem, Beranda, Kartu share · stempel kota | Stempel kota adalah elemen produk bernama (glosarium, K-028), tetapi di v4 hanya berupa lingkaran Lime polos bertuliskan "SUKABUMI 13/100" atau kapsul biru "12/100" di header Buku. Tidak ada cincin, tinta, maupun sifat cap. Elemen paling khas produk ini justru jadi badge generik. | Pembuka diambil dari elemen paling khas dunia subjek (skill) | Tinggi | **Terbukti**: `V4KartuShare.dc.html:21`; screenshot V4Buku (pil 12/100) |
| 6 | Semua layar · konteks Indonesia/Sukabumi | Selain teks ("Sukabumi", "angkot ijo"), tidak ada satu pun bahasa visual yang hanya bisa muncul di sini: karcis, cap pos, guntingan koran (arti harfiah "kliping"), papan nama toko, stabilo. Kalau "Sukabumi" diganti "Austin", layarnya tetap masuk akal. | Variasi dan sumber inspirasi konkret (cookbook Anthropic) | Tinggi | **Dugaan** (penilaian ahli) |
| 7 | Beranda · tata letak | Polanya hero card, bento 2 kolom, grid 3 kolom tile pastel, lalu tab bar. Ini kerangka "dashboard bento" yang bisa ditebak. Tile pastel `#FFE3D6`/`#FFE0EC`/`#FFF4C7` dengan titik 8 px mirip kartu produk e-commerce. | Tata letak bisa ditebak; anti-acuan "grid kaku tanpa rotasi atau selotip" (K-005) | Sedang | **Terbukti**: `V4Beranda.dc.html:47-88` |
| 8 | Kamera · skin dan bingkai | Skin kamera adalah pembeda produk (spesifikasi §1), tetapi di v4 hanya berupa bulatan warna (Kobalt, pink, kuning) dengan label. Bingkai jendela bidik berupa border Kobalt 6 px membulat. Tidak ada bodi kamera, penghitung film, atau nama yang tercetak. | Spesifikasi §1, §4.2 | Tinggi | **Terbukti**: `V4Kamera.dc.html:48`, border `6px solid #3048FF` |
| 9 | Buku · halaman | Halaman berupa persegi membulat dengan bayangan lembut. Tidak ada selotip (wajib, spesifikasi §4.5), tekstur kertas, maupun tepi tumpukan halaman. Nomor halaman berupa kotak angka seperti paginasi tabel web. Semua keterangan Caveat berukuran dan bermiring sama. | Buku harus terasa artefak nyata (arah-visual §1); acuan draf `halaman-buku.md` | Tinggi | **Terbukti**: `V4Buku.dc.html:29`; screenshot V4Buku |
| 10 | Pembuka, Sukses, Kartu share, Sistem · chip Lime | Kapsul Lime dipakai sebagai badge di mana-mana ("+1 temuan", "Landmark ke-5 ditemukan", "Draf untuk diuji", "Landmark ke-5 di Sukabumi"). Warna sorotan yang dipakai di setiap layar kehilangan daya sorotnya. | "Dominant colors with sharp accents" (cookbook): aksen harus jarang | Sedang | **Terbukti**: screenshot |
| 11 | Navigasi · ikon | Ikon garis standar ala Lucide/Feather: rumah, buku terbuka, **target** untuk Misi, **siluet orang** untuk Profil, pin lokasi. Target dan siluet orang adalah klise yang tidak berhubungan dengan karcis misi atau halaman identitas buku (spesifikasi §4.5). | Ikon generik | Sedang | **Terbukti**: `V4Beranda.dc.html:107,111` |
| 12 | Sukses · momen puncak | Teks putih di tengah, latar biru, lingkaran, dua tombol kapsul. Ini layar "success" generik; momen peak-end (kritik v3 #10) tidak dipakai untuk menunjukkan stiker masuk ke buku dan dicap. | Peak-end rule | Sedang | Screenshot V4Sukses |
| 13 | Kartu share · isi | Kartu memuat "Landmark ke-5 di Sukabumi" (progres landmark) dan nama tempat "Gereja Sidang Kristus". Acuan draf `docs/desain/acuan/kartu-share.md` menyebut progres landmark **tidak** masuk kartu share (K-028), dan lokasi hanya nama kota, "tidak pernah ... nama tempat yang lebih rinci" (K-011). Ini bukan soal selera, tetapi pelanggaran acuan. | K-011, K-028 | Tinggi (kepatuhan) | **Terbukti**: `V4KartuShare.dc.html:19,35`; `kartu-share.md` tabel elemen wajib |
| 14 | Sistem · kategori | Hanya 5 warna kategori. K-020 menetapkan 9 kategori (`sign`, `food`, `drink`, `vehicle`, `animal`, `plant`, `building`, `object`, `other`). Minuman, hewan, barang, dan lainnya belum punya rupa. | Konsistensi (H4) | Sedang (celah) | **Terbukti**: `data/categories.json`; `V4Sistem.dc.html:38` |

**Tiga terbesar:** (1) sudut membulat seragam ditambah lingkaran latar dekoratif, yang membuatnya terasa seperti UI kit atau template; (2) ilustrasi stiker setara clip-art dan stempel kota yang jadi badge generik, padahal keduanya konten dan identitas inti; (3) tidak ada bahasa visual khas Indonesia atau Sukabumi, termasuk arti "kliping" itu sendiri.

---

## 2. Konsep v5

**"Karcis & Kliping": setiap layar adalah guntingan cetakan kota (karcis angkot berlubang, cap pos, coretan stabilo) yang dicetak dua tinta, Kobalt dan hitam, di atas kertas putih, dan stiker temuan menjadi satu-satunya benda berwarna penuh.**

Turunannya:
- UI = **cetakan** (datar, tinta, garis, raster, tanpa bayangan).
- Temuan = **benda** (stiker die-cut dengan tebal, bayangan, dan grain).
- Buku = **kertas** (grain, selotip, tumpukan halaman).

Pembagian tiga lapis ini menjadi aturan yang menentukan bentuk setiap elemen. Dengan begitu, spesifikasi §2 ("warna ramai dibawa konten") terjaga tanpa kembali ke krem v1.

---

## 3. Spesifikasi v5

### 3.1 Palet

Rasio dihitung dengan rumus luminans relatif WCAG 2.x (`kontras.py`, 18 Nov 2026).

**Inti (5 warna, 4 dipertahankan dari v4):**

| Token (usulan) | Hex | Peran | Asal |
|---|---|---|---|
| `ink.primary` (Tinta) | `#121212` | Teks utama, garis 2 px komponen, garis atas navigasi | v4, dipertahankan |
| `ink.secondary` | `#5B5B66` | Teks sekunder, garis putus placeholder | v4, dipertahankan |
| `action.primary` (Kobalt) | `#3048FF` | Satu-satunya warna aksi. Juga **tinta cap** (cap pos, tulisan pulpen di buku) dan panel hero | v4, dipertahankan; perannya diperluas menjadi tinta cetak |
| `highlight` (Lime) | `#D4F25C` | **Stabilo**: coretan di balik kata, isi bilah progres, karcis "Potret sekarang", tombol "Ya, betul". Tidak pernah sebagai badge kapsul | v4, dipertahankan; perannya dipersempit |
| `paper.screen` | `#FFFFFF` | Latar semua layar UI | v4, dipertahankan |
| `paper.book` | `#F6F5F1` | **Hanya** halaman buku, kliping di kartu share, latar Sukses. Abu hangat sangat muda, bukan krem (bandingkan krem v1 `#F3EEE4`) | Baru |
| `paper.muted` | `#EDEDF0` | Skeleton, tombol nonaktif, garis alas potong. Menggantikan peran "permukaan" `#F3F3F6` sebagai isi kartu | Menggantikan `#F3F3F6` |
| `action.onPrimarySoft` | `#DCE1FF` | Teks sekunder di atas Kobalt **polos** (≥14 px, bobot 700) | v4, dipertahankan |
| `tape` | `#EBE8DC` @82% | Selotip; hasil di atas `paper.book` ≈ `#EDEAE0` | Baru |
| `state.error` / `state.success` | `#B42318` / `#2E7652` | Galat dan berhasil | Dari K-021 (kini digantikan K-035), dipertahankan |

**Kategori: 9 warna (5 dari v4 + 4 baru untuk K-020).** Teks di atas warna kategori selalu Tinta. Karena kontras warna kategori terhadap putih < 3 (gagal WCAG 1.4.11), karcis kategori **wajib** bergaris Tinta 1,5–2 px dan selalu memuat ikon + label (warna bukan satu-satunya penanda).

| Kategori (`id`) | Hex | Tinta di atasnya | Asal |
|---|---|---|---|
| Bangunan (`building`) | `#FF8A5B` | 8,06 | v4 |
| Makanan (`food`) | `#FF6FA3` | 7,19 | v4 |
| Kendaraan (`vehicle`) | `#FFD84D` | 13,54 | v4 |
| Tanaman (`plant`) | `#7FD6A6` | 10,77 | v4 |
| Papan nama (`sign`) | `#9DB4FF` | 9,28 | v4 |
| Minuman (`drink`) | `#5ED1E0` | 10,41 | baru |
| Hewan (`animal`) | `#C7A6FF` | 9,21 | baru |
| Barang (`object`) | `#E0C39A` (cokelat kardus) | 11,10 | baru |
| Lainnya (`other`) | `#D6D6DC` | 12,95 | baru, netral |

**Semua pasangan teks dan latar di spesifikasi ini:**

| Teks | Latar | Rasio | Syarat | Lolos |
|---|---|---|---|---|
| Tinta `#121212` | Putih | 18,73 | 4,5 | ya |
| `#5B5B66` | Putih | 6,70 | 4,5 | ya |
| Kobalt `#3048FF` (tautan, tulisan pulpen) | Putih | 6,01 | 4,5 | ya |
| Putih | Kobalt (tombol utama, hero, kartu share) | 6,01 | 4,5 | ya |
| `#DCE1FF` | Kobalt polos | 4,65 | 4,5 | ya (hanya ≥14 px/700) |
| Lime | Kobalt (cap di hero, angka) | 4,76 | 4,5 | ya |
| Tinta | Lime (karcis Potret, tombol "Ya, betul") | 14,86 | 4,5 | ya |
| `#5B5B66` | Lime (teks kecil di karcis) | 5,32 | 4,5 | ya |
| Putih / Lime | Tinta (panel kamera) | 18,73 / 14,86 | 4,5 | ya |
| `#B4B4BE` ("Segera" di kamera) | Tinta | 9,11 | 4,5 | ya |
| Putih | Bodi kamera `#2B2B30` | 14,08 | 4,5 | ya |
| Tinta | `paper.book` | 17,17 | 4,5 | ya |
| `#5B5B66` | `paper.book` | 6,14 | 4,5 | ya |
| Kobalt (keterangan pulpen, cap) | `paper.book` | 5,51 | 4,5 | ya |
| Kobalt | selotip di atas kertas (`#EDEAE0`) | 4,99 | 4,5 | ya |
| Tinta | `paper.muted` | 16,03 | 4,5 | ya |
| `#5B5B66` | `paper.muted` | 5,74 | 4,5 | ya |
| Tinta | 9 warna kategori | 7,19–13,54 | 4,5 | ya |
| Galat / Berhasil | Putih | 6,57 / 5,48 | 4,5 | ya |
| Putih ≥24 px atau ≥18,7 px/700 | Titik raster di Kobalt (kasus terburuk `#5E70FF`) | 4,01 | 3 (teks besar) | ya, **hanya teks besar** |
| Putih 28 px/700 (watermark kartu share) | Titik raster kartu (`#596DFF`) | 4,15 | 3 | ya |

**Dilarang (gagal):** Lime di atas putih atau kertas (1,26 / 1,16), sehingga Lime tidak pernah dipakai untuk teks atau sebagai satu-satunya penanda status di atas putih. Teks < 18,7 px di atas raster (4,01). `#DCE1FF` di atas raster (3,1).

**`City.accentColor` (usulan untuk `kurator-katalog`):** Sukabumi memakai Kobalt sampai kurator punya dasar warna kota. Syarat warna aksen kota apa pun: putih di atasnya ≥4,5 **dan** Lime di atasnya ≥3, karena kartu share dan hero memakai keduanya.

### 3.2 Tipografi

Tetap tiga keluarga dengan peran tetap (kritik v3 #4). Dua diganti:

| Peran | v4 | v5 | Alasan |
|---|---|---|---|
| Display + angka | Unbounded | **Anybody** (Tyler Finck, OFL, variabel `wdth` 50–150 dan `wght` 100–900; diverifikasi di `google/fonts/ofl/anybody/METADATA.pb`, 18 Nov 2026) | Satu keluarga memberi dua suara: **sangat sempit dan sangat tebal** (seperti huruf karcis, papan nama toko, judul koran) lawan **lebar dan ringan** (angka "/100"). Kontras bobot 900 lawan 250–300 dan lebar 50 lawan 140 sesuai saran Anthropic. Huruf sempit menyelesaikan masalah nama landmark panjang (pertanyaan terbuka di riset kritik v3). Unbounded berasal dari proyek Web3 (Polkadot) dan selalu lebar, jadi tidak punya rentang ini. Lihat `spesimen.png`. |
| Teks UI | Plus Jakarta Sans | **Plus Jakarta Sans** (dipertahankan) | Buatan Tokotype (Indonesia), terbaca baik, sudah di K-021, kini digantikan K-035 |
| Tulisan tangan | Caveat | **Nanum Pen Script** (Sandoll, OFL; diverifikasi di `METADATA.pb`) | Caveat adalah huruf "tulisan tangan" bawaan paling umum. Nanum Pen lebih mirip spidol atau pulpen sungguhan dengan ritme tidak rata (lihat `spesimen.png`). Untuk aplikasi, subset Latin saja (`pyftsubset`) karena file aslinya memuat Hangul. Opsi jangka panjang (tidak memblokir): font dari tulisan tangan pemilik sendiri, sejalan dengan semangat K-024 (suara direkam sendiri). |

Skala (dp/px CSS di layar 360 dp, setara 720×1640 @2x):

| Peran | Keluarga | Lebar (`font-stretch`) | Bobot | Ukuran / tinggi baris | Letter-spacing | Kapital |
|---|---|---|---|---|---|---|
| Display XL: nama kota di hero | Anybody | 50% | 900 | 64 / 0,86 | +0,5 px | KAPITAL |
| Angka besar: "13", "2" | Anybody | 55–60% | 900 | 44 / 1,0 | 0 | – |
| Angka pasangan: "/100", "/5" | Anybody | 130–140% | 300 (min.) | 24 / 1,0 (min. 16 bila di dalam karcis kecil, bobot 400) | 0 | – |
| H1 judul layar | Anybody | 75% | 800 | 28 / 1,0 | −0,2 px | Kalimat |
| Nama landmark (Temuan, Sukses) | Anybody | 75% | 800 | 32 / 1,0 | −0,2 px | Kalimat |
| Judul Sukses "Tertempel." | Anybody | 60% | 900 | 56 / 0,9 | 0 | Kalimat |
| H2 judul bagian | Anybody | 75% | 800 | 20 / 1,1 | 0 | Kalimat |
| Karcis besar ("POTRET SEKARANG") | Anybody | 60% | 900 | 30 / 0,9 | +0,3 px | KAPITAL (hanya di karcis) |
| Sobekan karcis dan nomor seri ("No. 014", "SISA 4 HARI") | Anybody | 70% | 700 | 13 / 1,0 | +0,5 px | KAPITAL, teks vertikal di sobekan |
| Isi | Plus Jakarta Sans | – | 400 (tebal 700) | 16 / 1,45 | 0 | Kalimat |
| Label tombol | Plus Jakarta Sans | – | 800 | 16 / 1,0 | 0 | Kalimat |
| Label karcis kategori, label tab | Plus Jakarta Sans | – | 700 (tab aktif 800) | 13–14 | 0 | Kalimat |
| Meta (minimum) | Plus Jakarta Sans | – | 500 | 13 / 1,35 | 0 | Kalimat |
| Keterangan buku | Nanum Pen Script | – | 400 | 24 (min. 22) / 1,05 | +0,3 px | Huruf kecil, apa adanya |
| Kartu share (1080 px) | sama, ×2,5 | | | nama kota 160, keterangan 64, watermark 28/700 | | |

Lompatan ukuran: isi 16 ke H1 28 (1,75×) ke display 64 (4×). Bobot 900 bersanding dengan 300 dalam satu blok.

### 3.3 Bentuk dan radius

Aturan: **benda punya bentuk benda; UI punya bentuk cetakan.**

| Token (usulan) | Nilai | Dipakai untuk |
|---|---|---|
| `radius.none` | 0 | Kliping, halaman buku (tepi luar), garis navigasi |
| `radius.paper` | 2 px | Hero kliping |
| `radius.ticket` | 4 px | Karcis, tombol, input, tombol kota, thumbnail halaman |
| `radius.round` | 50% | **Hanya** benda yang memang bulat: rana, cap pos, avatar, lubang pons |
| `border.ink` | 2 px Tinta | Komponen putih (tombol kedua, karcis putih, tombol kembali) |
| `border.tag` | 1,5 px Tinta | Karcis kategori |
| Tinggi tombol | 52–56 px; target sentuh ≥48 | |
| Rotasi | stiker ±4° (`placementRotationMax`), kliping dan kartu share ±3°, cap −12° s/d −6°, hero −1°. **Kontrol UI 0°** | |
| Bayangan | **Hanya benda**: stiker (2 lapis) dan kliping. Tombol dan karcis datar | |

Tidak ada lagi radius 14–29 dan kapsul.

### 3.4 Elemen tanda tangan

Ketiganya diambil dari benda cetak kota yang dikenal pengguna Indonesia. Satu layar maksimal memakai **satu** elemen sebagai fokus; dua lainnya hanya pendukung kecil.

**A. Karcis berlubang (perforasi + sobekan)**
- Wujud: karcis angkot, parkir, atau bioskop. Dua takik setengah lingkaran (r 8 px) di tepi atas dan bawah, garis putus 2 px di antaranya, dan bagian sobekan selebar 30 px berisi teks vertikal (nomor seri atau sisa hari).
- Dipakai untuk: kartu aksi di Beranda, karcis misi, pertanyaan landmark di Temuan, tab gaya di Bagikan. Versi kecil (takik r 4 px di kiri dan kanan) dipakai sebagai **label kategori**.
- Makna: "No. 014" = nomor temuan berikutnya di kota itu (menyambung ke 13/100). Di Misi, progres ditandai **lubang pons**, seperti kondektur melubangi karcis.
- CSS (karcis berwarna):
  ```css
  .karcis{--sobek:calc(100% - 30px);position:relative;border-radius:4px;
    -webkit-mask:
      radial-gradient(circle 8px at var(--sobek) 0,#0000 97%,#000) top/100% 51% no-repeat,
      radial-gradient(circle 8px at var(--sobek) 100%,#0000 97%,#000) bottom/100% 51% no-repeat;}
  .karcis::after{content:"";position:absolute;top:10px;bottom:10px;left:var(--sobek);
    border-left:2px dashed currentColor;opacity:.55}
  /* karcis putih: garis 2 px yang mengikuti takik (dibungkus, karena mask memotong border) */
  .garis{filter:drop-shadow(2px 0 0 #121212) drop-shadow(-2px 0 0 #121212)
                drop-shadow(0 2px 0 #121212) drop-shadow(0 -2px 0 #121212)}
  /* label kategori: takik kiri-kanan */
  .tag{-webkit-mask:
      radial-gradient(circle 4px at 0 50%,#0000 97%,#000) left/51% 100% no-repeat,
      radial-gradient(circle 4px at 100% 50%,#0000 97%,#000) right/51% 100% no-repeat}
  ```
  Di Flutter: `CustomClipper<Path>` dengan dua `arcToPoint` per takik; garis tepi digambar `CustomPainter` dengan path yang sama.

**B. Cap pos kota (stempel kota)**
- Wujud: cincin ganda (r 60 dan r 40 dalam viewBox 220×132), nama kota melengkung di atas, "KLIPING KOTA" melengkung di bawah, angka temuan besar (Anybody 55%/900) dengan "/100" kecil di bawahnya, dan empat garis gelombang pembatal di kanan. Tinta tidak rata: tepi digoyang `feDisplacementMap` (skala 2,2) dan ada bintik kosong dari `feTurbulence` yang dipakai sebagai alpha. Format mengikuti K-028.
- Dipakai untuk: Sukses (momen utama), halaman pembatas bab, kartu share, dan lencana (versi cap per lencana).
- **Aturan tinta**: cap harus berada utuh di satu permukaan. Di kertas atau putih memakai Kobalt (5,51 / 6,01); di Kobalt memakai Lime (4,76). Diameter minimal 96 px di layar dan 240 px di kartu share. Tidak ditaruh di hero Beranda (diuji: menumpuk dengan bilah progres dan angkanya tidak terbaca).
- Kode lengkap: `cap.svg`. Inti filternya:
  ```xml
  <filter id="cap-tinta">
    <feTurbulence type="fractalNoise" baseFrequency="0.7" numOctaves="2" seed="4" result="n"/>
    <feDisplacementMap in="SourceGraphic" in2="n" scale="2.2" xChannelSelector="R" yChannelSelector="G" result="goyang"/>
    <feTurbulence type="fractalNoise" baseFrequency="0.09 0.5" numOctaves="2" seed="9" result="n2"/>
    <feColorMatrix in="n2" type="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 -10 8.2" result="lubang"/>
    <feComposite in="goyang" in2="lubang" operator="in"/>
  </filter>
  ```
  Di aplikasi, cap dirender sekali menjadi `stampAsset` PNG per kota; angka digambar terpisah di atasnya supaya bisa berubah.

**C. Coretan stabilo**
- Wujud: blok Lime miring setinggi sekitar 58% bagian bawah huruf, ujungnya sedikit miring. Menggantikan semua badge kapsul Lime.
- Dipakai untuk: kata kunci misi ("papan nama"), label tab aktif (garis 6 px di bawah label), dan **satu** kata di judul bila perlu.
- CSS: `background:linear-gradient(176deg,transparent 30%,#D4F25C 30% 88%,transparent 88%);padding:0 3px;-webkit-box-decoration-break:clone;`. Ini hard-stop, bukan gradasi halus.
- Aturan: Lime tidak pernah menjadi satu-satunya penanda status. Tab aktif juga memakai bobot 800 dan ikon Tinta penuh.

**Pendukung (bukan tanda tangan): raster titik.** Pola titik koran (`radial-gradient` 1,3 px per 7 px, putih 22% di atas Kobalt) memudar lewat `mask-image`. Hanya di area tanpa teks kecil. Inilah pengganti lingkaran latar v4, dan maknanya jelas: cetakan koran = kliping.

### 3.5 Perlakuan stiker cutout (ilustrasi SVG, gaya "cetak saring")

Mockup tetap memakai ilustrasi, tanpa foto atau gambar AI (arahan pemilik). Gaya yang diusulkan meniru **cetak saring atau risograph dua tinta di atas stiker vinyl**. Aturannya:

1. **Teknik bentuk**
   - Gambar dari pandangan **tampak depan arsitektural** (elevasi), ditambah satu bidang samping yang menjauh untuk memberi kedalaman.
   - Bidang datar besar dengan `path` (bukan susunan `rect` dan `circle`). Detail mengikuti benda aslinya: lengkung jendela, kisi lonceng, lis atap.
   - **Tidak ada outline hitam keliling**, karena outline tebal di sekeliling bentuk adalah ciri clip-art dan stiker kartun.
2. **Cahaya**: satu arah, dari kiri atas.
   - Sisi bayang memakai warna dasar yang lebih gelap ±15% L, ditimpa **raster halftone** (`<pattern>` titik r ≈1 pada grid 4–5, diputar 28°). Tidak memakai gradasi.
   - Sorot berupa **garis putih tipis 2,4 px** di tepi yang kena cahaya (opasitas 0,9).
3. **Lapis garis tinta**: detail (kusen, jam, lis) digambar sebagai lapisan garis terpisah dengan stroke 2 px (1,4–2,2 untuk detail halus), warna `#1E1B18`, ujung `round`. Seluruh lapisan **digeser 1,2/−0,8 px** dari lapisan warna, seperti cetak saring yang sedikit meleset. Garis hanya untuk detail di dalam bentuk.
4. **Tekstur grain**: filter `feTurbulence` (`fractalNoise`, `baseFrequency` 1,4, 1 oktaf) diubah menjadi bintik gelap lewat `feColorMatrix` (alpha = −3,2·B + 1,32). Bintik dipotong ke bentuk dengan `feComposite in SourceAlpha`. Grain hanya di dalam benda, tidak di tepi putih. Hindari frekuensi < 1, karena hasilnya mirip granit (sudah diuji).
5. **Palet per objek**: maksimal 3 rona + 1 bayang per rona + tinta garis. Warna diambil dari benda aslinya, bukan dari warna kategori. Warna kategori hanya ada di label karcis.
   - Gereja: dinding kapur `#F3EFE6` / `#F7F4EE`, bayang `#D8D1C3` / `#E2DCCF`, atap `#B4472F` / `#8F3622`, kusen `#2E5E57`, garis `#1E1B18`.
   - Mochi: keranjang bambu `#C9A46A` / `#9C7A45`, mochi `#F6F1EA`, `#EFC6CF`, `#CFE0B8` (dugaan: mochi Sukabumi umum dijual dalam keranjang bambu kecil; pemilik perlu memastikan).
   - Angkot: badan dan garis warna sesuai trayek asli Sukabumi. **Belum diketahui**; v4 memakai "angkot ijo" tanpa sumber. Perlu dicek pemilik di lapangan.
6. **Tepi stiker die-cut**
   - Alpha bentuk diperlebar secara membulat: `feGaussianBlur` σ 4, lalu ambang `feFuncA slope=40 intercept=-1.4` (±7 unit). Hasilnya kontur tunggal yang halus. Ini berbeda dengan `paint-order stroke` v4 yang menghasilkan sudut tajam di setiap sambungan bentuk.
   - Tepi diisi putih, lalu diberi dua bayangan: tebal vinyl (geser 2 px, Tinta 22%) dan jatuh (geser 3/10, blur 7, Tinta 20%).
7. **Ukuran**: satu SVG berlaku dari 96 px sampai 460 px (sudah diuji di `uji-gereja.png`). Di bawah 64 px, garis detail berukuran < 1,4 disembunyikan.
8. **Bila foto asli sudah ada**: perlakuan tepi (die-cut putih dan dua bayangan) dan rotasi tetap sama. Grain dan raster tidak diterapkan ke foto.

**Contoh lengkap, gereja bermenara.** Ini acuan gaya, **bukan** gambar akurat Gereja Sidang Kristus. Bentuk aslinya harus digambar ulang dari foto survei pemilik. Id filter perlu diberi awalan unik per stiker bila beberapa SVG ada di satu halaman.

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -14 260 334" width="260" height="334" role="img" aria-label="Ilustrasi stiker gereja bermenara">
  <defs>
    <!-- 1. Tepi stiker die-cut: alpha diperlebar secara membulat (blur + ambang), diisi putih, lalu dua bayangan -->
    <filter id="gsk-stiker" x="-20%" y="-12%" width="140%" height="130%" color-interpolation-filters="sRGB">
      <feGaussianBlur in="SourceAlpha" stdDeviation="4" result="lebar"/>
      <feComponentTransfer in="lebar" result="tepi-alpha"><feFuncA type="linear" slope="40" intercept="-1.4"/></feComponentTransfer>
      <feFlood flood-color="#FFFFFF" result="putih"/>
      <feComposite in="putih" in2="tepi-alpha" operator="in" result="tepi"/>
      <feOffset in="tepi-alpha" dy="2" result="tebal-geser"/>
      <feFlood flood-color="#121212" flood-opacity="0.22"/>
      <feComposite in2="tebal-geser" operator="in" result="tebal"/>
      <feOffset in="tepi-alpha" dx="3" dy="10" result="jauh-geser"/>
      <feGaussianBlur in="jauh-geser" stdDeviation="7" result="jauh-blur"/>
      <feFlood flood-color="#121212" flood-opacity="0.20"/>
      <feComposite in2="jauh-blur" operator="in" result="bayang"/>
      <feMerge><feMergeNode in="bayang"/><feMergeNode in="tebal"/><feMergeNode in="tepi"/><feMergeNode in="SourceGraphic"/></feMerge>
    </filter>
    <!-- 2. Grain cetak: noise hanya di dalam bentuk -->
    <filter id="gsk-grain" x="0" y="0" width="100%" height="100%" color-interpolation-filters="sRGB">
      <feTurbulence type="fractalNoise" baseFrequency="1.4" numOctaves="1" seed="11" result="noise"/>
      <feColorMatrix in="noise" type="matrix" values="0 0 0 0 0.12  0 0 0 0 0.10  0 0 0 0 0.08  0 0 -3.2 0 1.32" result="bintik"/>
      <feComposite in="bintik" in2="SourceAlpha" operator="in" result="grain"/>
      <feMerge><feMergeNode in="SourceGraphic"/><feMergeNode in="grain"/></feMerge>
    </filter>
    <!-- 3. Raster halftone untuk sisi bayang (pengganti gradien) -->
    <pattern id="gsk-raster" width="5" height="5" patternUnits="userSpaceOnUse" patternTransform="rotate(28)">
      <circle cx="2.5" cy="2.5" r="1.05" fill="#9A9282"/>
    </pattern>
    <pattern id="gsk-raster-atap" width="4" height="4" patternUnits="userSpaceOnUse" patternTransform="rotate(28)">
      <circle cx="2" cy="2" r="0.95" fill="#6E2617"/>
    </pattern>
  </defs>

  <g filter="url(#gsk-stiker)">
    <g filter="url(#gsk-grain)">
      <!-- LAPIS WARNA (tinta 1): bidang datar, cahaya dari kiri atas -->
      <!-- dinding samping kanan, menjauh (memberi kedalaman) -->
      <path d="M196 158 L226 170 L226 290 L196 296 Z" fill="#D8D1C3"/>
      <path d="M196 158 L226 170 L226 290 L196 296 Z" fill="url(#gsk-raster)"/>
      <!-- atap samping -->
      <path d="M190 156 L130 104 L162 112 L232 170 Z" fill="#8F3622"/>
      <path d="M190 156 L130 104 L162 112 L232 170 Z" fill="url(#gsk-raster-atap)" opacity=".8"/>
      <!-- fasad utama berpelana -->
      <path d="M44 160 L130 98 L198 158 L198 296 L44 296 Z" fill="#F3EFE6"/>
      <!-- lis atap pelana -->
      <path d="M36 164 L130 94 L206 160 L198 166 L130 108 L46 170 Z" fill="#B4472F"/>
      <!-- menara depan -->
      <path d="M106 64 L154 64 L154 296 L106 296 Z" fill="#F7F4EE"/>
      <path d="M140 64 L154 64 L154 296 L140 296 Z" fill="#E2DCCF"/>
      <path d="M140 64 L154 64 L154 296 L140 296 Z" fill="url(#gsk-raster)" opacity=".55"/>
      <!-- puncak menara (spire) -->
      <path d="M100 66 L130 6 L160 66 Z" fill="#B4472F"/>
      <path d="M130 6 L160 66 L136 66 Z" fill="#8F3622"/>
      <path d="M130 6 L160 66 L136 66 Z" fill="url(#gsk-raster-atap)" opacity=".7"/>
      <!-- jendela lengkung fasad -->
      <path d="M62 266 V214 a10 10 0 0 1 20 0 V266 Z" fill="#2E5E57"/>
      <path d="M178 266 V214 a10 10 0 0 0 -20 0 V266 Z" fill="#2E5E57"/>
      <!-- pintu lengkung -->
      <path d="M116 296 V250 a14 14 0 0 1 28 0 V296 Z" fill="#2E5E57"/>
      <!-- ruang lonceng berkisi -->
      <path d="M118 120 V104 a12 12 0 0 1 24 0 V120 Z" fill="#2B2724"/>
      <!-- jam -->
      <circle cx="130" cy="160" r="12" fill="#FBFAF6"/>
    </g>

    <!-- LAPIS GARIS (tinta 2), sengaja digeser 1.2/-0.8 seperti cetak saring yang meleset -->
    <g transform="translate(1.2 -0.8)" fill="none" stroke="#1E1B18" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M62 266 V214 a10 10 0 0 1 20 0 V266 M72 204 V266 M62 236 H82"/>
      <path d="M178 266 V214 a10 10 0 0 0 -20 0 V266 M168 204 V266 M158 236 H178"/>
      <path d="M116 296 V250 a14 14 0 0 1 28 0 V296 M130 236 V296"/>
      <path d="M120 108 H140 M120 114 H140" stroke-width="1.6"/>
      <circle cx="130" cy="160" r="12"/>
      <path d="M130 152 V160 L136 163" stroke-width="1.8"/>
      <path d="M104 190 H156 M104 196 H156" stroke-width="1.4"/>
      <path d="M130 6 V-4 M125 0 H135" stroke-width="2.2"/>
    </g>
    <!-- SOROT: garis kertas tipis di tepi kiri yang kena cahaya -->
    <g stroke="#FFFFFF" stroke-width="2.4" stroke-linecap="round" opacity=".9" fill="none">
      <path d="M108 70 V290"/>
      <path d="M47 172 V290"/>
      <path d="M104 62 L128 14"/>
    </g>
  </g>
</svg>
```

Catatan performa: filter SVG hanya untuk mockup HTML. Di Flutter, stiker ilustrasi diekspor menjadi WebP (sama seperti cutout), jadi tidak ada filter yang berjalan saat runtime di Infinix Hot 11 Play.

### 3.6 Tata letak per layar

Lebar acuan 360 dp. Margin sisi 16 dp, jarak antarblok 16 dp, spasi kelipatan 4.

**Beranda** (struktur v4 dipertahankan, rupanya diganti). Sketsa: `beranda-v5.png`.

```
┌──────────────────────────────────────┐
│ Beranda (H1 28)        [ Sukabumi ▾ ] │  tombol kota: outline 2px, radius 4
│ ┌──────────────────────────────────┐  │  HERO = kliping Kobalt, rotasi −1°, radius 2
│ │ SUKABUMI   (Anybody 50/900 64)   │░░│  raster titik memudar dari kanan atas
│ │ 13 /100 temuan                   │  │  13 = 55/900 44 · /100 = 140/300 24
│ │                         ┌──────┐ │  │
│ │ [■■□□□□□□□] outline 2px │stiker│ │  │  stiker landmark terbaru menembus
│ └─────────────────────────┤gereja├─┘  │  tepi kanan-bawah, rotasi +7°
│                           └──────┘    │
│ ┌──── karcis LIME ─────┬N┐ ┌─ karcis putih ─┬S┐│
│ │ (◉)                  │o│ │ Misi minggu ini │I│ │  sobekan 30px, teks vertikal
│ │ POTRET               │.│ │ Potret 5 ▓papan │S│ │  ▓ = stabilo
│ │ SEKARANG             │0│ │ nama▓  2/5      │A│ │
│ └──────────────────────┴─┘ └─────────────────┴─┘│
│ Baru ditempel (H2 20)          Buka buku │  tautan Kobalt bergaris bawah, tanpa panah
│   ╱stiker╲    ╱stiker╲    ┌ ─ ─ ─ ┐     │  stiker lepas, rotasi ±4°, tanpa tile
│  [Bangunan]  [Makanan]    tempel        │  label = karcis kategori kecil
│                           berikutnya    │  slot kosong: garis putus + Nanum Pen
│ ═══════════════════════════════════════ │  garis atas nav 2px Tinta
│ Beranda  Buku   (◉)   Misi   Profil     │  rana Kobalt 52px menonjol 18px
│ ▓▓▓▓▓▓                Potret            │  tab aktif: 800 + stabilo 6px
└──────────────────────────────────────┘
```

- Hanya hero yang berwarna penuh; karcis Lime adalah satu-satunya aksen kedua.
- Hapus sapaan "Halo, Nadia": sapaan nama adalah pola template. H1 cukup "Beranda".
- Ikon navigasi digambar ulang dengan 2 px, ujung persegi:
  - Beranda: rumah beratap pelana;
  - Buku: buku terbuka dengan sudut selotip;
  - Potret: bilah rana;
  - Misi: **karcis berlubang** (bukan target);
  - Profil: **kartu identitas** (bukan siluet orang), merujuk ke halaman identitas buku (spesifikasi §4.5).

**Kamera**
- Jendela bidik penuh layar. Overlay skin adalah **bodi kamera**:
  - pelat atas `#2B2B30` bertuliskan "SAKU 35" (Anybody 140%/800 14 px, putih 14,08);
  - **jendela penghitung film** di kanan atas berisi nomor temuan berikutnya "14" (Lime di Tinta 14,86).
- Bingkai: **tanda potong** di 4 sudut (garis putih 2 px, panjang 24 px), bukan border membulat.
- Deteksi kategori: karcis kategori meluncur dari kiri atas, misalnya "Bangunan" dengan ikon.
- Panel bawah Tinta:
  - pemilih skin berupa **deretan bodi kamera mini** 64×44 (ilustrasi tiap skin), nama 13 px putih di bawahnya;
  - skin terkunci tampil dengan gembok dan "Segera" `#B4B4BE` (9,11);
  - rana bulat putih 72 px dengan cincin Kobalt 4 px;
  - di kiri, temuan terakhir sebagai stiker mini miring.

**Temuan**
- Header: tombol kembali 44 px (outline 2 px, radius 4) dan H1 "Temuan baru".
- Stiker besar di atas **alas potong**: putih dengan grid 16 px garis `#EDEDF0` dan angka penggaris 11 px dekoratif di tepi. Tombol "Rapikan potongan" (outline) di pojok kanan bawah alas.
- Pertanyaan landmark sebagai **karcis Kobalt**:
  - "Kamu dekat landmark" (14/700 `#DCE1FF`);
  - "Ini Gereja Sidang Kristus?" (Anybody 75/800 22 putih);
  - tombol "Ya, betul" (Lime, Tinta) dan "Bukan" (outline putih 2 px, teks putih).
- Kategori: deretan karcis kategori. Yang terpilih memakai isi warna, outline 2 px, dan tanda centang; lainnya putih dengan outline 1,5 px.
- Tombol bawah "Tempel ke buku": Kobalt, 56 px, radius 4, lebar penuh.

**Sukses** (layar momen gerak, §3.7)
- Latar `paper.book` dengan grain; tidak lagi biru dan tidak ada lingkaran.
- Kliping halaman dengan stiker tertempel, dua selotip, dan **cap pos Kobalt** yang menimpa sudut kliping.
- Di bawahnya:
  - "Tertempel." (Anybody 60/900 56);
  - "Sukabumi sekarang 13 dari 100 temuan." (16);
  - bila temuan itu landmark: karcis kecil "Landmark 5/25". Progres landmark boleh tampil di aplikasi (K-028), tetapi tidak di kartu share.
- Tombol: "Bagikan" (Kobalt), "Lihat di buku" (outline), tautan "Potret lagi".

**Buku**
- Halaman `paper.book` dengan grain dan tiga garis tumpukan halaman 1 px di tepi kanan. Bayangan jilid di kiri berupa raster, bukan gradasi. Sudut tajam.
- Header: kembali, "Sukabumi" (H2), dan "hlm. 11" (13 px `#5B5B66`). Pil "12/100" dihapus, karena angka itu tempatnya di cap pada halaman pembatas.
- Stiker:
  - rotasi ±4°;
  - **1–2 selotip per stiker** (`tape`), di sudut atau tepi atas (acuan `halaman-buku.md`);
  - keterangan Nanum Pen 24 px berwarna Kobalt (pulpen) atau Tinta, dengan rotasi berbeda per keterangan (−3° s/d +2°).
- Nomor halaman kecil di tengah bawah (Anybody 13).
- Navigasi halaman: **strip miniatur halaman** 40×56 dengan nomor di bawahnya, bukan kotak angka. Halaman aktif memakai outline 2 px Tinta dan stabilo di bawah nomor.
- Tombol bawah: "Daftar isi" (outline) dan "Bagikan halaman" (Kobalt).

**Misi**
- H1 "Misi".
- **Karcis Lime lebar penuh**:
  - isi kiri "Potret 5 papan nama atau tulisan" (Jakarta 700 18) dan karcis kategori "Papan nama";
  - **5 lubang pons** (lingkaran 22 px): yang sudah = lubang tembus (lingkaran putih bergaris Tinta 2 px), yang belum = lingkaran putus Tinta;
  - sobekan kanan berisi "2/5" (Anybody 44) dan "SISA 4 HARI";
  - tombol "Potret papan nama" (Tinta, teks putih);
  - "Hadiah: selotip motif untuk bukumu" (13/500 `#5B5B66` di Lime 5,32).
- **Lencana sebagai koleksi cap**: grid 3 kolom. Lencana yang didapat = cap Kobalt dengan rotasi acak. Yang belum = cincin putus `#5B5B66` dengan progres "5/25" di bawahnya. Ini menggantikan daftar baris berkotak warna.

**Bagikan**
- Pratinjau kartu di atas alas potong (putih + grid).
- Tiga **tab karcis** "Halaman · Temuan · Stiker". Yang terpilih memakai isi Lime dan outline 2 px; lainnya putih dengan outline 1,5 px.
- Baris privasi: "Hanya nama kota yang ikut. Data lokasi foto dihapus." (15 `#5B5B66`).
- Tombol "Simpan" (outline) dan "Ke Stories" (Kobalt).

**Kartu share 1080×1920.** Sketsa: `kartu-v5.png`.

```
┌──────────────── 1080 ────────────────┐
│          zona aman atas 270          │  Kobalt polos
│    ┌────────── 840 × 970 ─────────┐  │
│    │ ╱‾‾‾ kliping paper.book ‾‾‾╲ │  │  740×780, rotasi −2.5°, bayangan
│    │ ( CAP )≈≈≈≈      ▭selotip   │ │  │  cap Kobalt di DALAM kertas, −9°
│    │ (SUKABUMI 13/100)            │ │  │  (format K-028)
│    │        ╱ stiker ╲            │ │  │
│    │       │  temuan  │[Bangunan] │ │  │  karcis kategori, bukan nama landmark
│    │        ╲________╱            │ │  │
│    │  ▭ menara jam, sore hari     │ │  │  Finding.note, Nanum Pen 64 Kobalt
│    │ ╲____________________________╱ │  │
│    │ KLIPING                       │  │  Anybody 50/900 64 putih
│    │ KOTA          kamera Saku 35  │  │  Jakarta 700 28 putih (watermark kamera)
│    └──────────────────────────────┘  │
│ ░░░ raster titik memudar (dekoratif) ░░│  zona aman bawah 680: tanpa info
└──────────────────────────────────────┘
```

- Wajib (acuan `kartu-share.md`): stempel kota, watermark kamera, EXIF/GPS dihapus.
- **Tidak memuat**:
  - progres landmark (K-028);
  - nama landmark atau tempat (K-011, sesuai acuan "tidak pernah nama tempat yang lebih rinci");
  - tanggal, jam, atau provinsi.
- Judul kartu adalah keterangan buatan pengguna. Bila kosong, pakai nama kategori.
- Varian "stiker transparan" (riset Strava) memakai stiker, cap, dan watermark yang sama di atas latar transparan.

**Tambahan 18 Nov: Bagikan dengan 10 gaya kartu.** Pemilik meminta kartu share yang beragam, karena kartu inilah yang dilihat calon pengguna. Dasar: `docs/riset/2026-11-18-kartu-share-viral.md`. Layar Bagikan di atas diganti oleh rancangan berikut (belum diputuskan, lihat Q-023 dan Q-024).

- **Layar Bagikan** (`V5Bagikan`): pratinjau kartu yang digeser horizontal untuk berganti gaya, dengan nama gaya dan "4 dari 10"; chip warna Kobalt, Tinta, Lime, Kertas, warna Kategori, dan tombol Acak; segmen format Story 9:16, Feed 3:4, Stiker, Video (format yang tidak cocok dinonaktifkan beserta alasannya); tujuan WhatsApp, IG Stories, TikTok, Simpan, Lainnya; kalimat privasi di dekat tombol.
- **Pilih gaya** (`V5BagikanGaya`): kisi 10 gaya. Gaya yang belum terbuka (Tonggak) tampil redup dengan alasan "Muncul di 25 temuan", tanpa ajakan berbagi demi hadiah.
- **10 gaya**: 1 Halaman Kliping (`V5KartuShare`), 2 Video Buka Halaman (`V5ShareVideo`), 3 Stiker Temuan (`V5BagikanStiker`), 4 Temuan Tunggal (`V5ShareTunggal`), 5 Kartu Pos Kota (`V5SharePos`), 6 Sukabumi-ku dalam 4 (`V5ShareEmpat`, feed: `V5ShareEmpatFeed`), 7 Label Pemburu (`V5ShareLabel`), 8 Tonggak Stempel (`V5ShareTonggak`), 9 Cuci Cetak Mingguan (`V5ShareCetak`), 10 Tambah Punyamu (`V5ShareTambah`).
- **Aturan bersama semua gaya**: stempel kota dan watermark "Kliping Kota · <kamera>" selalu ada (§4.8); lokasi hanya nama kota (K-011); tanpa progres landmark (K-028); tanpa nama landmark sampai Q-018 diputuskan; zona aman atas 270 dan bawah 680 bebas informasi.
- **Unsur baru yang perlu diputuskan**: tinta cap di atas warna kategori, wujud cap tonggak 25/50/100 dengan aksen emas `#E0A526` (hanya di gaya 8), dan format Feed 3:4 serta Stiker di luar spesifikasi §4.8.
- Screenshot: `usulan-v5/V5Bagikan.png`, `usulan-v5/V5BagikanGaya.png`, `usulan-v5/V5BagikanStiker.png`, dan `usulan-v5/V5Share*.png` (versi tanpa garis zona aman).

### 3.7 Satu momen gerak: "Cap!"

Terjadi saat menekan "Tempel ke buku", dari Temuan ke Sukses. Total ±1,1 detik.

1. **0–250 ms**: stiker terangkat dari alas potong (skala 1 ke 1,06, bayangan jatuh membesar).
2. **250–550 ms**: stiker meluncur ke kliping halaman dan berputar ke rotasi penempatannya (ease-out dengan sedikit lewatan, ≤3%).
3. **550–720 ms**: dua selotip "ditarik" (scaleX 0 ke 1 dari satu ujung, 80 ms per selotip, berselang 40 ms), disertai suara sobek selotip.
4. **720–950 ms**: **cap pos turun** (skala 1,25 ke 0,97 ke 1; opasitas 0 ke 1). Tinta muncul lewat masker noise yang sudah dirender sebelumnya, disertai bunyi "tok" dan haptic ringan.
5. **950–1100 ms**: angka di cap berganti 12 ke 13 dengan **flip vertikal** seperti penghitung film. Penghitung yang sama juga dipakai di kamera dan hero Beranda.

Teknis:
- hanya `transform` dan `opacity`, supaya tetap 30 fps di Infinix Hot 11 Play (K-016);
- suara mengikuti K-024/K-030;
- bila *reduce motion* aktif: crossfade 200 ms tanpa gerak.

Momen ini menggantikan semua animasi kecil lain. Layar lain hanya memakai transisi standar.

### 3.8 Draf token (untuk Q-017; **tidak** ditulis ke `data/design-tokens.json`)

Semua berstatus `placeholder` sampai pemilik memutuskan:
- `color.action.primary` = `#3048FF`, `color.highlight` = `#D4F25C`
- `color.ink.primary` = `#121212`, `color.ink.secondary` = `#5B5B66`
- `color.paper.screen` = `#FFFFFF`, `color.paper.book` = `#F6F5F1`, `color.paper.muted` = `#EDEDF0`, `color.paper.tape` = `#EBE8DC`
- `color.category.<id>` = 9 nilai di §3.1
- `typography.display` = Anybody, `typography.handwriting` = Nanum Pen Script
- `radius.ticket` = 4, `radius.paper` = 2
- `border.ink` = 2

Skema `data/schema/design-tokens.schema.json` perlu dicek apakah menerima grup `category`, `highlight`, dan `border`. Belum diperiksa, karena file tidak boleh disentuh di tugas ini.

---

## 4. Daftar "jangan" untuk v5

1. Jangan memakai radius 12–32 px atau kapsul untuk kartu, tombol, dan chip. Lingkaran hanya untuk benda bulat (rana, cap, avatar, lubang pons).
2. Jangan memakai lingkaran, blob, atau gradasi dekoratif di latar. Tekstur latar hanya raster titik (bermakna cetakan) dan grain kertas.
3. Jangan memakai badge kapsul Lime. Lime hanya untuk stabilo, karcis Potret, tombol "Ya, betul", dan isi progres.
4. Lime tidak boleh menjadi teks, dan tidak boleh menjadi satu-satunya penanda status di atas putih atau kertas.
5. Jangan menaruh teks < 18,7 px tebal (atau < 24 px biasa) di atas raster titik.
6. Jangan memakai bayangan pada tombol, karcis, atau kartu UI. Bayangan hanya untuk stiker dan kliping.
7. Jangan memakai bayangan offset keras ala neo-brutalism (`4px 4px 0 #000`).
8. Jangan memakai outline hitam keliling pada ilustrasi stiker, susunan primitif `rect`/`circle` tanpa detail benda, gradasi linear pada ilustrasi, atau satu SVG yang sama untuk dua benda berbeda.
9. Jangan memakai maskot, wajah, emoji, konfeti, bintang, atau kilau "sparkle" (K-017).
10. Jangan memakai huruf monospace untuk nomor seri atau angka (default AI). Nomor seri memakai Anybody.
11. Jangan memakai eyebrow kapital berjarak lebar di atas judul. Kapital hanya di karcis, sobekan, dan cap, dengan letter-spacing ≤0,5 px.
12. Jangan memakai deretan meta dengan titik tengah ("Sukabumi · Jawa Barat · 18 Nov"), dan jangan menaruh panah di ujung tautan.
13. Jangan menaruh nama landmark, progres landmark, provinsi, tanggal, atau jam di kartu share (K-011, K-028).
14. Jangan memakai ikon target untuk Misi atau siluet orang untuk Profil.
15. Jangan memakai sapaan nama ("Halo, Nadia") sebagai pembuka layar.
16. Jangan memakai lebih dari satu elemen tanda tangan sebagai fokus dalam satu layar (cap di hero Beranda sudah diuji dan gagal).
17. Jangan memakai Unbounded, Caveat, Inter, Space Grotesk, Bebas Neue, atau Oswald.
18. Jangan kembali ke latar krem (`#F3EEE4` dan sejenisnya) untuk layar UI. Warna kertas hanya untuk buku.

---

## 5. Pemeriksaan ulang terhadap daftar default AI

Daftar dari `docs/riset/2026-11-18-desain-ui-anti-ai-slop.md`:

| Default AI | Status v5 | Catatan |
|---|---|---|
| Inter, Roboto, Arial, font sistem | Bersih | Anybody, Plus Jakarta Sans, Nanum Pen Script |
| Favorit baru (Space Grotesk dan sejenisnya) | Bersih | Kandidat Bebas Neue dan Oswald sengaja tidak diuji karena termasuk default huruf sempit. Archivo diuji tetapi terlalu netral (`spesimen.png`) |
| Gradasi ungu di atas putih | **Risiko kecil** | Kobalt `#3048FF` adalah biru keunguan. Dimitigasi: selalu warna datar, tanpa gradasi, dan diberi peran "tinta cap" yang konkret. Bila pemilik merasa masih "AI", alternatifnya biru lebih dingin `#1F4BFF`; kontras putih perlu dihitung ulang |
| Latar krem + aksen terakota | **Sempat masuk, diganti** | `paper.book` awalnya mendekati krem. Diganti `#F6F5F1` (abu hangat sangat muda) dan dibatasi ke buku saja. Terakota hanya muncul sebagai warna atap di ilustrasi (warna benda), bukan aksen UI |
| Kartu SaaS membulat identik dengan bayangan abu | Bersih | Karcis bertakik, kliping bersudut tajam, tanpa bayangan UI |
| Gradasi tipis menyeluruh | Bersih | Stabilo memakai hard-stop. Raster memakai `mask-image` memudar, tetapi isinya pola titik, bukan gradasi warna |
| Eyebrow kapital berjarak lebar | **Sempat masuk, diganti** | Draf awal karcis Misi memakai label "MISI MINGGU INI" berkapital. Diganti kalimat biasa "Misi minggu ini". Kapital dipindah ke sobekan vertikal |
| Meta bertitik tengah | **Sempat masuk, diganti** | Rencana awal teks melengkung di cap: "KOTA SUKABUMI · JAWA BARAT". Diganti "SUKABUMI" di atas dan "KLIPING KOTA" di bawah. Ini juga menghapus provinsi demi K-011 |
| Label monospace | **Sempat dipertimbangkan, ditolak** | Nomor seri "No. 014" awalnya akan memakai mono ala mesin karcis. Diganti Anybody 70%/700 |
| Panah di ujung tautan | Bersih | "Buka buku" memakai garis bawah tanpa panah |
| Pola "angka besar + label kecil + aksen gradasi" | **Sebagian ada, dipertahankan dengan sadar** | Hero memakai "13 /100 temuan". Dipertahankan karena progres kota adalah tujuan utama layar (goal-gradient, kritik v3 #1). Aksen gradasinya dihapus, dan angka dipasangkan dengan nama kota sempit-tebal sehingga terbaca sebagai cap atau papan, bukan kartu statistik |
| Neo-brutalism (bayangan offset keras) | **Sempat dipertimbangkan, ditolak** | Sempat dipertimbangkan untuk tombol agar terasa "cetak". Ditolak karena kini juga jadi gaya bawaan, dan bertentangan dengan aturan "UI datar, benda berbayangan" |
| Satu momen gerak, bukan efek tersebar | Bersih | Hanya "Cap!" |

Perubahan lain setelah meninjau render (bukan dari daftar, tetapi ditemukan saat menguji):
- **Cap pos dihapus dari hero Beranda**: menumpuk dengan bilah progres dan angka tidak terbaca di 120 px.
- **Cap di kartu share dipindah utuh ke kertas** dengan tinta Kobalt: Lime di kertas hanya 1,16.
- **Grain diperhalus** (`baseFrequency` 0,95 ke 1,4, 1 oktaf): versi pertama terlihat seperti granit.
- **Raster dimasker dari area teks kecil**: putih di titik raster hanya 4,01.
- **Sobekan karcis Misi dilebarkan ke 30 px tetap**, karena teks menabrak garis sobek saat memakai persentase.
- **Karcis kategori di kartu share dipindah** supaya tidak menimpa keterangan.

---

## Perlu dicatat (untuk koordinator dan pemilik)

1. **Usulan K- (lewat Q-017):** arah v5 "Karcis & Kliping" menggantikan sebagian K-021 (diputuskan sebagai K-035, yang menggantikan K-021): palet inti, 9 warna kategori, Anybody + Plus Jakarta Sans + Nanum Pen Script, radius 0/2/4, tiga elemen tanda tangan, dan aturan "UI datar, benda berbayangan".
2. **Konflik yang perlu baris Q- baru** (tidak saya tulis, karena `docs/pertanyaan.md` di luar file yang boleh saya sentuh):
   - (a) Apakah nama landmark boleh tampil di kartu share? Acuan `kartu-share.md` menyebut lokasi hanya nama kota, "tidak pernah ... nama tempat yang lebih rinci" (K-011), sementara v4 menampilkannya.
   - (b) Acuan `kartu-share.md` masih menetapkan latar `paper.base` dan font Fraunces (K-021, kini digantikan K-035). v4 dan v5 sama-sama menyimpang, jadi acuan harus diperbarui bila Q-017 diputuskan.
   - (c) Warna 4 kategori baru (K-020) belum pernah diputuskan.
3. **Fakta yang perlu dicek pemilik di lapangan:**
   - rupa asli Gereja Sidang Kristus dan Gedung Capitol, untuk menggambar ulang ilustrasi;
   - warna angkot trayek Sukabumi;
   - kemasan mochi Sukabumi (dugaan: keranjang bambu).

## Checklist `desainer-visual` (dicentang jujur)

- [~] Setiap usulan dibandingkan dengan acuan aktif terkait, atau acuan draf dibuat lebih dulu. Belum ada acuan berstatus aktif. Kartu share dan halaman buku dibandingkan dengan acuan draf (`kartu-share.md`, `halaman-buku.md`). Untuk layar kamera, pembatas bab, dan sampul **belum ada acuan draf, dan tidak saya buat** karena tugas ini dibatasi ke laporan usulan.
- [x] Tidak masuk anti-acuan: tidak ada maskot atau kartun, neon generik, atau grid kaku. Stiker diberi rotasi dan selotip, dan karcis memakai sudut 4 px.
- [~] Nilai baru masuk token: nilai dirumuskan sebagai draf token (§3.8), tetapi **tidak** ditulis ke `data/design-tokens.json` sesuai batas brief. `node scripts/cek-hq.mjs` tidak dijalankan karena tidak ada perubahan file repo.
- [x] Token yang belum disetujui pemilik tetap `placeholder`: semua usulan ditandai placeholder, dan file token tidak disentuh.
- [x] Kontras teks utama diperiksa dan rasionya ditulis: semua pasangan di §3.1 ≥4,5, atau ≥3 untuk teks besar yang dibatasi eksplisit.
- [x] Kartu share tidak memuat lokasi selain nama kota: v5 bahkan membuang nama landmark dan provinsi.

**Tambahan 18 Nov: kamera berbodi, etalase, dan toko.** Pemilik meminta setiap kamera memakai overlay bodi dan efeknya sendiri, ditambah halaman memilih dan membeli kamera serta desain pembelian. Brief bersama, katalog kamera, dan aturan anti-dark-pattern ada di mockup; keputusan yang dibutuhkan ada di Q-025. Riset: `docs/riset/2026-11-18-monetisasi-kosmetik.md`.

- **Kamera berbodi** (`V5Kamera`, `V5KameraKotakPos`, `V5KameraKoran`): seluruh layar adalah punggung kamera. Jendela bidik adalah layar LCD di bodi. Timer, Zoom, dan Balik menempel di bodi, tombol rana fisik ada di bawah, hasil terakhir di kiri bawah, dan "Ganti kamera" di kanan bawah. Bodi digambar dengan gaya cetak saring, dan bentuk tiap kamera berbeda, bukan hanya warnanya. Efek (LUT) dipratinjau di jendela bidik: Saku 35 CCD hangat, Kotak Pos pop, Koran hitam-putih kasar.
- **Coba dulu** (`V5KameraCoba`, toko dibuka): kamera berbayar bisa dicoba lengkap dengan bodi dan efeknya. Tombol rana diganti "Beli Rp39.000", dengan jalan keluar yang sama besar "Pakai kamera gratis".
- **Etalase toko kamera** (`V5RakKamera` untuk MVP, `V5RakKameraToko` setelah toko dibuka): etalase kaca toko kamera pasar dengan label karcis. Di MVP, 4 kamera gratis bisa langsung dipakai, dan 3 kamera tampil "Segera hadir" dengan tombol "Kabari saya" yang hanya mencatat minat (spesifikasi §4.2, K-007).
- **Detail dan sukses beli** (`V5KameraDetail`, `V5KameraBeli`): perbandingan "Tanpa efek / Layar Tancap", tombol putar suara rana, daftar isi kamera, lalu layar sukses dengan cap "MILIKMU". Pembayaran dikonfirmasi di lembar Google Play / App Store, dan mockup tidak menggambar lembar sistem.
- **Toko** (`V5Toko`, `V5PaketTema`, `V5PasKolektor`, `V5Pembelian`): toko diawali kalimat tentang apa yang gratis selamanya. Isinya Pas Kolektor (kartu anggota, perbandingan jujur tanpa harga coret), kamera satuan, dan paket tema buku (contoh: Pasar Malam). Pembelian di Profil menampilkan riwayat, tombol Pulihkan pembelian, dan cara uang kembali lewat toko aplikasi.
- Ilustrasi 9 kamera tampak depan dibuat sendiri tanpa merek: Saku 35, Kotak Pos, Koran, Pagi, Hujan, Kilat, Layar Tancap, Studio Foto, Warung.
- Screenshot: `usulan-v5/V5Kamera*.png`, `usulan-v5/V5Rak*.png`, `usulan-v5/V5Toko.png`, `usulan-v5/V5PaketTema.png`, `usulan-v5/V5PasKolektor.png`, `usulan-v5/V5Pembelian.png`.

**Tambahan 19 Nov: halaman toko lengkap (K-033, K-034).** Toko ada di luar MVP (K-034), tetapi semua halamannya disiapkan agar tinggal dieksekusi saat toko dibuka.

- **Semua kamera berbodi**: Pagi (`V5KameraPagi`, gratis), Kilat (`V5KameraKilat`, contoh kamera yang sudah dimiliki), serta mode Coba dulu untuk Hujan, Studio Foto, dan Warung (`V5KameraCoba*`).
- **Detail per kamera** (`V5KameraDetail*`). Status pembayaran memakai dua layar: **tertunda** (`V5BeliTertunda`: menunggu bayar di minimarket/e-wallet, terpasang otomatis, tidak ditagih dua kali) dan **gagal/dibatalkan** (`V5BeliGagal`: "Tidak ada tagihan", "Coba lagi" setara dengan "Kembali ke etalase").
- **Toko lengkap**: paket tema Stasiun dan Hujan Sore (`V5PaketTemaStasiun`, `V5PaketTemaHujan`), coba paket di sampul (`V5CobaPaket`: sampul kembali ke template lama bila tidak dibeli), sukses Pas Kolektor (`V5PasKolektorSukses`), hasil pulihkan (`V5PulihkanHasil`), dan Profil versi toko dengan baris Toko dan Pembelian (`V5AkunToko`).
- **Label Pemburu dipilih pengguna** (K-033): `V5BagikanLabel` berisi 9 kategori dalam urutan tetap dengan jumlah temuan dan tanpa pilihan yang sudah terpilih. Kategori tanpa temuan tampil redup. Kalimat privasi baru dipasang di `V5Bagikan` dan `V5BagikanStiker`.
- Isi contoh yang belum konsisten: Toko dan Pas Kolektor menggambarkan keadaan sebelum Layar Tancap dibeli, sedangkan Pembelian dan Pulihkan menggambarkan keadaan sesudahnya. Layar sukses beli masih memakai contoh Layar Tancap untuk semua kamera.
