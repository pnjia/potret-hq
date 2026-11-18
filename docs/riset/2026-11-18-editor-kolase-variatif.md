# Editor kolase, scrapbook, dan buku foto: pilihan kustomisasi yang membuat hasil variatif tetapi tetap bagus

> Diriset: 2026-11-18 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: fitur editor tiap aplikasi (berubah tiap rilis; versi App Store yang dibaca tidak selalu mencantumkan tahun), jumlah template, stiker, dan motif, harga langganan Zinnia, stok warna sampul Artifact Uprising, isi pusat bantuan Canva, Polarsteps, Goodnotes, dan Mixbook (beberapa hanya terbaca lewat cuplikan mesin pencari), serta versi WCAG.
> Dipakai oleh: belum. Calon pemakai: editor halaman buku dan editor sampul (spesifikasi §4.5), Q-017 (arah visual v5). Editor sampul lanjutan tetap ditunda (spesifikasi §8).

Melengkapi, tidak mengulang:
- `docs/riset/2026-11-18-acuan-aplikasi-berkarakter.md`: momen stiker CapWords, efek stiker iOS (Outline, Comic, Puffy, Shiny), Instagram Cutouts dan stiker Frames, Retro, Locket, Polarsteps (Liquid Glass);
- `docs/riset/2026-11-18-desain-ui-anti-ai-slop.md`: stiker transparan Strava, warna dari data Spotify Wrapped;
- `docs/riset/2026-11-18-audit-aksesibilitas-v4.md`: aturan "setiap gestur punya padanan satu ketukan" (aturan 9).

Tidak ada aset atau tangkapan layar aplikasi lain yang disalin ke repo. Semua di bawah berupa deskripsi tertulis.

Istilah kerja di file ini yang belum ada di glosarium: **motif selotip**, **tinta keterangan**, **kertas latar**, **gaya halaman**, **tepi stiker**. Diusulkan lewat laporan balik, belum dipakai di dokumen stabil. Kode opsi di tabel Kesimpulan (ST, SL, KT, HL, SP) hanya penomoran lokal file ini, bukan nomor keputusan K-.

## Pertanyaan

1. Aplikasi kolase, scrapbook, dan buku harian mana yang relevan, dan opsi kustomisasi apa yang mereka tawarkan untuk tepi stiker, selotip (washi tape), kertas latar, teks, hiasan, bayangan, filter, tata letak acak, dan preset?
2. Bagaimana aplikasi menjaga hasil tetap bagus walau penggunanya awam: palet terkurasi, preset, tombol acak, saran otomatis? Adakah bukti atau penjelasan desainernya?
3. Berapa variasi template sampul yang lazim di aplikasi buku foto, gayanya apa, dan bagaimana cara pratinjaunya?
4. Batas aksesibilitas apa yang berlaku untuk teks di atas kertas bermotif, warna tinta keterangan (kontras ≥ 4,5:1), dan alternatif gestur?

## Temuan

Label: **primer** = situs, toko aplikasi, blog, atau pusat bantuan resmi pemilik produk, atau W3C; **sekunder** = media atau pihak ketiga; **belum diverifikasi** = hanya terlihat di cuplikan mesin pencari karena halamannya menolak dibuka (403/404).

### A. Opsi kustomisasi per aplikasi

- **Pinterest Shuffles (kolase dari potongan)** · primer + sekunder
  - App Store: "Cut out objects from an image with a single tap"; "Add animations and effects (motions, filters, and frames!)"; animasi keyframe; template kartu hari raya beranimasi; fitur remix kreasi orang lain. Rating usia 13+.
  - Sumber: https://apps.apple.com/us/app/shuffles-by-pinterest/id1573869498 (diakses 2026-11-18)
  - Newsroom Pinterest (28 Feb 2023): dibuat tim inkubator TwoTwenty; pengguna menggabungkan latar, gambar, stiker, dan teks, lalu menambah efek dan animasi.
  - Sumber: https://newsroom.pinterest.com/de/news/shuffles-by-pinterest-expands-to-nine-additional-countries/ (diakses 2026-11-18)
  - TechCrunch (1 Agu 2022): potongan bisa diputar, ditumpuk, dan diubah ukurannya; animasi dan efek bersifat opsional.
  - Sumber: https://techcrunch.com/2022/08/01/pinterest-debuts-a-new-app-shuffles-for-collage-making-and-moodboards/ (diakses 2026-11-18)
  - Make Tech Easier (30 Sep 2025, sekunder): per potongan ada alat bentuk (merapikan potongan), opasitas, **border**, filter, dan animasi. Tiap potongan satu lapisan; tekan lama lalu geser ke atas untuk memajukan lapisan. Latar kanvas: warna polos, **pipet yang mengambil warna dari potongan**, atau gambar sendiri yang dikunci.
  - Sumber: https://maketecheasier.com/shuffles-collages-app/ (diakses 2026-11-18)
  - TechCrunch (1 Mei 2024): CEO Bill Ready menyebut pengguna "roughly three times more likely to save collage Pins versus other Pins"; Gen Z hampir 70% pembuat kolase.
  - Sumber: https://techcrunch.com/2024/05/01/pinterest-says-its-ai-powered-collages-are-now-more-engaging-than-pins (diakses 2026-11-18)
  - Social Media Today (24 Sep 2024): "Collage Remixes" memungkinkan orang lain menyunting kolase yang ada; hasil remix diberi tanda yang menunjuk pembuat asli.
  - Sumber: https://www.socialmediatoday.com/news/pinterest-adds-new-collage-remix-and-sharing-options/727961/ (diakses 2026-11-18)
  - Tidak ditemukan dokumentasi resmi tentang jenis border (ketebalan, warna) atau bayangan di Shuffles.

- **Instagram Stories (teks dan warna)** · primer + sekunder
  - Engineering at Meta (18 Jul 2022): gaya teks Typewriter, Classic, Neon, dan Modern v2. Sebelum proyek itu hanya Typewriter, Classic, dan Neon yang punya versi "decorated"; tujuannya "all styles have decorated and non-decorated versions". Versi decorated gaya Directional awalnya **garis luar yang mengikuti baris teks**, lalu diganti **latar terisi** karena menggaris teks panjang membuat lag. Konsistensi antar-gaya disebut prinsip inti.
  - Sumber: https://engineering.fb.com/2022/07/18/ios/building-text-animations-for-instagram-stories/ (diakses 2026-11-18)
  - Blog Instagram (1 Apr 2024): tekan lama pilihan warna untuk membuka gradasi warna; pipet mengambil warna langsung dari foto; tombol latar teks ("background text color") bisa dinyalakan.
  - Sumber: https://about.instagram.com/blog/tips-and-tricks/instagram-story-tips-tricks (diakses 2026-11-18)
  - Later (1 Mei 2026, sekunder): ketuk teks aktif untuk berpindah perataan kiri, tengah, kanan; tekan lama swatch membuka slider "every shade imaginable". Jumlah gaya huruf resmi tidak disebut.
  - Sumber: https://later.com/blog/instagram-stories-fonts (diakses 2026-11-18)

- **Picsart (stiker die-cut)** · primer (blog resmi)
  - Blog Picsart (15 Jun 2026, "OOTD sticker peeling trend"): potong subjek di Sticker Maker, ekspor PNG transparan, lalu di Photo Editor ketuk ikon Border, pilih putih, dan geser **slider ketebalan** sampai tampak seperti stiker die-cut. Tepi putih tebal disebut "signature" tren ini karena langsung menjual ilusi stiker yang dikupas tanpa perlu keterangan. Artikel tidak membahas bayangan.
  - Sumber: https://picsart.com/blog/ootd-sticker-peeling-trend/ (diakses 2026-11-18)

- **Tico: Cutout | Collage | Scrapbook** · primer (App Store)
  - Deskripsi: "Add strokes, shadows and fancy outlines to cutouts"; "Add background patterns". Catatan versi 3.4: "Added dashed outline with adjustable dash length" dan "Added distance adjustment for the outline" (jarak garis luar dari tepi potongan).
  - Sumber: https://apps.apple.com/sn/app/tico/id6444690835 (diakses 2026-11-18)

- **PicCollage** · primer (App Store)
  - Mode freestyle; "ready-to-use layouts, grids & animated templates"; "thousands of exclusive backgrounds and stickers" (banyak paket berbayar terpisah); bingkai foto; potong foto menjadi bentuk bintang atau hati; teks melengkung. Catatan versi 8.68.3: bentuk potong baru **"Stamp"** (prangko) dan gaya teks baru. Listing menyebut "AI font pairing in suggested layouts".
  - Sumber: https://apps.apple.com/us/app/piccollage-magic-photo-editor/id448639966 (diakses 2026-11-18)

- **Goodnotes (selotip/Tape)** · primer (blog resmi)
  - "The Story Behind the Tape Tool" (22 Sep 2025, Chelsea Mangold-Takao, desainer produk): Tape lahir untuk menutup jawaban (belajar mandiri) sekaligus dekorasi; tarik garis lalu tahan untuk menjadi lurus. Motif dirancang bersama desainer UI dengan inspirasi "studygram". Kutipan: "The goal was to give users a creative starting point and empower them to create their own patterns."
  - Sumber: https://www.goodnotes.com/blog/the-story-behind-the-tape-tool (diakses 2026-11-18)
  - "Tape Tool: Tips, Tricks" (4 Feb 2025): warna polos, motif preset, atau desain sendiri; "customize colour schemes of preset patterns"; ketebalan lewat pilihan atau slider; slot palet bisa ditambah, diurutkan, disunting, dihapus. Paket Marketplace berisi 6, 14, dan 27 desain.
  - Sumber: https://www.goodnotes.com/blog/tape-tool-tips-tricks (diakses 2026-11-18)
  - Belum diverifikasi (pusat bantuan 403): tombol "Add to Presets" dan "restore color/pattern sets to original".
  - Sumber: https://support.goodnotes.com/hc/en-us/articles/9489290046607 (diakses 2026-11-18; 403)
  - Kertas latar: tidak ditemukan daftar resmi warna kertas bawaan. Umpan balik pengguna menyebut "3 standard colors"; paket pihak ketiga menjual kertas titik, garis, dan kotak dalam putih, kuning, dan hitam.
  - Sumber: https://feedback.goodnotes.com/forums/191274-customer-suggestions-for-goodnotes-apple/suggestions/43311153-template-creator (diakses 2026-11-18; cuplikan, belum diverifikasi)

- **Zinnia (Pixite)** · primer
  - App Store: Studio terkurasi berisi "journals • planners • trackers • stickers • washi tape • journal cards • frames • templates"; konten baru tiap bulan; kunci lapisan, kirim ke belakang/depan, potong tak merusak (versi 1.47), alat bentuk (versi 1.45). Harga di deskripsi $3,99/minggu, $8,99/bulan, $34,99/tahun (daftar pembelian di halaman yang sama menunjukkan angka berbeda; cek ulang).
  - Sumber: https://apps.apple.com/us/app/-/id1485310935 (diakses 2026-11-18)
  - Situs Pixite: "Themes: handpicked designs for a cohesive look"; koleksi dari seniman jurnal populer.
  - Sumber: https://pixiteapps.com/apps/zinnia/ (diakses 2026-11-18)

- **Day One (tema)** · primer
  - Sembilan tema: Classic, Notes, Solarized, Tokyo Night, Everforest, Rosé Pine, Catppuccin, Nord, Ayu. Tema mengubah header, daftar entri, dan isi entri (teks, judul, kutipan, sorotan, tautan) dengan satu palet, plus varian terang/gelap. Delapan tema menimpa font entri. Dua gratis, tujuh berbayar. Pemilih tema memakai **kartu pratinjau langsung**.
  - Sumber: https://dayoneapp.com/guides/tips-and-tutorials/journal-themes/ (diakses 2026-11-18)

- **Retro (rekap)** · sekunder
  - TechCrunch (7 Des 2023): rekap kolase atau video, dengan **bingkai gaya Polaroid atau layar penuh**; kartu pos dicetak fisik.
  - Sumber: https://techcrunch.com/2023/12/07/retro-lets-you-create-recaps-of-your-most-memorable-photos-and-send-the-best-ones-as-postcards (diakses 2026-11-18)

- **Apple Freeform** · sekunder
  - Cult of Mac (31 Mei 2025): pustaka stiker sistem (dari foto atau Genmoji); bentuk dan clip art; sticky note dalam 7 warna tetap (kuning, merah muda, merah, oranye, hijau, biru, abu); di Mac objek menempel ke grid saat grid tampil.
  - Sumber: https://www.cultofmac.com/how-to/freeform (diakses 2026-11-18)

- **Canva (Styles)** · primer (bahan pelatihan pemerintah) + belum diverifikasi
  - Transkrip pelatihan Departemen Pendidikan NSW: Styles bisa dipakai sebagai set penuh, atau hanya set warna, atau hanya set font; palet adalah "a selection of curated colour palettes"; mengetuk palet lagi akan "shuffle where the colours are applied until you find the one that you like".
  - Sumber: https://education.nsw.gov.au/teaching-and-learning/technology-for-learning/resources/professional-learning-resources/canva-for-education/canva-foundations/transcript-design-with-templates-and-styles (diakses 2026-11-18)
  - Belum diverifikasi (403): pusat bantuan Canva menyebut pilihan palet warna, set font, palet gambar, atau kombinasi, opsi "Apply to all pages", dan tombol Shuffle untuk melihat variasi.
  - Sumber: https://www.canva.com/help/color-and-font-combinations/ (diakses 2026-11-18; 403)

- **Tidak ditemukan sumber yang berguna**: editor Apple Journal (hanya sumber sekunder soal stiker dan bentuk di iOS 26), "Journal it!" (listing App Store tidak menjelaskan editor), Collart (listing hanya terbaca lewat cuplikan: "1000+ unique stickers, backgrounds and filters", mode freestyle), dan gaya keterangan Locket. Lihat "Belum terjawab".

### B. Pola "pilihan terbatas tapi hasil selalu bagus"

- **Palet dan gaya terkurasi, bukan pemilih warna bebas** · primer
  - Canva: palet terkurasi + tombol acak penempatan warna (lihat A).
  - Day One: sembilan tema bernama, masing-masing mengatur seluruh palet sekaligus (lihat A).
  - Apple Photos, "memory looks": "apply consistent color and style adjustments to all the photos in a memory".
  - Sumber: https://support.apple.com/guide/photos/pht69f4420d8 (diakses 2026-11-18)
  - Jumlahnya 12 look sejak iOS 15; tiap look menganalisis foto lalu menyetel kontras dan warna agar seragam (sekunder).
  - Sumber: https://www.macrumors.com/how-to/use-memory-looks-photos-app/ (diakses 2026-11-18)

- **Preset yang bisa disimpan dan dikembalikan ke asal** · primer
  - Goodnotes: palet selotip berupa slot preset yang bisa disunting dan diurutkan (lihat A).

- **Tombol acak tata letak** · primer
  - Storio (pusat bantuan): "Shuffle Within Style" dan "Random Shuffle" "automatically rearrange your photos into new layout designs"; ada juga Auto Layout yang membuat tata letak baru tiap kali foto diseret ke halaman. Halaman tidak menyebut urungkan atau pratinjau.
  - Sumber: https://service.storiogroup.com/hc/en-ie/articles/49715498762129-How-to-view-all-pages-and-shuffle-layouts (diakses 2026-11-18)
  - Belum diverifikasi (403): Snapfish, tombol Shuffle mengatur ulang foto ke tata letak lain setiap ditekan, tetapi tidak menggeser hiasan atau teks yang sudah diisi.
  - Sumber: https://support.snapfish.com/hc/en-us/articles/226562467-Shuffle-photos-on-a-calendar-page-canvas-and-other-products (diakses 2026-11-18; 403)

- **Saran otomatis** · primer
  - PicCollage: "AI font pairing in suggested layouts" dan deteksi sorotan agar fokus foto tetap di tengah (lihat A).
  - Shuffles: pipet warna latar dari potongan (lihat A).

- **Bukti riset tentang jumlah pilihan** · primer (abstrak jurnal)
  - Chernev, Böckenholt, Goodman (2015), *Journal of Consumer Psychology*: meta-analisis 99 observasi (N = 7.202). Pengaruh jumlah pilihan terhadap choice overload signifikan setelah empat moderator diperhitungkan: kompleksitas set pilihan, kesulitan tugas, ketidakpastian preferensi, dan tujuan menghemat usaha. Makin tinggi keempatnya, makin besar overload.
  - Sumber: https://www.kellogg.northwestern.edu/faculty/research/detail/2015/when-product-assortment-leads-to-choice-overload-a-conceptual (diakses 2026-11-18)

- **Penjelasan desainer**
  - Ditemukan dua: Meta (konsistensi antar-gaya teks sebagai prinsip inti; latar terisi menggantikan garis luar karena performa) dan Goodnotes ("creative starting point" untuk motif). Tidak ditemukan studi kasus desainer yang mengukur bahwa preset terkurasi menghasilkan karya yang lebih bagus.

### C. Variasi template sampul dan buku

- **Mixbook** · primer
  - Panduan (24 Sep 2025, JC Thomas): "hundreds of themes"; telusur per kategori (pernikahan, keluarga, perjalanan, bayi) atau "best sellers, everyday, simple"; filter tingkat kustomisasi (**easy, medium, pro**), warna utama, gaya (modern, cat air, vintage, botani, minimalis). "All themes are 100% customizable"; elemen dari beberapa tema bisa digabung.
  - Sumber: https://www.mixbook.com/inspiration/selecting-the-perfect-photo-book-theme (diakses 2026-11-18)
  - Belum diverifikasi (404): pusat bantuan menyebut tema bisa diganti kapan saja tanpa mengubah konten yang sudah dibuat, dan sampul boleh memakai tema berbeda. Pos "Theme Explorer" menyebut pratinjau foto pengguna di dalam tiap tema.
  - Sumber: https://help.mixbook.com/how-do-i-change-my-book's-theme-or-apply-different-theme-pages-to-my-book-SJO0pFeCm (diakses 2026-11-18; 404)

- **Artifact Uprising** · primer
  - Color Series Photo Book: sampul kertas berwarna dengan **jendela die-cut lingkaran** "to showcase the first photo in your book"; 4 warna (Arctic, Moss, Navy, Canary; Canary habis); huruf foil emas, perak, atau tembaga dengan efek timbul.
  - Sumber: https://www.artifactuprising.com/photo-books/color-series-photo-book (diakses 2026-11-18)

- **Chatbooks** · primer
  - Pusat bantuan: sampul "designer covers"; yang bernama "Foil" adalah sampul foil edisi terbatas, dipilih dari "See all designer covers" (iOS) atau "Add a Designer cover" (Android). Jumlah desain tidak disebut.
  - Sumber: https://help.chatbooks.com/en/articles/12418702-limited-edition-fancy-foil-covers (diakses 2026-11-18)
  - Blog (13 Apr 2016): sampul kustom dibuat di aplikasi lain lalu dipilih sebagai foto sampul; saran teks 1–5 kata di atas ruang kosong foto.
  - Sumber: https://chatbooks.com/design-amazing-custom-cover (diakses 2026-11-18)

- **Polarsteps Travel Book** · belum diverifikasi (pusat bantuan 403)
  - Cuplikan: sampul = foto sampul perjalanan (bisa diganti), judul, nama penulis, dan **warna tema**; tahun ditambahkan otomatis; posisi judul dan tahun **tidak bisa diubah**, jadi pengguna diminta memilih foto yang cocok dengan tata letak itu.
  - Sumber: https://support.polarsteps.com/hc/en-us/articles/24005018645010-How-can-I-create-the-perfect-Travel-Book-cover (diakses 2026-11-18; 403)

- **Ringkasan jumlah** (fakta dari sumber di atas): Artifact Uprising Color Series 4 warna × 3 foil; Day One 9 tema; Apple 12 look; Mixbook ratusan tema dengan filter; Polarsteps satu tata letak tetap dengan pilihan warna (belum diverifikasi). Tidak ditemukan angka "jumlah tipikal" lintas industri.

### D. Batas aksesibilitas

- **WCAG 2.2 SC 1.4.3 Kontras (Minimum), AA** · primer
  - Teks ≥ 4,5:1; teks besar (≥ 18 pt atau 14 pt tebal, sekitar 24 px atau 18,5 px) ≥ 3:1. Ambang tidak dibulatkan (4,499:1 gagal).
  - Kontras diukur terhadap latar tempat teks dirender. Latar gambar yang tidak memberi kontras cukup termasuk kegagalan F83.
  - Garis tepi sempit di huruf dihitung sebagai bagian huruf. Tepi lebar yang mengisi detail huruf berlaku sebagai "halo" dan dihitung sebagai latar.
  - Huruf tipis bisa tampil lebih pudar karena anti-aliasing, jadi dianjurkan huruf lebih tebal atau margin di atas minimum.
  - Sumber: https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html (diakses 2026-11-18)

- **WCAG 2.2 SC 2.5.7 Gerakan Seret, AA** · primer
  - "All functionality that uses a dragging movement for operation can be achieved by a single pointer without dragging". Contoh: peta dengan tombol arah; papan kanban, ketuk elemen lalu ketuk tombol panah untuk memindah; slider yang bisa diketuk di titik mana pun.
  - Sumber: https://www.w3.org/WAI/WCAG22/Understanding/dragging-movements.html (diakses 2026-11-18)

- **WCAG 2.2 SC 2.5.1 Gestur Penunjuk, A** · primer
  - Gestur multi-titik (termasuk cubit) harus bisa dilakukan dengan satu penunjuk tanpa gestur berjalur. Contoh: tombol plus/minus untuk zoom (teknik G215).
  - Sumber: https://www.w3.org/WAI/WCAG22/Understanding/pointer-gestures.html (diakses 2026-11-18)

- **Hitungan kontras calon tinta keterangan** · dihitung peneliti
  - Metode: rumus luminans relatif WCAG 2.x, dihitung tangan. Nilai latar diturunkan dari rasio di `docs/desain/usulan-v5-karcis-kliping.md` §3.1. Perlu dicek ulang dengan `docs/desain/usulan-v5/kontras.py`.
  - Latar: `paper.book` `#F6F5F1` (L ≈ 0,9125), selotip di atas kertas `#EDEAE0` (L ≈ 0,822), garis grid/titik bila memakai `paper.muted` `#EDEDF0` (L ≈ 0,848), dan kertas kraft contoh `#D2B48C` (L ≈ 0,482).

  | Tinta | Hex | paper.book | Selotip | Garis `#EDEDF0` | Kraft `#D2B48C` |
  |---|---|---|---|---|---|
  | Tinta (ada) | `#121212` | 17,17 | 15,55 | 16,03 | 9,50 |
  | Kobalt (ada) | `#3048FF` | 5,51 | 4,99 | 5,14 | **3,05 gagal** |
  | Sepia (calon) | `#6B4226` | 7,91 | 7,17 | 7,39 | **4,38 gagal** |
  | Merah cap (calon; hex sama dengan `state.error`) | `#B42318` | 6,02 | 5,45 | 5,62 | **3,33 gagal** |
  | Magenta (calon) | `#C2185B` | 5,38 | 4,88 | 5,03 | **2,98 gagal** |
  | Hijau (calon; hex sama dengan `state.success`) | `#2E7652` | 5,02 | 4,55 (tipis) | 4,69 | **2,78 gagal** |

  - Lime `#D4F25C` tetap dilarang sebagai teks (1,16 di kertas, usulan v5 §3.1).

## Kesimpulan

**Fakta bersumber.**
- Aplikasi kolase memberi potongan beberapa perlakuan tepi:
  - tepi putih dengan slider ketebalan (Picsart);
  - garis luar putus-putus dan jarak garis dari tepi (Tico);
  - border, opasitas, dan filter per potongan (Shuffles);
  - bingkai Polaroid (Retro);
  - bentuk prangko (PicCollage).
- Aplikasi catatan dan scrapbook menyediakan selotip berupa palet preset motif dan warna yang bisa diatur ketebalannya, ditambah paket motif tambahan (Goodnotes, Zinnia).
- Penjaga kualitas yang terdokumentasi:
  - set terkurasi yang mengubah banyak hal sekaligus (Canva Styles, Day One 9 tema, Apple 12 look);
  - tombol acak dalam batas gaya (Canva, Storio, Snapfish);
  - tata letak sampul yang posisinya dikunci (Polarsteps, belum diverifikasi).
- Riset Chernev dkk. (2015): banyak pilihan merugikan terutama bila tugasnya sulit dan preferensi pengguna belum jelas.
- Variasi sampul di layanan buku foto berkisar dari satu tata letak dengan pilihan warna (Polarsteps) sampai empat warna dengan jendela die-cut dan foil (Artifact Uprising) dan ratusan tema dengan filter tingkat kesulitan (Mixbook).
- WCAG 2.2 meminta kontras 4,5:1 diukur terhadap latar sebenarnya, termasuk motif, dan setiap seret atau cubit punya padanan satu ketukan.

**Tafsiran (bukan keputusan).**
- Keluhan "kurang variatif" kemungkinan berasal dari dua hal: hanya ada satu sumbu yang benar-benar terlihat (posisi selotip), dan pilihan tinta hanya dua. Aplikasi pembanding menambah variasi lewat **lapisan yang saling dikombinasikan** (tepi × selotip × tinta × kertas), bukan lewat satu daftar panjang.
- Dengan 4 pilihan per lapisan di 4 lapisan, ada 256 kombinasi, tetapi pengguna tetap hanya menghadapi 4 pilihan per langkah. Ini sejalan dengan temuan Chernev bahwa overload naik saat set pilihan kompleks.
- Supaya hasil tetap bagus, set pilihan per lapisan disusun dari tema v5 (karcis, cap pos, stabilo, selotip, cetak saring), semua tinta sudah lolos kontras, dan tersedia satu tombol acak dan satu "gaya halaman" untuk orang yang tidak mau memilih.
- Kertas kraft gelap hanya cocok dengan Tinta (Kobalt 3,05). Bila kraft ditawarkan, pilihan tinta perlu dikunci otomatis, atau keterangan diberi label kertas di belakangnya (pola "background text color" Instagram).
- Dua batas dari dokumen proyek yang perlu dijaga:
  - K-005: sistem tidak boleh mengacak ulang halaman yang sudah diatur manual. Tombol acak yang ditekan pengguna sendiri, dengan urungkan, perlu diputuskan apakah sejalan dengan K-005. Ini bukan keputusan peneliti.
  - Spesifikasi §4.5 dan §8: sampul MVP adalah "template + nama + stiker", dan editor sampul lanjutan ditunda. Opsi sampul di bawah sengaja dibatasi pada variasi template.

### Daftar opsi kustomisasi yang diusulkan untuk Kliping Kota

Semua butir adalah **tafsiran** yang perlu diputuskan pemilik. Prioritas: **wajib** = layak masuk MVP karena murah dan langsung menjawab keluhan; **bagus** = menambah variasi nyata bila waktu ada; **nanti** = setelah MVP, misalnya sebagai hadiah misi (§4.6) atau karena butuh uji performa atau keputusan baru.

**1. Stiker (tepi, bayangan, bingkai)**

| # | Opsi | Asal dan sumber | Prioritas |
|---|---|---|---|
| ST1 | Tepi die-cut putih sebagai bawaan (sudah ada di v5 §3.5) | Picsart Border putih (blog Picsart, 15 Jun 2026); efek Outline iOS (riset `2026-11-18-acuan-aplikasi-berkarakter.md`) | wajib |
| ST2 | Pilihan **tepi stiker** 4 jenis: putih (bawaan), tanpa tepi, **garis gunting putus-putus** (cocok dengan arti "kliping"), dan **bingkai cetak** (kartu putih seperti foto cetak/Polaroid) | Tico (dashed outline, App Store); Retro (bingkai Polaroid, TechCrunch 7 Des 2023); Shuffles (border/frames, App Store); PicCollage (bingkai foto, App Store) | wajib (4 jenis, tanpa slider) |
| ST3 | Ketebalan tepi dalam 3 langkah tetap (tipis, sedang, tebal), bukan slider bebas | Picsart slider ketebalan; Goodnotes slider ketebalan selotip | bagus |
| ST4 | Bentuk potong **prangko** (tepi bergerigi) untuk stiker | PicCollage "Stamp" cutout shape (App Store, versi 8.68.3) | bagus |
| ST5 | Bayangan: tetap satu gaya bawaan (dua lapis v5), plus opsi "rata" tanpa bayangan | Tico "shadows" (App Store); aturan v5 "bayangan hanya benda" | nanti |
| ST6 | Material stiker (kilau holografik, timbul) sebagai hadiah | Efek Puffy/Shiny iOS (riset `2026-11-18-acuan-aplikasi-berkarakter.md`) | nanti (perlu uji 30 fps) |
| ST7 | Filter warna per stiker | Shuffles (App Store); Collart (cuplikan) | nanti (berisiko bentrok dengan LUT skin kamera) |

**2. Selotip (motif, warna)**

| # | Opsi | Asal dan sumber | Prioritas |
|---|---|---|---|
| SL1 | Posisi selotip: tanpa, 1 sudut, 2 sudut, atas (sudah ada) | Mockup v5; spesifikasi §4.5 | wajib (ada) |
| SL2 | **4–6 motif selotip** dari tema v5: kertas polos (bawaan), garis-garis, kotak grid, titik raster, perforasi karcis, cetakan teks "KLIPING KOTA" | Goodnotes preset motif dan warna (blog 4 Feb 2025 dan 22 Sep 2025); Zinnia washi tape (App Store) | wajib |
| SL3 | Motif tambahan sebagai hadiah misi | Paket motif Goodnotes Marketplace (6/14/27 desain); mockup v5 Misi "Hadiah: selotip motif"; spesifikasi §4.6 | bagus |
| SL4 | Warna motif ikut palet tinta (satu motif, beberapa warna) | Goodnotes "customize colour schemes of preset patterns" | nanti |
| SL5 | Ujung selotip sobek tidak rata | Tidak ada sumber aplikasi (**dugaan**, dari benda fisik) | bagus |

**3. Keterangan (tinta, gaya, posisi)**

| # | Opsi | Asal dan sumber | Prioritas |
|---|---|---|---|
| KT1 | **5–6 tinta keterangan** terkurasi yang semuanya ≥ 4,5:1 di `paper.book` dan selotip: Tinta, Kobalt, Sepia, Merah cap, Magenta, Hijau (Hijau hanya 4,55 di selotip). Tanpa pemilih warna bebas | Palet terkurasi Canva (transkrip NSW); Day One 9 tema; hitungan kontras §D; WCAG 1.4.3 | wajib |
| KT2 | 3 gaya keterangan: tulisan tangan (Nanum Pen, bawaan), **label karcis** (huruf cetak di atas pita kertas), dan **stabilo** (Lime di belakang kata, teks tetap Tinta) | Gaya teks Instagram dengan versi decorated/non-decorated (Engineering at Meta, 18 Jul 2022); tombol latar teks Instagram (blog 1 Apr 2024); stabilo v5 §3.4 | bagus |
| KT3 | Latar keterangan (label kertas) otomatis menyala bila kertas latar bermotif atau gelap | Latar terisi Instagram menggantikan garis luar (Meta 2022); konsep halo di WCAG 1.4.3 | wajib bila kertas bermotif (HL2) masuk |
| KT4 | Posisi keterangan preset: bawah, samping, atau di atas selotip; rotasi kecil otomatis | Perataan ketuk-berganti Instagram (Later, 1 Mei 2026); rotasi keterangan v5 §3.6 | bagus |
| KT5 | Ukuran keterangan 2 langkah (≥ 22 px, sesuai v5) | WCAG 1.4.3 (huruf tipis perlu margin) | wajib |
| KT6 | Warna berbeda per huruf | Pewarnaan selektif Instagram (Meta 2022) | tidak diusulkan (risiko kontras dan keramaian) |

**4. Halaman (kertas latar, dekorasi)**

| # | Opsi | Asal dan sumber | Prioritas |
|---|---|---|---|
| HL1 | Kertas latar polos `paper.book` (bawaan) | Usulan v5 §3.1 | wajib (ada) |
| HL2 | 3 **kertas latar** tambahan: bergaris, titik, kotak grid, dengan garis `#EDEDF0` agar semua tinta tetap lolos | Kertas garis/titik/kotak Goodnotes (umpan balik pengguna dan paket pihak ketiga, belum diverifikasi); "Add background patterns" Tico (App Store) | bagus |
| HL3 | Kertas kraft atau gelap, dengan tinta otomatis dikunci ke Tinta | Hitungan kontras §D (Kobalt 3,05 di kraft) | nanti |
| HL4 | Tombol **Acak** tata letak satu halaman: hanya mengacak posisi, rotasi, dan selotip dalam batas template, dengan urungkan; tidak menyentuh teks keterangan | Canva Shuffle (transkrip NSW); Storio "Shuffle Within Style"; Snapfish Shuffle (belum diverifikasi); perlu dicek terhadap K-005 | bagus (perlu keputusan) |
| HL5 | **Gaya halaman**: satu ketukan memasang kombinasi kertas + motif selotip + tinta yang serasi, untuk satu halaman atau semua halaman bab | Canva Styles (set penuh atau sebagian, transkrip NSW; "Apply to all pages", belum diverifikasi); Apple memory looks; Day One tema | bagus |
| HL6 | Hiasan tempel kecil bertema v5 (cap pos mini, sobekan karcis, coretan stabilo, nomor seri) dalam set terbatas | Zinnia stiker dan journal cards (App Store); PicCollage stiker (App Store); elemen tanda tangan v5 §3.4 | nanti (risiko ramai, anti-acuan) |
| HL7 | Warna latar halaman diambil dari stiker (pipet) | Shuffles pipet (Make Tech Easier) | nanti (kontras tidak terjamin) |

**5. Sampul (jumlah dan jenis template)**

| # | Opsi | Asal dan sumber | Prioritas |
|---|---|---|---|
| SP1 | Tetap 4 template (Kobalt, Tinta, Kliping, Karcis), ditambah pratinjau langsung memakai nama dan stiker milik pengguna di setiap kartu template | Kartu pratinjau langsung Day One; Theme Explorer Mixbook (belum diverifikasi) | wajib |
| SP2 | Posisi judul dan stiker dikunci per template; pengguna hanya memilih isi | Polarsteps (posisi judul tetap, belum diverifikasi); spesifikasi §4.5 | wajib |
| SP3 | Ganti template tanpa kehilangan nama dan stiker yang sudah dipilih | Mixbook ganti tema tanpa mengubah konten (belum diverifikasi); "100% customizable" (panduan Mixbook) | wajib |
| SP4 | Template ke-5 **jendela die-cut**: lubang bulat atau berbentuk cap yang memperlihatkan satu stiker | Artifact Uprising Color Series (jendela lingkaran) | bagus |
| SP5 | Variasi warna dasar per template (3–4 warna terkurasi) | Artifact Uprising 4 warna; Polarsteps warna tema (belum diverifikasi) | bagus (perlu dicek apakah masih termasuk "template" §4.5) |
| SP6 | Judul timbul atau foil sebagai hadiah kosmetik | Foil Artifact Uprising (emas/perak/tembaga); Chatbooks Fancy Foil | nanti |

**Gestur (berlaku untuk semua lapisan).** Setiap seret, cubit, dan putar di "Atur halaman" sudah punya tombol satu ketukan di bilah alat v5 (geser, putar, ukuran). Ini sesuai WCAG 2.5.7 dan 2.5.1 serta aturan 9 di audit aksesibilitas. Opsi baru (pilihan motif, tinta, kertas) sebaiknya berupa deret pilihan yang diketuk, bukan slider seret. Bila slider dipakai, raknya harus bisa diketuk di titik mana pun (contoh slider di SC 2.5.7).

## Belum terjawab

- Dokumentasi resmi editor Shuffles: jenis border (warna, ketebalan), bayangan, dan ada atau tidaknya tombol acak tata letak. Hanya ada listing App Store dan artikel sekunder.
- Isi pusat bantuan Canva (Styles, Shuffle), Polarsteps (sampul, warna tema), Goodnotes (preset Tape, jumlah motif bawaan), dan Snapfish (Shuffle): semuanya 403. Klaim terkait berlabel "belum diverifikasi".
- Halaman Mixbook "Theme Explorer" dan artikel bantuan ganti tema: 404. Klaim pratinjau foto pengguna di dalam tema belum diverifikasi.
- Jumlah dan nama resmi gaya teks Instagram Stories saat ini; panduan pihak ketiga tidak sepakat.
- Editor Apple Journal (iOS 26) dari sumber primer; "Journal it!" (fitur editor tidak dijelaskan di listing); Collart (listing App Store 404 saat dibuka); gaya keterangan Locket.
- Studi kasus desainer atau data metrik yang menunjukkan bahwa preset terkurasi atau tombol acak menaikkan kualitas hasil atau tingkat berbagi. Yang ditemukan hanya prinsip (Meta, Goodnotes) dan meta-analisis umum (Chernev 2015).
- Angka "jumlah tipikal" template sampul di industri buku foto; yang ada hanya contoh per layanan.
- Apakah tombol acak yang dipicu pengguna sejalan dengan K-005 ("tidak boleh diacak ulang oleh sistem"). Ini perlu keputusan, bukan riset.
- Apakah variasi warna sampul (SP5) masih termasuk "template + nama + stiker" (spesifikasi §4.5) atau sudah termasuk editor sampul lanjutan (§8).
- Kontras tinta di atas motif selotip bergaris atau titik berwarna, dan di atas raster. Tabel §D hanya menghitung warna dasar selotip dan garis `#EDEDF0`; motif berwarna lain perlu dihitung per motif.
- Keterbacaan Nanum Pen Script pada 22–24 px setelah anti-aliasing di layar Infinix Hot 11 Play (WCAG menyarankan margin untuk huruf tipis).
- Biaya performa motif selotip dan kertas bertekstur di halaman dengan banyak stiker pada 30 fps (K-016).
