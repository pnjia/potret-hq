# Teknis: backend Supabase

> Area agen `backend-supabase`. Fakta di bagian 1 diambil dari spesifikasi v1.
> Terakhir diverifikasi: 17 Nov 2026 (K-017, K-018, K-019, K-025).

## 1. Yang sudah terkunci

- Supabase: Auth, Postgres + RLS, Storage (spesifikasi §6).
- Login wajib sejak awal lewat Google dan Sign in with Apple. Hapus akun dari dalam aplikasi (K-006).
- Usia minimal 18 tahun dengan verifikasi berlapis (K-017). Yang disimpan hanya `age_verification_method` dan `age_verified_at`; tahun lahir tidak disimpan (K-018).
- Akun privat secara default; follow butuh persetujuan (`Follow.status`: `pending`/`approved`). Buku teman hanya bisa dilihat: tanpa komentar, like, atau DM (K-008).
- Buku teman hanya menampilkan nama kota, tidak pernah lokasi tepat. Tidak ada kolom koordinat di tabel milik pengguna (K-011).
- Lapor dan blokir tersedia; laporan ditinjau manual lewat dashboard Supabase (spesifikasi §4.7).
- Storage: cutout (WebP terkompresi) dan thumbnail. Foto asli tidak diunggah (spesifikasi §4.9).
- Skema siap jual sejak MVP: `Camera.sku`, tabel `Entitlement`. Pembelian terikat ke akun (K-007).
- `Event` untuk ketukan kamera terkunci dan metrik dasar, **agregat tanpa id pengguna** (K-017).
- Tabel `finding` tidak punya kolom path foto asli (K-019).
- Pembelian (nanti): RevenueCat dengan App User ID = UUID pengguna Supabase; webhook diterima Edge Function yang menulis `entitlement` (K-025).

## 2. Prinsip RLS (usulan awal)

- Default tolak. Setiap tabel milik pengguna hanya bisa dibaca dan ditulis pemiliknya.
- Pengecualian baca: `Book`, `Chapter`, `Page`, `Placement`, dan `Finding` milik X boleh dibaca Y hanya bila ada `Follow` dengan `follower = Y`, `followee = X`, dan `status = approved`, serta tidak ada `Block` di antara keduanya.
- Objek Storage mengikuti aturan yang sama (bucket privat + URL bertanda tangan atau kebijakan Storage).
- Hapus akun menghapus baris dan objek Storage milik pengguna.

## 3. Belum ditetapkan

| Hal | Status |
|---|---|
| Skema `Mission`, `MissionProgress`, `Badge`, `UserBadge`, `Report`, `Block`, `Event` | Dirinci saat dibangun; nama mengikuti glosarium (K-014) |
