# Teknis: buku

> Area agen `animasi-buku`. Fakta di bagian 1 diambil dari spesifikasi v1 (dikunci); bagian lain boleh diperbarui.
> Terakhir diverifikasi: 17 Nov 2026 (target performa K-016).

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
- Ukur frame time dan waktu muat halaman di **Infinix Hot 11 Play** (perangkat acuan, K-016) dan satu iPhone (iOS 17+).

**Di luar lingkup:** kamera, cutout, backend, login, data asli.

**Selesai bila (K-016):**
- Di Infinix Hot 11 Play, build profile: ≥95% frame (UI dan raster) ≤33,3 ms selama gestur buka halaman, dan tidak ada frame >50 ms setelah shader dipanaskan.
- Backend renderer yang dipakai (Impeller OpenGLES/Vulkan atau Skia) tercatat dari log perangkat.
- Waktu muat halaman dan pemakaian memori tercatat per perangkat.
- Ada keputusan lanjut/ganti pendekatan, dicatat sebagai keputusan baru. Durasi page-curl hasil prototipe diisi ke `data/design-tokens.json` (`motion.pageCurl`).

**Catatan teknis dari riset** (`docs/riset/2026-11-17-perangkat-dan-stack.md`):
- Hot 11 Play: Helio G35, PowerVR GE8320, RAM 4 GB, layar 720×1640. Kemungkinan besar Impeller jalan di OpenGLES, bukan Vulkan.
- Precache `FragmentProgram` sebelum halaman pertama dibuka supaya buka halaman pertama tidak tersendat.
- Di OpenGLES koordinat y tekstur terbalik: UV dibalik di shader.
- `toImageSync` saat gestur dimulai bisa memakan anggaran 33,3 ms. Siapkan gambar halaman sebelum gestur.
- RAM 4 GB membatasi cache tekstur. Simpan hanya halaman sekitar yang sedang dibuka.

## 3. Belum ditetapkan

| Hal | Status |
|---|---|
| Pendekatan shader (fragment shader Flutter vs alternatif) | Riset pertama agen `animasi-buku` |
| Sumber suara buka halaman | Rekam sendiri, tercatat di `data/sounds.json` (K-024) |
| Format template halaman (slot, rotasi, posisi selotip) | Dirumuskan bersama `desainer-visual`; lihat `docs/desain/acuan/halaman-buku.md` |
