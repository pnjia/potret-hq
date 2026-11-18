# Desain UI yang tidak terasa "AI slop", referensi pemilik, dan kartu share

> Diriset: 2026-11-18 · Oleh: sesi utama
> Cek ulang sebelum dipakai untuk keputusan baru: isi skill dan cookbook Anthropic (bisa diperbarui), fitur share Strava dan Instagram (berubah tiap rilis), angka zona aman.
> Dipakai oleh: Q-017 (arah visual), mockup v3 (https://claude.ai/artifact/Acc38ZrS9c64zx1VbA3MzE)

## Pertanyaan

1. Kenapa desain buatan AI (termasuk Claude) terasa generik, dan instruksi apa yang terbukti membantu?
2. Bagian mana dari screenshot referensi pemilik (aplikasi meditasi, 3 layar) yang cocok untuk Kliping Kota?
3. Kartu share 9:16 yang baik itu seperti apa?

## Temuan

- **Penyebab desain generik: "distributional convergence"**
  - Anthropic: tanpa arahan, model memilih pilihan aman yang mendominasi data latih: font Inter, gradasi ungu di atas putih, animasi minim. Kutipan: "Safe design choices–those that work universally and offend no one–dominate web training data."
  - Yang membantu: arahkan tiap dimensi secara terpisah (tipografi, warna dan tema, gerak, latar), beri sumber inspirasi yang konkret, dan sebutkan kebiasaan bawaan yang harus dihindari.
  - Sumber: https://claude.com/resources/articles/improving-frontend-design-through-skills (terbit 12 Nov 2025, diakses 2026-11-18)

- **Isi prompt "frontend aesthetics" Anthropic**
  - Tipografi: pilih font berkarakter, hindari Inter, Roboto, Arial, dan font sistem. Pakai kontras ekstrem: bobot 100/200 lawan 800/900 (bukan 400 lawan 600), dan lompatan ukuran 3x atau lebih.
  - Warna: berkomitmen pada satu estetika, pakai variabel. "Dominant colors with sharp accents outperform timid, evenly-distributed palettes."
  - Gerak: satu momen terorkestrasi (muncul bertahap saat layar dibuka) lebih berkesan daripada efek kecil yang tersebar.
  - Latar: bangun suasana dan kedalaman (lapisan gradasi, pola geometris, efek kontekstual), jangan warna polos.
  - Model cenderung pindah ke favorit baru, misalnya Space Grotesk. Variasi harus diminta eksplisit.
  - Sumber: https://platform.claude.com/cookbook/coding-prompting-for-frontend-aesthetics (terbit 21 Okt 2025, diakses 2026-11-18)

- **Skill resmi `frontend-design` (anthropics/skills)**
  - Proses: tulis rencana desain singkat dulu (4–6 warna bernama dengan hex, peran tiap font, konsep tata letak, prinsip), tinjau ulang terhadap brief dan buang yang terasa default, baru dibangun.
  - Pembuka diambil dari elemen paling khas di dunia subjeknya. Pola "angka besar + label kecil + aksen gradasi" baru dipakai bila memang paling tepat.
  - Default AI yang dihindari: latar krem dengan aksen terakota, kartu SaaS membulat identik dengan bayangan abu, gradasi tipis menyeluruh, eyebrow huruf kapital berjarak lebar, deretan meta dengan titik tengah (·), label monospace, dan panah di ujung tautan.
  - Satu elemen dibuat paling berkesan, sisanya tenang. Dekorasi yang tidak melayani brief dibuang.
  - Kata-kata di layar juga bagian dari desain: bahasa pengguna, kalimat aktif, label aksi konsisten.
  - Sumber: https://raw.githubusercontent.com/anthropics/skills/main/skills/frontend-design/SKILL.md (diakses 2026-11-18; ringkasan, teks berlisensi tidak disalin utuh)

- **Kartu share**
  - Strava "Sticker Stats": statistik dibagikan sebagai **stiker transparan** yang diletakkan pengguna di atas fotonya sendiri di Instagram Stories. Pengulas mencatat ini terlihat lebih bersih daripada screenshot.
  - Sumber: https://support.strava.com/en-us/articles/17718841-how-do-i-share-my-strava-activity-to-instagram-stories-as-a-transparent-sticker ; https://www.bikeradar.com/news/strava-sticker-stats-spring-2025-updates (diakses 2026-11-18)
  - Spotify Wrapped 2018: warna tiap kartu diambil dari data pengguna, dari daftar palet dan kombinasi 3 warna, jadi kartu tiap orang berbeda. Wrapped 2024 memakai rentang tipografi lebar (sangat tebal sampai ramping terkondensasi).
  - Sumber: https://medium.com/active-theory/spotify-wrapped-2018-technical-case-study-5b7cfb7e9d3a ; https://www.fastcompany.com/91239913/spotify-wrapped-2024-music-evolution (diakses 2026-11-18)
  - Panduan umum Story: render kartu dari komponen khusus berukuran 1080×1920 (bukan screenshot layar), satu fokus per kartu, teks besar di latar bersih, elemen penting di luar zona aman atas dan bawah, sediakan "simpan ke galeri" selain "bagikan".
  - Sumber: https://vp0.com/blogs/instagram-story-share-export-template-react-native ; https://www.webtonic.io/blog/instagram-story-ideas (diakses 2026-11-18; sekunder)

- **Analisis screenshot referensi pemilik** (aplikasi meditasi, 3 layar; diterima 2026-11-18, tidak disimpan di repo)
  - Diamati:
    - setengah layar atas berupa panel ilustrasi dengan suasana (lengkung matahari berlapis, awan) dan warna pastel berbeda per layar (sage, mint, abu hangat);
    - judul tebal dua warna (cokelat tua + oranye);
    - tombol utama bulat cokelat tua dengan panah;
    - chip statistik gelap berikon dalam lingkaran sage ("Breathe 12", "Time 2:35");
    - kartu pilihan dengan latar merah muda saat terpilih;
    - skor besar di tengah, dengan lembar putih melengkung menutup latar;
    - kartu rekomendasi dengan ilustrasi menembus tepi kanan;
    - navigasi bawah dengan tombol "+" hitam mengambang.
  - Tidak cocok untuk Kliping Kota: maskot kartun, wajah emoji, burung dan awan klip-art. Ketiganya termasuk anti-acuan "kekanak-kanakan" (K-017, `docs/desain/acuan/README.md`).

## Kesimpulan

**Fakta bersumber.** Anthropic sendiri menyebut desain generik muncul karena model memilih pilihan paling umum. Perbaikannya: arahan per dimensi, sumber inspirasi konkret, larangan eksplisit terhadap default (Inter, gradasi ungu, kartu SaaS identik, eyebrow kapital, meta dengan titik tengah), dan rencana desain tertulis sebelum membangun. Kartu share yang efektif fokus pada satu hal. Strava memakai stiker transparan di atas foto pengguna, sedangkan Spotify memakai warna dari data pengguna.

**Tafsiran.** Mockup v1–v2 memakai beberapa default yang disebut di atas: krem + aksen (v1); satu font untuk semua, kartu abu identik, eyebrow kapital, dan meta bertitik tengah (v2); ditambah ilustrasi cutout setara klip-art. Dari referensi pemilik, yang layak diambil adalah strukturnya: panel hero bersuasana, tinta cokelat hangat sebagai pengganti hitam murni, chip gelap berikon, status terpilih berwarna lembut, lembar melengkung, dan kartu dengan objek menembus tepi. Untuk kartu share, tiga varian layak diuji: halaman buku, satu temuan besar berwarna aksen kota, dan stiker transparan ala Strava.

## Belum terjawab

- Analisis resmi Spotify atau Strava tentang alasan desain kartu share mereka (hanya ada sumber sekunder).
- Data apakah varian stiker transparan lebih sering dibagikan di Indonesia.
