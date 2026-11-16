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
