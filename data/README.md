# Data untuk mesin

> Data yang dibaca kode dan agen. Setiap file punya skema JSON Schema (draft 2020-12) di `schema/`, dan file data merujuk skemanya lewat key `$schema` (editor seperti VS Code memakainya untuk validasi otomatis).
> Key berbahasa Inggris `camelCase` (K-014, `docs/produk/glosarium.md` bagian 4).
> Terakhir diverifikasi: 23 Nov 2026 (decorations.json; cek-hq memeriksa file aset suara dan dekorasi ada di app/).

| File | Isi | Skema | Pemilik (agen) | Keadaan |
|---|---|---|---|---|
| `design-tokens.json` | Warna (termasuk kategori dan tinta keterangan), tipografi, gaya teks, spasi, radius, garis, ukuran, gerak | `schema/design-tokens.schema.json` | `desainer-visual` | v2.0.0 final (K-035); `motion.pageCurl` menunggu prototipe K-012 |
| `cameras.json` | Skin kamera (`Camera`) | `schema/cameras.schema.json` | `kamera-cutout` (data), `desainer-visual` (visual) | 1 entri contoh |
| `cities.json` | Kota (`City`) dan landmark (`Landmark`) | `schema/cities.schema.json` | `kurator-katalog` | Kota MVP Sukabumi (K-029): 21 kandidat landmark, semua `verified: false` sampai disurvei pemilik; `isCurated: false`. Entri contoh Bandung dihapus |
| `categories.json` | Kategori temuan dan pemetaan label ML Kit | `schema/categories.schema.json` | `kurator-katalog` (kategori), `kamera-cutout` (aturan pemilihan) | v1 (K-020), 9 kategori, 174 label; diuji ulang dengan foto kota nyata |
| `decorations.json` | Hiasan sampul (12, dalam 3 set), motif selotip (6), kertas latar (4); sumber dan lisensi tiap SVG | `schema/decorations.schema.json` | `desainer-visual` (aset), `kurator-katalog` (data) | Lengkap (K-031, K-043); SVG dibuat `app/tool/make_decorations.py` |
| `sounds.json` | Catatan sumber dan lisensi setiap file suara | `schema/sounds.schema.json` | `animasi-buku`, `kamera-cutout` | Kosong (K-024) |

## Aturan

- Entri contoh ditandai `"example": true` dan wajib dihapus atau diganti sebelum data dipakai di aplikasi.
- Landmark `"verified": true` hanya bila koordinat, radius, dan **setiap** fakta sudah punya sumber URL.
- Koordinat landmark adalah titik tempat publik untuk pencocokan radius di perangkat. Lokasi **pengguna** tidak pernah disimpan (K-011).
- Path aset (`assets/...`) relatif terhadap `app/`. `cek-hq` memeriksa file yang dirujuk `sounds.json` dan `decorations.json` benar-benar ada.
- Validasi: `node scripts/cek-hq.mjs` (skema, plus cek silang `landmarks[].cityId` ke `cities[].id`, kategori landmark ke `categories.json`, label ML Kit yang dipetakan ganda, dan sumber fakta untuk landmark terverifikasi).

## Skema singkat

```
design-tokens.json
  meta {version, status, verifiedAt, note}
  color.{paper|ink|action|highlight|state}.<nama> {value "#RRGGBB"|"TBD", opacity?, contrast?{<token>: rasio}, status, note}
  color.noteInk.{ink|cobalt|sepia|stampRed|magenta|green}, color.category.<id kategori>  (bentuk sama)
  typography.{display|body|handwriting} {family, status, note}
  textStyle.<nama> {font display|body|handwriting, size, lineHeight|null, weight, width|null, letterSpacing, uppercase, status, note}
  spacing|radius|border|size|motion.<nama> {value number|null, unit px|ms|deg, status, note}

cameras.json
  cameras[] {id, name, lut, overlay, shutterSound, sku|null, isFree, isLocked, example}

cities.json
  cities[]    {id, name, province, accentColor, stampAsset, findingTarget, isCurated, example}
  landmarks[] {id, cityId, name, category, lat, lng, radiusM, facts[{text, source|null}], silhouetteAsset, verified, example}

categories.json
  meta {verifiedAt, source, confidenceThreshold, rule, note}
  categories[] {id, name, tieBreakOrder, missionEligible, mlkitLabels[{text, index, weak?}]}

decorations.json
  ornaments[], tapePatterns[], paperStyles[]  {id, name, file assets/decorations/*.svg, source script|drawn, license own, author, addedAt}
  decorationSets[] {id, name, ornamentIds[4]}

sounds.json
  sounds[] {id, file, use page-turn|shutter|ui, source foley|freesound|pixabay, license, url|null, author, addedAt}
```

Katalog misi dan lencana belum dibuat. Keduanya dibangun dari `categories.json` (hanya kategori `missionEligible`).
