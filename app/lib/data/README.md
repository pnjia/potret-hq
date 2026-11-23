# lib/data

Lapisan data: repositori per entitas glosarium. UI hanya memakai repositori lewat provider di `providers.dart`, tidak pernah drift langsung.

| File | Isi |
|---|---|
| `local/tables.dart`, `local/app_database.dart` | Tabel drift `Findings`, `Books`, `Chapters`, `Pages`, `Placements`; `app_database.g.dart` hasil generator (ikut di-commit) |
| `models/enums.dart` | Nilai enum glosarium (`EdgeStyle`, `PageKind`, `PaperStyle`, `TapePosition`, `TapePattern`, `NoteInk`); kategori memakai `CategoryId` di `core/` |
| `finding_repository.dart` | Temuan: tambah, jumlah dan temuan terbaru per kota, landmark terbaru, ubah tepi/keterangan, hapus |
| `book_repository.dart` | Satu buku, bab per kota, halaman, tempel/atur manual/lepas, baki "Belum ditempel" |
| `catalog_repository.dart` | Kota dan landmark dari `assets/catalog/` (salinan `data/`, `tool/sync_catalog.py`) |
| `cutout_image.dart` | `ImageProvider` dari URI gambar temuan |
| `demo_seed.dart` | 13 temuan contoh bila `--dart-define=DEMO_DATA=true` |

Aturan:

- drift adalah sumber kebenaran di perangkat. Supabase **ditahan**; nanti menjadi cermin, jadi nama kolom SQL sudah sama dengan Postgres (snake_case, `sort_order`).
- Koordinat tidak pernah disimpan; hanya `cityId` dan `landmarkId` (K-011). Tes skema memeriksa tidak ada kolom lat/lng/lokasi/tahun lahir.
- `localOriginalPath` hanya di drift, tidak tersinkron (K-019).
- URI gambar temuan (`cutoutUrl`, `thumbUrl`): `file://` selama hanya di perangkat, `asset:` untuk data contoh, `https://` setelah tersinkron.
- Id baris UUID v4 dibuat di perangkat (`ids.dart`), sama dengan id di Supabase nanti.
- Mengubah tabel: naikkan `schemaVersion` dan tulis migrasi di `AppDatabase.migration`, lalu `dart run build_runner build`.
