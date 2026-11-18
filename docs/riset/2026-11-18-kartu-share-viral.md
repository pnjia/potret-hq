# Kartu share yang banyak dibagikan: pemicu, variasi gaya, format, dan alur Bagikan

> Diriset: 2026-11-18 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: angka DataReportal/GWI Indonesia (terbit tiap tahun, edisi terbaru 4 Nov 2026), spesifikasi teknis Instagram Sharing to Stories, TikTok Share Kit (diperbarui 4 Agu 2026), dan WhatsApp Share to Status (dokumentasi resmi belum ditemukan), Pedoman App Store dan Kebijakan Developer Meta (diperbarui 3 Feb 2026), fitur rekap tahunan (Wrapped, Replay, Year in Sport, Unpacked, Year in Review) yang berganti tiap tahun. Edisi 2026 semua rekap tahunan belum terbit saat riset ini ditulis.
> Dipakai oleh: belum (calon: spesifikasi §4.8 Share, `docs/desain/acuan/kartu-share.md`, Q-017, Q-018)

Melengkapi dan tidak mengulang:

- `docs/riset/2026-11-18-desain-ui-anti-ai-slop.md`: stiker transparan Strava (dasar fitur), warna dari data Spotify Wrapped 2018, tipografi Wrapped 2024.
- `docs/riset/2026-11-18-acuan-aplikasi-berkarakter.md`: Duolingo Year in Review (persentil dan learner styles menaikkan tingkat berbagi), Letterboxd Four Favourites, Wrapped 2025 bergaya "analog", Strava Year in Sport (sistem grafis Manual), Pokémon GO Postcard Book, Locket, dan Retro.
- `docs/riset/2026-11-17-nama-suara-zona-aman.md`: zona aman 9:16 Meta dan TikTok.

Tidak ada aset atau tangkapan layar aplikasi lain yang disalin ke repo. Semua acuan ditulis sebagai deskripsi.

Label: **primer** = situs, dokumentasi, atau pernyataan resmi pemilik produk; **sekunder** = media atau pihak ketiga. **Terbukti** = tertulis di sumber yang dibuka; **dugaan** = tafsiran atau sumber yang tidak bisa dibuka penuh.

## Pertanyaan

1. Kartu share mana dari 2024–2026 yang terbukti banyak dibagikan? Untuk tiap aplikasi: variasi gaya, unsur personalisasi, dan pemicu berbaginya.
2. Format apa yang dipakai (Story 9:16, feed 4:5/3:4, persegi, stiker transparan, video, carousel), dan bagaimana layar Bagikan memilih gaya?
3. Di Indonesia, ke mana orang membagikan (Instagram Stories, WhatsApp Status, TikTok)? Apa spesifikasi teknis share intent masing-masing?
4. Watermark, tautan balik, dan "buat punyamu": apa yang terbukti, dan apa yang hanya klaim pemasaran?
5. Etika: batas apa yang perlu dijaga agar tidak memaksa orang berbagi dan tidak membocorkan lokasi?

## Temuan

### A. Aplikasi acuan: data, variasi, dan pemicu

- **Spotify Wrapped 2025, angka resmi** · primer · terbukti
  - Prepared remarks laporan keuangan Q4 2025 (Feb 2026), Alex Norström: "A driver of MAU outperformance is Wrapped". Di akhir kampanye, "more than 300 million users engaged, up 20%" dan "more than 630 million shares across social media, up 42%". Hari pertama Wrapped juga menjadi hari dengan jumlah pelanggan baru tertinggi dalam sejarah Spotify.
  - Sumber: https://s29.q4cdn.com/175625835/files/doc_financials/2025/q4/Q4-25-Earnings-Call-Prepared-Remarks.pdf (halaman 4, diakses 2026-11-18)
  - Angka hari pertama, menurut Music Business Worldwide (8 Des 2025, mengutip Marc Hazan): sekitar 200 juta pengguna terlibat dalam sekitar 24 jam (2024 butuh sekitar 62 jam) dan sekitar 500 juta share (+41%). Definisi "share" di sana mencakup share native di aplikasi, unduhan, dan **tangkapan layar**. Pengguna terlibat = melihat minimal satu cerita.
  - Sumber: https://www.musicbusinessworldwide.com/spotify-wrapped-campaign-hit-200m-engaged-users-in-24-hours-a-19-yoy-increase (diakses 2026-11-18; sekunder)
  - Catatan: angka "share" Spotify ikut menghitung tangkapan layar. Ini bukan angka konversi pengguna baru, karena tidak ada data instal yang berasal dari share.

- **Spotify Wrapped 2025, mekanisme** · primer + sekunder · terbukti
  - Newsroom (3 Des 2025): ada "share cards for your data stories", yang bisa dikirim lewat Spotify Messages atau diposting ke media sosial. Fitur baru: **Clubs** (pengguna dimasukkan ke salah satu dari enam klub, "each representing a unique listening style"), **Listening Age** (membandingkan selera dengan kelompok usia sendiri), **Wrapped Party**, kuis lagu teratas, dan kontrol kecepatan.
  - Sumber: https://newsroom.spotify.com/2025-12-03/2025-wrapped-user-experience/ (diakses 2026-11-18)
  - TechCrunch (3 Des 2025): Wrapped Party bisa mengundang sampai 9 teman dan memberi penghargaan kelompok ("most obsessed fan", "early bird", "picky listener", "dinner table explainer") yang berubah tiap sesi. Klub punya peran berdasarkan data (club leader, scout, archivist). Nama klub antara lain "Soft Hearts Club" dan "Club Serotonin".
  - Sumber: https://techcrunch.com/2025/12/03/spotifys-2025-wrapped-becomes-a-multiplayer-experience/ (diakses 2026-11-18; sekunder)
  - Pemicu yang terlihat: identitas/label (klub, peran), perbandingan (Listening Age, Party), kejutan (kuis), dan kelangkaan waktu (hanya Desember). Klaim bahwa Listening Age viral karena hasilnya lucu atau memalukan hanya ada di artikel Fast Company yang tidak bisa dibuka (403), jadi **dugaan**.

- **Duolingo Year in Review: hadiah untuk berbagi** · primer · terbukti
  - Pos blog (8 Des 2022): "Learners who share their Year-in-Review results are rewarded with a special themed Leaderboard badge". Lencana itu bertema sesuai learner style masing-masing. Fakta tentang persentil dan learner styles sudah ada di riset 18 Nov dan tidak diulang di sini.
  - Sumber: https://blog.duolingo.com/year-in-review-behind-the-scenes (diakses 2026-11-18)
  - Cuplikan pencarian Android Authority (Des 2025) menyebut edisi 2025 juga memberi "bonus" bagi yang membagikan statistiknya. Halaman itu tidak bisa dibuka (403), jadi **dugaan**.
  - Sumber: https://www.androidauthority.com/duolingo-year-in-review-2025-3621782 (diakses 2026-11-18; 403)

- **Strava** · sekunder · terbukti
  - Sticker Stats (BikeRadar, 9 Apr 2025): stiker berisi jarak, elevasi, waktu, **gambar garis rute**, dan logo Strava. Stiker bisa disalin ke clipboard atau langsung dikirim ke Instagram Story. Aktivitas privat tidak bisa dibagikan; visibilitasnya harus "everyone" atau "followers".
  - Sumber: https://www.bikeradar.com/news/strava-sticker-stats-spring-2025-updates (diakses 2026-11-18)
  - Year in Sport 2025 (Tantek Çelik, 2 Jan 2026): hanya ada di aplikasi ponsel, disimpan per "segmen" lewat tombol masing-masing, dan "no videos this year". Halaman bantuan resmi Strava tidak bisa dibuka (pengalihan berulang). Klaim dari cuplikan pencarian bahwa edisi 2025 butuh langganan dan bisa diakses 8 Des 2025–23 Jan 2026 masih **dugaan**.
  - Sumber: https://tantek.com/2026/002/t1/find-export-strava-year-in-sport (diakses 2026-11-18)
  - Ada banyak aplikasi pihak ketiga yang menjual template overlay untuk data Strava, dengan rasio 9:16 dan 4:5 (contoh: Run Story di App Store). Tafsiran: ada permintaan akan variasi gaya yang tidak dipenuhi aplikasi aslinya (**dugaan**).
  - Sumber: https://apps.apple.com/us/app/run-story/id6737940528 (cuplikan pencarian, diakses 2026-11-18)

- **Nike Run Club** · primer · terbukti
  - Halaman bantuan Nike: Activity → pilih lari → menu tiga titik → Share. Pengguna memilih antara **gambar rute** atau **foto/poster yang dihias stiker dan data lari**, lalu memilih kanal media sosial.
  - Sumber: https://www.nike.com/nl/en/help/a/nrc-share (diakses 2026-11-18)

- **Polarsteps Unpacked** · primer · terbukti
  - Rilis 15 Des 2025: rekap tahunan di dalam aplikasi berisi "unique travel stats" dan "personalized travel personality", yang disebut "even more fun to share". Syaratnya minimal satu perjalanan berkonten setahun terakhir. Halaman tidak merinci format kartu, tingkat detail lokasi, atau angka berbagi.
  - Sumber: https://www.polarsteps.com/news/polarsteps-unpacked-and-2025-travel-report-the-year-in-travel (diakses 2026-11-18)

- **Goodreads Year in Books 2025** · primer · terbukti
  - Blog (6 Des 2025): halaman statistik pribadi terbit di bulan Desember, syaratnya minimal tiga buku bertanggal baca 2025, dan pembaca diajak memakai tagar #GoodreadsYearInBooks. Pos tidak merinci gambar atau kartu share.
  - Sumber: https://www.goodreads.com/blog/show/3064 (diakses 2026-11-18)

- **Pinterest Shuffles / Collages** · sekunder · terbukti
  - TechCrunch (24 Agu 2022): Shuffles menyebar lewat kolase "mood board" bergerak di TikTok yang diberi musik. Objek bisa dianimasikan (goyang, putar, berdenyut). Aplikasinya **khusus undangan**: tiap pengguna punya 5 undangan, dan ada yang mengeluh harus memohon kode. Pada pekan 15–22 Agu 2022, Shuffles naik ke peringkat 5 kategori Lifestyle iPhone AS (data.ai), lalu peringkat 1 pada 21 Agu. Unduhan bulan pertama diperkirakan 211 ribu (data.ai) sampai 338 ribu (Sensor Tower). Objek di kolase tertaut ke halaman Pin.
  - Sumber: https://techcrunch.com/2022/08/24/shuffles-pinterests-invite-only-collage-making-app-is-blowing-up-on-tiktok-heres-how-to-get-in (diakses 2026-11-18)
  - Social Media Today (24 Sep 2024): **Collage Remix** memungkinkan pengguna membuat versi sendiri dari kolase orang lain, dengan label pembuat asli di pojok kiri bawah. Kolase bisa diunduh sebagai video untuk Instagram Stories, dengan **watermark Pinterest** yang mengarahkan penonton ke kolase asli. Tautan Pin di video tidak aktif, tetapi pengguna bisa menambah stiker tautan.
  - Sumber: https://www.socialmediatoday.com/news/pinterest-adds-new-collage-remix-and-sharing-options/727961/ (diakses 2026-11-18)

- **Instagram "Add Yours"** · primer · terbukti
  - Halaman tips Instagram (1 Apr 2024): stiker Add Yours (2021) membuat utas Story publik yang bisa diikuti siapa saja. **Add Yours Templates** mengubah GIF, teks, atau gambar di Story menjadi template yang diisi orang lain dengan versinya sendiri. Ada **tombol dadu** "for inspiration". Layout bisa menyusun beberapa foto menjadi kolase dalam satu Story.
  - Sumber: https://about.instagram.com/blog/tips-and-tricks/instagram-story-tips-tricks (diakses 2026-11-18)

- **Pikmin Bloom, kartu pos** · primer · terbukti
  - Pusat bantuan (Scopely): kartu pos adalah "digital keepsakes" dengan foto dari Wayspot Wayfarer. Teman bisa saling mengirim satu kartu pos per hari, sampai dalam 12 jam, dan diantar seekor Pikmin. Kartu pos yang diterima tidak bisa diteruskan. Layar detail kartu pos punya tombol **Share** (media sosial) dan **Save to device**.
  - Sumber: https://scopelyexplore.helpshift.com/hc/faq/2147-postcards/ (dialihkan dari niantic.helpshift.com, diakses 2026-11-18)
  - Nintendo Life (14 Des 2021, catatan pembaruan v36.0): fitur berbagi tangkapan layar ditambahkan, dan foto AR diberi logo.
  - Sumber: https://www.nintendolife.com/news/2021/12/pikmin-bloom-update-adds-new-share-features-and-reduces-network-usage (diakses 2026-11-18)

- **BeReal Recap** · sekunder · terbukti
  - Bustle (terbit 5 Jan 2023, diperbarui 20 Feb 2024): rekap berupa video slideshow cepat dari semua BeReal setahun. Video bisa disimpan atau langsung diposting ke Instagram, TikTok, dan Twitter, dan **tidak berwatermark profil**.
  - Sumber: https://www.bustle.com/life/how-to-get-bereal-recap-year-in-review-video (diakses 2026-11-18)

- **Locket Rollcall** · sekunder · terbukti
  - Social Samosa (4 Nov 2025): Rollcall mengajak pengguna membagikan foto favorit dari **sepekan terakhir** dan memakai Live Activities iOS. Pada pekan pertama ada lebih dari 1 juta posting; lebih dari 25% pengguna aktif ikut tiap minggu; sekitar 80% pengguna awal adalah Gen Alpha. Total instal Locket lebih dari 91 juta (Appfigures).
  - Sumber: https://www.socialsamosa.com/news-2/locket-91-mn-installs-10622388 (diakses 2026-11-18)

- **CapWords** · primer · terbukti (terbatas)
  - Halaman App Store: foto diubah menjadi stiker kata. Daftar fitur hanya menyebut "Export to other apps", tanpa rincian kartu atau tujuan media sosial.
  - Sumber: https://apps.apple.com/app/id6738896465 (diakses 2026-11-18)

- **Apple Music Replay 2025** · sekunder · sebagian besar dugaan
  - 9to5Mac (2 Des 2025) menyebut rekap ini "ready to explore and share" tanpa merinci kartu. Klaim di situs lain (highlight reel video, kartu dengan warna yang dipersonalisasi, tombol ke Instagram Stories/Reels dan TikTok) berasal dari situs agregator berkualitas rendah atau cuplikan yang tidak bisa diatribusikan. Karena itu dicatat di "Belum terjawab".
  - Sumber: https://9to5mac.com/2025/12/02/apple-music-replay-2025-personal-listening-recap-is-ready-to-explore-and-share (diakses 2026-11-18)

### B. Format

- **Instagram feed: 3:4 dan carousel 20**
  - 9to5Mac (29 Mei 2025): Adam Mosseri mengumumkan dukungan foto **3:4**, "the format that almost every phone camera defaults to". Sebelumnya foto paling tinggi 4:5.
  - Sumber: https://9to5mac.com/2025/05/29/instagram-changes-standard-photo-aspect-ratio/ (diakses 2026-11-18; sekunder)
  - PetaPixel (9 Agu 2024): carousel feed bisa berisi sampai **20** foto atau video (sebelumnya 10). Halaman tidak dibuka penuh; angka diambil dari cuplikan pencarian yang konsisten di beberapa media (**dugaan kuat**).
  - Sumber: https://petapixel.com/2024/08/09/instagram-users-can-now-share-20-photos-videos-in-a-post-carousel-photodump (diakses 2026-11-18)
- **TikTok photo mode**: lihat batas Share Kit di bagian C (iOS sampai 35 gambar, rasio 1/2,2–2,2).
- **Stiker transparan**: Instagram Stories punya lapisan stiker resmi (bagian C). Strava memakainya untuk Sticker Stats (bagian A).
- **Video**: Shuffles (video kolase berwatermark) dan BeReal Recap (slideshow tanpa watermark) membagikan rekap sebagai video. Instagram Stories menerima video latar sampai 20 detik (bagian C).
- **Banyak kartu**: Spotify membuat kartu per cerita data; Strava Year in Sport menyimpan per segmen tanpa ekspor gabungan. Belum ditemukan sumber yang menyebut aplikasi acuan mengekspor rekap sebagai carousel siap unggah.

### C. Tujuan berbagi di Indonesia dan spesifikasi teknis

- **Penggunaan platform (GWI, Q2 2026)** · primer (laporan data) · cek ulang
  - DataReportal "Digital 2027: Indonesia" (terbit 4 Nov 2026). Persentase pengguna internet 16+ yang memakai platform minimal sekali sebulan: WhatsApp 92,7%, Instagram 84,0%, TikTok 81,0%, Facebook 79,5%, YouTube 78,1%, Telegram 52,0%, X 44,3%, Pinterest 34,1%, Threads 33,0%, Snapchat 9,4%.
  - Identitas pengguna media sosial: 240 juta pada Okt 2026 (83,2% populasi; tidak sama dengan individu unik).
  - Jangkauan iklan akhir 2026: Instagram 116 juta (40,3% populasi), Facebook 126 juta, YouTube 155 juta. TikTok tercatat "240 juta pengguna 18+ (117,0% dari dewasa 18+)". Angka di atas 100% ini ganjil dan oleh laporannya sendiri disebut bukan pengguna aktif.
  - Laporan tidak memuat data platform favorit atau waktu pakai per platform.
  - Sumber: https://datareportal.com/reports/digital-2027-indonesia (diakses 2026-11-18)
  - Edisi sebelumnya, "Digital 2026: Indonesia" (terbit 5 Nov 2025): 180 juta identitas pada Okt 2025; jangkauan iklan Instagram 108 juta dan TikTok 18+ 180 juta. Laporan memperingatkan bahwa angka jangkauan iklan bisa direvisi. Tidak ada angka WhatsApp.
  - Sumber: https://datareportal.com/reports/digital-2026-indonesia (diakses 2026-11-18)
  - Tidak ditemukan angka khusus Indonesia untuk pemakaian **WhatsApp Status** atau **Instagram Stories** (lihat "Belum terjawab").

- **WhatsApp Status, skala global** · primer · terbukti
  - Blog WhatsApp (16 Jun 2025): tab Updates, rumah Status dan Channels, "now used by 1.5 billion people a day". Status tetap terenkripsi end-to-end.
  - Sumber: https://blog.whatsapp.com/helping-you-find-more-channels-and-businesses-on-whatsapp (diakses 2026-11-18)

- **Instagram Sharing to Stories** · primer · terbukti · cek ulang
  - iOS: skema `instagram-stories://share?source_application=<Facebook App ID>`. `instagram-stories` harus didaftarkan di `LSApplicationQueriesSchemes`. Data dikirim lewat pasteboard (`com.instagram.sharedSticker.backgroundImage`, `.stickerImage`, `.backgroundTopColor`, `.backgroundBottomColor`); contoh resmi memberi masa kedaluwarsa 5 menit.
  - Android: aksi `com.instagram.share.ADD_TO_STORY` dengan extras `source_application`, `interactive_asset_uri` (stiker), `top_background_color`, dan `bottom_background_color`. URI harus berupa content URI dengan izin baca.
  - Sejak Januari 2023 wajib ada Facebook App ID. Tanpa App ID, pengguna melihat pesan "The app you shared from doesn't currently support sharing to Stories".
  - Latar: gambar JPG/PNG minimal 720×1280 (disarankan 9:16 atau 9:18), atau video H.264/H.265/WebM sampai 1080p dan 20 detik (disarankan < 50 MB di iOS). Stiker: JPG/PNG, disarankan 640×480. Minimal satu dari latar atau stiker harus dikirim. Bila hanya stiker yang dikirim, latar diisi dua warna gradasi (bawaan `#222222`).
  - Halaman tidak menyebut **tautan atribusi** ("attribution link").
  - Sumber: https://developers.facebook.com/docs/instagram-platform/sharing-to-stories/ (diakses 2026-11-18)

- **TikTok Share Kit** · primer · terbukti · cek ulang
  - Android (diperbarui 4 Agu 2026): harus menyelesaikan Android Quickstart dan memakai `client_key`. Video hanya MP4, 1–360 detik, sisi bingkai maksimal 1100 px, sampai 35 video. Gambar 2–35 per share. Mode **green screen** menerima tepat satu gambar atau video. Berkas lokal dikirim lewat FileProvider. Share Kit bisa menyertakan **"partner hashtags"**, dan setelah berbagi muncul toast yang mengajak kembali ke aplikasi. Penggunaan logo merek atau watermark harus berizin.
  - Sumber: https://developers.tiktok.com/doc/share-kit-android-quickstart-v2 (diakses 2026-11-18)
  - iOS (diperbarui 4 Agu 2026): media diambil lewat `localIdentifiers` Photos (berkas harus disimpan dulu ke galeri), satu jenis media per share, sampai 35 gambar atau 12 video, rasio aspek 1/2,2–2,2, dan `shareFormat = .greenScreen` tersedia.
  - Sumber: https://developers.tiktok.com/doc/share-kit-ios-quickstart-v2 (diakses 2026-11-18)

- **WhatsApp Status dari aplikasi pihak ketiga** · primer (sampel) · belum lengkap
  - Repositori Meta `fbsamples/whatsapp_status_api_android` menyebut "WhatsApp's Share to Status Android API" dan opsi berbagi "with or without a sticker". README tidak memuat nama intent, extras, format, atau dukungan iOS.
  - Sumber: https://github.com/fbsamples/whatsapp_status_api_android (diakses 2026-11-18)
  - Dokumentasi resmi API ini tidak ditemukan. Cuplikan WABetaInfo menyebut opsi "My Status" di share sheet Android (beta 2.25.20.3), tetapi halamannya tidak dibuka (**dugaan**).

### D. Pertumbuhan: watermark, tautan balik, dan "buat punyamu"

- **Watermark TikTok sebagai merek** · sekunder (kolom opini dengan data) · terbukti
  - Rob Walker, Fast Company ME (18 Sep 2022): watermark TikTok yang berpindah posisi dan bertahan saat video dibagikan ke platform lain membuat logonya sangat dikenali. Artikel mengutip laporan internal Meta yang bocor (via WSJ): hampir sepertiga video Reels berasal dari platform lain, biasanya TikTok, dengan watermark atau bingkai. YouTube juga menambahkan ikon asal pada klip Shorts yang beredar di platform lain.
  - Sumber: https://fastcompanyme.com/?p=9006 (diakses 2026-11-18)
- **Instagram menurunkan distribusi konten berlogo platform lain** · sekunder yang mengutip akun resmi · terbukti untuk 2021
  - Tubefilter (10 Feb 2021): akun @creators Instagram menyatakan konten yang "visibly recycled from other apps", yaitu berisi logo atau watermark, dibuat "less discoverable in places like the Reels tab". Konten itu tetap tampil untuk pengikut. Tidak disebut berlaku untuk Stories. Pembaruan kebijakan setelah 2021 tidak ditemukan.
  - Sumber: https://tubefilter.com/2021/02/10/instagram-reels-with-tiktok-watermark-less-discoverable/ (diakses 2026-11-18)
- **Remix dan label pembuat asli**: Pinterest Collage Remix (bagian A).
- **Template berantai**: Instagram Add Yours Templates (bagian A).
- **Kode undangan**: Shuffles memakai 5 undangan per pengguna saat masa viralnya (2022), dan sebagian pengguna mengeluh soal kode (bagian A). Tidak ada data apakah sistem undangan itu yang menyebabkan pertumbuhan.
- **Bukti versus klaim**
  - Bukti kuantitatif terkuat yang ditemukan: angka resmi Spotify (630 juta share, Wrapped disebut pendorong MAU, hari pertama memecahkan rekor pelanggan baru), dan peringkat Shuffles dari data.ai/Sensor Tower.
  - Klaim vendor "personalized recap" (misalnya rujukan berlipat ganda atau konversi 88% di blog vendor video) tidak menyertakan metodologi atau kelompok kontrol, jadi diperlakukan sebagai klaim pemasaran dan tidak dipakai.
  - Sumber klaim yang ditolak: https://www.idomoo.com/blog/why-spotify-wrapped-works-and-how-you-can-do-it-too/ (cuplikan pencarian, diakses 2026-11-18)

### E. Etika dan aturan platform

- **Pedoman App Store** · primer · terbukti · cek ulang
  - 3.1.2(a): pengguna harus mendapat yang dibayarnya "without performing additional tasks, such as posting on social media".
  - 3.2.2(x): aplikasi tidak boleh memaksa rating, ulasan, atau unduhan aplikasi lain untuk mengakses fungsi. Aplikasi boleh memberi insentif untuk aksi tertentu di dalam aplikasi.
  - 5.1.1(v): "sharing to the social network, or inviting friends to use the app are not considered core app functionality". Konteksnya kewajiban login.
  - Sumber: https://developer.apple.com/app-store/review/guidelines/ (diakses 2026-11-18; 14 ribu karakter terakhir tidak terbaca)
- **Kebijakan Developer Meta** (diperbarui 3 Feb 2026) · primer · terbukti
  - 1.7: "Obtain consent from people before publishing content or taking any other action on their behalf."
  - 5.6(d): jangan mengisi pesan lebih dulu kecuali isinya dibuat oleh pengguna.
  - 2.7: dilarang ikut program jual beli atau tukar "Likes"/"Shares".
  - Halaman ini tidak memuat larangan eksplisit memberi insentif untuk berbagi. Contoh "poin untuk berbagi melanggar aturan" yang muncul di cuplikan pencarian berasal dari halaman "Policies Deep Dive" yang kini 404, jadi tidak dipakai.
  - Sumber: https://developers.facebook.com/devpolicy/ (diakses 2026-11-18)
- **Taksonomi deceptive pattern** · sekunder tepercaya · terbukti
  - deceptive.design mendaftar 18 jenis. Yang relevan untuk layar Bagikan: forced action ("required to do something else undesirable in return"), nagging, confirmshaming, fake urgency, fake scarcity, fake social proof, dan preselection. Tidak ada jenis khusus "friend spam" di daftar saat ini.
  - Sumber: https://www.deceptive.design/types (diakses 2026-11-18)
- **Privasi lokasi di kartu share acuan**
  - Strava Sticker Stats menampilkan garis rute (bagian A). Strava punya pengaturan untuk menyembunyikan titik mulai dan selesai. Panduan Kaspersky mengutip studi 2022 yang bisa menebak lokasi tersembunyi dengan akurasi 85%. Halaman Kaspersky tidak dibuka penuh (**dugaan kuat**, dari cuplikan pencarian).
  - Sumber: https://www.kaspersky.com/blog/running-apps-privacy-settings-part2-strava/52409 (diakses 2026-11-18)
  - Pikmin Bloom memakai foto Wayspot, yaitu tempat publik yang sudah dikurasi, bukan lokasi pribadi pengguna (bagian A).

### F. Mengapa orang berbagi (riset perilaku)

- **Berger & Milkman (2012), Journal of Marketing Research 49(2)** · primer (abstrak) · terbukti
  - Konten yang membangkitkan emosi berenergi tinggi, baik positif (kagum) maupun negatif (marah, cemas), lebih viral. Emosi berenergi rendah (sedih) kurang viral. Hasil ini bertahan setelah dikontrol untuk unsur kejutan, menarik, dan kegunaan praktis. Data: artikel New York Times dan eksperimen terkontrol. Hanya abstrak yang dibaca, lewat cuplikan pencarian.
  - Sumber: https://faculty.wharton.upenn.edu/wp-content/uploads/2011/11/Virality.pdf (diakses 2026-11-18)
- **Toubia & Stephen (2013), Marketing Science 32(3)** · primer (abstrak) · terbukti
  - Eksperimen lapangan di Twitter menemukan bahwa bagi kebanyakan pengguna nonkomersial, utilitas citra diri ("image-related utility") lebih besar daripada utilitas intrinsik.
  - Sumber: https://pubsonline.informs.org/doi/10.1287/mksc.2013.0773 (abstrak lewat cuplikan pencarian, diakses 2026-11-18)

## Kesimpulan

**Fakta bersumber.**

- **Skala.** Kartu share dengan skala berbagi terbesar yang terdokumentasi adalah Spotify Wrapped. Spotify sendiri menyebut Wrapped sebagai pendorong pertumbuhan MAU, dengan lebih dari 630 juta share di akhir kampanye 2025 (naik 42%). Angka hari pertama ikut menghitung tangkapan layar.
- **Pemicu berbagi.** Aplikasi acuan memakai pemicu yang berulang:
  - label identitas: Wrapped Clubs, learner styles Duolingo, travel personality Polarsteps;
  - perbandingan: Listening Age, Wrapped Party;
  - pencapaian: Strava, NRC;
  - kelangkaan waktu: semua rekap tahunan hanya muncul di jendela tertentu;
  - ritme rutin berskala kecil: Locket Rollcall mingguan diikuti lebih dari 25% pengguna aktif;
  - ajakan meniru: Add Yours Templates, Pinterest Remix.
- **Variasi.** Variasi biasanya datang dari **banyak kartu per cerita** (Spotify) atau **pilihan format** (NRC: rute / foto / poster; Strava: kartu / stiker transparan), bukan dari satu kartu yang diwarnai ulang. Instagram memakai tombol dadu untuk inspirasi template.
- **Indonesia.** WhatsApp, Instagram, dan TikTok adalah tiga platform teratas (GWI Q2 2026: 92,7%, 84,0%, dan 81,0%).
- **Teknis.** Instagram Stories punya API resmi dengan lapisan latar dan lapisan stiker (wajib Facebook App ID). TikTok punya Share Kit (gambar 2–35, video MP4, green screen, partner hashtags). WhatsApp Status dari aplikasi pihak ketiga belum punya dokumentasi publik yang ditemukan.
- **Watermark.** Watermark terbukti efektif sebagai merek untuk TikTok, tetapi Instagram (2021) menurunkan distribusi Reels berlogo platform lain di tab Reels.
- **Insentif berbagi.** Duolingo memberi hadiah lencana untuk berbagi. Apple melarang mewajibkan posting media sosial untuk konten berbayar. Meta mewajibkan persetujuan sebelum bertindak atas nama pengguna.

**Tafsiran (bukan keputusan).** Semua isi di bawah ini adalah usulan peneliti yang perlu diuji dan diputuskan lewat K- baru. Daftar ini tidak menyelesaikan Q-018: gaya yang butuh nama landmark ditandai, dan semua gaya bisa dibuat tanpa nama landmark.

### Batas yang dipakai untuk semua gaya

- **Data yang boleh tampil**
  - nama kota;
  - stempel kota "Sukabumi 13/100" (K-028);
  - cutout temuan;
  - keterangan buatan pengguna;
  - kategori;
  - nama kamera (watermark, §4.8);
  - bulan atau minggu.
- **Data yang tidak tampil**
  - koordinat, rute, peta, atau jarak (K-011);
  - progres landmark (K-028);
  - nama landmark (menunggu Q-018);
  - jam pengambilan, karena pola waktu bisa membuka rutinitas (dugaan risiko);
  - peringkat antar-pengguna. Peringkat ini butuh data pengguna lain dan bisa termasuk pemrofilan, jadi perlu `penasihat-privasi` (K-017).
- **Watermark**: kecil, statis, dan di dalam zona aman: "Kliping Kota · <nama kamera>". Tautan web penerima ditunda (§8), jadi tautan balik di MVP hanya berupa nama aplikasi yang terbaca.
- **Risiko yang tidak diatasi kode**: cutout bisa memuat nomor rumah, plat nomor, atau papan nama yang membuka lokasi lebih rinci dari kota. Ini dugaan risiko yang perlu ditinjau `penasihat-privasi`.

### 10 gaya kartu share yang diusulkan untuk Kliping Kota

| # | Gaya (nama kerja) | Pemicu berbagi | Unsur data | Format | Acuan | Prioritas |
|---|---|---|---|---|---|---|
| 1 | **Halaman Kliping**: satu halaman buku apa adanya, dengan stempel kota di pojok | Kebanggaan kurasi, identitas ("ini bukuku") | Halaman, stempel kota, watermark kamera | Kartu share 9:16 (gambar) | Kartu per cerita Spotify; spesifikasi §4.8 | **Wajib** (spesifikasi) |
| 2 | **Video Buka Halaman**: page-curl + suara halaman, berakhir di stempel kota | Kejutan dan gerak; suara yang khas | Sama dengan gaya 1 | Video share 9:16, sekitar 4–8 dtk (≤ 20 dtk untuk Instagram Stories) | Video kolase Shuffles, BeReal Recap | **Wajib** (spesifikasi) |
| 3 | **Stiker Temuan**: satu cutout bertepi die-cut dengan cap kota mini, tanpa latar | Ekspresi diri: pengguna menempelkannya di foto atau Story-nya sendiri | Cutout, nama kota, nama kamera kecil | Stiker transparan (PNG) ke lapisan stiker Instagram Stories; ke galeri untuk tujuan lain | Strava Sticker Stats; API stiker Instagram | **Wajib** (biaya rendah, paling cocok dengan inti aplikasi) |
| 4 | **Temuan Tunggal**: satu temuan besar dengan keterangan pengguna dan label kategori | Momen "kupas" yang baru terjadi; pamer temuan aneh atau lucu | Cutout, keterangan, kategori, stempel kota | 9:16; varian 3:4 untuk feed | Momen stiker CapWords (riset 18 Nov), poster NRC | **Wajib** |
| 5 | **Kartu Pos Kota**: cutout di depan kartu pos, cap pos "SUKABUMI", perangko motif kota | Identitas lokal dan kebanggaan kota; enak dikirim langsung ke teman (WhatsApp) | Cutout, nama kota, motif kota, bulan | 9:16 dan 3:4 | Kartu pos Pikmin Bloom dan Pokémon GO | **Bagus** |
| 6 | **Sukabumi-ku dalam 4**: empat temuan pilihan pengguna dalam kisi | Identitas lewat kurasi; mudah dibandingkan dan ditiru teman | 4 cutout, nama kota, stempel kota | 9:16 dan 3:4 | Letterboxd Four Favourites (riset 18 Nov), Add Yours Templates | **Bagus** |
| 7 | **Label Pemburu**: persona dari kategori dominan, misalnya "Pemburu Papan Nama" atau "Kolektor Benda Random" | Label identitas; humor yang sedikit memalukan; inklusif untuk pengguna dengan sedikit temuan | Kategori dominan (dihitung di perangkat), 3 cutout contoh, stempel kota | 9:16 | Learner styles Duolingo, Wrapped Clubs (6 klub), travel personality Polarsteps | **Bagus** (setelah taksonomi K-020 stabil) |
| 8 | **Tonggak Stempel**: stempel berubah wujud di 25/50/100 temuan | Pencapaian; kelangkaan karena hanya muncul saat tonggak | Stempel kota, angka tonggak | 9:16 dan stiker transparan | Tonggak streak Duolingo (riset 18 Nov), Strava | **Bagus** |
| 9 | **Cuci Cetak Mingguan**: kolase temuan sepekan sebagai lembar kontak atau strip film | Ritme rutin yang ringan; tidak perlu temuan yang "hebat" | Cutout sepekan (maksimal 9), nama kota, rentang tanggal mingguan | Carousel (beberapa kartu 9:16 atau 3:4), multi-gambar TikTok (2–35) | Locket Rollcall, Retro (riset 18 Nov), carousel Instagram 20 | **Nanti** (selaras dengan ritme misi §4.6) |
| 10 | **Tambah Punyamu**: kartu misi dengan satu slot terisi dan slot kosong bertanda "?" | Ajakan meniru; rantai antar-teman | Nama misi, kategori, satu cutout, nama kota | 9:16 | Instagram Add Yours Templates, Pinterest Remix | **Nanti** (butuh misi §4.6; tanpa tautan web penerima, ajakannya hanya berupa teks) |

Cadangan di luar 10: **Rekap Tahunan Kota** (kartu per cerita bergaya Wrapped/Unpacked). Butuh data setahun dan sebaiknya ditunda sampai ada pengguna aktif sepanjang tahun.

**Variasi di dalam satu gaya** (tafsiran, sesuai keinginan pemilik agar kartu tidak satu gaya saja):

- 3–5 varian warna yang diambil dari `City.accentColor`, warna kategori, dan kertas. Mengikuti Q-017; palet belum boleh dikunci.
- Tombol **Acak** yang mengganti varian dan susunan, seperti tombol dadu Add Yours dan opsi Acak di K-031.
- Sakelar elemen opsional (keterangan, kategori). Watermark kamera tidak bisa dimatikan karena wajib di §4.8.

### Alur layar Bagikan yang diusulkan

1. **Titik masuk menentukan gaya bawaan.** Contoh:
   - layar Sukses setelah temuan → gaya 4 (Temuan Tunggal);
   - Buku → gaya 1 (Halaman Kliping);
   - tonggak → gaya 8 (Tonggak Stempel);
   - akhir pekan misi → gaya 9 (Cuci Cetak Mingguan).

   Kartu tonggak boleh muncul otomatis satu kali, dengan tombol tutup yang sama menonjolnya. Tidak ada pengingat ulang.
2. **Pratinjau besar dan pilihan gaya.** Pratinjau kartu 9:16 yang bisa digeser horizontal untuk berganti gaya, dengan indikator titik dan nama gaya yang terbaca. Pratinjau diberi teks alternatif (audit R-04) dan bisa diketuk untuk memperbesar.
3. **Varian.** Baris chip warna (3–5) ditambah tombol Acak di bawah pratinjau. Sakelar keterangan dan kategori diletakkan di lembar "Atur".
4. **Format.** Segmen: Story 9:16 (bawaan), Feed 3:4, Stiker, Video. Format yang tidak cocok dengan gaya dinonaktifkan beserta alasannya, misalnya gaya 9 hanya tersedia sebagai Carousel. Segmen terpilih harus kontras (audit S-01).
5. **Tujuan.** Urutan mengikuti GWI Indonesia:
   - WhatsApp (share sheet atau Share to Status bila API-nya terkonfirmasi);
   - Instagram Stories (API: lapisan latar untuk 9:16, lapisan stiker untuk gaya 3);
   - TikTok (Share Kit: gambar, multi-gambar, video);
   - Simpan ke galeri;
   - Lainnya (share sheet sistem).
6. **Kalimat privasi di dekat tombol**: "Hanya nama kota yang ikut. Lokasi dan EXIF dihapus." (§4.8, K-011).
7. **Setelah berbagi**: kembali ke layar asal tanpa hadiah, tanpa skor, dan tanpa ajakan berbagi lagi.
8. **Larangan** (tafsiran dari deceptive.design, Pedoman App Store 3.1.2(a), dan K-017):
   - tidak ada hadiah, lencana, atau konten terkunci yang ditukar dengan berbagi. Duolingo melakukannya, tetapi untuk Kliping Kota ini termasuk forced action yang ringan;
   - tidak ada hitung mundur palsu;
   - tidak ada teks penolakan yang menyindir;
   - tidak ada tujuan yang dipilih otomatis;
   - tidak ada posting atas nama pengguna.

### Prioritas MVP (ringkas)

- **Wajib**:
  - gaya 1, 2, 3, dan 4;
  - format 9:16 dan stiker;
  - tujuan Instagram Stories (API), TikTok, Simpan, dan share sheet;
  - chip warna dan tombol Acak;
  - kalimat privasi.
- **Bagus**:
  - gaya 5, 6, 7, dan 8;
  - format 3:4;
  - jalur khusus WhatsApp Status (bila API terkonfirmasi).
- **Nanti**:
  - gaya 9 dan 10;
  - carousel;
  - Rekap Tahunan;
  - tautan web penerima (§8).

## Belum terjawab

- **Apple Music Replay 2025**: isi dan format kartu share dari sumber resmi Apple. Newsroom Apple tidak ditemukan; klaim tentang highlight reel dan tombol ke Instagram/TikTok hanya ada di sumber yang tidak bisa diverifikasi.
- **Letterboxd**: kartu share bawaan untuk ulasan atau Year in Review 2025. FAQ dialihkan ke support.letterboxd.com dan tidak dibuka. Yang ditemukan hanya aplikasi pihak ketiga ("Stories For Letterboxd").
- **Strava**:
  - isi resmi halaman bantuan Year in Sport 2025 (paywall, tanggal, kartu ringkasan yang bisa diatur), karena halamannya mengalami pengalihan berulang;
  - jumlah gaya Sticker Stats.
- **Goodreads**: rincian gambar share Year in Books 2025.
- **CapWords**: tujuan dan format "Export to other apps".
- **Duolingo 2025**: bentuk "bonus" untuk berbagi (Android Authority 403).
- **WhatsApp Share to Status API**:
  - nama intent, extras, format, batas durasi;
  - apakah butuh pendaftaran;
  - dukungan iOS.
- **Instagram Stories**:
  - cara mendapat tautan atribusi ("attribution link"), yang menurut forum developer terbatas untuk mitra tertentu;
  - apakah Stories yang dibagikan lewat API menampilkan nama aplikasi asal.
- **Data Indonesia**:
  - porsi pengguna yang memakai **WhatsApp Status** dan **Instagram Stories** (bukan hanya platformnya);
  - data platform favorit kelompok 18–24.
- **Konversi**: data publik yang menghubungkan jumlah share dengan instal baru (share-to-install), untuk aplikasi mana pun. Spotify hanya menyebut Wrapped sebagai "driver" MAU.
- **Watermark**: apakah kebijakan Instagram 2021 tentang watermark di Reels masih berlaku, dan apakah berlaku untuk video buatan aplikasi pihak ketiga (bukan hasil daur ulang dari platform lain).
- **Kaspersky**: studi 2022 tentang menebak lokasi tersembunyi Strava (akurasi 85%), karena halamannya tidak dibuka penuh.
- **Isi lengkap** Berger & Milkman (2012) dan Toubia & Stephen (2013). Hanya abstrak yang dibaca.
- **Preferensi Indonesia**: tidak ada data apakah stiker transparan, kartu pos, atau label persona lebih sering dibagikan oleh pengguna di Indonesia. Perlu diuji langsung (lihat rencana uji di `docs/riset/2026-11-18-kritik-v3-dan-rencana-uji.md`).
