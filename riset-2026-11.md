# Riset Awal — November 2026

> Diriset: 16 Nov 2026. Cek ulang poin yang mudah berubah (regulasi, harga, status paket) sebelum dipakai untuk keputusan baru.

## Pesaing
- **Loot** (iOS, rilis di Product Hunt 1 Jul 2026)
  - Alurnya: potret → latar dihapus → diberi nama → masuk koleksi → dibagikan sebagai tautan web.
  - Diposisikan sebagai "Pokédex untuk apa saja".
  - Ada keluhan pengguna bahwa hasil potongan tidak bisa diedit.
  - Sumber: https://chatgate.ai/post/loot
- **Museeum**
  - Mengekstrak subjek secara lokal, lalu menambahkan judul, lokasi, dan cerita untuk dijadikan stiker.
  - Sumber: https://hunted.space/product/museeum
- **kokososo**
  - Potret → potong → koleksi, plus fitur dinding foto AR.
  - Sumber: https://mwm.ai/apps/kokososo/6755541795
- **Kesimpulan**: Mekanik inti sudah umum. Pembeda kita ada di konteks kota Indonesia, buku sebagai artefak, dan skin kamera.

## Monetisasi kamera (patokan)
- Dazz Cam di App Store Indonesia menjual kamera satuan seharga Rp19 ribu–Rp49 ribu, dan Pro sekali bayar Rp199 ribu.
- Sumber: https://apps.apple.com/id/app/dazz-cam-vintage-camera/id1422471180

## Teknologi
- **`native_cutout` (Flutter)**
  - Memakai iOS Vision (butuh iOS 17+ dan perangkat asli) dan Android ML Kit Subject Segmentation.
  - Model Android diunduh oleh Play services, dan penggunaan pertama gagal kalau sedang offline.
  - Sumber: https://pub.dev/packages/native_cutout
- **FFmpegKit**
  - Resmi pensiun sejak Januari 2025, binary lamanya dihapus.
  - Paket Flutter-nya bertanda unmaintained.
  - Sumber: https://www.itpathsolutions.com/ffmpegkit-shutdown-what-to-do-next

## Regulasi
- **PP Tunas (PP 17/2025)**
  - Berlaku penuh 28 Mar 2026.
  - Kewajiban: informasi batas usia, verifikasi usia, dan mekanisme pelaporan.
  - Larangan: melacak lokasi maupun membuat profil anak untuk kepentingan iklan atau bisnis.
  - Sumber:
    - https://teknologi.bisnis.com/read/20260505/101/1971394/10-kewajiban-platform-dalam-pp-tunas-yang-perlu-diketahui-pse
    - https://teknologi.bisnis.com/read/20260306/101/1958347/pp-tunas-berlaku-platform-wajib-tunda-akses-anak-ke-layanan-digital-berisiko-tinggi

## Visual
- **Gen Z terbelah dua selera**: yang lebih tua menyukai visual lembut dan bersih, yang lebih muda menyukai visual ramai dan ekspresif.
  - Sumber: https://hashtagpaid.com/banknotes/gen-z-visual-strategy-2026-why-design-is-now-a-performance-channel
- **Gen Alpha** cenderung menyukai warna cerah dan optimis dengan banyak pink.
  - Sumber: https://www.beautyindependent.com/bye-bye-gen-z-neons-these-design-elements-are-catching-gen-alphas-eye/
