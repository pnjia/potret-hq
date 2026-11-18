# app/ · konvensi Flutter

Dimuat saat bekerja di `app/`. Peta HQ: `../CLAUDE.md`. Arsitektur: `../docs/teknis/arsitektur.md`.

## Struktur (K-027)

```
lib/
├── main.dart           ProviderScope + MaterialApp ("Kliping Kota")
├── core/               tema (theme/), nanti router, error, util
├── data/               repositori per entitas: drift (lokal) + Supabase
└── features/<modul>/   account, camera, finding, book, social, share, retention
    ├── ui/             widget dan layar
    └── state/          provider Riverpod
```

- Layar dan widget di `features/<modul>/ui/`. Provider di `features/<modul>/state/`.
- Akses data hanya lewat repositori di `data/` (`FindingRepository`, dst.). UI tidak memanggil drift atau Supabase langsung.
- Antarmodul boleh saling membaca provider; jangan mengimpor widget privat modul lain.
- Material diimpor dari `package:material_ui/material_ui.dart` (bawaan template Flutter 3.50).

## Riverpod (`flutter_riverpod` 3.x, tanpa generator)

- Provider ditulis manual. Dilarang `riverpod_generator` dan `@riverpod`. Drift satu-satunya pemakai code generation.
- `Provider`: dependensi dan nilai turunan (repositori, klien).
- `NotifierProvider` / `AsyncNotifierProvider`: state yang berubah lewat aksi.
- `FutureProvider` / `StreamProvider`: baca-saja dari repositori.
- Pakai `.autoDispose` untuk state per layar; `.family` untuk state per id (`pageId`, `cityId`).
- Hindari `StateProvider` dan `StateNotifierProvider` (legacy di Riverpod 3).

## Penamaan (K-014)

- Identifier Inggris sesuai `../docs/produk/glosarium.md`: kelas `PascalCase` (`Finding`, `Placement`), field `camelCase` (`landmarkId`, `isManuallyArranged`), enum huruf kecil (`divider`).
- Teks UI Bahasa Indonesia. Istilah baru diusulkan dulu, tidak dipakai diam-diam.

## Token desain

- Sumber: `../data/design-tokens.json`. Salinan Dart: `lib/core/theme/design_tokens.dart`.
- `test/core/design_tokens_test.dart` gagal bila salinan berbeda dari JSON. Ubah JSON dulu, lalu salin. Jangan mengarang token.

## Perintah (dari `app/`)

```
flutter analyze                 # wajib "No issues found"
flutter test
flutter build apk --profile     # APK untuk ukur frame time
```

## Performa (perangkat acuan Infinix Hot 11 Play, K-016)

- Target konsisten 30 fps, diukur di build profile. Catatan teknis: `../docs/teknis/buku.md` §2 (precache `FragmentProgram`, UV dibalik di OpenGLES, siapkan gambar halaman sebelum gestur, batasi cache tekstur).
- minSdk bawaan Flutter (24); jangan diturunkan.

## Larangan

- FFmpegKit (K-003). Minimum iOS 17.0 (`IPHONEOS_DEPLOYMENT_TARGET`, K-003).
- Koordinat tidak disimpan di model, drift, Supabase, atau log; hanya `cityId`/`landmarkId` (K-011).
- `localOriginalPath` hanya di drift, tidak tersinkron (K-019).
- Jangan commit `build/`, `.dart_tool/`, `android/local.properties`, keystore, `key.properties`, `.env*`.

## Bundle ID

Placeholder `id.potret.prototype` (Android `applicationId`/`namespace`, iOS `PRODUCT_BUNDLE_IDENTIFIER`). Nilai final menunggu Q-015 di `../docs/pertanyaan.md`.
