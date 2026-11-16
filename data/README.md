# Data untuk mesin

> Data yang dibaca kode dan agen. Setiap file punya skema JSON Schema (draft 2020-12) di `schema/`, dan file data merujuk skemanya lewat key `$schema` (editor seperti VS Code memakainya untuk validasi otomatis).
> Key berbahasa Inggris `camelCase` (K-014, `docs/produk/glosarium.md` bagian 4).
> Terakhir diverifikasi: 16 Nov 2026.

| File | Isi | Skema | Pemilik (agen) | Keadaan |
|---|---|---|---|---|
| `design-tokens.json` | Warna, tipografi, spasi, radius, gerak | `schema/design-tokens.schema.json` | `desainer-visual` | **PLACEHOLDER** (Q-007): nilai `TBD`/`null` |
| `cameras.json` | Skin kamera (`Camera`) | `schema/cameras.schema.json` | `kamera-cutout` (data), `desainer-visual` (visual) | 1 entri contoh |
| `cities.json` | Kota (`City`) dan landmark (`Landmark`) | `schema/cities.schema.json` | `kurator-katalog` | 1 kota + 1 landmark contoh, belum diverifikasi |

## Aturan

- Entri contoh ditandai `"example": true` dan wajib dihapus atau diganti sebelum data dipakai di aplikasi.
- Landmark `"verified": true` hanya bila koordinat, radius, dan **setiap** fakta sudah punya sumber URL.
- Koordinat landmark adalah titik tempat publik untuk pencocokan radius di perangkat. Lokasi **pengguna** tidak pernah disimpan (K-011).
- Path aset (`assets/...`) relatif terhadap `app/`, yang belum ada.
- Validasi: `node scripts/cek-hq.mjs` (skema, plus cek silang `landmarks[].cityId` ke `cities[].id` dan sumber fakta untuk landmark terverifikasi).

## Skema singkat

```
design-tokens.json
  meta {version, status, verifiedAt, note}
  color.{paper|ink|accent|state}.<nama> {value "#RRGGBB"|"TBD", status, note}
  typography.{display|body|handwriting} {family, status, note}
  spacing|radius|motion.<nama> {value number|null, unit px|ms|deg, status, note}

cameras.json
  cameras[] {id, name, lut, overlay, shutterSound, sku|null, isFree, isLocked, example}

cities.json
  cities[]    {id, name, province, accentColor, stampAsset, isCurated, example}
  landmarks[] {id, cityId, name, category, lat, lng, radiusM, facts[{text, source|null}], silhouetteAsset, verified, example}
```

Belum ada katalog kategori, misi, dan lencana karena taksonominya menunggu Q-004.
