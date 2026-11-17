# Teknis: kamera dan temuan

> Area agen `kamera-cutout`. Fakta di bagian 1 diambil dari spesifikasi v1 dan riset 16 Nov 2026.
> Terakhir diverifikasi: 17 Nov 2026. Cek ulang status paket sebelum dipasang (riset bisa usang).

## 1. Yang sudah terkunci

- Kamera: paket `camera` + overlay UI + shader LUT (spesifikasi §6).
- Skin = overlay bodi kamera + filter warna (LUT) + suara shutter. 3–4 gratis, 2–3 terkunci "segera hadir"; ketukan pada skin terkunci dicatat sebagai `Event` (spesifikasi §4.2, K-007). Data skin di `data/cameras.json`.
- Hapus latar di perangkat dengan `native_cutout` (K-010):
  - iOS memakai Vision, butuh iOS 17+ dan **perangkat asli** (tidak jalan di simulator).
  - Android memakai ML Kit Subject Segmentation; modelnya diunduh Play services, dan penggunaan pertama gagal bila offline. Karena itu model diunduh saat onboarding.
  - Sumber: `docs/riset/2026-11-16-riset-awal.md` bagian Teknologi.
- Kuas manual untuk merapikan masker.
- Kategori otomatis lewat ML Kit Image Labeling (spesifikasi §4.3).
- Kota dideteksi dari lokasi; **hanya nama kota yang disimpan**. Koordinat dipakai sesaat di perangkat untuk mencocokkan kota dan radius landmark (K-011).
- Landmark dicocokkan lewat radius lokasi + konfirmasi "Ini [nama landmark]?", bukan pengenalan gambar (K-002).
- EXIF dan GPS dihapus dari setiap gambar yang dibagikan (K-011, spesifikasi §4.8).
- Cutout (WebP terkompresi) dan thumbnail diunggah; foto asli tetap di perangkat (spesifikasi §4.9).

## 2. Sudah diputuskan setelah spesifikasi

- **Kategori** (K-020): 9 kategori dan pemetaan 174 label ML Kit di `data/categories.json`. Ambang confidence 0,5. Pilih label terpetakan tertinggi yang bukan "lemah"; seri dipecah `tieBreakOrder`; tanpa label terpetakan → `other`. Pemetaan dikunci pada teks label.
- **Path foto asli** (K-019): `localOriginalPath` hanya di drift, tidak pernah dikirim ke Supabase.
- **Lokasi** (K-017): minta izin lokasi hanya saat memotret, tampilkan tanda saat lokasi dibaca, koordinat dibuang setelah kota/landmark dicocokkan.
- **Suara shutter** (K-024): rekam sendiri; setiap file tercatat di `data/sounds.json`.
- **Status `native_cutout`** (riset 17 Nov): 0.4.0 (30 Sep 2026), satu perawat. ML Kit Subject Segmentation masih beta dan butuh API 24+. Risiko ini tetap di bawah K-010.

## 3. Belum ditetapkan

| Hal | Status |
|---|---|
| Format LUT (PNG 3D LUT vs `.cube`) | Diputuskan agen `kamera-cutout` saat implementasi |
| Ukuran dan kualitas WebP cutout dan thumbnail | Belum ada angka; terkait risiko biaya storage (#4) |
