# STATUS

> Satu-satunya file status di repo ini. **Ditimpa** setiap akhir sesi lewat `/akhiri-sesi`, bukan ditambah. Batas ±60 baris.
> Riwayat ada di `git log -p STATUS.md`. Daftar tugas ada di Trello, bukan di sini.

Terakhir diperbarui: 23 Nov 2026

## Fokus sekarang

Fase 1 peta jalan MVP v5. Fondasi UI v5 selesai; Fase 0 tinggal pekerjaan lapangan pemilik.

- Board: https://trello.com/b/8RGssqWK/potret-kliping-kota
- Kartu peta jalan (urutan fase 0–5): https://trello.com/c/i9LI5ikx
- Prototipe uji v5 + panel fasilitator: https://claude.ai/artifact/MuiHwmoLuhwqYz4G2SHgJB

## Titik berhenti sesi terakhir

- Fondasi UI v5 selesai (K-042): font OFL dibundel, gaya teks dari token, 7 komponen bersama di `app/lib/core/widgets/`, Beranda sesuai V5Beranda (data contoh di `assets/demo/`), navigasi 5 tab; tab Buku membuka prototipe K-012. 57 tes lulus termasuk golden dan pedoman aksesibilitas.
- APK profile `id.klipingkota.app` terbangun dari sesi ini (Flutter dan Android SDK ada di `/opt`, tambahkan `/opt/flutter/bin` ke PATH).
- Sesi 20 Nov: K-039 (jalur share), K-040 (bundle ID), K-041 (kurasi landmark), prototipe uji v5 dengan panel fasilitator.
- Cabang `claude/ecstatic-heisenberg-tbkori` dibangun di atas `claude/affectionate-johnson-o67pob`; keduanya belum di-merge ke `main`.

## Langkah berikutnya

1. Pemilik (lapangan): ukur APK profile di Infinix Hot 11 Play (K-012); survei 21 landmark; jalankan 5 sesi uji; beli klipingkota.id + .com; cek PDKI dan handle Instagram/Threads di peramban; buat Meta App ID.
2. Claude: lanjut Fase 1. Usulan urutan: Hiasan/selotip/kertas latar (tanpa ketergantungan), lalu migrasi Supabase lokal di `supabase/` (membuat proyek Supabase sungguhan butuh persetujuan pemilik soal biaya), lalu Login dan onboarding.
3. Setelah 5 sesi uji: baca koleksi `sessions` dari artifact uji dan tulis riset sintesis.

## Tertunda

- Status semua tugas lain ada di board Trello.
- Cabang ini belum di-merge ke `main`.

## Menunggu keputusan

- Q-028: video + stiker ke Instagram Stories (butuh uji perangkat).
- Q-029: akun developer Meta/TikTok atas nama pribadi atau organisasi.
