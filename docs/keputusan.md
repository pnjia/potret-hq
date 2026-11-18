# Catatan Keputusan

> Setiap keputusan mencatat **apa**, **mengapa**, dan **alternatif yang ditolak**, supaya tidak dibahas ulang tanpa alasan baru.
> Untuk mengubah keputusan, tambahkan entri baru yang menggantikan entri lama. Jangan hapus entri lama.

---

### K-001 · Batas usia 16+
- **Tanggal**: 16 Nov 2026
- **Keputusan**: Pengguna minimal berusia 16 tahun.
- **Alasan**: PP Tunas mewajibkan verifikasi usia untuk pengguna anak dan melarang pelacakan lokasi maupun profiling anak. Aplikasi ini berbasis kota dan punya fitur share, sehingga 16+ adalah opsi paling aman.
- **Ditolak**:
  - 13+: masih terkena kewajiban perlindungan anak.
  - Semua umur dengan mode anak: beban kepatuhan terlalu berat untuk developer solo.
- **Konsekuensi**: Target menjadi Gen Z dan angkatan Gen Alpha tertua. Visual tidak boleh terasa kekanak-kanakan.

### K-002 · Konsep objek hybrid
- **Tanggal**: 16 Nov 2026
- **Keputusan**: Temuan bebas dengan kategori otomatis, ditambah landmark kurasi per kota.
- **Alasan**: Temuan bebas membuat konten mudah bertambah. Landmark memberi tujuan dan rasa "melengkapi koleksi".
- **Ditolak**:
  - Bebas saja: pengguna tidak punya tujuan.
  - Kurasi saja: kurasinya terlalu berat untuk satu orang.
- **Konsekuensi**: Landmark dicocokkan lewat radius lokasi + konfirmasi, bukan pengenalan gambar.

### K-003 · Flutter untuk Android dan iOS sekaligus
- **Tanggal**: 16 Nov 2026
- **Alasan**: Satu basis kode untuk developer solo. Cocok untuk animasi kustom (shader). Plugin cutout native untuk kedua platform tersedia.
- **Ditolak**: Android dulu.
- **Konsekuensi**: Minimum iOS 17. Video share memakai encoder native karena FFmpegKit sudah pensiun.

### K-004 · Satu buku untuk semua kota
- **Tanggal**: 16 Nov 2026
- **Alasan**: Buku menjadi "paspor perjalanan" sekaligus identitas pengguna, sehingga nilai sampul dan tema ikut naik.
- **Ditolak**:
  - Satu buku per kota.
  - Pengguna bebas membuat banyak buku.
- **Konsekuensi**: Buku wajib dibagi per bab kota, punya daftar isi, dan memuat halaman secara bertahap.

### K-005 · Tata letak otomatis yang bisa diatur ulang
- **Tanggal**: 16 Nov 2026
- **Alasan**: Halaman langsung rapi tanpa usaha, tapi pengguna tetap bisa berekspresi.
- **Ditolak**:
  - Otomatis penuh: terasa kaku.
  - Manual penuh: terlalu merepotkan.
- **Konsekuensi**: Halaman yang pernah diatur manual tidak boleh diacak ulang oleh sistem.

### K-006 · Login wajib sejak awal
- **Tanggal**: 16 Nov 2026
- **Alasan**: Data tersinkron, pembelian terikat ke akun, dan fitur follow butuh identitas.
- **Ditolak**: Tanpa akun dengan login opsional.
- **Konsekuensi**:
  - Wajib ada fitur hapus akun dan Sign in with Apple.
  - Biaya storage cloud muncul.
  - Demo buku ditampilkan sebelum layar login untuk mengurangi pengguna yang berhenti.

### K-007 · Belum ada toko di MVP
- **Tanggal**: 16 Nov 2026
- **Alasan**: Fokus membuktikan bahwa produknya disukai lebih dulu.
- **Ditolak**: Kamera berbayar sejak MVP, atau kamera + tema sejak MVP.
- **Konsekuensi**:
  - Skema data sudah siap jual (SKU dan tabel kepemilikan).
  - Kamera terkunci ditampilkan untuk mengukur minat sebelum toko dibuka.

### K-008 · Follow dan melihat buku teman
- **Tanggal**: 16 Nov 2026
- **Alasan**: Memberi alasan untuk mengajak teman. Melengkapi share ke luar aplikasi.
- **Ditolak**:
  - Share ke luar saja.
  - Menunda fitur sosial.
- **Konsekuensi**:
  - Akun privat secara default, follow butuh persetujuan.
  - Buku teman hanya bisa dilihat, tanpa komentar, like, atau DM.
  - Wajib ada fitur lapor dan blokir.

### K-009 · Retensi lewat misi mingguan dan lencana
- **Tanggal**: 16 Nov 2026
- **Alasan**: Misi memberi alasan kembali dalam jangka pendek. Lencana memberi tujuan jangka panjang.
- **Konsekuensi**:
  - Misi dibuat otomatis dari kategori, tidak ditulis manual tiap minggu.
  - Ritme mingguan, bukan harian.
  - Hadiah bersifat kosmetik.

### K-010 · Hapus latar di perangkat
- **Tanggal**: 16 Nov 2026
- **Alasan**: Gratis, privat, dan tidak butuh server.
- **Ditolak**: API hapus latar berbasis cloud, karena berbayar per foto dan foto harus diunggah.
- **Konsekuensi**: Model Android diunduh saat onboarding. Kuas manual disediakan untuk merapikan hasil.

### K-011 · Lokasi disimpan hanya di tingkat kota
- **Tanggal**: 16 Nov 2026
- **Alasan**: Mematuhi UU PDP dan menjaga keamanan pengguna saat buku dilihat orang lain.
- **Konsekuensi**: Koordinat hanya dipakai sesaat di perangkat untuk mencocokkan kota dan landmark. EXIF dihapus saat share.

### K-012 · Prototipe pertama: animasi buka halaman
- **Tanggal**: 16 Nov 2026
- **Alasan**: Ini risiko teknis terbesar sekaligus jantung pengalaman aplikasi.

### K-013 · HQ digabung dengan kode aplikasi dalam satu repo
- **Tanggal**: 16 Nov 2026
- **Keputusan**: Repo ini berisi knowledge base (HQ) dan nanti kode aplikasi Flutter di `app/`. HQ tidak dipisah ke repo sendiri.
- **Alasan**: Developer solo. Satu sesi Claude melihat spesifikasi dan kode sekaligus, sehingga penyimpangan mudah terlihat. Path di CLAUDE.md bisa menunjuk ke kode, dan konvensi Flutter cukup ditaruh di `app/CLAUDE.md` yang baru dimuat saat bekerja di `app/`. Sesi cloud cukup satu repo.
- **Ditolak**: HQ terpisah seperti `inzta-hq`. Di sana repo dipisah karena kodenya milik klien dan dibagikan ke tim lain, alasan yang tidak berlaku di sini.
- **Konsekuensi**:
  - Riwayat git dokumen dan kode bercampur. CI aplikasi nanti memakai filter path.
  - Nama repo `potret-hq` mungkin perlu diganti (Q-012).
  - Dasar persetujuan: analisis di `LAPORAN-ANALISIS.md`, disetujui pemilik 16 Nov 2026 ("Setuju semua, gabung").

### K-014 · Identifier kode dan data berbahasa Inggris
- **Tanggal**: 16 Nov 2026
- **Keputusan**: Nama entitas, field, dan nilai enum di Dart, JSON (`data/`), dan Postgres memakai bahasa Inggris sesuai `docs/produk/glosarium.md`. Dart/JSON `camelCase`, Postgres `snake_case`. Dokumen dan teks UI tetap Bahasa Indonesia.
- **Alasan**: Glosarium v1 sudah memakai nama kelas Inggris (`Finding`, `landmarkId`). Field §5 spesifikasi masih Indonesia (`tahun_lahir`, `radius_m`), jadi perlu satu aturan supaya kode, skema, dan sub-agen tidak mencampur dua bahasa.
- **Ditolak**: Field berbahasa Indonesia mengikuti §5 apa adanya; campuran per lapisan.
- **Konsekuensi**: Tabel pemetaan field §5 → kode ada di glosarium bagian 4. Disetujui pemilik 16 Nov 2026 ("Setuju semua").

### K-015 · HQ tanpa gerbang persetujuan; kualitas lewat checklist mandiri
- **Tanggal**: 16 Nov 2026
- **Keputusan**: Tidak ada gerbang verifikasi, approval berlapis, pre-commit hook, atau CI yang memblokir di HQ. Setiap sub-agen memeriksa sendiri checklist "selesai" di file agennya. Pemeriksaan mekanis (`node scripts/cek-hq.mjs`) dijalankan sukarela.
- **Alasan**: Developer solo tidak butuh pemeriksa dari orang lain. Gerbang di `inzta-hq` lahir dari kebutuhan klien dan tim.
- **Ditolak**: Pasangan pembuat-pemeriksa wajib, ambang skor keyakinan, gerbang per tahap pipeline.
- **Konsekuensi**:
  - Mata kedua tetap tersedia bila diminta (misalnya `/code-review` bawaan Claude Code), tidak wajib.
  - Setiap temuan agen wajib berbukti (`file:baris` atau URL) dan berlabel **terbukti** atau **dugaan**.
  - Tindakan yang tidak bisa dibatalkan (rilis ke toko, hapus data produksi, keluar uang) tetap ditanyakan dulu. Ini perilaku dasar, bukan gerbang.

### K-016 · Perangkat acuan Android dan target 30 fps
- **Tanggal**: 17 Nov 2026
- **Keputusan**: Perangkat acuan Android adalah Infinix Hot 11 Play (Helio G35, GPU PowerVR GE8320, RAM 4 GB, layar 720×1640, Android 11). Target: **konsisten 30 fps** selama animasi page-curl. Diukur di build profile. Lolos bila ≥95% frame (UI dan raster) ≤33,3 ms selama gestur buka halaman, dan tidak ada frame >50 ms setelah shader dipanaskan.
- **Alasan**: Ditetapkan pemilik 17 Nov 2026 ("infinix hot 11 play, target konsisten 30fps"). Spesifikasi perangkat dan perilaku renderer dari `docs/riset/2026-11-17-perangkat-dan-stack.md`: di SoC MediaTek/PowerVR, Flutter kemungkinan memakai Impeller OpenGLES, bukan Vulkan.
- **Ditolak**:
  - 60 fps (asumsi kerja sebelumnya): terlalu tinggi untuk GPU kelas bawah dan tidak diminta pemilik.
  - Perangkat acuan yang lebih kuat: tidak mewakili risiko #1 (Android kelas menengah ke bawah).
- **Konsekuensi**:
  - `FragmentProgram` di-precache sebelum halaman pertama dibuka. UV dibalik di shader untuk backend OpenGLES.
  - Backend renderer yang benar-benar dipakai dicatat dari log perangkat saat prototipe K-012.
  - iPhone (iOS 17+) tetap diukur, tetapi tidak menggantikan hasil di Hot 11 Play.
- **Menjawab**: Q-011

### K-017 · Pengguna 18+ di MVP, perlindungan privasi tingkat anak untuk semua
- **Tanggal**: 17 Nov 2026
- **Keputusan**:
  - Pengguna minimal **18 tahun**.
  - Verifikasi usia berlapis:
    1. deklarasi bulan-tahun lahir saat pendaftaran;
    2. sinyal usia dari platform bila tersedia: Apple Declared Age Range API, dan Google Play Age Signals API begitu tersedia global;
    3. jalur keberatan bila usia dinilai salah.
  - Karena verifikasi ini belum tentu dinilai memadai, **semua pengguna** mendapat pengaturan baku setara perlindungan anak (PP 17/2025 Ps. 22 ayat (4)):
    - akun privat baku;
    - tanpa geolokasi tepat;
    - tanpa pemrofilan: `Event` dicatat agregat, tanpa id pengguna;
    - tanpa dark pattern yang mendorong melonggarkan privasi atau memberi data lebih.
- **Alasan**:
  - Teks asli PP 17/2025 Ps. 1 angka 1 mendefinisikan anak sebagai belum 18 tahun. Pengguna 16–17 hanya boleh dilayani dengan persetujuan orang tua (opt-in 24 jam di usia 16, opt-out 6 jam di usia 17) dan kontrol orang tua lewat akun anak (PP Ps. 9, Ps. 21; Permenkomdigi 9/2026 Ps. 10, Ps. 29; UU PDP Ps. 25).
  - Beban itu setara "mode anak" yang ditolak K-001 untuk developer solo.
  - Deklarasi mandiri tidak disebut sebagai metode verifikasi di teks mana pun.
  - Jaring pengaman Ps. 22 ayat (4) murah karena sebagian besar sudah ada di spesifikasi.
  - Sumber: `docs/riset/2026-11-17-usia-pp-tunas-uu-pdp.md`.
- **Ditolak**:
  - 16+ dengan alur persetujuan dan kontrol orang tua: beban implementasi dan moderasi terlalu berat untuk MVP solo.
  - 18+ tanpa jaring pengaman: bila ada anak yang lolos verifikasi, layanan melanggar Ps. 18, 19, 22.
  - Tahun lahir saja sebagai verifikasi: tidak memakai teknologi sebagaimana diminta PP Ps. 22.
- **Konsekuensi**:
  - Target pengguna: Gen Z usia 18+. Gen Alpha tertua keluar dari target MVP. Visual tetap tidak boleh terasa kekanak-kanakan.
  - "Gerbang usia 16+ (tahun lahir)" di spesifikasi §4.1 tidak berlaku lagi; yang berlaku keputusan ini.
  - Sebelum rilis, wajib ada:
    - info batas usia (pop-up);
    - penilaian mandiri tingkat risiko beserta laporannya ke Komdigi (Permenkomdigi 9/2026 Ps. 4–5);
    - penilaian dampak pelindungan data pribadi;
    - mekanisme pelaporan.
  - Rinciannya di `docs/teknis/rilis.md`.
  - Metrik minat kamera terkunci (K-007) tetap ada, tetapi dihitung agregat per kamera, bukan per akun.
  - Bukan nasihat hukum: periksakan ke konsultan hukum sebelum rilis. 16+ boleh ditinjau ulang setelah MVP lewat keputusan baru.
- **Menggantikan**: K-001
- **Menjawab**: Q-001, Q-002

### K-018 · Simpan hasil verifikasi usia, bukan tahun lahir
- **Tanggal**: 17 Nov 2026
- **Keputusan**: Bulan-tahun lahir hanya diproses di perangkat saat pendaftaran, lalu dibuang. Supabase hanya menyimpan `ageVerificationMethod` (`self_declared` atau `platform_signal`) dan `ageVerifiedAt`. Tidak ada kolom tahun lahir.
- **Alasan**: Data verifikasi hanya untuk verifikasi dan dihapus setelah selesai (PP 17/2025 Ps. 22 ayat (3) huruf e–f). Pemrosesan harus terbatas dan spesifik (UU PDP Ps. 27). Dengan batas 18+ (K-017), tidak perlu tahu kapan pengguna genap 18.
- **Ditolak**:
  - Menyimpan `birth_year` seperti §5 spesifikasi: melebihi kebutuhan.
  - Menyimpan tanggal genap 18: hanya perlu bila ada pengguna di bawah 18.
- **Konsekuensi**: Pemetaan field `User` di glosarium bagian 4 berubah: `birthYear` diganti `ageVerificationMethod` dan `ageVerifiedAt`.
- **Menjawab**: Q-010

### K-019 · Path foto asli hanya disimpan di perangkat
- **Tanggal**: 17 Nov 2026
- **Keputusan**: `localOriginalPath` hanya ada di drift (SQLite perangkat) dan tidak pernah dikirim ke Supabase. Tabel Postgres `finding` tidak punya kolom `local_original_path`. Di perangkat lain, temuan ditampilkan dari cutout dan thumbnail saja.
- **Alasan**: Path perangkat tidak berguna di perangkat lain dan membocorkan struktur folder. Foto asli memang tidak diunggah (spesifikasi §4.9, K-010).
- **Ditolak**: Menyinkronkan path. Mengunggah foto asli: bertentangan dengan §4.9 dan menaikkan biaya storage.
- **Konsekuensi**: Model drift dan Postgres untuk `Finding` berbeda satu field. Sinkronisasi wajib menyaring field ini.
- **Menjawab**: Q-003

### K-020 · Taksonomi kategori v1: 9 kategori dari label ML Kit
- **Tanggal**: 17 Nov 2026
- **Keputusan**:
  - Kategori: `sign` (papan nama dan tulisan), `food`, `drink`, `vehicle`, `animal`, `plant`, `building` (bangunan dan monumen), `object` (barang), dan `other` (lainnya).
  - Pemetaan 174 label ML Kit ada di `data/categories.json`.
  - Aturan pemilihan:
    1. ambil label di atas ambang 0,5 (bawaan ML Kit) dan urutkan menurut confidence di kode;
    2. pilih label terpetakan tertinggi yang bukan "lemah"; label lemah hanya dipakai bila tidak ada label terpetakan lain;
    3. seri dipecah dengan `tieBreakOrder`;
    4. tanpa label terpetakan → `other`.
  - `other` tidak dipakai misi dan lencana.
- **Alasan**:
  - Label map resmi punya 430 label berbahasa Inggris, tanpa label teks, papan nama, mural, atau pohon (`docs/riset/2026-11-17-label-mlkit-kategori.md`).
  - Sembilan kategori menutup contoh di spesifikasi §4.3 dan objek kota Indonesia.
  - Minuman dipisah karena budaya jajan dan ngopi memberi banyak bahan misi.
- **Ditolak**:
  - Kategori `fashion` (pakaian yang dikenakan): mendorong pengguna memotret orang lain. Aksesori (tas, topi, sepatu, kacamata) masuk `object`.
  - Delapan kategori dengan minuman digabung ke makanan: misi jadi kurang beragam.
  - Text Recognition v2 untuk papan nama sejak MVP: menambah model sekitar 4 MB per arsitektur dan satu proses lagi. Dievaluasi setelah uji di perangkat.
- **Konsekuensi**:
  - Label orang (Person, Selfie, Baby), alkohol (Wine, Alcohol), dan dokumen pribadi (Receipt, Passport, Money) sengaja tidak dipetakan.
  - Kategori `sign` lemah di MVP.
  - `Landmark.category` memakai id yang sama.
  - Pemetaan diuji dengan foto kota nyata sebelum `data/categories.json` dianggap stabil; perubahan pemetaan cukup mengedit data, bukan keputusan baru.
- **Menjawab**: Q-004

### K-021 · Palet dan tipografi v1
- **Tanggal**: 17 Nov 2026
- **Keputusan**:
  - Warna:
    - kertas `#F3EEE4` (dasar), `#FBF8F2` (lembar), `#DCD3C3` (garis), `#E6D6A3` (selotip);
    - tinta `#1F1C19` dan `#5F584F`;
    - aksen merah muda tinta stempel `#C2385F` dan biru pulpen `#2F5D8C`;
    - galat `#B42318`, berhasil `#2E7652`.
  - Font: Fraunces (display), Plus Jakarta Sans (teks UI), Caveat (tulisan tangan). Ketiganya berlisensi OFL.
  - Spasi kelipatan 4 px, radius kartu 6 px, rotasi penempatan maksimal ±4°.
  - Nilainya ada di `data/design-tokens.json` v1.0.0.
- **Alasan**:
  - Mengikuti spesifikasi §2: dasar kertas netral, warna ramai dibawa konten.
  - Merah muda dipakai sebagai aksen, bukan dasar, untuk mengakomodasi selera pengguna muda (riset 16 Nov) tanpa terasa kekanak-kanakan.
  - Semua pasangan teks di atas kertas lolos WCAG AA (≥4,5; dihitung 17 Nov 2026).
  - Plus Jakarta Sans buatan Tokotype (Indonesia).
  - Lisensi dicek di `google/fonts` METADATA.pb.
- **Ditolak**:
  - Merah muda sebagai warna dasar: berisiko terasa kekanak-kanakan.
  - Palet neon atau gelap: bertentangan dengan nuansa kertas.
  - Font sistem bawaan: tidak memberi karakter zine.
- **Konsekuensi**:
  - Durasi page-curl tetap placeholder sampai prototipe K-012 diukur.
  - `City.accentColor` per kota diisi saat kurasi.
- **Menjawab**: Q-007

### K-022 · Kota MVP: Bandung
- **Tanggal**: 17 Nov 2026
- **Keputusan**: Kota pertama yang dikurasi (20–30 landmark) adalah **Bandung**.
- **Alasan**: Spesifikasi sudah memakai Bandung sebagai contoh stempel ("Bandung 23/100"). Kotanya padat landmark ikonik dalam radius yang bisa dijalani, dan punya budaya kuliner serta jalanan yang kaya bahan temuan bebas.
- **Ditolak**:
  - Jakarta: terlalu luas untuk 20–30 landmark yang terasa "lengkap".
  - Yogyakarta: kandidat kuat kedua, tetapi tidak dipakai di contoh spesifikasi.
- **Konsekuensi**:
  - Asumsi yang belum dicek: pemilik bisa menyurvei Bandung langsung (spesifikasi §4.4). Bila tidak, ganti lewat keputusan baru sebelum survei dimulai.
  - Kota lain tetap berfungsi tanpa kurasi.
- **Menjawab**: Q-005

### K-023 · Nama aplikasi: Kliping Kota
- **Tanggal**: 17 Nov 2026
- **Keputusan**: Nama aplikasi di toko: **Kliping Kota**. Nama kode `potret` tetap dipakai di repo, kode, dan dokumen internal.
- **Alasan**: Menggambarkan konsep (potong, tempel, koleksi per kota) dalam bahasa Indonesia. Tidak ada aplikasi bernama sama di hasil teratas App Store dan Google Play (`docs/riset/2026-11-17-nama-suara-zona-aman.md`).
- **Ditolak**:
  - "Kliping": sudah dipakai aplikasi lain di kedua toko.
  - "Jepret": dipakai aplikasi foto di Google Play.
  - "Potret", "Tempel", "Tempelan": kata umum yang sulit menonjol.
  - "Gunting": terasa kekanak-kanakan.
  - "Klise": bermakna "basi".
  - "Sudut": sulit ditemukan lewat pencarian.
- **Konsekuensi**:
  - Sebelum mendaftar akun pengembang atau merek: cek PDKI (belum dicek), domain, dan akun media sosial. Bila bentrok, ganti lewat keputusan baru.
  - Bundle ID ditetapkan saat `app/` dibuat.
  - Spesifikasi v1 masih menulis "nama aplikasi belum ada"; yang berlaku keputusan ini.
- **Menjawab**: Q-006

### K-024 · Suara: rekam sendiri, cadangan CC0/Pixabay, semua tercatat
- **Tanggal**: 17 Nov 2026
- **Keputusan**:
  - Suara buka halaman dan suara shutter diutamakan **direkam sendiri** (foley).
  - Cadangan hanya Freesound CC0 atau Pixabay, yang diolah di dalam aplikasi.
  - Lisensi CC BY, CC BY-NC, dan sumber tanpa lisensi jelas dilarang.
  - Setiap file suara dicatat di `data/sounds.json` (sumber, URL, pembuat, lisensi).
- **Alasan**:
  - Suara ikut di video share yang diunggah pengguna ke media sosial. Lisensi CC BY mewajibkan kredit di setiap video, dan NC melarang pemakaian komersial.
  - Pixabay memperingatkan sistem deteksi otomatis media sosial bisa membisukan video.
  - Rekaman sendiri bebas dari masalah lisensi dan sekaligus menjadi identitas suara.
  - Sumber: `docs/riset/2026-11-17-nama-suara-zona-aman.md`.
- **Ditolak**: CC BY (kewajiban kredit ikut ke setiap video pengguna); musik atau efek dari aplikasi lain.
- **Konsekuensi**: `data/sounds.json` dan skemanya dibuat sekarang (masih kosong). `Camera.shutterSound` merujuk file yang tercatat di sana.
- **Menjawab**: Q-008

### K-025 · Pembelian lewat RevenueCat
- **Tanggal**: 17 Nov 2026
- **Keputusan**:
  - Pembelian kosmetik (kamera, tema) memakai RevenueCat (`purchases_flutter`) dengan App User ID = UUID pengguna Supabase.
  - Webhook RevenueCat diterima Supabase Edge Function, yang menulis tabel `Entitlement`.
  - Item dijual sebagai non-consumable.
- **Alasan**:
  - Gratis sampai US$2,5 rb MTR, lalu 1%.
  - Menghapus kebutuhan membangun validasi receipt, restore, dan refund sendiri; untuk developer solo itu pekerjaan terbesar `in_app_purchase`.
  - Sumber: `docs/riset/2026-11-17-perangkat-dan-stack.md`.
- **Ditolak**: `in_app_purchase` saja: perlu backend verifikasi, kredensial Play/App Store, dan Pub/Sub sendiri.
- **Konsekuensi**:
  - Integrasi dikerjakan saat toko dibuka (K-007 tetap).
  - Saat itu cek ulang harga dan versi SDK (syarat non-consumable di Android).
- **Menjawab**: Q-009

### K-026 · Nama repo tetap `potret-hq`
- **Tanggal**: 17 Nov 2026
- **Keputusan**: Repo tidak diganti nama sekarang. Ditinjau ulang saat rilis toko pertama.
- **Alasan**:
  - Nama kode `potret` tetap dipakai internal (K-023).
  - Mengganti nama repo menyentuh clone, sesi cloud, dan tautan, sementara nama publik belum dicek ke PDKI.
  - GitHub mengalihkan nama lama, jadi penggantian nanti tetap murah.
- **Ditolak**: Mengganti sekarang ke `potret` atau `kliping-kota`.
- **Konsekuensi**: Tidak ada perubahan. Akhiran "-hq" dibiarkan walau repo juga akan berisi kode (K-013).
- **Menjawab**: Q-012

### K-027 · Riverpod 3 dan struktur folder per fitur
- **Tanggal**: 17 Nov 2026
- **Keputusan**:
  - State management dan dependency injection: `flutter_riverpod` 3.x, provider ditulis manual tanpa `riverpod_generator`. Drift menjadi satu-satunya pemakai code generation.
  - Struktur:
    - `app/lib/core/`
    - `app/lib/data/` (repositori per entitas, drift dan Supabase)
    - `app/lib/features/<modul>/{ui,state}/`
  - Modul mengikuti glosarium seperti di `docs/teknis/arsitektur.md`.
- **Alasan**:
  - Satu alat untuk state dan DI, aktif dirawat (3.5.0, 6 Nov 2026), dan berstatus Flutter Favorite.
  - Struktur sejalan dengan panduan arsitektur resmi Flutter: UI per fitur, data per tipe.
  - Sumber: `docs/riset/2026-11-17-perangkat-dan-stack.md`.
- **Ditolak**:
  - `flutter_bloc`: boilerplate lebih banyak, rilis terakhir Mei 2025.
  - `provider` + `ChangeNotifier`: DI dan state terpisah.
  - `riverpod_generator`: menambah beban code generation.
- **Konsekuensi**: Konvensi rinci ditulis di `app/CLAUDE.md` saat `app/` dibuat.
- **Menjawab**: Q-013

### K-028 · Arti angka di stempel kota
- **Tanggal**: 17 Nov 2026
- **Keputusan**:
  - "Bandung 23/100" berarti **23 temuan** pengguna di kota itu dari **target 100** (`City.findingTarget`, default 100).
  - Bila melewati target, angka pertama tetap naik (contoh "123/100").
  - Progres landmark ditampilkan terpisah di halaman pembatas ("Landmark 4/25").
- **Alasan**: Kota kurasi hanya punya 20–30 landmark, jadi "/100" tidak cocok sebagai jumlah landmark. Target temuan berlaku juga untuk kota yang belum dikurasi.
- **Ditolak**:
  - Persentase kelengkapan: sulit dijelaskan bila melewati 100.
  - Jumlah landmark: tidak cocok dengan angka 100.
- **Konsekuensi**: Field `findingTarget` ditambahkan ke `data/cities.json` dan skemanya. Kartu share, halaman pembatas, dan lencana memakai definisi ini.
- **Menjawab**: Q-014

### K-029 · Kota MVP: Sukabumi
- **Tanggal**: 17 Nov 2026
- **Keputusan**: Kota pertama yang dikurasi (target 20–30 landmark) adalah **Kota Sukabumi**. Bandung menjadi kandidat kota kurasi kedua setelah MVP (kota kurasi tambahan memang ditunda, spesifikasi §8).
- **Alasan**:
  - Pemilik berdomisili di Kota Sukabumi (17 Nov 2026). Spesifikasi §4.4 meminta kota yang bisa disurvei langsung, dan K-022 sudah menyebut Bandung harus diganti bila syarat itu tidak terpenuhi.
  - Bandung sekitar 3 jam sekali jalan dari Sukabumi tanpa kereta langsung, jadi tidak cocok untuk survei berulang.
  - Kota Sukabumi punya sekitar 21 objek diduga cagar budaya (2023), ditambah bangunan publik dan museum.
  - Kota domisili juga memudahkan uji kategori dengan foto nyata (K-020) dan uji lapangan di Infinix Hot 11 Play (K-016).
  - Sumber: `docs/riset/2026-11-17-kota-mvp-sukabumi.md`.
- **Ditolak**:
  - Bandung: terlalu jauh untuk survei rutin; tetap jadi kandidat kedua.
  - Kabupaten Sukabumi (Geopark Ciletuh, Pelabuhan Ratu): objeknya tersebar jauh dan tidak cocok dengan konsep bab per kota.
- **Konsekuensi**:
  - `data/cities.json` mendapat entri Sukabumi (belum dikurasi). Contoh Bandung–Gedung Sate tetap sebagai entri contoh.
  - Bila kurasi menemukan kurang dari 20 landmark yang layak di dalam Kota Sukabumi, catat sebagai Q- baru. Jangan menambah objek dari luar batas kota diam-diam.
  - Contoh "Bandung 23/100" di spesifikasi dan acuan tetap sah sebagai contoh format.
- **Menggantikan**: K-022

### K-030 · Suara sintesis sendiri boleh dipakai dan dicatat
- **Tanggal**: 18 Nov 2026
- **Keputusan**: Suara yang disintesis sendiri lewat skrip, tanpa bahan pihak ketiga, boleh dipakai di aplikasi. Suara seperti ini dicatat di `data/sounds.json` dengan `source` = `synth`, `license` = `own`, `url` = `null`, dan path skrip pembuatnya disebut di `meta.note` atau di skrip itu sendiri. Rekaman foley tetap diutamakan (K-024).
- **Alasan**:
  - K-024 mewajibkan setiap file suara tercatat, tetapi enum `source` di skema hanya berisi `foley`, `freesound`, dan `pixabay`. Placeholder buka halaman prototipe K-012 jadi tidak bisa dicatat.
  - Sintesis sendiri tidak membawa kewajiban lisensi atau kredit, dan aman dari deteksi otomatis media sosial (alasan yang sama dengan K-024).
  - Prototipe K-012 butuh suara sekarang, sebelum rekaman foley ada.
- **Ditolak**:
  - Mencatat placeholder hanya di `meta.note`: melanggar semangat K-024 (setiap file suara tercatat per entri).
  - Prototipe tanpa suara sampai rekaman ada: suara termasuk lingkup K-012.
  - Memakai Freesound CC0 sebagai placeholder: sah menurut K-024, tetapi tetap butuh pengecekan lisensi per file, sedangkan sintesis tidak.
- **Konsekuensi**:
  - `data/schema/sounds.schema.json`: enum `source` ditambah `synth`.
  - `data/sounds.json`: entri `page-turn-placeholder` (`app/assets/sounds/page-turn-placeholder.wav`, dibuat oleh `app/tool/make_page_turn_sound.py`).
  - Placeholder tetap diganti rekaman foley sebelum rilis, kecuali ada keputusan baru yang menetapkan suara sintesis sebagai versi final.
- **Menjawab**: Q-016

### K-031 · Opsi editor v5 masuk MVP, tepi bawaan Die-cut
- **Tanggal**: 18 Nov 2026
- **Keputusan**:
  - **Sampul**: 8 template (Kobalt, Koran, Jendela, Peta trayek, Perangko, Tinta, Kliping, Karcis), 1–3 stiker temuan per template, dan **set hiasan** buatan sendiri (Karcis, Pos, Coretan; 12 hiasan) yang posisinya diatur template. Penempatan bebas di sampul tetap ditunda (spesifikasi §8).
  - **Halaman**:
    - 4 tepi stiker: putih, tanpa, gunting, bingkai.
    - 6 tinta keterangan: Tinta `#121212`, Kobalt `#3048FF`, Sepia `#6B4226`, Merah cap `#B42318`, Magenta `#C2185B`, Hijau `#276B4A`. Semuanya ≥ 4,5:1 di kertas buku dan selotip.
    - 6 motif selotip, 4 posisi selotip, 4 kertas latar (polos, garis, titik, grid), dan 6 gaya halaman siap pakai.
    - Tombol **Acak tata letak**.
  - **Acak dan K-005**: Acak hanya dijalankan pengguna. Halaman tetap berstatus `isManuallyArranged`, keterangan tidak berubah, dan hasilnya bisa diurungkan. Sistem tetap tidak pernah mengacak sendiri.
  - **Hapus temuan** (permanen, termasuk cutout di cloud, dengan konfirmasi) terpisah dari **Lepas dari halaman** (temuan tetap ada).
  - **Rapikan potongan**:
    - tiga mode: Kuas (Tambah/Hapus, kaca pembesar), Gunting poligon, dan Tepi;
    - lima gaya tepi: Tanpa, Die-cut, Guntingan, Zigzag, Sobek; tebal S/M/L;
    - **gaya tepi bawaan: Die-cut putih**.
- **Alasan**:
  - Pemilik menilai editor sebelumnya kurang variatif dan meminta semua opsi hasil riset masuk MVP (18 Nov 2026).
  - Riset menunjukkan pola "pilihan terkurasi supaya hasil selalu bagus" (preset, palet terbatas, tombol acak) di aplikasi kolase dan buku foto (`docs/riset/2026-11-18-editor-kolase-variatif.md`).
  - Laso poligon dan tepi guntingan/zigzag tidak ditemukan di aplikasi konsumen, jadi keduanya menjadi pembeda (`docs/riset/2026-11-18-ux-potong-latar-dan-gunting.md`).
  - Die-cut putih adalah tepi yang paling dikenal (pola stiker iOS dan Photoroom) dan paling bersih di latar apa pun.
  - Hiasan dibuat sendiri karena hanya itu yang bebas kredit dan cocok tema (`docs/riset/2026-11-18-stiker-hiasan-lisensi.md`).
- **Ditolak**:
  - MVP minimal (hanya opsi berprioritas "wajib" dari riset; Gunting, Guntingan, Zigzag, Sobek, Acak, dan hiasan ditunda): pemilik ingin hasil akhir lebih variatif sejak awal.
  - Guntingan sebagai tepi bawaan: lebih khas, tetapi kurang dikenal dan lebih berat dirender. Tetap tersedia sebagai pilihan.
  - Stiker hiasan dari pustaka luar (OpenMoji, Twemoji, Streamline, emoji): wajib kredit atau melanggar daftar "jangan" v5. Sumber CC0 museum hanya dipakai sebagai acuan bentuk.
- **Konsekuensi**:
  - Spesifikasi v1 §4.3 (hanya kuas manual) dan §4.5 (sampul = template + nama + stiker) diperluas oleh keputusan ini; teks spesifikasi tidak diedit.
  - Glosarium perlu istilah baru (K-014):
    - tepi stiker `edgeStyle` (`none`/`dieCut`/`snipped`/`pinking`/`torn`) dan `edgeWidth`;
    - motif selotip;
    - tinta keterangan;
    - kertas latar;
    - gaya halaman;
    - stiker hiasan;
    - `templateId` di `Book.cover`.
  - Hiasan buatan sendiri dicatat seperti suara (K-024/K-030): data/decorations.json (usulan) dengan lisensi `own`, dikerjakan `desainer-visual`/`kurator-katalog`.
  - Skema drift dan Supabase untuk `Placement` dan `Book.cover` perlu kolom baru (`arsitek-flutter`, `backend-supabase`). Rincian batas atur manual dan isi sampul masih di Q-020 dan Q-021.
  - Risiko performa di Infinix Hot 11 Play (K-016) harus diukur sebelum dikunci: tepi Zigzag/Sobek/Guntingan, kaca pembesar, dan kertas bermotif. Tepi dirender sekali saat simpan, bukan per frame (`animasi-buku`, `kamera-cutout`).
  - Rupa visual opsi-opsi ini mengikuti arah v5, yang masih menunggu Q-017. Bila arah visual berubah, daftar opsinya tetap berlaku.
- **Menjawab**: Q-022
