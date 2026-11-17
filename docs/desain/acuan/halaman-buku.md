# Acuan: halaman temuan bebas

> Status: **draf** (belum ada gambar). Aturan dari spesifikasi §4.5 dan K-005; angka adalah **usulan kerja**.
> Terakhir diverifikasi: 16 Nov 2026.

## Aturan terkunci

- Tata letak otomatis berbasis template, dengan rotasi acak kecil, selotip, dan keterangan (§4.5).
- Pengguna bisa mengatur ulang. Halaman yang pernah diatur manual tidak diacak ulang oleh sistem (K-005).
- Halaman dimuat bertahap dengan thumbnail (K-004).

## Usulan anatomi (perlu dicek)

| Bagian | Usulan |
|---|---|
| Slot temuan per halaman | 3–6, tergantung template |
| Rotasi acak | −4° sampai +4° (`motion.placementRotationMax`, K-021) |
| Selotip | 1–2 per temuan, posisi di sudut atau tepi atas |
| Keterangan | `Finding.note` atau nama kategori, dengan font tulisan tangan (Caveat) |
| Latar | `color.paper.base` dengan tekstur kertas halus; selotip `color.paper.tape` |
| Nomor halaman | Di tepi bawah, kecil |

## Kriteria cocok dengan acuan

- [ ] Terasa seperti scrapbook nyata, bukan grid galeri
- [ ] Cutout tetap terbaca (kontras dengan latar kertas)
- [ ] Data yang disimpan cukup untuk menggambar ulang halaman: `Placement` (`x`, `y`, `scale`, `rotation`, `z`, `isManuallyArranged`)
