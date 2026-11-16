# Teknis: backend Supabase

> Area agen `backend-supabase`. Fakta di bagian 1 diambil dari spesifikasi v1.
> Terakhir diverifikasi: 16 Nov 2026.

## 1. Yang sudah terkunci

- Supabase: Auth, Postgres + RLS, Storage (spesifikasi §6).
- Login wajib sejak awal lewat Google dan Sign in with Apple. Hapus akun dari dalam aplikasi (K-006).
- Gerbang usia 16+ lewat tahun lahir saat pendaftaran (K-001; lihat Q-001, Q-002, Q-010).
- Akun privat secara default; follow butuh persetujuan (`Follow.status`: `pending`/`approved`). Buku teman hanya bisa dilihat: tanpa komentar, like, atau DM (K-008).
- Buku teman hanya menampilkan nama kota, tidak pernah lokasi tepat. Tidak ada kolom koordinat di tabel milik pengguna (K-011).
- Lapor dan blokir tersedia; laporan ditinjau manual lewat dashboard Supabase (spesifikasi §4.7).
- Storage: cutout (WebP terkompresi) dan thumbnail. Foto asli tidak diunggah (spesifikasi §4.9).
- Skema siap jual sejak MVP: `Camera.sku`, tabel `Entitlement`. Pembelian terikat ke akun (K-007).
- `Event` untuk ketukan kamera terkunci dan metrik dasar.

## 2. Prinsip RLS (usulan awal)

- Default tolak. Setiap tabel milik pengguna hanya bisa dibaca dan ditulis pemiliknya.
- Pengecualian baca: `Book`, `Chapter`, `Page`, `Placement`, dan `Finding` milik X boleh dibaca Y hanya bila ada `Follow` dengan `follower = Y`, `followee = X`, dan `status = approved`, serta tidak ada `Block` di antara keduanya.
- Objek Storage mengikuti aturan yang sama (bucket privat + URL bertanda tangan atau kebijakan Storage).
- Hapus akun menghapus baris dan objek Storage milik pengguna.

## 3. Belum ditetapkan

| Hal | Status |
|---|---|
| `local_original_path` di Postgres | Q-003 |
| Simpan `birth_year` atau penanda usia saja | Q-010 |
| RevenueCat atau `in_app_purchase` | Q-009 |
| Skema `Mission`, `MissionProgress`, `Badge`, `UserBadge`, `Report`, `Block`, `Event` | Dirinci saat dibangun; nama mengikuti glosarium (K-014) |
