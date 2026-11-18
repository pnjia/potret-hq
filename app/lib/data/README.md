# lib/data

Lapisan data: repositori per entitas glosarium (`FindingRepository`, `BookRepository`, ...).

- Lokal: drift (SQLite). Drift satu-satunya pemakai code generation (K-027).
- Server: klien Supabase. Skema Postgres milik agen `backend-supabase`.
- Sinkronisasi: lokal dulu, lalu ke Supabase. `localOriginalPath` hanya di drift (K-019).
- Koordinat tidak pernah disimpan; hanya `cityId` dan `landmarkId` (K-011).

Belum ada kode: prototipe K-012 tidak memakai drift atau Supabase.
