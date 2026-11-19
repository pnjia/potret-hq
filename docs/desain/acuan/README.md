# Contoh acuan (golden references)

> Kata "estetik" saja tidak cukup jelas untuk AI maupun manusia. Acuan adalah contoh konkret yang dipakai untuk membandingkan setiap hasil desain baru.
> Terakhir diverifikasi: 19 Nov 2026. Arah visual yang berlaku: v5 "Karcis & Kliping" (K-035).

## Cara kerja

- Satu acuan = satu file `.md` berisi **spesifikasi tertulis** (elemen, ukuran, aturan) + gambar acuan. Gambar boleh dirujuk dari `docs/desain/usulan-v5/` (screenshot mockup v5) daripada disalin ke folder ini.
- Status acuan: `draf` (spesifikasi tertulis, belum ada gambar), `aktif` (ada gambar yang disetujui pemilik), `pensiun` (diganti acuan baru, file tetap disimpan).
- Hasil desain baru dibandingkan dengan acuan aktif. Penyimpangan yang disengaja dicatat sebagai keputusan baru.
- Mockup v5 bisa tertinggal dari keputusan sesudahnya; bila berbeda, keputusan yang menang dan acuan menulis bagian "Jangan disalin dari mockup".
- Gambar acuan harus milik sendiri atau berlisensi; jangan menyalin tangkapan layar aplikasi lain.

## Daftar acuan

| Acuan | File | Status | Gambar |
|---|---|---|---|
| Kartu share (4 gaya MVP, K-032) | [`kartu-share.md`](kartu-share.md) | aktif | `V5KartuShare`, `V5ShareVideo`, `V5BagikanStiker`, `V5ShareTunggal` |
| Halaman buku (halaman temuan bebas) | [`halaman-buku.md`](halaman-buku.md) | aktif | `V5Buku`, `V5EditHalaman` |
| Halaman pembatas bab | – | belum dibuat | mockup v5: `V5Pembatas` |
| Layar kamera dengan skin | – | belum dibuat | mockup v5: `V5Kamera`, `V5KameraKotakPos`, `V5KameraKoran`, `V5KameraPagi` |
| Sampul buku | – | belum dibuat | mockup v5: `V5Sampul`, `V5EditSampul` |

Semua gambar ada di `docs/desain/usulan-v5/` (`<nama>.png`).

## Anti-acuan (yang dihindari)

- Maskot imut, ilustrasi kartun, emoji, konfeti, dan sudut membulat berlebihan yang membuat aplikasi terasa untuk anak (K-017). Di v5: radius hanya 0/2/4, tanpa kapsul.
- Gradasi neon generik, glassmorphism, dan lingkaran atau blob dekoratif di latar. Tekstur latar hanya raster titik dan grain kertas.
- Tata letak grid kaku tanpa rotasi atau selotip, karena tata letak manual-penuh dan otomatis-penuh sama-sama ditolak (K-005).
- Wajah "UI kit" generik: kartu membulat identik berbayangan abu, badge kapsul Lime, bayangan offset keras ala neo-brutalism, ikon target dan siluet orang. Daftar lengkap: [usulan v5](../usulan-v5-karcis-kliping.md) §4 "Daftar jangan".
