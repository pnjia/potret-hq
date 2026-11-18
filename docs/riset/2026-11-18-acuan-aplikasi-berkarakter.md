# Acuan aplikasi berkarakter: teknik konkret yang membuat desain tidak generik

> Diriset: 2026-11-18 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: angka laporan tren (Canva 2026), daftar penghargaan (Apple Design Awards, Google Play), efek stiker iOS per versi, fitur Pokémon GO dan Pikmin Bloom (kapasitas, sumber data lokasi), isi Spotify Wrapped dan Letterboxd Year in Review (berganti tiap tahun; edisi 2026 belum terbit saat riset ini ditulis).
> Dipakai oleh: Q-017 (arah visual mockup v4), belum ada K-.

Melengkapi, tidak mengulang, `docs/riset/2026-11-18-desain-ui-anti-ai-slop.md` (prinsip umum, stiker transparan Strava, warna dari data Spotify Wrapped 2018). Tidak ada aset atau tangkapan layar aplikasi lain yang disalin ke repo; semua di bawah berupa deskripsi tertulis.

## Pertanyaan

1. Aplikasi koleksi, stiker, atau foto mana yang desainnya khas, dan elemen apa yang membuatnya dikenali?
2. Bagaimana aplikasi Indonesia memasukkan unsur lokal tanpa klise?
3. Tren 2025–2026 mana yang didukung sumber kredibel, dan mana yang sekadar klaim pemasaran?
4. Apa yang membuat kartu share (Spotify Wrapped, Strava, Letterboxd, Duolingo) ingin dibagikan? Hanya fakta baru di luar riset 18 Nov pagi.

## Temuan

Label: **primer** = situs atau blog resmi pemilik produk/penghargaan; **sekunder** = media atau pihak ketiga; **belum diverifikasi** = hanya terlihat di cuplikan mesin pencari, halamannya tidak bisa dibuka.

### A. Aplikasi koleksi, stiker, dan foto

- **CapWords (Apple Design Award 2025, kategori Delight and Fun)** · primer
  - Apple: CapWords "transforms images of everyday objects into interactive stickers". Pemenang diumumkan 3 Juni 2025, 12 pemenang dari 36 finalis.
  - Sumber: https://www.apple.com/newsroom/2025/06/apple-unveils-winners-and-finalists-of-the-2025-apple-design-awards/ (diakses 2026-11-18)
  - Artikel pengembang Apple (4 Des 2025): penghargaan itu "due in large part to the moment when a photo becomes a sticker". Alur: "Capture → remove background → confirm → display the result". Langkah konfirmasi sengaja dipakai untuk memberi waktu API mengembalikan hasil, dengan mikro-animasi selama proses. Prinsip desainnya "grounded in real-world physics: sound, touch, and sight cues". Pemotongan memakai VisionKit karena model di perangkat yang dicoba sebelumnya menghasilkan tepi kurang rapi. Tim 3 orang, dibangun sekitar 4 bulan.
  - Pendiri (Ace Lee): ide muncul dari anaknya yang serius "seperti membuat karya seni", lalu gagasan untuk "'peel' things off from the real world and collect them".
  - Sumber: https://developer.apple.com/articles/capwords (terbit 2025-12-04, diakses 2026-11-18)

- **Efek stiker sistem iOS (Outline, Comic, Puffy, Shiny)** · primer + sekunder
  - Panduan resmi Apple (iPadOS 17): sentuh dan tahan subjek → Add Sticker → "Tap Add Effect if you want to apply a visual effect such as Outline, Comic, or Puffy". Halaman yang terbaca tidak menyebut Shiny.
  - Sumber: https://support.apple.com/guide/ipad/make-stickers-from-your-photos-ipadd833ac4d/17.0/ipados/17.0 (diakses 2026-11-18)
  - Sekunder: Outline memberi bingkai putih tebal seperti stiker cetak; Puffy memberi kilau plastik yang bergerak saat ponsel dimiringkan; Shiny memberi kilau pelangi holografik.
  - Sumber: https://www.cultofmac.com/how-to/how-to-make-stickers-from-photos-on-iphone ; https://www.macrumors.com/how-to/add-effects-to-stickers-in-messages/ (diakses 2026-11-18)

- **Instagram Cutouts dan stiker Frames** · primer
  - Meta (2 Mei 2024): Cutouts mengubah bagian foto/video di galeri menjadi stiker yang tersimpan di baki stiker. Stiker "Frames" "turns any photo into an instant print"; penonton mengguncang ponsel untuk "mencuci" foto.
  - Sumber: https://about.fb.com/news/2024/05/new-stickers-in-instagram-stories (diakses 2026-11-18)

- **Airbnb, redesain Mei 2025** · primer + sekunder
  - Airbnb (13 Mei 2025): "a design system with a dimensional and beautifully animated interface". Siaran pers tidak menyebut ikon 3D secara eksplisit.
  - Sumber: https://news.airbnb.com/en-uk/2025-summer-release-now-you-can-airbnb-more-than-an-airbnb (diakses 2026-11-18)
  - It's Nice That (14 Mei 2025): desain aplikasi, UI, 3D, dan ilustrasi dikerjakan tim internal. Ikon baru dibangun "over the last couple of years", digambarkan playful dan kaya detail; VP desain Teo Connor menyebutnya "a universal language". Tujuan: "Fun, alive, and simple". Tab Trips menjadi "living itinerary".
  - Sumber: https://www.itsnicethat.com/articles/airbnb-app-redesign-140525 (diakses 2026-11-18)
  - Sekunder (cuplikan, artikel berbayar tidak terbuka): Bloomberg 13 Jun 2025 membingkainya sebagai kembalinya dimensi, bersama Liquid Glass Apple.
  - Sumber: https://www.bloomberg.com/news/articles/2025-06-13/apple-airbnb-ditch-flat-app-icons-for-new-3d-ui-design (diakses 2026-11-18; belum diverifikasi)

- **Duolingo, bahasa bentuk ilustrasi** · primer
  - Blog Duolingo (2 Jul 2020, Megan Barker): gaya bergeser dari bentuk datar runcing ke bentuk bulat yang ramah. Pakai detail sesedikit mungkin asal subjek jelas; beri ruang agar siluet terbaca; garis dan sudut diputar untuk mengarahkan mata ke UI atau teks; detail kunci dilebih-lebihkan mendekati karikatur. Alasan: cepat diproduksi tim kecil, mudah dipahami, dan membuat belajar terasa tidak menakutkan.
  - Sumber: https://blog.duolingo.com/shape-language-duolingos-art-style/ (diakses 2026-11-18)
  - Belum diverifikasi: cuplikan pedoman lama design.duolingo.com menyebut tiga bentuk dasar (persegi panjang membulat, lingkaran, segitiga membulat), bentuk runcing dilarang, dan contoh "15 bentuk = pas, 30 = terlalu banyak". Halaman itu sekarang dialihkan ke https://blog.duolingo.com/hub/design/ dan aturannya tidak tampil.
  - Sumber: https://design.duolingo.com/illustration (diakses 2026-11-18; dialihkan)

- **Duolingo, tonggak streak** · primer
  - Blog Duolingo (21 Jan 2022, Kurt Hartfelder): pada tonggak (1 minggu, 1 bulan, 100 hari, 1 tahun) maskot berubah wujud menjadi phoenix berapi, karena versi lama (memegang balon angka) dinilai "Cute, but not quite celebratory enough". Kartu share sederhana bisa disimpan atau dibagikan tanpa keluar aplikasi. Animasi dibuat lewat beberapa putaran kasar untuk menyetel ritme: "Timing is everything in animation". Tidak ada angka metrik yang diterbitkan.
  - Sumber: https://blog.duolingo.com/streak-milestone-design-animation (diakses 2026-11-18)

- **Pikmin Bloom, Decor Pikmin** · primer + sekunder
  - Nintendo (8 Apr 2022): "The Decor Pikmin will wear an item that matches where you found the seedling." Ikon jenis lokasi (supermarket, restoran, minimarket) menunjukkan dekor apa yang bisa didapat.
  - Sumber: https://nintendo.com/whatsnew/mobilenews-pikmin-bloom-rolls-out-sushi-themed-decor-pikmin (diakses 2026-11-18)
  - Wiki penggemar: kafe → cangkir kopi, stasiun → kereta kertas atau tiket, taman → semanggi. Tempat tanpa kategori memberi dekor "Roadside" (stiker atau koin). Data lokasi dari OpenStreetMap dan Foursquare.
  - Sumber: https://pikminwiki.com/Decor_Pikmin (diakses 2026-11-18; sekunder)

- **Pokémon GO, Postcard Book** · primer
  - Pusat bantuan resmi: Postcard Book adalah koleksi kartu pos dari PokéStop/Gym yang dikunjungi atau dari hadiah teman, kapasitas bawaan 350. Kartu pos dari suatu wilayah dihitung untuk medali Vivillon Collector; pola sayap Vivillon mengikuti wilayah asal kartu pos.
  - Sumber: https://scopelyexplore.helpshift.com/hc/faq/1140-what-is-the-postcard-book/ (dialihkan dari niantic.helpshift.com, diakses 2026-11-18)

- **Locket** · sekunder
  - TechCrunch (2 Agu 2022): foto muncul langsung di widget layar utama teman, maksimal 20 orang. Matt Moss: "a simple camera experience", tanpa rencana filter atau efek; tujuannya agar ponsel terasa seperti "a place where your favorite people are at the center".
  - Sumber: https://techcrunch.com/2022/08/02/locket-app-that-lets-yor-post-photos-to-your-loved-ones-homescreens-raises-12-5m (diakses 2026-11-18)

- **Retro** · sekunder
  - TechCrunch (7 Jul 2023): strip film mingguan di atas layar, satu kartu per teman per minggu ("one card for you, whether you've shared one photo or 50 photos"), dorongan berbagi minimal satu foto per minggu. Nathan Sharp: "By nudging everybody to share, it lowers the pressure of what you feel like you have to share."
  - Sumber: https://techcrunch.com/2023/07/07/retro-is-a-deeply-personal-photo-journaling-app-for-close-friends/ (diakses 2026-11-18)

- **Dispo** · primer (halaman App Store)
  - "Photos develop every day at 9am, making the process of seeing your photos magical." Kamera digital sekali pakai.
  - Sumber: https://apps.apple.com/us/app/-/id1491684197 (diakses 2026-11-18)

- **Polarsteps** · primer (situs perusahaan)
  - 5 Mar 2026: Apple menyorotnya sebagai salah satu aplikasi perjalanan favorit. Prinsip pendiri Job Harmsen saat mengadopsi Liquid Glass: "don't slap Liquid Glass on everything"; ikuti komponen platform "without losing the distinctive Polarsteps identity". Rute perjalanan diplot otomatis di peta dunia.
  - Sumber: https://www.polarsteps.com/news/apple-spotlights-polarsteps-as-one-of-its-most-loved-travel-apps-and-applauds-its-design-approach (diakses 2026-11-18)

- **Partiful** · primer (penghargaan) + sekunder
  - Google (18 Nov 2024): Partiful meraih Best App Google Play 2024 "thanks to its intuitive design and fresh twist on invite creation".
  - Sumber: https://blog.google/products-and-platforms/platforms/google-play/google-play-best-apps-games-2024/ (diakses 2026-11-18)
  - Modern Retail (16 Mar 2023): "bold, graphic Gen Z-friendly aesthetic". Tidak ditemukan wawancara desainer Partiful soal sistem visualnya.
  - Sumber: https://www.modernretail.co/technology/how-partiful-has-become-the-hottest-invitation-app-for-startup-founders/ (diakses 2026-11-18)

### B. Karakter lokal Indonesia

- **Gojek, rebrand 2019** · primer (cermin) + sekunder
  - Pos "A new Gojek" (22 Agu 2019, Gojek Design Team): logo Solv dipilih karena unik, mudah diingat, dan lentur di semua ukuran; bisa dibaca sebagai tombol daya, ikon cari, pin peta, atau pengemudi dilihat dari atas. Palet yang terlalu ramai dipangkas menjadi **enam warna yang mengelompokkan lini produk**. Sistem merek (tipografi, fotografi, ilustrasi, nada bahasa, komposisi, ikon, sonic branding) didokumentasikan dalam buku merek 200+ halaman.
  - Sumber: https://compfest-11.netlify.app/blog/a-new-gojek (cermin pos blog.gojek.io; aslinya di https://blog.gojek.io/a-new-gojek tidak terbuka, diakses 2026-11-18)
  - Marketing Interactive (23 Jul 2019): pembagian warna per kelompok (transportasi hijau, makanan dan ritel merah, pembayaran biru, berita dan hiburan merah muda, kebutuhan harian oranye, bisnis ungu). Logo lama menggabungkan ojek dan simbol wifi.
  - Sumber: https://www.marketing-interactive.com/gojek-revamps-logo-shares-insights-to-new-look-and-creative-challenges/ (diakses 2026-11-18)
  - Belum diverifikasi: cuplikan pos Gojek "How we make the GO-JEK app come alive" menyebut ilustrasi menggambarkan kehidupan sehari-hari yang akrab bagi pengguna Indonesia, dengan kepribadian "colloquial, bright, and empathetic", kadang memakai meme.
  - Sumber: https://blog.gojek.io/how-we-make-the-go-jek-app-come-alive (halaman tidak terbuka, diakses 2026-11-18)

- **Gojek Asphalt (sistem desain)** · primer
  - Fondasi: warna, tipografi, gerak, spasi, bayangan. Huruf merek Maison Neue, "the bold and playful personality of Gojek". Prinsip gerak: "We always design with the system in mind and never as individual flows." Halaman fondasi tidak menyebut unsur lokal.
  - Sumber: https://asphalt.gojek.io/pages/foundations.html (diakses 2026-11-18)

- **Plus Jakarta Sans** (font teks UI di mockup v4) · primer
  - Dipesan 6616 Studio untuk identitas "+Jakarta City of Collaboration" Pemprov DKI Jakarta, 2020; dirancang Gumpita Rahayu (Tokotype); lisensi SIL OFL 1.1. Punya tiga stylistic set bernama Indonesia: **Lancip, Lurus, Lingkar**. Narasi: "The beauty of diversity captured in typography. Like the city itself."
  - Sumber: https://raw.githubusercontent.com/tokotype/PlusJakartaSans/master/README.md (diakses 2026-11-18)

- **Huruf vernakular jalanan (wawancara Monotype, 30 Apr 2026)** · primer
  - Gumpita Rahayu: papan nama warung dan usaha kecil dibuat sendiri, "either hand-painted or crafted from stickers and cutout letters", disebut "pure vernacular expressions" yang "raw, local, and completely honest". Plus Jakarta Sans juga tampil di mural kampanye yang dicat tangan.
  - Sumber: https://cms-prod.monotype.com/company/spotlights/type-around-world-get-know-jakarta-indonesia (diakses 2026-11-18)

### C. Tren 2025–2026: mana yang kredibel

- **Material 3 Expressive (Google)** · primer, riset pengguna pemilik produk
  - 46 studi, lebih dari 18.000 peserta. Preferensi pada desain ekspresif hingga 87% di usia 18–24. Elemen kunci ditemukan hingga 4x lebih cepat (eye-tracking, 10 aplikasi). Pengguna 45+ menemukan elemen kunci secepat pengguna muda.
  - Batasan yang ditulis Google sendiri: pola yang dirusak menurunkan kegunaan (playlist yang diganti susunan sampul album bebas tidak dikenali sebagai playlist; menghapus label teks pada aksi email menurunkan kegunaan); ada minoritas kuat yang lebih suka desain tenang; daya tarik emosional tidak menutupi fungsi yang tidak jelas. Tanggal terbit tidak tercantum di halaman.
  - Sumber: https://design.google/library/expressive-material-design-google-research (diakses 2026-11-18)

- **Liquid Glass (Apple, 9 Jun 2025)** · primer
  - Material tembus pandang yang memantulkan dan membiaskan sekitarnya, warnanya dari konten di bawahnya, dengan sorotan spekular yang bergerak saat perangkat digerakkan. Alan Dye: "This is our broadest software design update ever."
  - Sumber: https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/ (diakses 2026-11-18)

- **Spotify Wrapped 2025, "analog"** · primer + sekunder
  - Newsroom Spotify (3 Des 2025): ada kartu share untuk tiap cerita data; kontrol kecepatan baru; fitur "Top Artist Sprint" dan kuis.
  - Sumber: https://newsroom.spotify.com/2025-12-03/2025-wrapped-user-experience/ (diakses 2026-11-18)
  - Fast Company Middle East (5 Des 2025): Marc Hazan (SVP marketing): "We leaned into the charm of analog inspiration, bringing back the nostalgia of a gifted mixtape or CD." Visual dibuat terasa buatan tangan (potongan gambar, coretan, tekstur). Palet terutama hitam-putih; warna disimpan untuk foto artis dan sampul album. Payman Kassaie: "If brands are looking to the future or to AI for inspiration, we did the opposite."
  - Sumber: https://fastcompanyme.com/?p=46098 (diakses 2026-11-18)
  - Rive (9 Jan 2026): Spotify menyebutnya "visual mixtape", sistem grafis yang dipakai ulang di dalam aplikasi dan kartu share; animasi dibangun di Rive lalu digerakkan data asli pengguna.
  - Sumber: https://rive.app/blog/spotify-used-rive-for-spotify-wrapped-2025 (diakses 2026-11-18)

- **Canva Design Trends 2026 "Imperfect by Design"** · laporan vendor (sekunder)
  - Metode: data pencarian di platform Canva, dewan penasihat desainer, survei 1.000 kreator di AS dan Brasil. Angka: pencarian elemen DIY dan kolase naik 90%, tata letak ala zine naik 85%, "lo-fi aesthetic" naik 527%, tekstur realistis naik 30%. Tren: Texture Check, Notes App Chic (visual scrapbook), Zinegeist (Meksiko), dll.
  - Sumber: https://ecommercenews.com.au/story/canva-backs-imperfect-by-design-trend-in-2026-report (terbit 2026-01-12, diakses 2026-11-18); rilis asli https://www.businesswire.com/news/home/20251210696597/en (10 Des 2025, tidak terbuka)

- **Kritik terhadap tren "analog"** · sekunder, opini kredibel
  - Elizabeth Goodspeed, It's Nice That (29 Jan 2026): "analog" kini lebih berupa sinyal visual daripada praktik; banyak tampilan buatan tangan dibuat dengan tekstur dan kuas digital. "The aesthetic becomes a proxy for the labour and the signal gets mistaken for the thing itself." Konten "bukti nyata" di balik layar hanya berhasil selama masih baru.
  - Sumber: https://www.itsnicethat.com/articles/elizabeth-goodspeed-on-analogue-creative-industry-290126 (diakses 2026-11-18)

### D. Kartu share (fakta baru)

- **Duolingo Year in Review** · primer
  - Blog Duolingo (8 Des 2022): pada 2021 peringkat persentil XP ditambahkan ke kartu share dan menaikkan tingkat berbagi, terutama di kalangan pengguna teratas. Data 2020: 10% pengguna XP teratas menyumbang lebih dari separuh share. Karena itu ditambahkan "learner styles" (gaya belajar dari kebiasaan di aplikasi) agar semua orang punya alasan berbagi, dan ini "significantly boosted share rates". Nama gaya diadaptasi per bahasa (25 bahasa UI), bukan sekadar diterjemahkan. Persentase kenaikan tidak diterbitkan.
  - Sumber: https://blog.duolingo.com/year-in-review-behind-the-scenes (diakses 2026-11-18)

- **Letterboxd "Four Favourites"** · sekunder dengan kutipan staf
  - The Spinoff (24 Apr 2025): sejak awal pengguna diminta memilih empat film favorit untuk profil. Kepala media sosial Letterboxd, Aaron Yap: "It almost encapsulates who you are as a Letterboxd member"; empat dipilih karena tiga terlalu sempit dan lima terlalu banyak ("the fifth one is like a lifeboat"). Formatnya menyebar ke luar platform (wawancara karpet merah, pesta kostum, versi merek lain).
  - Sumber: https://thespinoff.co.nz/culture/24-04-2025/how-letterboxds-four-favourites-took-over-the-internet (diakses 2026-11-18)

- **Strava Year in Sport (sistem grafis oleh Manual)** · sekunder
  - It's Nice That (15 Mar 2021): dibangun dari elemen sederhana, "lines, dots, colour strips, circles, and typography", supaya mudah dianimasikan. Warna diambil dari strip nomor dada lomba dan pakaian atlet, lalu diredam ke nada alami (navy, hijau zaitun). Cerita disusun seperti bab: gambaran besar, usaha, puncak (elevasi), lalu pencapaian dengan foto. Animasi diekspor sebagai Lottie.
  - Sumber: https://www.itsnicethat.com/articles/manual-strava-year-in-sport-graphic-design-150321 (diakses 2026-11-18)

## Kesimpulan

**Fakta bersumber.** Aplikasi yang dikenali punya satu momen atau satu aturan yang konsisten, bukan banyak dekorasi:

- Momen: CapWords menang penghargaan Apple terutama karena momen foto menjadi stiker. Duolingo membuat maskotnya berubah wujud pada tonggak.
- Aturan: Duolingo membatasi bahasa bentuk ilustrasi. Letterboxd membatasi profil pada empat film. Gojek memangkas palet menjadi enam warna kelompok.
- Ikatan dengan dunia nyata: dekor Pikmin mengikuti jenis tempat, pola Vivillon mengikuti wilayah, dan Plus Jakarta Sans lahir dari identitas sebuah kota.

Bukti tren terkuat berasal dari riset Google tentang Material 3 Expressive: desain ekspresif disukai usia 18–24 dan mempercepat penemuan aksi kunci, tetapi merugikan bila pola yang sudah dikenal dirusak. Tren "analog/buatan tangan" didukung Spotify (Wrapped 2025) dan laporan vendor (Canva), dan dikritik It's Nice That sebagai sinyal yang mudah dipalsukan. Untuk kartu share, Duolingo melaporkan bahwa peringkat relatif dan label identitas menaikkan tingkat berbagi.

**Tafsiran (bukan keputusan).**

- Mockup v4 meminjam kosakata aplikasi berkarakter (warna aksen, font display bulat, kartu radius 24), tetapi belum punya satu momen atau aturan khas yang hanya dimiliki Kliping Kota. Itu dugaan penyebab kesan "AI slop" yang tersisa.
- Ikon 3D gaya Airbnb dan tekstur grain stok berisiko menjadi klise baru, karena mudah ditiru (dugaan; lihat "Belum terjawab").
- Tekstur sebaiknya berasal dari bahan asli milik sendiri: foto pengguna, kertas yang dipindai sendiri, dan suara rekaman sendiri (sejalan dengan K-024).

### 10 teknik yang bisa dicuri untuk Kliping Kota

Semua di bawah adalah **tafsiran** yang perlu diuji. Bila menyentuh palet, tipografi, atau radius, teknik ini terkait Q-017 dan K-021, dan tidak berlaku sebelum diputuskan.

1. **Momen "kupas" sebagai pusat desain.**
   - Asal: CapWords (Apple Design Award 2025). Sumber: developer.apple.com/articles/capwords.
   - Penerapan: di layar hasil hapus latar (spesifikasi §4.3), subjek terangkat dari foto, bingkai putih tumbuh, lalu terdengar suara kupas rekaman sendiri dan getar haptik singkat.
   - Langkah "Simpan ke buku?" sekaligus menutupi waktu proses `native_cutout` dan pelabelan kategori, seperti langkah konfirmasi CapWords.
   - Ini satu-satunya animasi besar di luar page-curl. Semua layar lain tenang.
2. **Material stiker sebagai hadiah.**
   - Asal: efek Puffy/Shiny iOS. Sumber: support.apple.com, cultofmac (sekunder).
   - Penerapan: hadiah kosmetik (§4.6) berupa "material" stiker, bukan stiker baru. Contoh: temuan landmark pertama mendapat kilau holografik yang bergeser saat ponsel dimiringkan, dan lencana kelengkapan kota mendapat material emboss.
   - Kebutuhan teknis: fragment shader dan sensor gerak. Kelayakannya pada 30 fps di Infinix Hot 11 Play (K-016) belum diukur (dugaan).
3. **Dekor mengikuti kategori.**
   - Asal: Decor Pikmin. Sumber: nintendo.com, pikminwiki.
   - Penerapan: tiap kategori di `data/categories.json` (K-020) punya aksesori tempel sendiri di halaman buku. Contoh: selotip kertas cokelat untuk Makanan, label tiket untuk Kendaraan, klip logam untuk Papan nama.
   - Pemicunya label gambar, bukan jenis tempat dari peta. Dengan begitu tidak perlu data lokasi di bawah tingkat kota (K-011).
4. **Motif khas per kota.**
   - Asal: pola Vivillon per wilayah di Pokémon GO. Sumber: pusat bantuan Pokémon GO.
   - Penerapan: tiap bab kota punya satu motif tepi, dipakai di halaman pembatas, stempel kota, dan tepi kartu share. Contoh untuk Sukabumi: motif dari bentuk landmark yang dikurasi.
   - Motif dibuat sendiri dan disimpan bersama `City.stampAsset`. Hindari motif "Indonesia generik" seperti batik atau wayang.
5. **Huruf vernakular dari papan nama asli.**
   - Asal: papan warung dari huruf potong dan stiker (wawancara Gumpita Rahayu). Sumber: monotype.com.
   - Penerapan: judul bab dan angka stempel kota memakai huruf potong yang difoto sendiri dari papan nama di Sukabumi (izin pemilik papan perlu dicek), lalu ditempel seperti kliping.
   - Ini juga mengikat nama "Kliping" ke kebiasaan visual jalanan lokal.
6. **Pakai stylistic set Plus Jakarta Sans.**
   - Asal: Tokotype (Lancip, Lurus, Lingkar). Sumber: README GitHub tokotype/PlusJakartaSans.
   - Penerapan: aktifkan satu set alternatif untuk angka dan judul (misalnya "23/100" di stempel) lewat fitur OpenType di Flutter, supaya huruf tidak tampil dalam bentuk bawaan yang dipakai jutaan situs.
   - Belum dicek apakah file di Google Fonts memuat set ini (lihat "Belum terjawab").
7. **Batas kurasi "empat".**
   - Asal: Letterboxd Four Favourites. Sumber: The Spinoff.
   - Penerapan: halaman identitas buku (§4.5 butir 2) dan satu varian kartu share menampilkan tepat empat temuan pilihan pengguna untuk sebuah kota, misalnya "Sukabumi-ku dalam 4 temuan".
   - Batas yang memaksa memilih membuat kartu terasa personal dan mudah dibandingkan antar-teman.
8. **Label identitas, bukan hanya angka.**
   - Asal: Duolingo Year in Review. Sumber: blog.duolingo.com.
   - Penerapan: halaman statistik (§4.5 butir 5) dan kartu share menampilkan label dari kategori dominan pengguna, misalnya "Pemburu Papan Nama", di samping "Sukabumi 23/100". Dengan begitu pengguna dengan sedikit temuan pun punya alasan berbagi.
   - Peringkat relatif antar-pengguna perlu ditinjau `penasihat-privasi` lebih dulu (pemrofilan, K-017). Label dihitung di perangkat dari data milik sendiri.
9. **UI monokrom, warna dari konten.**
   - Asal: Spotify Wrapped 2025. Sumber: Fast Company ME.
   - Penerapan: bingkai aplikasi (navigasi, tombol sekunder, latar) hitam-putih atau kertas. Warna hanya datang dari cutout pengguna dan `City.accentColor`, satu aksen per kota.
   - Ini menguji alternatif v4, yang memakai kobalt, lime, dan lima warna kategori sekaligus dan bisa bersaing dengan foto pengguna. Arah ini juga sudah tertulis di `docs/desain/arah-visual.md` §1 ("warna ramai dibawa oleh konten").
10. **Tonggak yang mengubah wujud.**
    - Asal: Duolingo streak (maskot jadi phoenix). Sumber: blog.duolingo.com.
    - Penerapan: stempel kota berubah wujud pada tonggak `City.findingTarget`, misalnya 25, 50, dan 100 temuan (K-028): cap tinta biasa, lalu cap ganda, lalu cap timbul emas. Tiap tonggak memunculkan kartu share sederhana yang langsung bisa disimpan ke galeri.

**Cadangan (tidak masuk 10, layak dicatat):**

- Tombol potret besar dengan bentuk khas dan gerak pegas, sambil mempertahankan pola yang sudah dikenal di daftar isi kota (Material 3 Expressive, design.google).
- "Cuci cetak" mingguan yang mengikuti ritme misi (§4.6), meniru jam cuci Dispo dan kartu mingguan Retro.
- Ikon kategori dan siluet "???" dari sedikit bentuk dasar dengan satu aturan (Duolingo shape language).

## Belum terjawab

- Isi pedoman ilustrasi resmi Duolingo (design.duolingo.com dialihkan); aturan "tiga bentuk dasar" hanya terlihat di cuplikan pencarian.
- Pos asli Gojek tentang ilustrasi "kehidupan sehari-hari Indonesia" dan pos Medium Gojek "Design at Scale: Making GOJEK part of Indonesia's visual language" (403/tidak terbuka). Klaim soal meme dan nada "colloquial, bright, and empathetic" belum diverifikasi.
- Sistem ilustrasi Tokopedia ("A Whole New Toped Universe", Medium Tokopedia Design) tidak bisa dibuka (403). Tidak ditemukan sumber yang menjelaskan unsur lokal di Tokopedia Unify.
- Artikel Bloomberg (berbayar) tentang kembalinya desain dimensional; klaim bahwa ikon 3D Airbnb cepat ditiru alat AI tidak punya sumber yang bisa dibuka (dugaan).
- Wawancara desainer Partiful, Poparazzi, Cosmos, atau Locket tentang keputusan visual mereka: tidak ditemukan sumber primer.
- Apakah Plus Jakarta Sans versi Google Fonts memuat stylistic set Lancip/Lurus/Lingkar, dan apakah Flutter `FontFeature.stylisticSet` mengaktifkannya di kedua platform.
- Daftar resmi efek stiker iOS terbaru (halaman iPhone tidak terbaca; Shiny hanya dari sumber sekunder).
- Data apakah label identitas atau batas "empat" menaikkan tingkat berbagi di Indonesia; semua angka Duolingo bersifat global dan tanpa persentase.
- Biaya performa efek holografik berbasis shader di Infinix Hot 11 Play.
