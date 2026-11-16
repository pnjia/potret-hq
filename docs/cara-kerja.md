# Cara kerja

> Rincian dari peta di `CLAUDE.md`: lapisan pengetahuan, ritual sesi, aturan bersama sub-agen, Trello, dan tempat menaruh hal baru.
> Terakhir diverifikasi: 16 Nov 2026.

## 1. Lapisan pengetahuan

| Lapisan | Isi | Cara mengubah |
|---|---|---|
| **Stabil** | `docs/produk/`, `docs/desain/`, `docs/teknis/`, `docs/kepatuhan/`, `data/` | Edit langsung bila fakta berubah, lalu perbarui baris "Terakhir diverifikasi". Spesifikasi v1 dikunci: perubahan perilaku lewat keputusan baru |
| **Append-only** | `docs/keputusan.md`, `docs/riset/` | Hanya ditambah. Keputusan lama tidak dihapus atau diedit; yang baru menulis `Menggantikan: K-XXX`. Riset lama tidak diedit; yang usang diganti riset baru bertanggal |
| **Cepat berubah** | `STATUS.md` (ditimpa tiap sesi), Trello (tugas) | `/akhiri-sesi`; kartu Trello dipindah manual |
| **Menunggu** | `docs/pertanyaan.md` | Tambah Q- baru; yang terjawab dipindah ke tabel "Terjawab" beserta nomor K-nya |

Prioritas bila dua sumber bertentangan: `docs/keputusan.md` (entri terbaru menang) → spesifikasi v1 → dokumen lain. Konflik **dicatat** di `docs/pertanyaan.md`, tidak diselesaikan diam-diam.

## 2. Ritual sesi

Claude tidak punya ingatan antar sesi. `STATUS.md` dimuat otomatis lewat `@STATUS.md` di `CLAUDE.md`.

- **Awal**: `/mulai-sesi`. Membaca STATUS, keputusan terbaru, pertanyaan terbuka, dan `git log`, lalu mengusulkan satu langkah pertama.
- **Selama sesi**: keputusan baru langsung `/catat-keputusan`; riset baru `/catat-riset`; celah baru jadi Q- di `docs/pertanyaan.md`.
- **Akhir**: `/akhiri-sesi`. Menimpa `STATUS.md`, menjalankan `node scripts/cek-hq.mjs`, dan mengusulkan pesan commit.

## 3. Aturan bersama sub-agen

Setiap agen di `.claude/agents/` membaca bagian ini lebih dulu.

1. **Istilah** mengikuti `docs/produk/glosarium.md`, termasuk nama field kode (K-014). Istilah baru diusulkan di laporan balik, tidak dipakai diam-diam.
2. **Keputusan** di `docs/keputusan.md` dan spesifikasi v1 tidak diubah. Bila menemukan celah atau konflik: tambah baris Q- di `docs/pertanyaan.md`, sebut di laporan, lalu lanjutkan bagian yang tidak terdampak.
3. **Bukti**: setiap temuan atau klaim disertai `file:baris`, perintah yang dijalankan, atau URL, dan diberi label **terbukti** atau **dugaan**.
4. **Riset** dari web selalu bertanggal dan bersumber. Fakta yang mudah berubah (regulasi, harga, status paket) ditandai "cek ulang sebelum dipakai".
5. **Status** tidak ditulis di dokumen pengetahuan. Status hanya ada di `STATUS.md` dan Trello.
6. **Privasi**: koordinat tidak pernah disimpan, dicontohkan, atau dikirim selain dipakai sesaat di perangkat (K-011). Jangan membaca `.env*` atau kunci.
7. **Teknologi terlarang**: FFmpegKit (pensiun, K-003).
8. **Rem**: bila dua percobaan untuk masalah yang sama gagal, berhenti dan laporkan apa yang menahan beserta pilihan berikutnya.
9. **Tidak ada pemeriksa wajib** (K-015). Kualitas dijaga oleh checklist "selesai" di file agen sendiri, yang dicentang jujur di laporan balik.
10. **Bertanya dulu** sebelum tindakan yang tidak bisa dibatalkan: rilis ke toko, hapus data produksi, keluar uang.

### Mendelegasikan

Sub-agen tidak melihat percakapan. Brief ditulis dengan `templates/brief-subagen.md`: tujuan, konteks, input, output, batas, kriteria selesai, laporan balik.

## 4. Trello

Trello hanya melacak **status tugas**. Isi kerja (spesifikasi, keputusan, catatan teknis) tetap di repo.

- Nama kartu: `[AREA] <judul dengan istilah glosarium>`. Area: `BUKU`, `KAMERA`, `TEMUAN`, `KOTA`, `AKUN`, `SOSIAL`, `SHARE`, `RETENSI`, `HQ`.
- Deskripsi kartu: tautan path repo yang relevan (misalnya `docs/teknis/buku.md`) dan "Selesai bila" (pakai `templates/kartu-trello.md`).
- Repo merujuk kartu hanya di `STATUS.md` bagian "Fokus sekarang" (URL kartu). Dokumen lain tidak menyebut status kartu.
- Commit yang menyelesaikan kartu boleh menyebut ID pendek kartu di pesan commit, misalnya `(trello: aBc123)`.
- Bila Trello dan repo berbeda soal isi, repo yang benar. Bila soal status, Trello yang benar.

## 5. Tempat menaruh hal baru

| Hal baru | Tempat |
|---|---|
| Keputusan | `docs/keputusan.md` lewat `/catat-keputusan` |
| Pertanyaan atau celah | `docs/pertanyaan.md` |
| Riset dari web | `docs/riset/YYYY-MM-DD-<topik>.md` lewat `/catat-riset` |
| Catatan teknis per area | `docs/teknis/<area>.md` |
| Contoh acuan visual | `docs/desain/acuan/` |
| Data untuk mesin | `data/<nama>.json` + `data/schema/<nama>.schema.json` |
| Aturan regulasi dan toko aplikasi | `docs/kepatuhan/` |
| Kode aplikasi | `app/` (belum ada; konvensinya nanti di `app/CLAUDE.md`) |
| Backend Supabase (migrasi, kebijakan RLS) | `supabase/` (belum ada) |
