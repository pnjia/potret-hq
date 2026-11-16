# potret-hq

Markas kerja proyek **potret**: aplikasi Flutter (Android + iOS) untuk memotret objek di kota-kota Indonesia, menghapus latarnya, lalu mengoleksinya di satu buku digital beranimasi.

Repo ini berisi knowledge base (HQ) yang dibaca Claude dan sub-agennya di setiap sesi. Nanti kode aplikasi juga masuk ke sini, di `app/` (K-013). File ini untukmu sebagai manusia. Peta untuk Claude ada di `CLAUDE.md`.

## Sehari-hari

1. **Buka sesi** Claude Code di folder repo, lalu ketik `/mulai-sesi`. Claude membaca `STATUS.md`, keputusan terbaru, dan pertanyaan terbuka, lalu mengusulkan satu langkah pertama. Mau fokus lain? Tulis saja: `/mulai-sesi kerjakan kamera`.
2. **Kerja seperti biasa.** Cukup ceritakan apa yang mau dikerjakan. Untuk pekerjaan khusus, minta sub-agennya langsung, misalnya "pakai `animasi-buku` untuk prototipe page-curl". Daftar agen ada di `CLAUDE.md`.
3. **Ada yang diputuskan?** `/catat-keputusan <judul>`. Keputusan ditambahkan sebagai K- baru di `docs/keputusan.md`, lengkap dengan alasan dan alternatif yang ditolak. Keputusan lama tidak pernah dihapus.
4. **Butuh riset?** `/catat-riset <topik>`. Hasilnya file bertanggal dan bersumber di `docs/riset/`.
5. **Tutup sesi** dengan `/akhiri-sesi`. Claude menimpa `STATUS.md` (titik berhenti dan langkah berikutnya), menjalankan pemeriksaan, lalu mengusulkan pesan commit.

Tidak ada gerbang persetujuan (K-015). Setiap agen memeriksa sendiri checklist "selesai"-nya. `/cek-hq` boleh dijalankan kapan saja; sifatnya sukarela.

## Di mana menaruh apa

| Kalau kamu… | Taruh di |
|---|---|
| Ingin tahu apa yang sedang dikerjakan | `STATUS.md` |
| Mengatur tugas dan prioritas | Trello (aturan nama kartu di `docs/cara-kerja.md` §4) |
| Mengubah keputusan | `/catat-keputusan`, dengan baris `Menggantikan: K-XXX` |
| Menemukan hal yang belum jelas | `docs/pertanyaan.md` (Q- baru) |
| Menambah istilah | `docs/produk/glosarium.md` |
| Menambah kota, landmark, atau kamera | `data/*.json` (lihat `data/README.md`) |
| Menambah contoh visual acuan | `docs/desain/acuan/` |

## Yang perlu kamu ingat

- `STATUS.md` **ditimpa**, bukan ditambah. Riwayatnya bisa dilihat dengan `git log -p STATUS.md`.
- Status tugas hanya ada di Trello dan `STATUS.md`. Dokumen lain hanya berisi pengetahuan.
- Spesifikasi v1 dikunci. Perubahan perilaku dicatat sebagai keputusan baru.
- Pertanyaan yang menunggu jawabanmu ada di `docs/pertanyaan.md`. Yang paling mendesak tercantum di `STATUS.md`.

## Pemeriksaan

```
node scripts/cek-hq.mjs
```

Yang diperiksa: tautan dan path di dokumen, skema JSON di `data/`, frontmatter agen, nomor K- dan Q-, sinonim istilah, serta panjang `CLAUDE.md` dan `STATUS.md`. Butuh Node 20 ke atas, tanpa paket tambahan.
