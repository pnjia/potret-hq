# STATUS

> Satu-satunya file status di repo ini. **Ditimpa** setiap akhir sesi lewat `/akhiri-sesi`, bukan ditambah. Batas ±60 baris.
> Riwayat ada di `git log -p STATUS.md`. Daftar tugas ada di Trello, bukan di sini.

Terakhir diperbarui: 20 Nov 2026

## Fokus sekarang

Fase 0 peta jalan MVP v5. Kerja Claude untuk kelima kartunya sudah selesai; sisanya pekerjaan lapangan pemilik.

- Board: https://trello.com/b/8RGssqWK/potret-kliping-kota
- Kartu peta jalan (urutan fase 0–5): https://trello.com/c/i9LI5ikx
- Prototipe uji v5 + panel fasilitator: https://claude.ai/artifact/MuiHwmoLuhwqYz4G2SHgJB

## Titik berhenti sesi terakhir

- Cabang sesi ini dibangun di atas `claude/affectionate-johnson-o67pob` (32 commit kerja 18–19 Nov yang belum di-merge ke `main`).
- Cek API share selesai: riset 20 Nov, K-039 (IG Stories lewat platform channel sendiri + Meta App ID; TikTok lewat intent/share sheet di MVP, Share Kit setelah rilis; EXIF dibuang saat berkas dibuat). Q-028, Q-029 baru.
- Cek nama: tidak ada merek "kliping" di data DGIP via WIPO; semua domain `klipingkota.*` kosong; PDKI diblokir dari cloud. K-040: bundle ID `id.klipingkota.app` (menjawab Q-015), sudah dipasang di `app/` tetapi belum di-build ulang (Flutter tidak terpasang di sesi ini).
- Kurasi landmark: 21 kandidat di `data/cities.json` (semua `verified: false`), contoh Bandung dihapus, K-041 aturan kurasi. Checklist survei di riset 20 Nov.
- Uji 5 pengguna: prototipe klik 10 layar v5 dengan pencatatan ketukan/waktu/SEQ ke penyimpanan artifact, protokol di `docs/desain/uji-pengguna-v5.md`.

## Langkah berikutnya

1. Pemilik (lapangan): ukur APK profile di Infinix Hot 11 Play (K-012); survei 21 landmark; jalankan 5 sesi uji; beli klipingkota.id + .com; cek PDKI dan handle Instagram/Threads di peramban; buat Meta App ID.
2. Claude: mulai Fase 1 dari kartu "Fondasi UI v5" (pasang Flutter dulu, lalu build ulang dengan bundle ID baru).
3. Setelah 5 sesi uji: baca koleksi `sessions` dari artifact uji dan tulis riset sintesis.

## Tertunda

- Status semua tugas lain ada di board Trello.
- Cabang ini belum di-merge ke `main`.

## Menunggu keputusan

- Q-028: video + stiker ke Instagram Stories (butuh uji perangkat).
- Q-029: akun developer Meta/TikTok atas nama pribadi atau organisasi.
