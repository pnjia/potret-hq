# Hiasan, motif selotip, kertas latar

SVG buatan sendiri (K-031), katalognya di `../../../data/decorations.json` (id, nama, lisensi `own`).

- `ornaments/`: hiasan sampul. Tiga set (Karcis, Pos, Coretan) masing-masing 4 hiasan; tiga di antaranya memakai SVG selotip dari `tapes/`.
- `tapes/`: 6 motif selotip (`Placement.tapePattern`), strip 100×30 dengan ujung bergerigi.
- `papers/`: 4 kertas latar (`Page.paperStyle`), 360×584 (rasio halaman buku mockup v5).

Jangan disunting tangan: ubah `app/tool/make_decorations.py` lalu jalankan `python3 tool/make_decorations.py` dari `app/` (butuh `fonttools`). Teks diubah menjadi path dari font yang dibundel, dan SVG hanya memakai elemen dasar supaya aman dirender Flutter; `test/core/decorations_assets_test.dart` memeriksanya.
