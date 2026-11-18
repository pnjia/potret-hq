# Privasi dan regulasi

> Area agen `penasihat-privasi` (pembantu, tidak memblokir). Bukan nasihat hukum resmi: periksakan ke konsultan hukum sebelum rilis.
> Terakhir diverifikasi: 18 Nov 2026. Untuk PP 17/2025, Permenkomdigi 9/2026, Kepmenkomdigi 140 dan 142/2026, serta UU PDP, verifikasi dilakukan dari **teks asli** (JDIH Komdigi, JDIH Kemenkeu). Rincian pasal, URL, dan tafsiran ada di `docs/riset/2026-11-17-usia-pp-tunas-uu-pdp.md`. Pada 18 Nov, PP Ps. 17–19 beserta penjelasan Ps. 9–19, dan UU PDP Ps. 1–21, 34 beserta penjelasan Ps. 9–21, dibaca ulang dari teks asli untuk kartu share. Pedoman App Store (3.1.2(a), 3.2.2(x), 5.1.1(v), 5.1.2(iii)/(v)) dan kebijakan Spam Google Play juga dibaca dari sumber asli (`docs/riset/2026-11-18-tinjauan-privasi-kartu-share.md`). Baris toko lainnya (hapus akun, Sign in with Apple, konten pengguna) **belum** dicek ke pedoman asli. Cek ulang sebelum rilis (spesifikasi §7).

## 0. Keputusan yang berlaku

- **K-017**: pengguna 18+; verifikasi usia berlapis; pengaturan baku setara perlindungan anak untuk semua pengguna (PP Ps. 22 ayat (4)). Baris tentang persetujuan dan kontrol orang tua di bawah tidak berlaku selama batasnya 18+, tetapi tetap dicatat bila 16+ ditinjau ulang.
- **K-018**: tahun lahir tidak disimpan; hanya metode dan waktu verifikasi.
- **K-019**: path foto asli hanya di perangkat.
- Kolom "Catatan" di bawah masih menyebut Q- saat tabel ditulis; semuanya kini terjawab (`docs/pertanyaan.md`).

## 1. Kewajiban dan penerapannya

Label: **terbukti** = tertulis di teks sumber; **dugaan** = tafsiran penasihat. Tingkat saran: **wajib** (menurut sumber) / **disarankan** / **opsional**.

| Kewajiban | Asal (pasal) | Penerapan di spesifikasi | Catatan |
|---|---|---|---|
| "Anak" = belum 18 tahun, jadi pengguna 16–17 adalah Anak | PP 17/2025 Ps. 1 angka 1; Permenkomdigi 9/2026 Ps. 1 angka 1 (terbukti) | Gerbang usia 16+ (§4.1) | Q-001 (dijawab K-017, yang menggantikan K-001): alasan K-001 ("16+ menghindari kewajiban perlindungan anak") tidak didukung teks |
| Info batasan minimum usia dalam bahasa yang mudah dipahami, juga untuk orang tua | PP Ps. 2 ayat (4) huruf a, Ps. 11, Ps. 20; Permenkomdigi Ps. 2–3 (terbukti) | Belum ada teks info usia | Wajib. Penjelasan Ps. 11 mencontohkan *pop-up* |
| Mekanisme verifikasi pengguna Anak "dengan menggunakan teknologi"; jaminannya sebanding dengan risiko; estimasi usia termasuk | PP Ps. 2 ayat (4) huruf b + penjelasan, Ps. 22 ayat (1)–(2) + penjelasan; Permenkomdigi Ps. 7 (terbukti) | Tahun lahir saat pendaftaran (§4.1) | Wajib. Q-002: deklarasi mandiri tidak disebut di teks mana pun; kemungkinan kurang untuk produk dengan fitur sosial (dugaan) |
| Data verifikasi hanya untuk verifikasi, dihapus setelah selesai; ada jalur keberatan bila usia salah | PP Ps. 22 ayat (3) huruf e–g (terbukti) | Tahun lahir disimpan di `User` (§5) | Wajib. Q-010 |
| Bila verifikasi memadai tidak bisa dilakukan: perlindungan privasi tingkat Anak untuk semua pengguna | PP Ps. 22 ayat (4) (terbukti) | Sebagian sudah: akun privat baku (§4.7), lokasi tingkat kota (K-011), tanpa iklan | Wajib bila kondisinya terjadi; disarankan sebagai jaring pengaman |
| Persetujuan orang tua sebelum Anak memakai layanan; usia 17 boleh lewat persetujuan Anak + notifikasi ke orang tua (opt-out 6 jam); di bawah 17 opt-in (24 jam); bila ditolak, hapus data Anak | PP Ps. 7 ayat (1) huruf a, Ps. 9 + penjelasan, Ps. 21 ayat (1) huruf c; Permenkomdigi Ps. 29 ayat (2) huruf c; UU PDP Ps. 25 ayat (2) (terbukti) | Tidak ada | Wajib bila ada pengguna 16–17. Q-001 |
| Teknologi pengawasan orang tua lewat akun Anak (*parental control*) | PP Ps. 21 ayat (2); Permenkomdigi Ps. 29 ayat (1) (terbukti) | Tidak ada | Wajib bila ada pengguna Anak |
| Kontrol orang tua untuk kontak Anak dengan orang tak dikenal | Permenkomdigi Ps. 10 ayat (2)–(3) (terbukti) | Follow butuh persetujuan pengguna, bukan orang tua (§4.7, K-008) | Wajib bila ada pengguna Anak dan pencarian username tetap ada (dugaan) |
| Larangan pengumpulan geolokasi tepat secara baku dan tanpa tanda yang jelas | PP Ps. 7 ayat (2) huruf b, Ps. 18 + penjelasan (terbukti) | Koordinat dipakai sesaat di perangkat, hanya kota disimpan (K-011, §4.4) | Untuk pengguna Anak: minta izin lokasi hanya saat memotret, tampilkan tanda saat lokasi dibaca (disarankan, dugaan cukup) |
| Larangan pemrofilan Anak, termasuk secara baku | PP Ps. 7 ayat (2) huruf c, Ps. 19 + penjelasan (terbukti) | Tanpa iklan; ada metrik ketukan Kamera terkunci (§4.2, K-007) | Untuk pengguna Anak: agregasi metrik minat tanpa terikat akun (disarankan, dugaan) |
| Privasi tinggi secara baku; Anak tidak bisa melonggarkan privasi tanpa persetujuan orang tua | PP Ps. 10; Permenkomdigi Ps. 16 ayat (2) huruf c (terbukti) | Akun privat baku (§4.7) | Wajib bila ada pengguna Anak |
| Kesimpulan untuk membuat profil (preferensi, kecenderungan, perilaku) termasuk Data Pribadi Anak; pemrofilan mencakup "tujuan lain", tidak hanya penawaran produk | PP penjelasan Ps. 9 ayat (5) huruf b angka i; Ps. 19 ayat (1), (4) + penjelasan (terbukti) | Gaya kartu share "Label Pemburu" (usulan v5, julukan otomatis dari kategori dominan) | Julukan otomatis kemungkinan pemrofilan; usul varian dipilih pengguna atau tunda (dugaan, `docs/riset/2026-11-18-tinjauan-privasi-kartu-share.md`) |
| Larangan *dark pattern* yang mendorong Anak memberi data lebih atau melonggarkan privasi | PP Ps. 7 ayat (2) huruf a, Ps. 17 + penjelasan (terbukti) | – | Wajib; berlaku juga untuk desain onboarding dan layar Bagikan (tanpa hadiah untuk berbagi, tanpa pilihan terpilih lebih dulu) |
| Penilaian mandiri tingkat risiko (7 aspek) dan laporannya ke Menteri lewat sistem Komdigi; dokumentasi disahkan sebelum produk bisa diakses Anak | PP Ps. 5 ayat (6)–(7); Permenkomdigi Ps. 4–5, 9, 21; Kepmenkomdigi 142/2026 Lampiran I–II (terbukti) | Tidak ada | Wajib. Potret kemungkinan besar masuk lingkup "mungkin diakses Anak" walau 18+, karena lencana, misi, dan progres termasuk contoh gamifikasi di Kepmen 142 (dugaan) |
| Layanan jejaring sosial berisiko tinggi kecuali ditetapkan lain; akun di bawah 16 harus dinonaktifkan | Permenkomdigi Ps. 30; Kepmenkomdigi 140/2026 (daftar 8 platform, potret tidak termasuk) (terbukti) | Follow, buku teman, Cutout terunggah (§4.7, §4.9) | Fitur sosial potret kemungkinan memenuhi definisi Ps. 30 ayat (2) (dugaan) |
| Mekanisme pelaporan yang mudah dipakai Anak/orang tua dan tindak lanjutnya | PP Ps. 2 ayat (4) huruf c, Ps. 23 (terbukti); aturan toko untuk konten pengguna (belum dicek) | Tombol lapor + tinjauan manual (§4.7) | Wajib |
| Edukasi dan pemberdayaan ekosistem digital, dilaporkan ke Menteri min. 1x setahun | PP Ps. 12 ayat (1), (5) (terbukti) | Tidak ada | Wajib bagi PSE dalam lingkup |
| Penilaian dampak pelindungan Data Pribadi dan petugas pelindungan data | PP Ps. 7 ayat (1) huruf b dan j; UU PDP Ps. 34 ayat (1)–(2) huruf b (terbukti) | Tidak ada | Wajib bila memproses data Anak (data spesifik, UU PDP Ps. 4 ayat (2) huruf e) |
| Persetujuan pengguna dan kebijakan privasi | UU PDP (spesifikasi §7; pasal dasar pemrosesan belum dibaca) | Kebijakan privasi (§7) | Isi persetujuan belum dirumuskan |
| Pemrosesan terbatas dan spesifik (minimisasi) | UU PDP Ps. 27 + penjelasan (terbukti) | Foto asli tetap di perangkat (§4.9); koordinat tidak disimpan (K-011) | Q-003, Q-010 |
| Tenggat penyesuaian PP Tunas | PP Ps. 49: paling lama 2 tahun sejak diundangkan 27 Mar 2025 (terbukti) | – | Aplikasi baru sebaiknya patuh sejak rilis (disarankan). Tanggal "28 Mar 2026" di riset 16 Nov adalah awal penonaktifan akun di Kepmen 140, bukan tanggal berlaku PP |
| Sanksi | PP Ps. 38: teguran tertulis, denda, penghentian sementara, pemutusan akses (terbukti) | – | Pasal 9, 18, 19, 21, 22 termasuk yang bersanksi |
| Hapus akun dari dalam aplikasi | App Store, Google Play (spesifikasi §4.1; pedoman asli belum dicek) | §4.1 | – |
| Sign in with Apple bila ada login pihak ketiga | App Store (spesifikasi §4.1; pedoman asli belum dicek) | §4.1 | – |
| Lapor, blokir, dan penyaringan untuk konten pengguna | App Store, Google Play (spesifikasi §7; pedoman asli belum dicek) | §4.7 | "Penyaringan" belum dirinci di spesifikasi |
| Tidak mensyaratkan posting ke media sosial untuk mendapat yang sudah dibayar; tidak memaksa aksi toko untuk membuka fungsi | App Store 3.1.2(a), 3.2.2(x) (terbukti, dibaca 18 Nov) | Kartu share §4.8 | Disarankan juga untuk misi dan lencana: tidak ada hadiah untuk berbagi |
| Tidak membangun profil pengguna secara diam-diam | App Store 5.1.2(iii) (terbukti, dibaca 18 Nov) | – | Relevan untuk Label Pemburu dan metrik |
| Pesan atas nama pengguna hanya dengan konfirmasi isi dan penerima; tidak memakai Kontak untuk mengundang tanpa inisiatif pengguna | Google Play kebijakan Spam; App Store 5.1.2(v) (terbukti, dibaca 18 Nov) | Share lewat share sheet atau API tujuan (§4.8) | Berlaku untuk "Tambah Punyamu" dan tautan undangan nanti |

## 2. Data yang dikumpulkan (garis besar dari spesifikasi §5)

| Data | Disimpan di | Catatan |
|---|---|---|
| Username, metode dan waktu verifikasi usia, visibilitas | Supabase | K-018: tahun lahir tidak disimpan (PP Ps. 22 ayat (3) huruf f) |
| Nama kota temuan | Lokal + Supabase | Tidak pernah koordinat |
| Cutout, thumbnail | Supabase Storage | Foto asli tidak diunggah. Untuk pengguna Anak, informasi visual termasuk Data Pribadi Anak (penjelasan PP Ps. 9 ayat (5)) |
| Path foto asli | Hanya lokal (K-019) | – |
| Event (ketukan kamera terkunci, metrik dasar) | Supabase | Agregat tanpa id pengguna untuk semua pengguna (K-017; PP Ps. 19) |

## 3. Celah yang perlu dirumuskan

- "Penyaringan" konten pengguna (spesifikasi §7) belum punya bentuk di fitur MVP.
- Teks persetujuan (consent) UU PDP belum ditulis.
- Cara memastikan yang memberi persetujuan benar orang tua/wali tidak diatur di PP maupun Permenkomdigi.
- Metode verifikasi usia yang "dinilai andal" oleh Menteri (Permenkomdigi Ps. 7 ayat (7)) belum ditemukan penetapannya.
- Pedoman asli App Store dan Google Play (hapus akun, konten pengguna, rating usia) belum dirangkum.
