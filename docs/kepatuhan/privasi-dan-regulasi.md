# Privasi dan regulasi

> Area agen `penasihat-privasi` (pembantu, tidak memblokir).
> Terakhir diverifikasi: 16 Nov 2026, **hanya dari sumber sekunder** (artikel berita di `docs/riset/2026-11-16-riset-awal.md`). Teks asli PP 17/2025, UU PDP, dan pedoman toko aplikasi belum dibaca. Cek ulang sebelum rilis (spesifikasi §7).

## 1. Kewajiban dan penerapannya

| Kewajiban | Asal | Penerapan di spesifikasi | Catatan |
|---|---|---|---|
| Informasi batas usia | PP Tunas (riset) | Gerbang usia 16+ (§4.1) | Q-001 |
| Verifikasi usia | PP Tunas (riset) | Tahun lahir saat pendaftaran (§4.1) | Q-002: deklarasi mandiri belum tentu cukup |
| Mekanisme pelaporan | PP Tunas (riset), aturan toko untuk konten pengguna | Tombol lapor + tinjauan manual (§4.7) | – |
| Larangan melacak lokasi dan membuat profil anak untuk iklan/bisnis | PP Tunas (riset) | Lokasi hanya tingkat kota (K-011); tanpa iklan | Q-001: berlaku untuk 16–17 bila mereka tergolong anak |
| Persetujuan pengguna dan kebijakan privasi | UU PDP (spesifikasi §7) | Kebijakan privasi (§7) | Isi persetujuan belum dirumuskan |
| Minimisasi data | UU PDP | Foto asli tetap di perangkat (§4.9); koordinat tidak disimpan (K-011) | Q-003, Q-010 |
| Hapus akun dari dalam aplikasi | App Store, Google Play (spesifikasi §4.1) | §4.1 | – |
| Sign in with Apple bila ada login pihak ketiga | App Store (spesifikasi §4.1) | §4.1 | – |
| Lapor, blokir, dan penyaringan untuk konten pengguna | App Store, Google Play (spesifikasi §7) | §4.7 | "Penyaringan" belum dirinci di spesifikasi |

## 2. Data yang dikumpulkan (garis besar dari spesifikasi §5)

| Data | Disimpan di | Catatan |
|---|---|---|
| Username, tahun lahir, visibilitas | Supabase | Q-010 |
| Nama kota temuan | Lokal + Supabase | Tidak pernah koordinat |
| Cutout, thumbnail | Supabase Storage | Foto asli tidak diunggah |
| Path foto asli | Lokal (Q-003) | – |
| Event (ketukan kamera terkunci, metrik dasar) | Supabase | Tidak boleh memuat koordinat atau profil iklan |

## 3. Celah yang perlu dirumuskan

- "Penyaringan" konten pengguna (spesifikasi §7) belum punya bentuk di fitur MVP.
- Teks persetujuan (consent) UU PDP belum ditulis.
