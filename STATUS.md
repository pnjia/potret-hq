# STATUS

> Satu-satunya file status di repo ini. **Ditimpa** setiap akhir sesi lewat `/akhiri-sesi`, bukan ditambah. Batas ±60 baris.
> Riwayat ada di `git log -p STATUS.md`. Daftar tugas ada di Trello, bukan di sini.

Terakhir diperbarui: 17 Nov 2026

## Fokus sekarang

Semua pertanyaan Q-001 s/d Q-014 sudah diputuskan (K-016 s/d K-029). Kota MVP diganti ke Sukabumi (K-029). HQ siap; belum ada kode aplikasi.

- Kartu Trello: belum ada, board belum dibuat.

## Titik berhenti sesi terakhir

- Empat riset bertanggal ditulis di `docs/riset/2026-11-17-*`: regulasi usia dari teks asli, label ML Kit, perangkat dan stack, serta nama, suara, dan zona aman.
- K-017 menggantikan K-001: pengguna **18+**, verifikasi usia berlapis, dan pengaturan baku setara perlindungan anak untuk semua pengguna.
- Data baru dan yang berubah: `data/design-tokens.json` v1 final, `data/categories.json` (9 kategori), `data/sounds.json` (kosong), `findingTarget` di `data/cities.json`.
- `node scripts/cek-hq.mjs`: 0 error, 2 peringatan (entri contoh kamera dan landmark).

## Langkah berikutnya

1. **Prototipe animasi buka halaman (K-012).** Target K-016: konsisten 30 fps di Infinix Hot 11 Play. Acuan: `docs/teknis/buku.md` bagian "Prototipe K-012". Agen: `animasi-buku`. Folder `app/` dibuat dengan struktur K-027.

## Tertunda

- Susun board Trello (spesifikasi §10 langkah 2). Konvensi kartu di `docs/cara-kerja.md` §4.
- Cek nama "Kliping Kota" di PDKI, domain, dan media sosial sebelum mendaftar akun toko (K-023).
- Kurasi 20–30 landmark Kota Sukabumi (K-029). Agen: `kurator-katalog`. Mulai dari daftar resmi cagar budaya Kota Sukabumi.
- Uji pemetaan kategori dengan foto kota nyata (K-020).
- Rekam suara buka halaman dan shutter (K-024).

## Menunggu keputusan

Tidak ada Q- terbuka.
