# Teknis: buku

> Area agen `animasi-buku`. Fakta di bagian 1 diambil dari spesifikasi v1 (dikunci); bagian lain boleh diperbarui.
> Terakhir diverifikasi: 16 Nov 2026.

## 1. Yang sudah terkunci

- Satu buku untuk semua kota, dibagi per bab kota, dengan daftar isi; halaman dimuat bertahap (K-004).
- Urutan isi: sampul → halaman identitas → daftar isi kota → bab per kota (halaman pembatas, halaman landmark, halaman temuan bebas) → halaman statistik (spesifikasi §4.5).
- Tata letak otomatis berbasis template dengan rotasi acak kecil, selotip, dan keterangan. Pengguna bisa mengatur ulang. Halaman yang pernah diatur manual (`Placement.isManuallyArranged`) **tidak boleh** diacak ulang oleh sistem (K-005).
- Landmark yang belum ditemukan tampil sebagai siluet "???".
- Animasi page-curl dengan shader kustom + suara buka halaman (spesifikasi §6).
- Video share: render frame + encoder native (AVAssetWriter / MediaCodec). **Tanpa FFmpegKit** (K-003).
- Risiko #1: page-curl kurang mulus di Android kelas menengah.

## 2. Prototipe K-012

Tujuan: membuktikan atau membantah risiko #1 sebelum fitur lain dibangun.

**Lingkup (usulan, boleh dipersempit):**
- Satu buku dummy dengan ±20 halaman dan gambar cutout palsu.
- Page-curl maju dan mundur dengan gestur, plus suara buka halaman.
- Lazy load halaman dengan thumbnail.
- Ukur fps dan waktu muat halaman di satu perangkat Android kelas menengah dan satu iPhone (iOS 17+).

**Di luar lingkup:** kamera, cutout, backend, login, data asli.

**Selesai bila:**
- Angka fps dan waktu muat tercatat per perangkat, beserta nama perangkatnya.
- Ada keputusan lanjut/ganti pendekatan, dicatat sebagai keputusan baru.
- Target angka mengikuti jawaban **Q-011**. Sampai dijawab, asumsi kerja 60 fps dan disebut sebagai asumsi.

## 3. Belum ditetapkan

| Hal | Status |
|---|---|
| Perangkat acuan dan target performa | Q-011 |
| Pendekatan shader (fragment shader Flutter vs alternatif) | Riset pertama agen `animasi-buku` |
| Sumber suara buka halaman | Q-008 |
| Format template halaman (slot, rotasi, posisi selotip) | Dirumuskan bersama `desainer-visual`; lihat `docs/desain/acuan/halaman-buku.md` |
