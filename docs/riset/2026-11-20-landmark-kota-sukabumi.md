# Kandidat landmark Kota Sukabumi (kurasi meja)

> Diriset: 2026-11-20 · Oleh: kurator-katalog
> Cek ulang sebelum dipakai untuk keputusan baru: status cagar budaya (daftar resmi bisa bertambah), akses publik Rumah Tahanan Hatta–Sjahrir, kondisi Gedung Capitol dan Pemandian Cikundul (rencana renovasi), jam buka museum, dan semua koordinat (belum disurvei).
> Dipakai oleh: `data/cities.json` (K-029, K-011, K-028)

## Pertanyaan

Objek mana di dalam batas administratif Kota Sukabumi (Baros, Cibeureum, Cikole, Citamiang, Gunungpuyuh, Lembursitu, Warudoyong) yang layak menjadi 20–30 landmark kurasi (spesifikasi §4.4)? Untuk setiap objek dicari koordinat titik publik, radius, kategori (K-020), dan fakta bersumber. Semua hasil adalah pekerjaan meja. Pemilik menyurvei setiap titik dan hanya pemilik yang menandai `verified: true`.

## Metode

- **Batas kota.** Poligon relasi OSM 14918119 (Nominatim, `place_rank` 12, kotak batas lat −6,97892 s/d −6,89242, lng 106,87167 s/d 106,96017). Setiap titik diuji dengan uji titik-dalam-poligon (ray casting), dan semua 21 titik berada di dalam. Kecamatan diambil dari alamat di sumber, lalu dicocokkan dengan daftar kelurahan di https://id.wikipedia.org/wiki/Daftar_kecamatan_dan_kelurahan_di_Kota_Sukabumi (diakses 2026-11-20). Status: **terbukti** (perintah dijalankan) untuk poligon OSM. Poligon OSM sendiri belum dibandingkan dengan peta resmi BIG.
- **Koordinat.** Sumber utamanya Nominatim (`/search` dan `/lookup` dengan `extratags`), Photon (komoot, berbasis data OSM), Wikidata (SPARQL `wikibase:box` + `Special:EntityData`), dan geotag foto Wikimedia Commons. Bila sumber berbeda, dipakai fitur OSM yang memetakan bangunan atau titik objek itu sendiri. Selisih lebih dari 50 m dicatat. Overpass API gagal dua kali (tunnel proxy tertutup), jadi tidak dipakai.
- **Radius.** Ditentukan dari ukuran objek, lalu dikecilkan bila objek tetangga dekat. Jarak antarpasangan dihitung dengan rumus haversine. Tidak ada pasangan yang jumlah radiusnya melebihi jaraknya (lihat tabel jarak). Semua radius ≤ 120 m, jadi tidak ada radius > 300 m yang perlu dijelaskan.
- **Fakta.** Setiap fakta diambil dari halaman yang dibaca langsung (WebFetch). Semua 25 URL sumber mengembalikan HTTP 200 pada 2026-11-20.

## Temuan

- **Daftar resmi 21 ODCB tidak ditemukan daring.**
  - Kadisdikbud menyebut ada 21 objek diduga cagar budaya. Stasiun dan bangunan Setukpa Polri disebut sebagai contoh. Tiga objek dibawa ke sidang penetapan Desember 2023: Balai Kota, Rumah Tahanan Hatta–Sjahrir, dan Gereja Sidang Kristus.
  - Sumber: https://kdp.sukabumikota.go.id/2023/12/diseminasi-cagar-budaya.html , https://www.sukabumiupdate.com/sukabumi/131891/3-cagar-budaya-baru-di-kota-sukabumi-segera-ditetapkan-ini-daftarnya (diakses 2026-11-20)
  - Gereja Sidang Kristus dan Rumah Tahanan Hatta–Sjahrir dilaporkan sah ditetapkan. Untuk Balai Kota, berita yang dibaca tidak tegas: judul fokusmedianews menulis "ditetapkan", tetapi isinya menyebut "akan dikaji".
  - Sumber: https://www.detik.com/jabar/budaya/d-7074676/gereja-sidang-kristus-sukabumi-ditetapkan-jadi-cagar-budaya , https://www.detik.com/jabar/budaya/d-7073608/sah-rumah-tahanan-bung-hatta-sjahrir-di-sukabumi-jadi-cagar-budaya , https://fokusmedianews.com/tiga-bangunan-di-kota-sukabumi-ditetapkan-sebagai-cagar-budaya-salah-satunya-balai-kota/ (diakses 2026-11-20)
  - Oktober 2024: Sekolah BPK Penabur dan Yuwati Bhakti masuk sidang penetapan.
  - Sumber: https://kdp.sukabumikota.go.id/2024/10/dua-bangunan-diduga-cagar-budaya.html (diakses 2026-11-20)
  - Radar Sukabumi (2017) mencatat delapan bangunan tertua dengan nama Belandanya: Soekaboemi Treinstation, Moskee te Soekaboemi, Pinkstergemeente, Rooms-katholieke kerk, Bethelkerk, Bataksche kerk, Onderstation Lemboersitoe, dan Politieschool.
  - Sumber: https://radarsukabumi.com/berita-utama/inilah-delapan-bangunan-tertua-di-kota-sukabumi/ (diakses 2026-11-20)
  - Agustus 2026: pendataan sementara menemukan sedikitnya 47 bangunan bersejarah di Citamiang, Warudoyong, dan Gunungpuyuh. Rute heritage walk sekitar 3,5 km juga direncanakan.
  - Sumber: https://bernas.id/nasional/news/jejak-kolonial-sukabumi-disulap-jadi-rute-heritage-walk (diakses 2026-11-20)
- **Selisih data yang ditemukan.**
  - Tahun berdiri Masjid Agung berbeda-beda antarsumber: 1836 (id.wikipedia), 1890 (skripsi UIN Sunan Kalijaga), dan 1935 (detikJabar). Tahun berdiri tidak dipakai sebagai fakta.
  - Wikipedia menulis Museum Tionghoa "resmi berdiri pada 29 Februari 2022", padahal tanggal itu tidak ada karena 2022 bukan tahun kabisat. Fakta memakai Antara (21 Feb 2022, "baru saja diresmikan").
  - Koordinat Wikidata untuk Museum Tionghoa, Museum Pegadaian, dan Museum Ki Pahare (seri Q1157765xx–Q1157768xx) meleset ke barat sejauh 260–470 m dari bangunan OSM, sementara lintangnya sama. Kemungkinan ada galat bujur saat impor (**dugaan**), jadi koordinat OSM yang dipakai.
  - Wikidata "Selabintana Hotel" (Q115795638) bertitik di pusat Kota Sukabumi, padahal Grand Hotel Selabintana berada di Kabupaten (Kadudampit). Data itu diabaikan.

### Tabel kandidat (21)

Koordinat ditulis lat, lng dengan 5 desimal. "OSM W/N" berarti way atau node OpenStreetMap. Status cagar budaya (CB) hanya diisi bila ada sumbernya.

| # | id | Nama | Kecamatan (kelurahan) | Kategori | Koordinat | Sumber koordinat | Radius | Status CB | Sumber fakta |
|---|---|---|---|---|---|---|---|---|---|
| 1 | `sukabumi-stasiun` | Stasiun Sukabumi | Cikole (Gunungparang) | building | −6,92497, 106,92962 | OSM W285843873. Wikidata Q2753694 selisih < 10 m. Geotag foto Commons di peron | 70 | Disebut contoh ODCB (KDP 2023) | id.wikipedia Stasiun_Sukabumi; id.wikipedia Kota_Sukabumi |
| 2 | `sukabumi-masjid-agung` | Masjid Agung Kota Sukabumi | Cikole (Gunungparang) | building | −6,92122, 106,92532 | Wikidata Q138505743. OSM hanya punya Perpustakaan Masjid Agung (W1124737637), ±50 m ke barat | 30 | Tidak diketahui (Radar 2017: bangunan tertua) | detik d-6025250 |
| 3 | `sukabumi-alun-alun` | Alun-alun Kota Sukabumi | Cikole (Gunungparang) | building | −6,92152, 106,92587 | OSM N13272567501 "Monumen Alun alun". Taman W285843697 ±17 m. Commons "Tugu Lapang Merdeka dan Alun-Alun" ±5 m | 35 | – | detik d-7975516; id.wikipedia Masjid_Agung_Sukabumi |
| 4 | `sukabumi-lapang-merdeka` | Taman Kota Lapang Merdeka | Cikole (Gunungparang) | plant | −6,91972, 106,92675 | OSM N9738093433 | 60 | – | detik d-6586768 |
| 5 | `sukabumi-gedung-juang-45` | Gedung Juang '45 | Cikole (Gunungparang/Selabatu) | building | −6,91891, 106,92753 | OSM W1123676979 (tag museum, operator Pemkot). **Ada duplikat**: OSM W1123963764 ±95 m dan Wikidata Q115776803 P625 ±210 m | 40 | Wikidata Q115788802 menyebutnya "salah satu cagar budaya" (tanpa rujukan) | detik d-7032332; detik d-7975516 |
| 6 | `sukabumi-balai-kota` | Balai Kota Sukabumi | Cikole (Kebonjati) | building | −6,91773, 106,93168 | OSM W292247234 "Kantor Walikota Sukabumi". Geotag Commons "Julang Ngapak di Balai Kota Sukabumi" ±25 m | 60 | Masuk sidang penetapan Des 2023; hasil akhir belum tegas | bernas.id; sukabumiupdate 131891 |
| 7 | `sukabumi-gereja-sidang-kristus` | Gereja Sidang Kristus | Cikole (Gunungparang) | building | −6,92055, 106,92560 | Geotag kamera foto Commons "Gereja Sidang Kristus Kota Sukabumi (Tampak Depan)" (−6,920583, 106,925603 dan −6,920533, 106,925539). **Posisi pemotret, bukan fasad.** Tidak ada di OSM | 30 | Ditetapkan CB Des 2023 | detik d-7074676 |
| 8 | `sukabumi-gereja-santo-joseph` | Gereja Santo Joseph | Cikole (Gunungparang) | building | −6,91809, 106,92827 | OSM N3292336130. Wikidata Q134499929 ±37 m | 50 | Tidak diketahui (Radar 2017: bangunan tertua) | detik d-7884217 |
| 9 | `sukabumi-vihara-widhi-sakti` | Vihara Widhi Sakti | Warudoyong (Nyomplong) | building | −6,92528, 106,92553 | OSM N12079323832 ("Vihara Vidhi Sakti") | 40 | – | detik d-7182047 |
| 10 | `sukabumi-museum-tionghoa` | Museum Tionghoa Sukabumi | Warudoyong (Nyomplong) | building | −6,92638, 106,92554 | OSM W1123666488. Danalaga Square W322205649 ±74 m. Wikidata meleset ±450 m (diabaikan) | 40 | – | Antara 178085; id.wikipedia Museum_Tionghoa_(Sukabumi) |
| 11 | `sukabumi-museum-pegadaian` | Museum Pegadaian | Citamiang menurut detik 2017; OSM menulis Warudoyong | building | −6,92824, 106,92673 | OSM W1123668962. Wikidata meleset ±260 m (diabaikan) | 50 | – | GNFI ceritakawan (8 Jul 2026) |
| 12 | `sukabumi-museum-prabu-siliwangi` | Museum Prabu Siliwangi | Gunungpuyuh (Karangtengah; OSM: Karamat) | building | −6,90659, 106,91333 | OSM W1123674828. Wikidata Q97306883 dan Q141694552 selisih < 15 m | 80 | – | id.wikipedia Museum_Prabu_Siliwangi |
| 13 | `sukabumi-museum-ki-pahare` | Museum Ki Pahare | Baros | building | −6,96428, 106,93973 | OSM W1123671139. Wikidata meleset ±470 m (diabaikan) | 60 | – | Antara 74060 |
| 14 | `sukabumi-gedung-capitol` | Gedung Capitol | Cikole (Gunungparang) | building | −6,92172, 106,92694 | OSM W278455044 "Capitol Plaza" (landuse retail, titik tengah), di Jl. Mayawati | 50 | – | detik d-7032332 |
| 15 | `sukabumi-pendopo` | Pendopo Sukabumi | Cikole (Gunungparang) | building | −6,92267, 106,92537 | OSM N5227870621 | 50 | – | Republika meng2v (2012) |
| 16 | `sukabumi-pasar-pelita` | Pasar Pelita | Cikole (Gunungparang) | food | −6,92411, 106,92847 | OSM W1144344266 "Pasar Induk Pelita" | 70 | – | detik d-5979778 |
| 17 | `sukabumi-terminal-kh-ahmad-sanusi` | Terminal K.H. Ahmad Sanusi | Baros (Sudajaya Hilir; OSM: Jayaraksa) | vehicle | −6,95119, 106,92544 | OSM N5757518708. Wikidata Q56416487 ±75 m | 120 | – | id.wikipedia Terminal_K.H._Ahmad_Sanusi |
| 18 | `sukabumi-stadion-suryakencana` | Stadion Suryakencana | Warudoyong (Nyomplong) | building | −6,93189, 106,91859 | OSM W286008254 "Lapangan Suryakencana" (titik tengah lapangan) | 100 | – | en.wikipedia Perssi_Sukabumi |
| 19 | `sukabumi-pemandian-cikundul` | Pemandian Air Panas Cikundul | Lembursitu (Cikundul) | other | −6,97591, 106,91311 | OSM N12404615705. **±74 m dari batas kota** (jarak ke titik sudut poligon) | 60 | – | detik d-7376869; iNews (17 Mar 2023) |
| 20 | `sukabumi-mochi-kaswari-lampion` | Mochi Kaswari Lampion | Cikole (Selabatu) | food | −6,91245, 106,93047 | OSM N7909021389 | 40 | – | GNFI (12 Mar 2025) |
| 21 | `sukabumi-monumen-kusukabumiku` | Monumen Kusukabumiku | Cikole (OSM: Kebonjati; haibunda: Gunungparang) | building | −6,92022, 106,93113 | OSM N12076191476 | 40 | – | haibunda (12 Mei 2026) |

Kategori dipilih menurut objek yang paling mungkin dipotret (tafsiran). Alun-alun diberi `building` karena ada monumen di tengahnya. Lapang Merdeka diberi `plant` karena berupa taman kota. Pemandian Cikundul diberi `other` karena tidak ada kategori air atau alam di K-020.

Sebaran per kecamatan: Cikole 14, Warudoyong 3–4, Baros 2, Gunungpuyuh 1, Lembursitu 1, Citamiang 0–1 (Museum Pegadaian belum pasti), Cibeureum 0.

### Pasangan landmark berdekatan (< 250 m)

| Pasangan | Jarak | Jumlah radius |
|---|---|---|
| Masjid Agung – Alun-alun | 69 m | 65 m |
| Masjid Agung – Gereja Sidang Kristus | 81 m | 60 m |
| Alun-alun – Gereja Sidang Kristus | 112 m | 65 m |
| Alun-alun – Gedung Capitol | 120 m | 85 m |
| Gedung Juang '45 – Gereja Santo Joseph | 122 m | 90 m |
| Vihara Widhi Sakti – Museum Tionghoa | 122 m | 80 m |
| Lapang Merdeka – Gedung Juang '45 | 125 m | 100 m |
| Alun-alun – Pendopo | 139 m | 85 m |
| Stasiun – Pasar Pelita | 159 m | 140 m |

Tidak ada radius yang tumpang tindih. Akibatnya, trio Masjid Agung, Alun-alun, dan Gereja Sidang Kristus memakai radius 30–35 m, di bawah rentang 50–200 m di brief. Radius sekecil itu rawan meleset bila GPS ponsel di pusat kota bergeser 10–20 m (**dugaan**, perlu diuji di lokasi).

### Ditolak atau cadangan

| Objek | Alasan | Catatan |
|---|---|---|
| Rumah Tahanan Hatta–Sjahrir (Jl. Bhayangkara, Gunungpuyuh) | Berada di kompleks Setukpa Lemdiklat Polri. Kunjungan per Des 2022 harus seizin Kepala Setukpa. Koordinat tidak ada di OSM, Wikidata, maupun Commons | Ditetapkan CB 5 Des 2023, dibangun 1926 (detik d-7073608, d-6480075). RRI (Sep 2026) memberitakan pembukaan museum, tetapi halamannya 403 sehingga tidak bisa dibaca. **Cadangan prioritas** bila survei membuktikan ada akses umum |
| Setukpa Lemdiklat Polri (bekas Politieschool) | Kompleks tertutup | Foto Commons "Setukpa Lemdikpol Sukabumi 2019" di −6,910945, 106,924547. Cadangan bila fasad bisa dipotret dari jalan umum dan tidak ada larangan memotret |
| Wisma Wisnu Wardhani (Jl. Bhayangkara 219, 1920, Indische Empire) | Bagian dari Setukpa; koordinat tidak ditemukan | detik d-6812110 |
| Gardu Induk Lembursitu (Onderstation Lemboersitoe) | Fasilitas PLN, tidak publik | Radar 2017 |
| Sekolah BPK Penabur, Yuwati Bhakti (ODCB 2024) | Sekolah aktif, bukan ruang publik, banyak anak (privasi, K-017) | KDP 2024 |
| RSUD R. Syamsudin SH (Bunut) | Fasilitas kesehatan, ada pasien | OSM W285840472 |
| Lapas Kelas IIB Sukabumi (Nyomplong) | Lembaga pemasyarakatan | Wikidata Q109325377 |
| Gereja Pantekosta (Jl. Veteran II), Gereja Bethel (Jl. A. Yani), HKBP Pasundan (Jl. Suryakencana) | Bangunan tertua menurut Radar 2017, tetapi identitas titik di OSM tidak bisa dipastikan (GKP Jl. Surya Kencana, GBI Eben Haezer Jl. A. Yani, HKBP Jl. Babakan Sirna) | Cadangan setelah pemilik memastikan bangunannya |
| Kantor Pos Sukabumi (Jl. A. Yani) | Tidak ada fakta bersumber tentang bangunannya; ±89 m dari Gedung Capitol | OSM N5227849322 |
| Titik Nol Kilometer (Jl. A. Yani x Jl. PGRI–Balai Desa, diresmikan 8 Jan 2022) | Marka di badan jalan (risiko keselamatan saat memotret); cat pudar sejak 2022; titiknya tidak ada di OSM | detik d-6283710 |
| GOR Merdeka, Tugu Adipura, Monumen Pemuda | Berimpit dengan Lapang Merdeka atau Gedung Juang (< 90 m); tidak ada fakta bersumber | OSM W1215997992, N12076254935, N6380393485 |
| Gapura batas kota "Pakujajar" (Jl. Lingkar Selatan, Warudoyong) | Koordinat tidak ditemukan; letaknya tepat di batas kota | detik d-8276290 (24 Des 2025). Cadangan |
| Pesantren Syamsul Ulum Gunung Puyuh dan makam K.H. Ahmad Sanusi | Lembaga pendidikan aktif; koordinat tidak ditemukan | Cadangan bila makam terbuka untuk peziarah |
| Bekas Societeit Concordia / Wilhelminapark (Jl. Siliwangi) | Kini parkir dan PKL, hanya panggung terbuka yang tersisa | bernas.id |
| SantaSea Water Theme Park (Citamiang) | Tempat komersial berbayar, area kolam renang (privasi) | haibunda |
| Stasiun Cisaat, Grand Hotel Selabintana, Situ Gunung, Curug Sawer, Museum Bojongkokosan, PLTA Ubrug, OASIS, Bukit Baros | **Di luar batas Kota Sukabumi** (Kabupaten) | Ditolak sesuai K-029 |

### Checklist survei lapangan (untuk pemilik)

Untuk setiap landmark di tabel kandidat:

- [ ] **Posisi titik.** Berdiri di depan pintu atau fasad yang terbuka untuk umum. Catat koordinat dari ponsel (5 desimal) di catatan survei, **bukan** di aplikasi, lalu bandingkan dengan `lat`/`lng`. Bila selisihnya > 15 m, perbarui koordinatnya. Prioritas: Gereja Sidang Kristus (titik saat ini adalah posisi pemotret di Commons), Gedung Juang '45 (ada dua titik OSM berjarak 95 m), Masjid Agung, dan Gedung Capitol (titik tengah kawasan, bukan fasad).
- [ ] **Radius.** Berjalan dari titik ke tepi area yang wajar untuk memotret objek, lalu cek apakah `radiusM` mencakupnya. Untuk trio Masjid Agung, Alun-alun, dan Gereja Sidang Kristus, uji apakah radius 30–35 m masih tertangkap GPS ponsel. Bila tidak, laporkan agar dibuat Q- tentang aturan landmark yang radiusnya tumpang tindih.
- [ ] **Akses publik.** Pastikan objek bisa dipotret dari ruang publik tanpa izin khusus. Catat jam buka, tiket, dan larangan memotret (terutama museum, Pendopo, dan Balai Kota).
- [ ] **Kondisi bangunan.** Catat apakah objek masih utuh atau sedang direnovasi. Perhatian khusus: fasad Capitol yang tertutup iklan, Pemandian Cikundul yang direncanakan direvitalisasi, dan Pasar Pelita (lantai yang belum buka).
- [ ] **Batas kota.** Untuk Pemandian Cikundul (±74 m dari batas) dan Museum Ki Pahare (±239 m), pastikan titik dan radius berada di sisi Kota Sukabumi.
- [ ] **Foto acuan siluet.** Ambil satu foto tegak lurus dari depan dengan seluruh objek masuk bingkai, langit sebagai latar bila bisa, tanpa wajah orang dan tanpa plat nomor. Foto ini menjadi bahan `silhouetteAsset` (diserahkan ke `desainer-visual`).
- [ ] **Fakta.** Bila papan informasi di lokasi berbeda dari fakta di data, foto papannya dan catat perbedaannya.
- [ ] **Cadangan.** Cek akses Rumah Tahanan Hatta–Sjahrir (museum yang dilaporkan dibuka 2026), fasad Setukpa dari Jl. Bhayangkara, dan identitas Gereja Pantekosta, Bethel, dan HKBP Pasundan.
- [ ] Setelah semua butir lolos, ubah `verified` menjadi `true` untuk landmark itu. Kapan `isCurated` kota menjadi `true` belum diputuskan. Usulan: setelah minimal 20 landmark terverifikasi (lihat usulan Q- di laporan kurasi).

## Kesimpulan

Fakta: Kota Sukabumi punya 21 objek publik di dalam batas administratif yang memiliki koordinat dari data terbuka dan 1–2 fakta bersumber URL. Daftar resmi 21 ODCB tidak ditemukan daring. Yang terkonfirmasi ditetapkan sebagai cagar budaya hanya Gereja Sidang Kristus dan Rumah Tahanan Hatta–Sjahrir, sedangkan status Balai Kota belum tegas.

Tafsiran: 21 kandidat memenuhi target bawah 20–30. Namun hasil survei bisa menurunkan jumlahnya, misalnya bila ada titik yang ternyata tidak layak, dan objek tersebar timpang: 14 dari 21 di Kecamatan Cikole, nol di Cibeureum. Cadangan terkuat untuk menambah atau mengganti adalah Rumah Tahanan Hatta–Sjahrir dan tiga gereja tua dari daftar Radar 2017. Ketiga gereja itu baru bisa masuk setelah survei memastikan titiknya.

## Belum terjawab

- Daftar resmi 21 ODCB Kota Sukabumi (Disdikbud Kota Sukabumi atau TACB). Belum ada di registrasinasional.kemdikbud.go.id lewat pencarian web.
- Status akhir Balai Kota pada sidang Desember 2023.
- Koordinat Rumah Tahanan Hatta–Sjahrir, Gereja Pantekosta, Gereja Bethel, HKBP Pasundan, Wisma Wisnu Wardhani, dan gapura batas kota.
- Kecamatan Museum Pegadaian (Citamiang menurut detik 2017, Warudoyong menurut OSM).
- Fakta kedua untuk Lapang Merdeka, Pendopo, Stadion Suryakencana, dan Monumen Kusukabumiku. Fakta Kusukabumiku saat ini hanya bersumber artikel wisata.
- Apakah poligon OSM 14918119 sama dengan batas resmi (BIG/Kemendagri).
