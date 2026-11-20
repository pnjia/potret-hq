# Uji 5 pengguna mockup v5

> Protokol uji tugas untuk mockup v5 "Karcis & Kliping" (K-035). Pemeriksaan mutu, bukan gerbang (K-015).
> Diturunkan dari rencana uji di `docs/riset/2026-11-18-kritik-v3-dan-rencana-uji.md`; tugas diganti ke alur v5 (memotret → menempel → membuka buku → membagikan) dan perbandingan v3/v4 dihapus karena arah sudah diputuskan.
> Terakhir diverifikasi: 20 Nov 2026.

## Alat

- **Prototipe klik + panel fasilitator**: https://claude.ai/artifact/MuiHwmoLuhwqYz4G2SHgJB (privat milik pemilik; dibuka di HP fasilitator).
  - Isinya 10 layar dari `docs/desain/usulan-v5/` (Pembuka, Beranda, Kamera, Temuan, Sukses, Buku hlm. 11, Pembatas hlm. 4, Daftar isi hlm. 3, Bagikan, Misi) dengan area ketuk.
  - Mencatat setiap ketukan (layar, posisi, kena area atau meleset), urutan layar, waktu, dan ketukan pertama.
  - Hasil tiap sesi tersimpan di penyimpanan artifact (koleksi `sessions`) dan dibaca Claude untuk sintesis. Bila penyimpanan tidak tersedia, sesi tetap tersimpan di perangkat dan panel menandainya.
- Panel terbuka saat halaman dimuat. Selama tugas berjalan panel tertutup; **tahan bilah tipis di atas layar 1 detik** untuk membukanya. Membuka panel menghentikan jam tugas.
- Opsi "Tampilkan area ketuk" hanya untuk latihan fasilitator. Matikan sebelum peserta memegang HP.

**Batas prototipe** (sebut ke peserta bila ditanya, jangan sebelumnya):

- Layar lain menampilkan "Belum ada di prototipe ini" dan tetap dicatat sebagai ketukan.
- Di buku hanya ada hlm. 3, 4, dan 11. Geser kiri/kanan atau panah berpindah di antara ketiganya.
- Tujuan share hanya disimulasikan.

## Peserta

- 5 orang, usia 18–26, tinggal di Sukabumi atau sekitarnya, membagikan foto ke Stories dalam 7 hari terakhir, tidak bekerja di desain atau aplikasi.
- Campuran 3 pengguna Android dan 2 iPhone (perangkat sehari-hari mereka; prototipe tetap dijalankan di HP fasilitator).
- Kenalan pemilik boleh untuk putaran ini.
- Usia di bawah 18 tidak diuji (K-017).

## Urutan sesi (±25 menit)

1. **Pembuka** (2 menit). "Yang diuji aplikasinya, bukan kamu. Tidak ada jawaban salah. Ucapkan apa yang kamu pikirkan." Minta persetujuan; panel mencatat kode peserta saja, tanpa nama, wajah, suara, atau lokasi.
2. **Uji 5 detik** Pembuka, lalu Beranda. Layar tampil 5 detik lalu disembunyikan; tanyakan pertanyaan di panel.
3. **Empat tugas.** Bacakan skenario di panel apa adanya. Jangan menunjuk layar. Bila peserta buntu 60 detik, beri satu petunjuk dan tandai "Berhasil dengan bantuan".

   | Tugas | Skenario | Mulai | Berhasil bila |
   |---|---|---|---|
   | 1 Memotret dan menempel | "Kamu sedang berdiri di depan gereja tua di Sukabumi dan ingin menyimpannya jadi stiker di bukumu. Tunjukkan apa yang kamu lakukan." | Beranda | Layar Tertempel muncul (otomatis) |
   | 2 Membaca progres kota | "Berapa banyak lagi temuan yang perlu kamu kumpulkan di Sukabumi?" | Beranda | Jawaban lisan 87 (13 dari 100); jawaban soal landmark (20 lagi) dicatat terpisah |
   | 3 Membuka buku | "Kamu penasaran landmark Sukabumi mana saja yang belum kamu temukan. Cari di bukumu." | Beranda | Halaman pembatas "Landmark 5/25" muncul (otomatis) |
   | 4 Membagikan | "Kamu baru saja menempel gereja tadi. Pamerkan di Instagram Stories." | Tertempel | IG Stories diketuk (otomatis; tujuan lain = gagal) |

   Setelah tiap tugas: SEQ "Seberapa mudah tugas tadi, 1 sangat sulit sampai 7 sangat mudah?"
4. **Wawancara** (5–10 menit): tiga kata untuk tampilannya; bagian paling membingungkan; mau mencoba bila ada di toko dan kenapa; apa yang paling ingin dibagikan ke teman; kesan visual 1–5.

## Ukuran

- Tingkat berhasil per tugas (target ≥ 4 dari 5 tanpa bantuan).
- Uji 5 detik benar (target ≥ 4 dari 5).
- Waktu sampai ketukan pertama dan waktu selesai (median).
- Ketukan meleset per tugas dan layar tempat terjadi.
- SEQ rata-rata per tugas.

## Setelah 5 sesi

- Claude membaca koleksi `sessions` dari artifact, mengelompokkan temuan per tema, memberi keparahan dan frekuensi, lalu menulis riset bertanggal lewat `/catat-riset`.
- Perubahan desain dicatat sebagai K- baru atau Q-, bukan diubah diam-diam (K-015, `docs/cara-kerja.md` §1).
