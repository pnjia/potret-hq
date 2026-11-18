# Tinjauan privasi kartu share: Label Pemburu, Tambah Punyamu, dan risiko lintas gaya

> Diriset: 2026-11-18 · Oleh: penasihat-privasi (sub-agen)
> Cek ulang sebelum dipakai untuk keputusan baru: Pedoman App Store dan kebijakan Google Play (berubah beberapa kali setahun), Kebijakan Developer Meta, peraturan pelaksana UU PDP (PP tentang pemrofilan otomatis dan penilaian dampak, Ps. 10 ayat (2) dan Ps. 34 ayat (3)), penetapan atau panduan Komdigi tentang PP 17/2025.
> Dipakai oleh: Q-024 (calon: Q-023, Q-018)
> **Bukan nasihat hukum.** Disusun agen dari teks resmi, bukan oleh advokat. Kesimpulan bertanda **dugaan** sebaiknya diperiksa konsultan hukum sebelum rilis.

Melengkapi dan tidak mengulang:

- [`2026-11-17-usia-pp-tunas-uu-pdp.md`](2026-11-17-usia-pp-tunas-uu-pdp.md): ringkasan PP 17/2025, Permenkomdigi 9/2026, Kepmenkomdigi 140 dan 142/2026, dan dasar K-017.
- [`2026-11-18-kartu-share-viral.md`](2026-11-18-kartu-share-viral.md): 10 gaya kartu, alur Bagikan, larangan dark pattern, aturan Apple dan Meta.

Label: **terbukti** = tertulis di teks sumber yang dibuka; **dugaan** = tafsiran penasihat. Tingkat saran: **wajib** (menurut sumber) / **disarankan** / **opsional**.

## Pertanyaan

1. Apakah "Label Pemburu" (persona dari kategori dominan, mis. "Pemburu Papan Nama", dihitung di perangkat, hanya tampil ke pengguna dan dibagikan bila ia memilih) termasuk pemrofilan menurut PP 17/2025 dan UU 27/2022? Apa bedanya dengan profil yang dipakai sistem untuk mengambil keputusan atau menarget? Syarat apa yang membuatnya aman?
2. Apakah "Tambah Punyamu" (kartu misi dengan slot kosong yang mengajak teman ikut memotret, tanpa tautan web penerima) berisiko dari sisi dark pattern, ajakan viral, atau pedoman App Store dan Google Play?
3. Risiko lintas gaya: cutout yang memuat plat nomor, nomor rumah, atau papan nama yang membuka lokasi lebih rinci dari kota; gaya "Cuci Cetak Mingguan" yang memuat rentang tanggal mingguan (pola waktu).

## Sumber yang dibaca

| Kode | Dokumen | Tempat | Diakses |
|---|---|---|---|
| PP | PP 17/2025 (PP Tunas), batang tubuh hal. 11–12 (Ps. 16–19) dan penjelasan hal. 6–10 (Ps. 9–19), teks asli hasil pindai | https://jdih.komdigi.go.id/produk_hukum/unduh/id/965/t/peraturan+pemerintah+nomor+17+tahun+2025 | 2026-11-18 |
| PDP | UU 27/2022, batang tubuh hal. 2–11 dan 15 (Ps. 1–21, 34), penjelasan hal. 6–8 (Ps. 9–21), salinan resmi | https://jdih.kemenkeu.go.id/download/46c17b53-4a45-411c-9b76-c6799e5769fc/UU_Nomor_27_Tahun_2022%20Perlindungan%20Data%20Pribadi.pdf | 2026-11-18 |
| APL | App Store Review Guidelines (sekitar 14 ribu karakter terakhir tidak terbaca oleh alat) | https://developer.apple.com/app-store/review/guidelines/ | 2026-11-18 |
| GPL | Google Play Console Help, "Spam" (alat hanya mengutip sebagian kalimat) | https://support.google.com/googleplay/android-developer/answer/9899034 | 2026-11-18 |
| DES | Mockup v5: `docs/desain/usulan-v5/V5ShareLabel.png`, `docs/desain/usulan-v5/V5ShareTambah.png`, dan bagian "Tambahan 18 Nov" di `docs/desain/usulan-v5-karcis-kliping.md` | repo | 2026-11-18 |

Dipakai dari riset sebelumnya tanpa dibuka ulang: Permenkomdigi 9/2026 Ps. 11 dan Ps. 16 (dibaca dari teks asli 17 Nov), Kebijakan Developer Meta 1.7 dan 5.6(d) (dibaca peneliti 18 Nov), taksonomi deceptive.design (**sekunder**, hanya sebagai kosakata, tidak untuk kesimpulan hukum).

## Temuan

### A. Teks sumber (semua **terbukti**)

- **A1. PP Ps. 19: larangan pemrofilan Anak** (PP hal. 12)
  - Ayat (1): PSE "dilarang melakukan pemrofilan Anak" yang meliputi "a. pemrofilan dengan cara atau metode apapun, seperti untuk tujuan penawaran produk atau layanan atau tujuan lain; atau b. pemrofilan Anak secara baku (*default*) dengan cara atau metode apapun."
  - Ayat (2): larangan huruf a dikecualikan bila PSE "dapat menunjukkan alasan kuat bahwa pemrofilan tersebut untuk kepentingan terbaik bagi Anak."
  - Ayat (3): larangan huruf b dikecualikan bila (a) ada alasan kuat demi kepentingan terbaik Anak, atau (b) "pemrofilan merupakan bagian esensi atau inti dalam penyediaan Produk, Layanan dan merupakan fitur yang diminta oleh Anak secara aktif dan sadar."
  - Ayat (4): pemrofilan Anak "merupakan pemrosesan Data Pribadi Anak dalam berbagai bentuk dan cara untuk mengidentifikasi, mengevaluasi, atau memprediksi berbagai aspek tentang Anak."
  - Ayat (5): bila pemrofilan dilakukan atas permintaan Anak (ayat (3) huruf b), PSE wajib menjamin langkah teknis dan operasional yang melindungi Anak dari dampak bahaya.
- **A2. Penjelasan PP Ps. 19** (penjelasan hal. 10)
  - Ayat (1) huruf a: contohnya "penganalisaan kecenderungan pilihan konten berdasarkan riwayat konten yang pernah diakses oleh Anak dalam kurun waktu tertentu."
  - Ayat (1) huruf b: contohnya "mengatur bawaan Produk, Layanan, dan Fitur ... dalam posisi aktif secara baku (*default*)."
  - Ayat (4): "memprediksi berbagai aspek tentang Anak" contohnya "kecenderungan pilihan Anak terhadap sesuatu."
- **A3. Penjelasan PP Ps. 9 ayat (5) huruf b: ruang lingkup Data Pribadi Anak** (penjelasan hal. 6–7)
  - Angka i: "kesimpulan yang diambil dari salah satu informasi atau kombinasi Data Pribadi yang telah diidentifikasi sebelumnya untuk membuat profil tentang individu Anak yang mencerminkan preferensi, karakteristik, kecenderungan psikologis, kecenderungan, perilaku, sikap, kecerdasan, kemampuan, dan bakatnya."
  - Angka f: "informasi suara, visual, atau informasi serupa lainnya". Angka e: "data geolokasi".
  - Angka j: antara lain data kesehatan, "informasi tentang asal ras atau etnis, keyakinan agama atau filosofis."
- **A4. PP Ps. 17 dan penjelasannya: praktik terselubung (dark pattern)** (PP hal. 11; penjelasan hal. 9)
  - Dilarang memakai "cara, teknik, atau praktik terselubung atau tidak transparan" yang mendorong Anak untuk (a) memberi atau mengungkapkan Data Pribadi lebih dari yang diperlukan, (b) melepaskan atau mengurangi fungsi pelindungan privasi, atau (c) melakukan tindakan yang dapat membahayakan kesehatan fisik, kesehatan mental, atau kesejahteraan Anak.
  - Penjelasan: termasuk "eksploitasi bias psikologi terhadap Anak". Contohnya "membuat pilihan yang sesuai dengan pola atau jalur yang Penyelenggara Sistem Elektronik pilih lebih mudah, menarik, atau lebih cepat dibandingkan pilihan lainnya sehingga mendorong Anak untuk memilih pilihan yang pertama."
- **A5. PP Ps. 18 dan penjelasannya: geolokasi** (PP hal. 11; penjelasan hal. 9)
  - "Informasi geolokasi yang tepat" adalah "data yang berasal dari perangkat dan yang digunakan atau dimaksudkan untuk digunakan untuk menemukan area geografis di mana pengguna berada."
- **A6. PP Ps. 22 ayat (4)** (PP hal. 15): bila verifikasi usia tidak memenuhi syarat, PSE wajib memberi pelindungan privasi dan Data Pribadi tingkat Anak kepada semua pengguna. Ini dasar K-017.
- **A7. UU PDP** (salinan resmi)
  - Ps. 1 angka 1: Data Pribadi adalah data tentang orang perseorangan yang teridentifikasi atau dapat diidentifikasi, sendiri atau dikombinasi dengan informasi lain, langsung maupun tidak langsung.
  - Ps. 1 angka 4: Pengendali Data Pribadi adalah pihak yang "menentukan tujuan dan melakukan kendali pemrosesan Data Pribadi."
  - Ps. 2 ayat (2): UU PDP "tidak berlaku untuk pemrosesan Data Pribadi oleh orang perseorangan dalam kegiatan pribadi atau rumah tangga."
  - Ps. 4 ayat (2): data spesifik meliputi kesehatan, biometrik, genetika, catatan kejahatan, data anak, keuangan pribadi, dan data lain sesuai peraturan. Ps. 4 ayat (3): data umum termasuk agama dan "Data Pribadi yang dikombinasikan untuk mengidentifikasi seseorang."
  - Ps. 10 ayat (1): Subjek Data Pribadi berhak mengajukan keberatan atas "pengambilan keputusan yang hanya didasarkan pada pemrosesan secara otomatis, termasuk pemrofilan, yang menimbulkan akibat hukum atau berdampak signifikan." Penjelasan Ps. 10 ayat (1): pemrofilan adalah "kegiatan mengidentifikasi seseorang termasuk namun tidak terbatas pada riwayat pekerjaan, kondisi ekonomi, kesehatan, preferensi pribadi, minat, keandalan, perilaku, lokasi, atau pergerakan Subjek Data Pribadi secara elektronik."
  - Ps. 16 ayat (1): pemrosesan meliputi antara lain "pengolahan dan penganalisisan" (huruf b) dan "penampilan, pengumuman, transfer, penyebarluasan, atau pengungkapan" (huruf e). Ayat (2) huruf a: pengumpulan "terbatas dan spesifik, sah secara hukum, dan transparan"; huruf b: sesuai tujuannya.
  - Ps. 20 ayat (2): dasar pemrosesan antara lain persetujuan eksplisit (huruf a) dan pemenuhan perjanjian atau permintaan Subjek Data Pribadi (huruf b).
  - Ps. 34 ayat (2): pemrosesan berpotensi risiko tinggi (wajib penilaian dampak) antara lain huruf a pengambilan keputusan otomatis berakibat hukum atau berdampak signifikan, huruf b data spesifik, dan huruf d "kegiatan evaluasi, penskoran, atau pemantauan yang sistematis."
- **A8. App Store Review Guidelines** (APL)
  - 3.1.2(a): pengguna harus mendapat yang dibayarnya "without performing additional tasks, such as posting on social media, uploading contacts".
  - 3.2.2(x): aplikasi tidak boleh memaksa rating, ulasan, atau unduhan aplikasi lain untuk mengakses fungsi; aplikasi boleh memberi insentif untuk aksi tertentu di dalam aplikasi.
  - 5.1.1(v): "sharing to the social network, or inviting friends to use the app are not considered core app functionality" (konteks kewajiban login).
  - 5.1.2(iii): "Apps should not attempt to surreptitiously build a user profile based on collected data".
  - 5.1.2(v): jangan menghubungi orang memakai data Kontak atau Foto "except at the explicit initiative of that user on an individualized basis"; tanpa opsi "Select All"; pengguna harus diberi tahu bagaimana pesan akan tampil bagi penerima.
- **A9. Google Play, kebijakan Spam** (GPL): "We don't allow apps that send SMS, email, or other messages on behalf of the user" tanpa kesempatan bagi pengguna untuk mengonfirmasi isi dan penerima pesan. Contoh pelanggaran yang dikutip: "When the user presses the 'Share' button, the app sent messages on the user's behalf." Halaman tidak memuat aturan tentang insentif untuk berbagi. Kutipan dibatasi alat; kalimat lengkap belum disalin.
- **A10. Isi mockup yang ditinjau** (DES)
  - `V5ShareLabel`: judul "Julukanku bulan ini / PEMBURU PAPAN NAMA", lima cutout papan nama ("ada PULSA", "AWAS ANJING GALAK", "WARUNG KOPI", "MIE BASO", "TAMBAL BAN"), "5 papan nama bulan ini", cap "SUKABUMI 13/100", watermark "KLIPING KOTA kamera Saku 35". Tanpa username.
  - `V5ShareTambah`: karcis "Misi · Papan nama tulisan tangan" dengan label samping "MISI BERANTAI", judul "TAMBAH PUNYAMU", satu cutout terisi ("Pakai spidol") dan dua slot "? Punyamu", teks "Ikut kapan saja.", cap kota, watermark. Tanpa username, tanpa tautan, tanpa kode undangan.

### B. Tafsiran per pertanyaan (semua **dugaan**)

#### B1. Label Pemburu

- **B1.1 Rancangan sekarang cocok dengan definisi pemrofilan di PP 17/2025 (dugaan kuat).** Kategori dominan bulan ini dihitung dari riwayat temuan pengguna, lalu diubah menjadi julukan tentang orangnya ("Julukanku"). Ini sama dengan contoh penjelasan Ps. 19 ayat (1) huruf a ("kecenderungan pilihan ... berdasarkan riwayat ... dalam kurun waktu tertentu") dan ayat (4) ("kecenderungan pilihan Anak terhadap sesuatu"). Hasilnya juga cocok dengan A3 angka i (kesimpulan yang mencerminkan preferensi atau kecenderungan), jadi labelnya sendiri adalah Data Pribadi Anak bila penggunanya Anak.
- **B1.2 PP tidak membedakan profil untuk keputusan atau penargetan dari ringkasan milik pengguna sendiri.** Ps. 19 ayat (1) huruf a menyebut "tujuan penawaran produk atau layanan **atau tujuan lain**", dan satu-satunya pengecualian huruf a adalah kepentingan terbaik Anak (ayat (2)). Pembedaan yang diminta pemilik ada di UU PDP, bukan di PP: Ps. 10 hanya memberi hak keberatan atas keputusan otomatis yang berakibat hukum atau berdampak signifikan, dan Ps. 34 ayat (2) huruf a dan d menautkan penilaian dampak ke keputusan otomatis dan evaluasi atau pemantauan sistematis. Untuk pengguna dewasa, label yang tidak dipakai untuk keputusan apa pun kemungkinan tidak memicu Ps. 10 dan cukup diatur oleh prinsip Ps. 16 ayat (2) (terbatas, sesuai tujuan, transparan).
- **B1.3 K-017 membuat ukuran PP yang berlaku.** K-017 menjanjikan "tanpa pemrofilan" untuk semua pengguna sebagai jaring pengaman PP Ps. 22 ayat (4). Selama keputusan itu berlaku, rancangan sekarang bertentangan dengan janji K-017, walaupun pengguna yang dituju 18+.
- **B1.4 Dihitung di perangkat mengurangi risiko, tetapi tidak menghapus status pemrofilan.** UU PDP Ps. 16 ayat (1) memasukkan "pengolahan dan penganalisisan" dan "penampilan" sebagai pemrosesan, dan pengembang menentukan tujuan serta cara perhitungannya (Ps. 1 angka 4). Teks tidak mengecualikan pemrosesan yang tidak meninggalkan perangkat. Pengecualian Ps. 2 ayat (2) (kegiatan pribadi) melindungi pengguna yang membagikan kartunya sendiri, bukan pengembang yang merancang fitur. Keuntungan perhitungan di perangkat tetap nyata: tidak ada penyimpanan di server, tidak ada transfer, dan tidak ada kebocoran (UU PDP Ps. 35, 39).
- **B1.5 Data yang dibutuhkan sudah ada di server.** `Finding.category` tersinkron ke Supabase (glosarium bagian 4), jadi label yang sama bisa dihitung di server kapan saja. Yang membuat fitur ini aman adalah larangan memakainya di server, bukan ketiadaan data.
- **B1.6 Varian yang lebih aman: julukan dipilih pengguna.** Bila pengguna sendiri memilih kategori untuk julukannya dari daftar kategori di bukunya, aplikasi hanya menampilkan jumlah temuan per kategori (statistik koleksi, seperti halaman statistik di spesifikasi §4.5). Aplikasi tidak lagi "mengidentifikasi, mengevaluasi, atau memprediksi" sesuatu tentang orangnya. Daya tarik identitas tetap ada, karena pengguna yang menyatakan identitasnya. Varian ini juga lebih mudah dibela dengan Ps. 19 ayat (3) huruf b: fitur "diminta ... secara aktif dan sadar".
- **B1.7 Sumber data sensitif.** `data/categories.json` memetakan label ML Kit "Church", "Mosque", dan "Temple" ke kategori bangunan. Bila julukan dibentuk dari label ML Kit mentah, bukan dari 9 id kategori, label seperti "Pemburu Masjid" bisa menyiratkan keyakinan agama (A3 angka j). Kategori `other` juga tidak bermakna sebagai julukan.
- **B1.8 Nada label.** Riset kartu share menyebut "humor yang sedikit memalukan" sebagai pemicu berbagi. Julukan yang mengejek atau memalukan bersinggungan dengan PP Ps. 17 huruf c (kesehatan mental) bila penggunanya Anak. Risikonya kecil selama label netral atau memuji.
- **B1.9 Apple 5.1.2(iii)** melarang membangun profil "surreptitiously". Label yang hanya tampil ke pengguna dan tidak tersimpan tidak bersifat diam-diam. Risiko toko rendah.

#### B2. Tambah Punyamu

- **B2.1 Bukan pemrofilan.** Kartu hanya memuat misi, satu cutout, kategori, dan kota.
- **B2.2 Tanpa tautan web penerima justru lebih aman untuk privasi.** Tidak ada kode rujukan, id pengirim, atau pelacakan instal yang menautkan pengirim dengan penerima. Begitu tautan atau kode undangan ditambahkan (spesifikasi §8), fitur ini perlu ditinjau ulang. Kode rujukan yang memuat id atau username akan membentuk data hubungan antar-orang, termasuk orang yang belum jadi pengguna.
- **B2.3 Dark pattern (PP Ps. 17).** Mockup sudah aman di beberapa titik: "Ikut kapan saja." tanpa hitung mundur, tanpa hadiah, dan tanpa tujuan yang dipilih otomatis. Risiko muncul bila nanti ditambah hadiah atau lencana untuk berbagi atau untuk teman yang ikut, penghitung "X orang sudah ikut" (bukti sosial palsu bila tidak benar), atau pengingat berulang untuk berbagi. Label "MISI BERANTAI" mengingatkan pada surat berantai yang menyiratkan kewajiban meneruskan. Risiko hukumnya rendah, tetapi istilah netral seperti "misi terbuka" lebih aman.
- **B2.4 Pedoman toko.** Kartu dikirim lewat share sheet sistem atau API Instagram/TikTok, dan pengguna memilih penerima sendiri. Itu sesuai dengan kebijakan Spam Google Play (A9) dan Apple 5.1.2(v) (yang hanya berlaku bila aplikasi memakai Kontak, padahal Kliping Kota tidak). Apple 3.1.2(a) dan 3.2.2(x) hanya terlanggar bila menyelesaikan misi, membuka fitur, atau mendapat konten berbayar mensyaratkan berbagi.
- **B2.5 Teks yang diisi lebih dulu.** Kebijakan Developer Meta 5.6(d) (dari riset 18 Nov, tidak dibuka ulang) melarang mengisi pesan lebih dulu kecuali isinya dibuat pengguna. Ajakan sebaiknya tetap di dalam gambar, seperti di mockup, dan tidak dimasukkan sebagai keterangan atau teks bawaan saat berbagi ke WhatsApp atau Instagram.
- **B2.6 Isi misi menentukan keamanan ajakan.** Kartu ini mengajak orang lain, mungkin termasuk Anak yang melihat Story, untuk memotret sesuatu. Misi dibuat otomatis dari kategori (K-009). Misi tidak boleh mendorong memotret orang, plat nomor, rumah orang, dokumen, atau memotret di tempat berbahaya seperti jalan raya atau atap (PP Ps. 17 huruf c bila sasarannya Anak). K-020 sudah tidak memetakan label orang dan dokumen, tetapi teks judul misi belum punya aturan.

#### B3. Risiko lintas gaya

- **B3.1 Isi cutout bisa membuka lokasi dan data orang lain.** K-011 dan acuan `docs/desain/acuan/kartu-share.md` mengatur teks dan metadata yang dibuat aplikasi, bukan isi gambar. Papan nama ("WARUNG KOPI", "TAMBAL BAN"), nomor rumah, atau nama jalan ditambah cap "SUKABUMI" bisa menunjuk tempat yang lebih rinci dari kota. Plat nomor dan wajah kemungkinan termasuk Data Pribadi orang lain (UU PDP Ps. 1 angka 1, "dapat diidentifikasi ... tidak langsung"). Untuk kartu yang dibagikan pengguna, Ps. 2 ayat (2) kemungkinan berlaku bagi pengguna, tetapi cutout yang sama juga tersimpan di Supabase Storage (§4.9), dan untuk salinan itu pengembang adalah Pengendali.
- **B3.2 Gaya dengan banyak cutout memperbesar risiko.** Gaya 6 (empat temuan), 7 (lima papan nama sebulan), dan 9 (sampai sembilan temuan sepekan) mengumpulkan beberapa petunjuk dalam satu gambar, sehingga area yang sering dikunjungi lebih mudah ditebak.
- **B3.3 Kalimat privasi bisa terlalu menenangkan.** "Hanya nama kota yang ikut. Lokasi dan EXIF dihapus." benar untuk metadata, tetapi bisa dibaca sebagai jaminan bahwa kartu tidak membuka lokasi sama sekali. Prinsip transparan (UU PDP Ps. 16 ayat (2) huruf a) dan larangan praktik tidak transparan (PP Ps. 17) lebih terpenuhi bila kalimat itu menyebut batasnya.
- **B3.4 Cuci Cetak Mingguan dan pola waktu.** Rentang tanggal dan kota bukan "informasi geolokasi yang tepat" menurut penjelasan PP Ps. 18 (A5), karena tidak berasal dari perangkat untuk menemukan posisi. Risikonya adalah pola: kartu yang dibagikan rutin tiap pekan menunjukkan pengguna ada di kota itu pada pekan tertentu, dan bersama papan nama bisa menunjukkan rutinitas. Risikonya lebih kecil daripada Story waktu-nyata biasa, karena kartu dibuat setelah pekan berakhir. Jam dan hari per temuan menambah risiko secara nyata, dan mockup sudah tidak memuatnya.
- **B3.5 Username di kartu.** Mockup tidak memuat username, dan itu sebaiknya dipertahankan. Username di kartu publik membuat akun bisa ditemukan orang tak dikenal lewat pencarian (§4.7), yaitu indikator risiko Permenkomdigi 9/2026 Ps. 11 ayat (1) huruf a dan d (riset 17 Nov).
- **B3.6 Metadata selain EXIF.** Spesifikasi §4.8 dan K-011 menyebut EXIF/GPS pada gambar. Video MP4 bisa membawa atom lokasi, dan PNG bisa membawa potongan teks atau eXIf. Kartu dirender ulang dari kanvas, jadi kemungkinan besar tidak membawa metadata, tetapi hal ini belum diuji.

## Rekomendasi per gaya (tafsiran, bukan keputusan)

| Gaya | Rekomendasi | Syarat | Tingkat |
|---|---|---|---|
| 7 Label Pemburu, **seperti di mockup** (julukan otomatis dari kategori dominan) | **Tunda** selama K-017 menjanjikan "tanpa pemrofilan" untuk semua | Bila tetap ingin dipakai, perlu keputusan baru yang secara sadar menerima risiko ini, sebaiknya setelah konsultasi hukum | – |
| 7 Label Pemburu, **varian dipilih pengguna** ("Pilih julukanmu") | **Aman dengan syarat** | (1) Pengguna memilih kategori sendiri dari daftar kategori di bukunya, dengan jumlah temuan di samping tiap kategori, tanpa kategori yang terpilih lebih dulu. | disarankan (PP Ps. 19 ayat (3) huruf b; Ps. 17 penjelasan, tanpa pilihan terpilih lebih dulu) |
| | | (2) Julukan dan jumlah dihitung di perangkat hanya saat gaya ini dibuka. Tidak disimpan, tidak disinkronkan, dan tidak masuk `Event`, termasuk sebagai atribut agregat. | wajib menurut K-017; PP Ps. 19 ayat (1) huruf b |
| | | (3) Julukan tidak dipakai untuk misi, rekomendasi, notifikasi, urutan konten, iklan, atau harga, dan tidak dihitung di server walaupun `Finding.category` ada di sana. | wajib menurut K-017; UU PDP Ps. 16 ayat (2) huruf b |
| | | (4) Tidak tampil otomatis di luar layar Bagikan: tanpa kartu kejutan, pop-up, atau push "Kamu Pemburu ...". | wajib (PP Ps. 19 ayat (1) huruf b, untuk Anak; berlaku untuk semua lewat K-017) |
| | | (5) Julukan hanya dari 9 id kategori (K-020), tanpa `other` dan tanpa label ML Kit mentah. Kalimat netral atau memuji, tidak mengejek. | disarankan (PP penjelasan Ps. 9 ayat (5) huruf b angka j; Ps. 17 huruf c) |
| | | (6) Satu kalimat di layar: "Dihitung di HP-mu, tidak disimpan." | disarankan (UU PDP Ps. 16 ayat (2) huruf a) |
| 10 Tambah Punyamu | **Aman dengan syarat** | (1) Tanpa hadiah, lencana, atau progres misi yang ditukar dengan berbagi atau dengan teman yang ikut. | wajib menurut sumber untuk konten berbayar (Apple 3.1.2(a)); disarankan untuk sisanya (PP Ps. 17) |
| | | (2) Berbagi hanya lewat share sheet atau API tujuan; pengguna memilih penerima; tanpa akses Kontak; tanpa teks keterangan bawaan. | wajib (Play Spam; Meta 5.6(d) dari riset 18 Nov) |
| | | (3) Tanpa username, kode rujukan, atau id di kartu. Tinjau ulang sebelum tautan web penerima (§8) dibuat. | disarankan |
| | | (4) Tanpa penghitung peserta, hitung mundur, atau pengingat berbagi. | disarankan (PP Ps. 17) |
| | | (5) Judul misi diperiksa agar tidak mengajak memotret orang, plat nomor, rumah orang, dokumen, atau di tempat berbahaya. | disarankan (PP Ps. 17 huruf c) |
| | | (6) Ganti label "MISI BERANTAI" dengan istilah netral. | opsional |
| 9 Cuci Cetak Mingguan | **Aman dengan syarat** | (1) Kartu baru tersedia setelah pekan berakhir. (2) Tanpa hari atau jam per temuan. (3) Rentang tanggal bisa dimatikan, atau ditulis kasar ("pekan ke-3 Nov"). | disarankan |
| Semua gaya | **Aman dengan syarat** | (1) Kalimat privasi menyebut batasnya, misalnya "Hanya nama kota yang ikut. Cek isi foto: plat nomor, nomor rumah, wajah." | disarankan (UU PDP Ps. 16 ayat (2) huruf a) |
| | | (2) Pengguna bisa menghapus bagian cutout sebelum berbagi (kuas Hapus K-031 sudah ada); sensor atau blur adalah tambahan. | disarankan; sensor opsional |
| | | (3) Tanpa username secara baku. | disarankan (Permenkomdigi Ps. 11 ayat (1)) |
| | | (4) Uji bahwa PNG, JPG, dan MP4 hasil share tidak membawa metadata lokasi. | disarankan (K-011) |
| | | (5) Deteksi otomatis plat nomor atau teks (Text Recognition, ditunda di K-020) | opsional, setelah MVP |

## Usulan yang bisa dicatat sebagai keputusan (pemilik yang memutuskan)

1. **Label Pemburu**: pilih salah satu.
   - (a) Varian "dipilih pengguna" dengan syarat 1–6 di atas.
   - (b) Rancangan otomatis, lewat keputusan yang menerima risiko dan menjelaskan bagaimana itu sejalan dengan K-017. Keputusan ini sebaiknya diambil setelah konsultasi hukum.
   - (c) Ditunda.
2. **Tambah Punyamu**: masuk dengan syarat 1–5. Tautan web penerima atau kode undangan wajib ditinjau privasi sebelum dibuat.
3. **Aturan bersama kartu share** (melengkapi K-011 tanpa menggantikannya): tanpa username secara baku; tanpa jam atau hari; tanggal paling rinci per pekan; kalimat privasi menyebut risiko isi foto; tidak ada hadiah untuk berbagi; metadata dihapus dari semua format (gambar, stiker PNG, video).
4. **Batas K-011**: K-011 mengatur data lokasi yang dibuat dan disimpan aplikasi. Isi foto adalah tanggung jawab pengguna, dibantu pengingat dan alat hapus. Catatan ini mencegah tafsiran bahwa aplikasi menjamin kartu tidak membuka lokasi.

## Kesimpulan

**Fakta bersumber.** PP 17/2025 Ps. 19 melarang pemrofilan Anak "dengan cara atau metode apapun ... atau tujuan lain" dan secara baku. Pemrofilan didefinisikan sebagai pemrosesan untuk "mengidentifikasi, mengevaluasi, atau memprediksi berbagai aspek tentang Anak", dengan contoh kecenderungan pilihan berdasarkan riwayat dalam kurun waktu tertentu. Penjelasan Ps. 9 menggolongkan kesimpulan yang mencerminkan preferensi dan kecenderungan sebagai Data Pribadi Anak. UU PDP mendefinisikan pemrofilan sebagai mengidentifikasi preferensi pribadi, minat, dan perilaku, tetapi hak keberatannya (Ps. 10) hanya untuk keputusan otomatis yang berakibat hukum atau berdampak signifikan. Apple melarang mensyaratkan posting media sosial untuk konten berbayar dan membangun profil diam-diam; Google Play melarang mengirim pesan atas nama pengguna tanpa konfirmasi.

**Tafsiran.** Label Pemburu otomatis kemungkinan besar termasuk pemrofilan menurut PP, dan PP tidak membedakan profil untuk penargetan dari ringkasan milik pengguna. Karena K-017 menerapkan standar Anak ke semua pengguna, rancangan itu sebaiknya diganti varian "dipilih pengguna" atau ditunda. Tambah Punyamu tidak memprofilkan, dan tanpa tautan penerima justru lebih privat. Fitur ini aman selama tidak ada hadiah untuk berbagi, pesan bawaan, username, atau kode rujukan. Risiko lintas gaya terbesar adalah isi cutout (papan nama, plat, nomor rumah), yang tidak bisa diatasi metadata. Penanganannya adalah kalimat privasi yang jujur dan alat hapus, bukan janji bahwa kartu "hanya memuat kota".

## Belum terjawab

- Tidak ditemukan panduan Komdigi tentang apakah pemrosesan yang tidak meninggalkan perangkat dihitung "pemrofilan" oleh PSE. B1.4 tetap dugaan.
- PP pelaksana UU PDP untuk Ps. 10 ayat (2) (keberatan atas pemrosesan otomatis) dan Ps. 34 ayat (3) (penilaian dampak) belum dicek keberadaannya.
- Sekitar 14 ribu karakter terakhir App Store Review Guidelines tidak terbaca. Kalimat lengkap kebijakan Spam Google Play belum disalin utuh (alat membatasi kutipan).
- Kebijakan Developer Meta tidak dibuka ulang; 5.6(d) dikutip dari riset 18 Nov.
- Apakah plat nomor kendaraan diperlakukan sebagai Data Pribadi dalam praktik penegakan UU PDP: belum ada sumber resmi yang dibaca.
- Parameter KM142 Lampiran II Bab III tentang fitur berbagi dan ajakan viral belum dibaca utuh, jadi pengaruh fitur share ke skor penilaian mandiri belum diketahui.
