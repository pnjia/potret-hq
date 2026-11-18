# Kritik heuristik mockup v3 dan rencana uji pengguna

> Diriset: 2026-11-18 · Oleh: sesi utama (skill design-critique, user-research, ux-research)
> Cek ulang sebelum dipakai untuk keputusan baru: temuan kritik adalah evaluasi ahli (**dugaan**), bukan hasil uji pengguna. Validasi dengan rencana uji di bawah.
> Dipakai oleh: Q-017, mockup v4 (https://claude.ai/artifact/Acc38ZrS9c64zx1VbA3MzE, halaman "v4")

## Pertanyaan

1. Masalah apa di mockup v3 yang membuatnya tidak menarik dan tidak mudah dipahami?
2. Bagaimana cara murah memvalidasi arah visual baru dengan pengguna Gen Z 18+ di Indonesia sebelum desain dikunci?

## Temuan: kritik heuristik v3

Konteks: pengguna Gen Z 18+, penggunaan singkat dan berulang (postur *transient*: buka, potret, tempel, tutup). Tugas utama: memotret objek lalu melihatnya masuk ke buku.

Skala keparahan Nielsen: 4 = fatal, 3 = mayor, 2 = minor, 1 = kosmetik.

| # | Temuan | Prinsip | Keparahan | Rekomendasi |
|---|---|---|---|---|
| 1 | Tidak ada layar Beranda. Setelah login, pengguna tidak tahu harus mulai dari mana, dan progres kota tersebar di layar buku. | Visibility of system status (H1), Recognition over recall (H6), Goal-gradient | 3 | Tambah Beranda: progres kota, tombol "Potret sekarang" besar, misi, temuan terbaru |
| 2 | Navigasi bawah v3 hanya ikon tanpa label (layar Misi, Teman). | Labeling: ikon saja hanya untuk konsep universal; Jakob's Law | 3 | Ikon + label selalu: Beranda, Buku, Potret, Misi, Profil |
| 3 | Palet bersaturasi rendah (cokelat, sage, peach). Tidak ada elemen yang menonjol, jadi layar terasa datar dan "tidak eye-catching". | Von Restorff effect, Visual hierarchy, Aesthetic-usability effect | 3 | Satu warna utama jenuh untuk aksi, warna kategori cerah untuk konten, latar putih bersih |
| 4 | Sistem tidak konsisten: 5 keluarga huruf (Bricolage, Jakarta, Fraunces, Caveat, plus sisa v2), tiga sistem aksen (Kopi, Jeruk, pink kota), dan gaya tombol berbeda antara layar buku dan non-buku. | Consistency and standards (H4), Law of Similarity | 3 | Maksimal 3 huruf dengan peran tetap; satu warna aksi; satu bentuk tombol |
| 5 | Cutout (konten inti) berupa ilustrasi kasar, sehingga produk terlihat murah. | Aesthetic-usability effect | 3 (untuk mockup) | Pakai foto asli pemilik untuk mockup berikutnya; sementara stiker berbingkai putih tebal dan berbayangan |
| 6 | Kategori hanya berupa teks; tidak ada kode warna atau ikon yang bisa dikenali cepat. | Recognition over recall (H6), Law of Similarity | 2 | Tiap kategori punya warna + ikon tetap, dipakai di kamera, temuan, buku, misi |
| 7 | Istilah internal muncul di UI: "Rapikan tepi", "Pembatas", "Siapkan hapus latar". | Match between system and real world (H2) | 2 | Uji label. Usulan: "Rapikan potongan", "Halaman kota", "Siapkan fitur potong otomatis" |
| 8 | Teks sekunder banyak di 12–13 px, dan thumbnail halaman tanpa nomor. | Readability, H6 | 2 | Minimum 13 px untuk meta, 15 px untuk isi; nomor di thumbnail |
| 9 | Tiga varian share ada, tetapi tidak ada layar untuk memilih dan melihat pratinjau sebelum membagikan. | User control and freedom (H3), Visibility (H1) | 2 | Layar "Bagikan": pratinjau, pilihan gaya, tombol Simpan dan Bagikan |
| 10 | Akhir alur "Tempel ke buku" tidak dirancang (tidak ada momen berhasil). | Peak-end rule | 2 | Layar atau lembar sukses: stiker jatuh ke halaman, progres kota naik |

Uji 5 detik (evaluasi ahli, dugaan):
- Pembuka v3: tujuan aplikasi cukup jelas, tetapi tidak ada yang langsung menarik mata.
- Misi v3: angka "2/5" jelas, tetapi tidak terlihat apa yang harus dilakukan berikutnya (tidak ada tombol "Potret").

## Rencana uji pengguna (sebelum arah visual dikunci)

- **Tujuan:** menentukan apakah arah v4 (a) dipahami tanpa penjelasan dan (b) dinilai menarik oleh Gen Z 18+, dibanding v3.
- **Pertanyaan riset:**
  1. Dalam 5 detik, apakah peserta bisa menyebut apa fungsi aplikasi dan tombol mana yang ditekan pertama?
  2. Apakah peserta menemukan "Potret sesuatu" dan "lihat progres Sukabumi" dari Beranda tanpa bantuan?
  3. Arah mana (v3 atau v4) yang lebih menarik, dan apa alasan konkretnya?
  4. Label mana yang membingungkan?
- **Metode:**
  - Uji 5 detik (layar Pembuka dan Beranda).
  - Uji tugas tanpa moderator di prototipe kanvas: 3 tugas, ukur berhasil atau gagal dan waktu.
  - Uji preferensi berpasangan v3 vs v4, urutan diacak, wajib dengan alasan.
  - Wawancara singkat 10 menit.
- **Peserta:**
  - 5 orang untuk putaran pertama, karena 5 pengguna menangkap sekitar 85% masalah.
  - Usia 18–26, berdomisili di Sukabumi atau sekitarnya, aktif memakai Instagram Stories setidaknya mingguan.
  - Campuran 3 pengguna Android kelas menengah dan 2 iPhone.
  - Rekrut dari kenalan pemilik; pada putaran awal ini sah.
- **Saringan:**
  - "Kapan terakhir kamu membagikan foto ke Stories?" (lolos bila ≤ 7 hari)
  - "Kamu pernah mengoleksi sesuatu (stiker, foto, tiket)?" (bukan syarat; untuk analisis)
  - Tidak bekerja di bidang desain atau aplikasi.
- **Tugas (skenario, bukan instruksi):**
  1. "Kamu sedang di depan gedung tua di Sukabumi dan ingin menyimpannya. Tunjukkan apa yang kamu lakukan."
  2. "Berapa banyak lagi yang perlu kamu kumpulkan di Sukabumi?"
  3. "Kamu ingin memamerkan temuan tadi di Instagram Stories."
- **Ukuran:**
  - Tingkat berhasil per tugas.
  - Waktu sampai ketukan pertama.
  - Jawaban uji 5 detik yang benar (target ≥ 4 dari 5 peserta).
  - Preferensi v3/v4 beserta alasan.
  - SEQ (Single Ease Question, 1–7) setelah tiap tugas.
- **Analisis:** temuan dikelompokkan per tema (pemetaan afinitas), diberi skala keparahan dan frekuensi, lalu dibagi per tier (Tier 1 = keparahan tinggi dan frekuensi tinggi).
- **Waktu:** sekitar 2 hari (1 hari sesi, 1 hari sintesis).
- **Etika dan privasi:** minta persetujuan rekam layar. Tidak merekam wajah atau lokasi. Catatan disimpan tanpa nama lengkap.

## Kesimpulan

**Dugaan dari evaluasi ahli.** Masalah terbesar v3 bukan "selera warna", tetapi tiga hal:

1. Tidak ada titik mulai yang jelas (Beranda).
2. Navigasi tanpa label.
3. Sistem visual yang tidak konsisten dan tidak punya satu elemen yang menonjol.

Arah v4 memperbaiki struktur ini dulu (Beranda, navigasi berlabel, satu warna aksi, kode warna kategori), lalu menambah daya tarik lewat warna jenuh dan stiker cutout. Semua ini harus divalidasi dengan uji di atas sebelum Q-017 dijawab.

## Belum terjawab

- Preferensi nyata pengguna Gen Z Sukabumi (butuh sesi uji).
- Apakah huruf display lebar (Unbounded) tetap terbaca untuk nama landmark yang panjang (uji di HP).
