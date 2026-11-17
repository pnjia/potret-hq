# Batas usia: PP Tunas, Permenkomdigi 9/2026, dan UU PDP

> Diriset: 2026-11-17 · Oleh: penasihat-privasi (sub-agen)
> Cek ulang sebelum dipakai untuk keputusan baru: Keputusan Menteri turunan (daftar layanan berisiko tinggi, juknis penilaian bisa diperbarui), status RUU perubahan UU PDP, ketersediaan API sinyal usia Apple/Google di Indonesia.
> Dipakai oleh: Q-001, Q-002, Q-010 (belum ada keputusan)
> Menggantikan sebagian: bagian "Regulasi" di [`2026-11-16-riset-awal.md`](2026-11-16-riset-awal.md) (sumber sekunder). Tanggal "berlaku penuh 28 Mar 2026" di sana tidak cocok dengan teks asli, lihat temuan 1.6.
> **Bukan nasihat hukum.** Ringkasan ini dibuat dari teks resmi oleh agen, bukan oleh advokat. Sebelum rilis, minta konsultan hukum memeriksa kesimpulan bertanda **dugaan**.

## Pertanyaan

1. Apakah pengguna 16–17 tahun tergolong "Anak", dan kewajiban apa yang berlaku untuk mereka? (Q-001)
2. Apakah input tahun lahir (deklarasi mandiri) cukup sebagai "verifikasi usia"? (Q-002)
3. Perlukah `User.tahun_lahir` disimpan, atau cukup penanda? (Q-010)
4. Apa konsekuensi tiap opsi batas usia untuk developer solo?

## Sumber yang dibaca (teks asli)

| Kode | Dokumen | Tempat | Diakses |
|---|---|---|---|
| PP | PP 17/2025 tentang Tata Kelola Penyelenggaraan Sistem Elektronik dalam Pelindungan Anak (LN 2025 No. 36), batang tubuh + penjelasan | https://jdih.komdigi.go.id/produk_hukum/unduh/id/965/t/peraturan+pemerintah+nomor+17+tahun+2025 (status "Berlaku": https://jdih.komdigi.go.id/produk_hukum/view/id/965/t/peraturan%2Bpemerintah%2Bnomor%2B17%2Btahun%2B2025) | 2026-11-17 |
| PM | Permenkomdigi 9/2026, peraturan pelaksanaan PP 17/2025 (BN 2026 No. 163, ditetapkan dan diundangkan 6 Mar 2026) | https://jdih.komdigi.go.id/produk_hukum/unduh/id/1007/t/peraturan+menteri+komunikasi+dan+digital+nomor+9+tahun+2026 | 2026-11-17 |
| KM140 | Kepmenkomdigi 140/2026 tentang Layanan Jejaring dan Media Sosial yang Dikategorikan sebagai Profil Risiko Tinggi (17 Mar 2026) | https://jdih.komdigi.go.id/index.php/produk_hukum/unduh/id/1008/t/keputusan+menteri+komunikasi+dan+digital+nomor+140+tahun+2026 | 2026-11-17 |
| KM142 | Kepmenkomdigi 142/2026 tentang indikator "mungkin digunakan atau diakses oleh Anak", juknis penilaian tingkat risiko, dan tata cara verifikasi penilaian mandiri (17 Mar 2026). Dibaca: diktum, Lampiran I utuh, Lampiran II Bab I–II; tabel parameter Bab III hanya sekilas | https://jdih.komdigi.go.id/index.php/produk_hukum/unduh/id/1009/t/keputusan+menteri+komunikasi+dan+digital+nomor+142+tahun+2026 | 2026-11-17 |
| PDP | UU 27/2022 tentang Pelindungan Data Pribadi (salinan resmi, LN 2022 No. 196). Dibaca: Pasal 1–6, 25–35, penjelasan Pasal 4, 16, 20–32 | https://jdih.kemenkeu.go.id/download/46c17b53-4a45-411c-9b76-c6799e5769fc/UU_Nomor_27_Tahun_2022%20Perlindungan%20Data%20Pribadi.pdf | 2026-11-17 |
| APL | Apple, "Age assurance developer Q&A" | https://developer.apple.com/support/age-assurance/ | 2026-11-17 |
| GPL | Android Developers, "Regional age-related protections on Play" | https://developer.android.com/distribute/age-appropriate-experiences/regional-protections | 2026-11-17 |

Sumber sekunder yang hanya dipakai untuk mencari dokumen di atas, tidak untuk kesimpulan: berita bisnis.com di riset 16 Nov, pasal.id (naskah berlabel "diproses, belum ditinjau").

## Temuan (fakta dari teks; semua **terbukti** kecuali diberi label lain)

### 1. PP 17/2025 (PP Tunas)

- **1.1 Definisi Anak.** "Anak ... adalah seseorang yang belum berusia 18 (delapan belas) tahun." (PP Pasal 1 angka 1; PM Pasal 1 angka 1 sama persis). Pengguna 16–17 tahun **adalah Anak**.
- **1.2 Siapa yang terkena.** PSE lingkup privat yang mengembangkan Produk, Layanan, dan Fitur yang "secara khusus dirancang untuk digunakan atau diakses oleh Anak, atau yang mungkin digunakan atau diakses oleh Anak" (PP Pasal 3 ayat (3), Pasal 4 ayat (1)). Indikator "mungkin digunakan" ada di PP Pasal 4 ayat (2) huruf a–e dan dirinci di KM142 (temuan 3).
- **1.3 Tiga kewajiban dasar.** PSE wajib menyediakan (a) informasi batasan minimum usia, (b) mekanisme verifikasi pengguna Anak, (c) mekanisme pelaporan penyalahgunaan (PP Pasal 2 ayat (4)). Penjelasan huruf b: "mekanisme verifikasi" adalah "tata cara untuk memastikan bahwa pengguna yang mengakses Sistem Elektronik adalah Anak, dengan menggunakan teknologi."
- **1.4 Profil risiko dan penilaian mandiri.** Tujuh aspek risiko: kontak dengan orang tak dikenal, konten tidak sesuai, eksploitasi Anak sebagai konsumen, ancaman keamanan Data Pribadi Anak, adiksi, gangguan psikologis, gangguan fisiologis. Satu aspek tinggi = profil risiko tinggi (PP Pasal 5 ayat (3)–(4)). PSE wajib menilai sendiri, melapor ke Menteri, Menteri memverifikasi lalu menetapkan profil (PP Pasal 5 ayat (6)–(9)).
- **1.5 Kewajiban dan larangan umum.** PP Pasal 7 ayat (1): antara lain (a) persetujuan orang tua/wali, (b) Penilaian Dampak Pelindungan Data Pribadi, (c) pengaturan privasi tinggi secara baku, (g) pilihan fungsi sesuai usia, (j) menunjuk petugas pelindungan Data Pribadi. PP Pasal 7 ayat (2): **dilarang** (a) praktik terselubung/tidak transparan (dark pattern), (b) mengumpulkan informasi geolokasi yang tepat dari Anak, (c) memprofilkan Anak.
- **1.6 Persetujuan orang tua (rinci).**
  - PSE wajib mendapat persetujuan orang tua/wali sebelum Anak dapat menggunakan layanan (PP Pasal 9 ayat (1)). Penjelasan: bersifat *opt-in*.
  - Untuk Anak "berusia paling rendah 17 (tujuh belas) tahun", PSE **dapat** meminta persetujuan dari Anak sendiri, dengan wajib memberi notifikasi ke orang tua/wali untuk konfirmasi (PP Pasal 9 ayat (2)). Penjelasan: bersifat *opt-out*.
  - Jangka waktu (Penjelasan Pasal 9 ayat (3)): Anak di bawah 17 → batas 24 jam untuk meminta persetujuan orang tua, akses ditahan sampai ada persetujuan. Anak 17 → orang tua diberi 6 jam untuk menolak, akses ditahan sampai 6 jam lewat.
  - Bila orang tua menolak: layanan dilarang diberikan, persetujuan Anak batal demi hukum, dan PSE wajib menghapus Data Pribadi Anak (PP Pasal 9 ayat (4)–(5)).
  - Penjelasan Pasal 9 ayat (5) huruf b: Data Pribadi Anak adalah Data Pribadi spesifik, meliputi antara lain alias, nama akun, alamat email, alamat IP, data geolokasi, informasi visual, dan kesimpulan untuk membuat profil Anak.
- **1.7 Privasi baku.** Pengaturan privasi tinggi secara baku untuk produk yang mungkin diakses Anak (PP Pasal 10 ayat (1)); penjelasan: hanya Data Pribadi yang benar-benar dibutuhkan yang diproses tanpa intervensi pengguna.
- **1.8 Geolokasi.** Dilarang (a) mengumpulkan geolokasi tepat dari Anak secara baku, **kecuali** sangat diperlukan untuk layanan yang diminta Anak dan hanya untuk waktu terbatas; (b) mengumpulkan tanpa tanda yang jelas kepada Anak selama pengumpulan (PP Pasal 18). Penjelasan: "informasi geolokasi yang tepat" adalah data dari perangkat untuk menemukan area geografis tempat pengguna berada; "sangat diperlukan" berarti bagian esensi layanan yang diminta Anak.
- **1.9 Pemrofilan.** Dilarang memprofilkan Anak dengan cara apa pun (mis. untuk penawaran produk) dan secara baku (PP Pasal 19 ayat (1)). Pengecualian: alasan kuat demi kepentingan terbaik Anak, atau pemrofilan adalah inti layanan dan diminta Anak secara aktif dan sadar (ayat (2)–(3)). Pemrofilan = pemrosesan Data Pribadi Anak untuk mengidentifikasi, mengevaluasi, atau memprediksi aspek tentang Anak (ayat (4)); penjelasan: mis. analisis kecenderungan pilihan konten dari riwayat.
- **1.10 Rentang usia dan akun.** Rentang: 3–5, 6–9, 10–12, 13–15, 16–<18 (PP Pasal 20 ayat (2)). PSE yang mewajibkan akun (PP Pasal 21 ayat (1)):
  - di bawah 13: hanya produk yang dirancang khusus untuk Anak dan berisiko rendah, dengan persetujuan orang tua;
  - 13–<16: hanya produk berisiko rendah, dengan persetujuan orang tua;
  - **16–<18: boleh memiliki akun, dengan persetujuan orang tua** (tanpa syarat profil risiko).
  - Ayat (2): PSE wajib menjamin teknologi bagi orang tua untuk mengawasi penggunaan melalui akun Anak (penjelasan: mis. *parental control*). PM Pasal 29 ayat (1)–(2) mengulang aturan yang sama.
- **1.11 Verifikasi usia.** PSE menerapkan langkah teknis dan operasional untuk verifikasi usia sesuai batas usia (PP Pasal 22 ayat (1)); penjelasan: "Termasuk dalam verifikasi usia adalah estimasi usia." Tingkat jaminan disesuaikan dengan risiko (ayat (2)). Saat verifikasi PSE wajib antara lain: memproses data hanya untuk verifikasi (ayat (3) huruf e), **menghapus data verifikasi setelah tujuannya terpenuhi** kecuali penyimpanan dibolehkan undang-undang (huruf f), dan menyediakan mekanisme keberatan bila usia teridentifikasi salah (huruf g). **Bila PSE tidak dapat memverifikasi sesuai persyaratan, PSE wajib menerapkan perlindungan privasi tingkat Anak kepada semua pengguna** (ayat (4)).
- **1.12 Pelaporan.** Alat pelaporan yang mudah dipakai Anak/orang tua dan tindak lanjutnya (PP Pasal 23); penjelasan: mis. fitur *mute words*.
- **1.13 Edukasi.** Wajib edukasi dan pemberdayaan ekosistem digital, dilaporkan ke Menteri paling sedikit 1 kali setahun (PP Pasal 12 ayat (1), (5)).
- **1.14 Sanksi.** Pelanggaran antara lain Pasal 7 ayat (1) huruf a dan c–i, Pasal 9, 10, 18, 19 ayat (1), 21 ayat (1)–(2), 22 ayat (1), (3), (4), 23 dikenai sanksi administratif: teguran tertulis, denda administratif, penghentian sementara, pemutusan akses (PP Pasal 38).
- **1.15 Berlaku dan tenggat.** Berlaku sejak diundangkan 27 Mar 2025 (PP Pasal 50). PSE wajib menyesuaikan "paling lama 2 (dua) tahun sejak Peraturan Pemerintah ini diundangkan" (PP Pasal 49), yaitu sampai 27 Mar 2027.
  - **Konflik dengan sumber sekunder:** riset 16 Nov menulis "berlaku penuh 28 Mar 2026". Teks asli tidak menyebut tanggal itu. Tanggal 28 Mar 2026 muncul di KM140 Diktum KETIGA sebagai awal penonaktifan bertahap akun Anak di platform yang terdaftar. **Dugaan:** berita merujuk tanggal itu.

### 2. Permenkomdigi 9/2026

- **2.1 Penilaian kesesuaian usia sebelum rilis.** PSE wajib menilai sendiri kesesuaian produk dengan batas dan rentang usia, dan dokumentasinya disahkan "sebelum Produk, Layanan, dan Fitur dapat diakses oleh Anak" (PM Pasal 4–5, khususnya Pasal 5 ayat (2)).
- **2.2 Verifikasi pengguna Anak.** Wajib menyediakan mekanisme verifikasi (PM Pasal 7 ayat (1)); "dapat dilakukan dengan menerapkan teknologi" (ayat (3)), dikembangkan sendiri atau lewat pihak ketiga (ayat (4)); Menteri dapat menetapkan teknologi yang dinilai andal (ayat (7)). **PM tidak menyebut metode yang diterima atau ditolak, dan tidak menyebut deklarasi mandiri.**
- **2.3 Kontak dengan orang tak dikenal.** Bila produk memungkinkan Anak berkontak dengan orang tak dikenal, PSE harus menyediakan teknologi kontrol orang tua untuk menyetujui atau menolak kontak itu (PM Pasal 10 ayat (2)–(3)). Indikatornya antara lain: akun Anak ditemukan orang tak dikenal, konten Anak ditemukan orang tak dikenal, informasi akun Anak ditampilkan di profil (PM Pasal 11 ayat (1) huruf a, b, d).
- **2.4 Eksploitasi sebagai konsumen.** Indikator antara lain produk berbayar sekali bayar atau langganan, dan fasilitas pembayaran (PM Pasal 15 ayat (1) huruf b–c).
- **2.5 Keamanan data Anak.** Indikator antara lain: data Anak dikumpulkan tanpa pengawasan orang tua, Data Pribadi Anak ditampilkan ke publik secara baku, Anak dapat mengubah pengaturan privasi tanpa persetujuan orang tua (PM Pasal 16 ayat (2) huruf a–c).
- **2.6 Pelaporan penilaian mandiri.** Hasil penilaian mandiri dan bukti pendukung dilaporkan ke Menteri melalui Direktur Jenderal, dengan menunjuk pejabat narahubung (PM Pasal 21). Produk yang sudah ada: paling lambat 3 bulan sejak 6 Mar 2026 (PM Pasal 62). Menteri menetapkan profil risiko tinggi atau rendah (PM Pasal 25).
- **2.7 Mitigasi yang diakui.** Evaluasi ulang risiko dapat dilakukan terhadap antara lain *safety by design*/*privacy by design*, *parental control*, verifikasi usia atau *age assurance*, kontrol transaksi *in-app purchase*, kontrol pengeluaran akun Anak (PM Pasal 26 ayat (4)).
- **2.8 Layanan jejaring sosial.** Layanan jejaring dan media sosial dikategorikan berisiko tinggi "kecuali ditentukan lain" berdasarkan penilaian mandiri dan penetapan Menteri (PM Pasal 30 ayat (1)). Definisinya: memungkinkan interaksi sosial daring antara dua atau lebih pengguna; memungkinkan pengguna berhubungan atau berinteraksi dengan sebagian atau semua pengguna lain; dan/atau memungkinkan pengguna mengunggah material (ayat (2)). PSE layanan ini **harus menonaktifkan akun Anak di bawah 16 tahun** (ayat (3)).

### 3. Keputusan Menteri turunan

- **3.1 KM140** menetapkan 8 layanan sebagai jejaring sosial berisiko tinggi: Instagram, Facebook, Threads, TikTok, YouTube, Bigo Live, Roblox, X (Lampiran). Penonaktifan akun Anak yang tidak memenuhi batas usia dilakukan bertahap sejak 28 Mar 2026 (Diktum KETIGA). PSE dalam daftar dapat menyesuaikan profil risiko lewat penilaian mandiri (Diktum KELIMA).
- **3.2 KM142 Lampiran I, indikator "mungkin digunakan atau diakses oleh Anak".** Terpenuhinya **satu** indikator sudah cukup. Yang relevan:
  - Indikator B (komposisi pengguna): bila tidak ada mekanisme pengumpulan data usia/verifikasi usia, atau tidak ada tingkat jaminan verifikasi, indikator terpenuhi. Kutipan: "Mekanisme pengumpulan data usia, atau mekanisme memastikan usia pengguna, atau mekanisme verifikasi usia dapat berupa prediksi usia atau penggunaan sertifikat elektronik." Jumlah signifikan: paling sedikit 25 pengguna Anak yang rutin.
  - Indikator D (desain menarik bagi Anak): antara lain warna cerah/pastel mencolok, ilustrasi kartun, animasi berlebihan (*bounce, sparkle, confetti*), tipografi *playful*; dan gamifikasi seperti poin, *level*, *badge*, *streak*, progres bar yang "*nudge*", *daily reward*, *loot box*. Bisa dibantah dengan bukti bahwa desain tidak diperuntukkan atau menargetkan Anak.
  - Indikator E (serupa dengan produk yang terbukti dipakai Anak).
  - Hasil penilaian indikator disampaikan lewat sistem elektronik Komdigi paling lambat 3 hari kerja setelah penilaian (Lampiran I angka IV).
- **3.3 KM142 Lampiran II** berisi kertas kerja penilaian mandiri: parameter berbobot per aspek, bukti pendukung wajib per parameter, dan asesor (idealnya tim multidisiplin; bila pihak luar, perlu keahlian psikologi Anak, fisiologi Anak, IT, keamanan data, hukum, *digital marketing*).

### 4. UU 27/2022 (UU PDP)

- **4.1** Data anak termasuk Data Pribadi yang bersifat spesifik (PDP Pasal 4 ayat (2) huruf e; penjelasan "cukup jelas").
- **4.2** "Pemrosesan Data Pribadi anak diselenggarakan secara khusus" dan "wajib mendapat persetujuan dari orang tua anak dan/atau wali anak sesuai dengan ketentuan peraturan perundang-undangan" (PDP Pasal 25 ayat (1)–(2); penjelasan "cukup jelas").
- **4.3** UU PDP **tidak mendefinisikan "anak"**: Pasal 1 angka 1–11 tidak memuatnya dan penjelasan Pasal 4 dan 25 "cukup jelas".
- **4.4** Pemrosesan wajib terbatas dan spesifik, sah, dan transparan (PDP Pasal 27); penjelasan: pengumpulan terbatas sesuai tujuan yang ditentukan saat pengumpulan.
- **4.5** Penilaian dampak pelindungan Data Pribadi wajib bila pemrosesan berisiko tinggi, termasuk pemrosesan Data Pribadi spesifik (PDP Pasal 34 ayat (1), ayat (2) huruf b).

### 5. Alat dari toko aplikasi (bukan regulasi; cek ulang)

- **5.1 Apple Declared Age Range API** tersedia di seluruh dunia; pengguna (atau orang tua di Family Sharing) bisa memilih tidak membagikan rentang usia; Apple memakai metode *age assurance* sendiri hanya "in certain regions, where legally required". Halaman tidak menyebut Indonesia (APL).
- **5.2 Google Play Age Signals API** untuk skala global berstatus "coming in Q4 2026"; Indonesia tidak tercantum di tabel perlindungan regional (GPL).

## Tafsiran (semua **dugaan**)

- **D1. potret kemungkinan besar masuk lingkup PP Tunas apa pun batas usianya.** Lencana, misi mingguan, angka progres kota, animasi buku, dan stiker cocok dengan contoh indikator D di KM142; tanpa verifikasi usia yang bermutu, indikator B juga terpenuhi. Artinya kewajiban dasar (info batas usia, verifikasi, pelaporan, penilaian mandiri dan laporannya) tetap berlaku walau batasnya dinaikkan ke 18+. Yang berubah hanya: dengan 18+, Anak bukan pengguna yang diizinkan, sehingga kewajiban khusus Anak (persetujuan orang tua, kontrol orang tua) tidak perlu dibangun sebagai alur.
- **D2. Fitur sosial potret kemungkinan memenuhi definisi jejaring sosial di PM Pasal 30 ayat (2)** (follow, melihat buku teman, Cutout yang diunggah terlihat oleh pengikut). Karena itu profil risikonya kemungkinan tinggi, kecuali penilaian mandiri dan penetapan Menteri menyatakan lain. Akun privat baku, follow dengan persetujuan, dan tanpa komentar/like/DM (K-008) adalah mitigasi yang relevan, tetapi pencarian lewat username tetap membuat akun "ditemukan orang tak dikenal" (PM Pasal 11 ayat (1) huruf a). Pembelian kosmetik nanti (K-007) menambah indikator eksploitasi konsumen (PM Pasal 15).
- **D3. K-011 sejalan dengan PP Pasal 18 untuk pengguna 16–17 asalkan** izin lokasi hanya diminta saat memotret (bukan baku di latar), dipakai sesaat, dan ada tanda yang jelas saat lokasi dibaca. Pemrosesan di perangkat tanpa dikirim kemungkinan tidak dihitung "pengumpulan" oleh PSE, tetapi teks tidak menjawabnya.
- **D4. Metrik ketukan Kamera terkunci per pengguna (K-007) bisa dianggap pemrofilan** (memprediksi minat membeli) bila terkait akun Anak. Untuk pengguna 16–17, metrik semacam ini sebaiknya diagregasi tanpa terikat akun.
- **D5. Deklarasi mandiri tahun lahir tidak disebut sebagai metode verifikasi** di PP, PM, maupun KM142. Contoh resmi yang disebut adalah estimasi/prediksi usia dan sertifikat elektronik. Untuk produk berisiko tinggi, deklarasi mandiri saja kemungkinan dinilai jaminannya terlalu rendah (PP Pasal 22 ayat (2)). Bila verifikasi yang memadai tidak mungkin, jalan yang disediakan aturan adalah PP Pasal 22 ayat (4): perlindungan privasi tingkat Anak untuk semua pengguna.
- **D6. Ketidakjelasan "anak" di UU PDP** kemungkinan diisi oleh definisi undang-undang perlindungan anak (di bawah 18), sejalan dengan PP Pasal 1 angka 1. Teks UU Perlindungan Anak tidak dibaca dalam riset ini.

## Perbandingan opsi (tafsiran)

| | (a) Tetap 16+ dengan alur khusus 16–17 | (b) Naik ke 18+ | (c) 18+ untuk MVP, privasi tingkat Anak untuk semua, 16+ ditinjau lagi nanti |
|---|---|---|---|
| Kewajiban tambahan (terbukti) | Persetujuan orang tua sebelum akses: opt-in 24 jam untuk usia 16, opt-out 6 jam untuk usia 17 (PP Pasal 9 + penjelasan); hapus data bila ditolak; kontrol orang tua lewat akun Anak (PP Pasal 21 ayat (2), PM Pasal 29 ayat (1)); kontrol orang tua untuk kontak dengan orang tak dikenal (PM Pasal 10); privasi baku tinggi; larangan geolokasi baku dan pemrofilan; penilaian dampak (PP Pasal 7 ayat (1) huruf b, PDP Pasal 34); petugas pelindungan data; laporan edukasi tahunan | Info batas usia 18+, verifikasi usia yang menahan pengguna di bawah 18, pelaporan, penilaian mandiri dan laporannya (D1). Tanpa alur persetujuan orang tua dan kontrol orang tua | Sama dengan (b), ditambah default privasi tingkat Anak untuk semua pengguna sebagai jaring pengaman bila ada Anak yang lolos verifikasi (selaras dengan PP Pasal 22 ayat (4)) |
| Beban implementasi untuk developer solo | **Tinggi.** Perlu identitas dan kanal kontak orang tua, penundaan akses 6/24 jam, alur penolakan dan penghapusan, dasbor atau mode pengawasan orang tua, perbedaan perilaku per usia, mekanisme verifikasi berjaminan lebih tinggi, dan penilaian mandiri dengan banyak parameter "ditemukan". Menjawab "siapa yang membuktikan dia orang tuanya" belum ada panduannya | **Sedang.** Verifikasi usia 18+ dan mekanisme keberatan tetap perlu; sisanya dokumen (penilaian mandiri, info usia, kebijakan privasi) | **Sedang.** Seperti (b); sebagian besar default privasi sudah ada di spesifikasi (akun privat, lokasi tingkat kota, tanpa iklan). Tambahan kecil: metrik tanpa profil per pengguna |
| Dampak ke target pengguna | Target K-001 tetap (Gen Z dan angkatan Gen Alpha tertua). Friksi orang tua kemungkinan menurunkan pendaftaran usia 16–17 | Pengguna 16–17 hilang. "Angkatan Gen Alpha tertua" (lahir sekitar 2010) belum 18 pada 2026, jadi segmen itu hilang seluruhnya. Arah visual "tidak kekanak-kanakan" makin penting karena indikator D | Seperti (b) untuk MVP; pintu 16+ tetap terbuka lewat keputusan baru setelah alur orang tua dan praktik Komdigi lebih jelas |
| Risiko sisa | Salah langkah di alur persetujuan langsung kena sanksi (PP Pasal 38 menyebut Pasal 9 dan 21) | Pengguna di bawah 18 yang berbohong saat verifikasi; diperkecil oleh verifikasi dan jaring pengaman (c) | Sama dengan (b), lebih kecil karena ada jaring pengaman |

Varian lain yang ditimbang dan **tidak** disarankan: 16+ tetapi fitur sosial dimatikan untuk 16–17. Varian ini tidak menghapus beban utama, karena persetujuan orang tua untuk akun usia 16–17 berlaku apa pun profil risikonya (PP Pasal 21 ayat (1) huruf c).

## Kesimpulan

Fakta dari teks asli: pengguna 16–17 tahun adalah Anak (PP 17/2025 Pasal 1 angka 1). Mereka boleh punya akun hanya dengan persetujuan orang tua (PP Pasal 9, Pasal 21 ayat (1) huruf c) dan dengan kontrol orang tua lewat akun Anak (Pasal 21 ayat (2)). Data mereka adalah Data Pribadi spesifik yang pemrosesannya wajib disetujui orang tua (UU PDP Pasal 4 ayat (2) huruf e, Pasal 25). Alasan K-001 bahwa 16+ "paling aman" karena menghindari kewajiban perlindungan anak tidak didukung teks: batas 16 hanya menghindari larangan untuk usia 13–15 (hanya produk berisiko rendah) dan kewajiban menonaktifkan akun di bawah 16 di layanan jejaring sosial (PM Pasal 30 ayat (3)). Tafsiran: potret tetap masuk lingkup PP Tunas walau batasnya 18+ (D1), dan deklarasi mandiri tahun lahir kemungkinan tidak cukup sebagai verifikasi untuk produk dengan fitur sosial (D5).

**Rekomendasi penasihat (bukan keputusan): opsi (c).** Alasannya: beban alur orang tua untuk satu developer setara dengan alasan K-001 menolak "semua umur dengan mode anak", dan fitur sosial potret kemungkinan membuat profilnya berisiko tinggi. Jaring pengaman privasi tingkat Anak untuk semua pengguna murah karena sebagian besar sudah ada di spesifikasi. Pemilik yang memutuskan lewat `/catat-keputusan`, dan sebaiknya mengonsultasikannya dengan konsultan hukum sebelum rilis.

Implikasi untuk Q-010 (tafsiran): dengan (b)/(c), cukup simpan hasil verifikasi (lolos 18+, metode, tanggal) lalu hapus tahun lahir atau data verifikasi lain setelah verifikasi selesai (PP Pasal 22 ayat (3) huruf e–f; UU PDP Pasal 27). Dengan (a), perlu disimpan kapan pengguna genap 18 tahun untuk mengakhiri perlakuan Anak. Datanya cukup sampai tingkat tahun-bulan, disimpan hanya untuk pengguna di bawah 18, dan dihapus begitu mereka dewasa. Nama field baru diusulkan lewat glosarium (K-014).

## Belum terjawab

- Metode verifikasi usia yang "dinilai andal" oleh Menteri (PM Pasal 7 ayat (7)): belum ditemukan penetapannya per 17 Nov 2026.
- Cara memastikan bahwa yang memberi persetujuan benar orang tua/wali: PP dan PM tidak mengaturnya.
- Isi lengkap tabel parameter dan bobot KM142 Lampiran II Bab III serta Lampiran III (tata cara verifikasi oleh Kementerian): belum dibaca utuh.
- Apakah aplikasi yang belum rilis wajib melapor penilaian mandiri sebelum tersedia di toko, atau cukup mengesahkan dokumentasi internal (PM Pasal 5 ayat (2) vs Pasal 21): teks tidak tegas.
- Pasal UU PDP tentang petugas pelindungan data, masa transisi, dan sanksi belum dibaca. Status RUU perubahan UU PDP (disebut di hasil pencarian, Juni 2026) belum dicek.
- Definisi anak di UU Perlindungan Anak tidak dibaca langsung (D6).
- Aturan usia dan rating di App Store dan Google Play untuk aplikasi dengan konten pengguna belum dirangkum.
