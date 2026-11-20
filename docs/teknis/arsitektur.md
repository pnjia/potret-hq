# Teknis: arsitektur aplikasi

> Area agen `arsitek-flutter`. Bagian 1 terkunci (spesifikasi v1 + keputusan sesudahnya). Bagian 2 diputuskan di K-027.
> Terakhir diverifikasi: 20 Nov 2026 (bundle ID K-040).

## 1. Yang sudah terkunci

| Bagian | Pilihan | Sumber |
|---|---|---|
| Aplikasi | Flutter, Android (dengan Google Play services) + iOS 17+ | K-003, spesifikasi §6 |
| Data lokal | SQLite via drift | spesifikasi §6 |
| Backend | Supabase | spesifikasi §6, `docs/teknis/backend.md` |
| Kamera | `camera` + overlay + shader LUT | `docs/teknis/kamera.md` |
| Hapus latar | `native_cutout` | K-010 |
| Kategori | ML Kit Image Labeling | spesifikasi §4.3 |
| Animasi buku | Shader page-curl kustom | `docs/teknis/buku.md` |
| Video share | Render frame + AVAssetWriter / MediaCodec, tanpa FFmpegKit | K-003 |
| Pembayaran | RevenueCat (`purchases_flutter`), saat toko dibuka | K-025 |
| State management dan DI | `flutter_riverpod` 3.x, provider manual tanpa generator | K-027 |
| Perangkat acuan Android | Infinix Hot 11 Play, target konsisten 30 fps | K-016 |

## 2. Struktur modul (K-027)

Modul dinamai menurut glosarium supaya nama folder, kelas, dan kartu Trello sejalan.

```
app/
├── CLAUDE.md            konvensi Flutter (dibuat saat app/ dibuat)
└── lib/
    ├── core/            tema dari data/design-tokens.json, router, error, util
    ├── data/            drift (lokal), klien Supabase, sinkronisasi
    └── features/        tiap modul berisi ui/ dan state/ (provider Riverpod)
        ├── account/     login, verifikasi usia 18+ (K-017), hapus akun
        ├── camera/      Camera, skin, LUT, shutter
        ├── finding/     cutout, masker + kuas, kategori, kota/landmark
        ├── book/        Book, Chapter, Page, Placement, page-curl
        ├── social/      Follow, lapor, blokir, buku teman
        ├── share/       ShareCard, ShareVideo, hapus EXIF
        └── retention/   Mission, Badge
```

Repositori per entitas ada di `data/` (drift + Supabase). Drift satu-satunya pemakai code generation. Konvensi rinci ditulis di `app/CLAUDE.md` saat `app/` dibuat.

## 3. Alur data yang sudah tersirat di spesifikasi

1. Potret → `native_cutout` → masker dirapikan → cutout WebP + thumbnail.
2. Lokasi sesaat → cocokkan `City` dan radius `Landmark` → simpan `cityId` (+ `landmarkId` bila dikonfirmasi). Koordinat dibuang.
3. ML Kit Image Labeling → `category` menurut `data/categories.json` (K-020).
4. Simpan `Finding` di drift → tata letak otomatis membuat `Placement` → sinkron ke Supabase (cutout, thumbnail, baris data tanpa `localOriginalPath`, K-019).

## 4. Kerangka `app/`

Fakta saat kerangka dibuat dengan `flutter create --platforms=android,ios --org id.potret --project-name potret`. Konvensi kode: `app/CLAUDE.md`.

| Hal | Nilai |
|---|---|
| Toolchain | Flutter 3.50.0 (stable), Dart 3.14.0 |
| Nama paket Dart | `potret` |
| Label di HP | "Kliping Kota" (`android:label`, `CFBundleDisplayName`), K-023 |
| Bundle ID | `id.klipingkota.app` untuk Android dan iOS (K-040) |
| Android | minSdk 24 (bawaan Flutter), compileSdk/targetSdk 36 |
| iOS | `IPHONEOS_DEPLOYMENT_TARGET = 17.0` (K-003). Plugin lewat Swift Package Manager bawaan Flutter 3.50; tidak ada Podfile |
| Material | Diimpor dari paket `material_ui` (template Flutter 3.50 memisahkan Material dari SDK) |
| Token desain | Disalin ke `app/lib/core/theme/design_tokens.dart`; tes membandingkannya dengan `data/design-tokens.json` |

Paket yang terpasang (dicek di pub.dev API 18 Nov 2026, cek ulang sebelum upgrade):

| Paket | Versi | Rilis terakhir | Penerbit, lisensi, poin pub | Sumber |
|---|---|---|---|---|
| `flutter_riverpod` | 3.5.0 | 6 Nov 2026 | dash-overflow.net, MIT, 140/160 | https://pub.dev/packages/flutter_riverpod |
| `material_ui` | 1.11.1 | 16 Nov 2026 | flutter.dev, BSD-3-Clause, 160/160 | https://pub.dev/packages/material_ui |
| `flutter_lints` (dev) | 6.0.0 | bawaan template | flutter.dev, BSD-3-Clause | https://pub.dev/packages/flutter_lints |
