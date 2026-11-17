# potret · peta repo

Aplikasi Flutter (Android + iOS) untuk memotret objek di kota-kota Indonesia, menghapus latarnya di perangkat, lalu mengoleksinya di satu buku digital beranimasi. Developer solo. Nama aplikasi **Kliping Kota** (K-023); nama kode di repo dan kode: **potret**.

Repo ini berisi HQ (knowledge base) dan nanti kode aplikasi di `app/` (K-013). File ini hanya **peta**: detail ada di dokumen yang dirujuk. Baca seperlunya.

## Status sekarang (dimuat otomatis)

@STATUS.md

## Ritual sesi

- **Mulai**: `/mulai-sesi`. **Akhiri**: `/akhiri-sesi` (menimpa `STATUS.md`).
- Keputusan baru: `/catat-keputusan`. Riset baru: `/catat-riset`. Cek tautan, JSON, dan agen: `/cek-hq`.
- Rincian ritual dan aturan: `docs/cara-kerja.md`.

## Peta: pertanyaan → sumber

| Pertanyaan | Sumber |
|---|---|
| Apa yang dibangun (fitur MVP, entitas, stack, risiko) | `docs/produk/spesifikasi-sistem-v1.md` (DIKUNCI) |
| Arti istilah dan nama di kode | `docs/produk/glosarium.md` |
| Kenapa begitu, dan alternatif yang ditolak | `docs/keputusan.md` (nomor K-, append-only) |
| Apa yang belum diputuskan | `docs/pertanyaan.md` (nomor Q-) |
| Data pasar, pesaing, regulasi, teknologi (bertanggal) | `docs/riset/` |
| Arah visual dan contoh acuan | `docs/desain/arah-visual.md`, `docs/desain/acuan/` |
| Arsitektur dan catatan per area | `docs/teknis/` (arsitektur, buku, kamera, backend, rilis) |
| Kewajiban privasi, PP Tunas, toko aplikasi | `docs/kepatuhan/privasi-dan-regulasi.md` |
| Data mesin: token desain, kamera, kota dan landmark | `data/*.json` + `data/schema/`, penjelasan di `data/README.md` |
| Template (keputusan, riset, brief sub-agen, kartu Trello) | `templates/` |
| Status tugas | Trello (konvensi: `docs/cara-kerja.md` §4) |

Urutan menang bila bertentangan: keputusan terbaru → spesifikasi v1 → dokumen lain. Catat konfliknya di `docs/pertanyaan.md`, jangan diselesaikan diam-diam.

## Lapisan pengetahuan

- **Stabil**: `docs/produk/`, `docs/desain/`, `docs/teknis/`, `docs/kepatuhan/`, `data/`. Ada baris "Terakhir diverifikasi".
- **Append-only**: `docs/keputusan.md`, `docs/riset/`. Tidak diedit, hanya ditambah.
- **Cepat berubah**: `STATUS.md` dan Trello saja.

## Aturan inti

1. Dokumen berbahasa Indonesia. Identifier kode dan key JSON berbahasa Inggris sesuai glosarium (K-014).
2. Jangan mengubah isi keputusan atau spesifikasi v1. Keputusan baru menggantikan lewat `Menggantikan: K-XXX`.
3. Celah atau konflik → baris Q- di `docs/pertanyaan.md`, lalu laporkan. Jangan memutuskan sendiri.
4. Status hanya di `STATUS.md` dan Trello. Dokumen lain tidak menulis status.
5. Riset selalu bertanggal dan bersumber; yang mudah berubah diberi tanda "cek ulang".
6. Data mesin di `data/` harus lolos skemanya (`node scripts/cek-hq.mjs`).
7. Lokasi hanya disimpan di tingkat kota; koordinat dipakai sesaat di perangkat (K-011).
8. Jangan pakai FFmpegKit (K-003). Minimum iOS 17 (K-003).
9. Tidak ada gerbang approval (K-015). Kualitas lewat checklist "selesai" di setiap agen.
10. Dua percobaan gagal untuk masalah yang sama → berhenti dan laporkan.
11. Tanya dulu sebelum tindakan yang tidak bisa dibatalkan (rilis, hapus data produksi, keluar uang).

## Sub-agen (`.claude/agents/`)

| Pekerjaan | Agen |
|---|---|
| Struktur aplikasi, drift/SQLite, sinkronisasi, plugin, onboarding | `arsitek-flutter` |
| Page-curl, suara halaman, tata letak halaman, lazy load, render video share | `animasi-buku` |
| Kamera, skin + LUT, hapus latar, kuas masker, kategori otomatis, EXIF | `kamera-cutout` |
| Supabase: skema, RLS, Storage, Auth, hapus akun, follow/lapor/blokir | `backend-supabase` |
| Token desain, template halaman dan sampul, visual skin, kartu share, acuan | `desainer-visual` |
| Kota, landmark, kategori, misi, lencana (`data/`) | `kurator-katalog` |
| PP Tunas, UU PDP, aturan App Store/Play (pembantu, tidak memblokir) | `penasihat-privasi` |
| Riset web bertanggal (pesaing, harga, status paket, regulasi) | `peneliti` |

Aturan bersama agen dan cara mendelegasikan: `docs/cara-kerja.md` §3. Brief: `templates/brief-subagen.md`.

## Kode aplikasi

`app/` dan `supabase/` belum ada. Keduanya dibuat saat prototipe K-012 dimulai. Konvensi Flutter nanti ditulis di `app/CLAUDE.md` (dimuat hanya saat bekerja di `app/`).
