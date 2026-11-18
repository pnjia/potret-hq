# Monetisasi kosmetik yang pantas untuk kamera retro dan koleksi stiker kota

> Diriset: 2026-11-18 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: **semua harga** di App Store dan Google Play (berubah tanpa pemberitahuan; App Store menyesuaikan harga Indonesia per 14 Sep 2026), daftar pembelian dalam aplikasi tiap aplikasi, aturan App Store (versi 16 Okt 2026) dan Google Play Payments, status *user choice billing* Google di Indonesia setelah putusan KPPU, tarif PPN PMSE, harga cetak photobook, status Digital Fairness Act UE (baru diusulkan 11 Nov 2026), angka RevenueCat State of Subscription Apps 2026.
> Dipakai oleh: belum (calon: keputusan membuka toko setelah K-007, layar toko mockup v5, `docs/teknis/rilis.md`). Melengkapi patokan harga Dazz di [`2026-11-16-riset-awal.md`](2026-11-16-riset-awal.md) tanpa menggantikannya; aturan PP Tunas dasar ada di [`2026-11-17-usia-pp-tunas-uu-pdp.md`](2026-11-17-usia-pp-tunas-uu-pdp.md); RevenueCat di [`2026-11-17-perangkat-dan-stack.md`](2026-11-17-perangkat-dan-stack.md); taksonomi deceptive pattern pertama kali dicatat di [`2026-11-18-kartu-share-viral.md`](2026-11-18-kartu-share-viral.md).

Bukan nasihat hukum. Tafsir pasal untuk Kliping Kota diserahkan ke `penasihat-privasi` dan konsultan hukum.

## Pertanyaan

1. Model dan harga aplikasi kamera retro di toko **Indonesia**: kamera satuan, Pro sekali bayar, atau langganan; harga Rupiah; ada uji coba kamera sebelum beli?
2. Aplikasi koleksi, scrapbook, dan jurnal yang menjual tema atau stiker: bentuk dan harga paketnya.
3. Pas/lifetime vs langganan untuk developer solo: konversi, risiko, aturan toko (Apple 3.1.1, 3.1.2; Google Play Payments), pulihkan pembelian, titik harga Rupiah.
4. Cetak buku fisik: boleh dibayar di luar IAP? Contoh layanan photobook Indonesia dan harganya.
5. Regulasi Indonesia: PPN PMSE, PP Tunas dan Kepmenkomdigi 142/2026 soal pembelian dan gamifikasi, UU Perlindungan Konsumen soal kejelasan harga.
6. Dark pattern pembelian yang harus dihindari, dan apa yang membuat paywall terasa jujur.

## Cara membaca

- **Terbukti**: dibaca langsung dari sumber primer (halaman App Store Indonesia, pedoman resmi, teks peraturan) pada 2026-11-18.
- **Sekunder**: dari ulasan, firma hukum, atau agregator. Dipakai sebagai petunjuk, bukan dasar keputusan.
- **Dugaan** atau **Tafsiran**: pendapat peneliti, diberi label.
- Halaman App Store menulis harga sebagai "Rp 19ribu". Di sini ditulis "Rp19rb". Halaman App Store tidak menulis periode langganan, dan nama item kadang ganda. Item yang tampil paling banyak 10 per aplikasi (semua halaman yang dibaca menampilkan ≤ 10 item), jadi daftar ini **belum tentu lengkap** (dugaan).
- Halaman Google Play tidak bisa dibaca oleh alat riset (isi dimuat lewat JavaScript; beberapa URL 404). **Harga Play Indonesia tidak ada di riset ini.**

## Temuan

### 1. Aplikasi kamera retro di App Store Indonesia (semua diakses 2026-11-18, cek ulang)

| Aplikasi (ID App Store, pengembang) | Rating usia | Model | Item dan harga di halaman App Store ID | Uji coba |
|---|---|---|---|---|
| **Dazz Cam** (id1422471180, DAZZ PTE. LTD.) | 4+ | Kamera/aksesori satuan + Pro langganan + Pro sekali bayar | Dazz Pro Rp69rb; **Dazz Pro One-Time Purchase Rp199rb**; Flash Color Rp19rb; ND Filter Rp19rb; Black Camera Rp19rb; NT16 Rp39rb; S Classic Rp39rb; Inst SQ Rp39rb; Fisheye Lens Rp39rb; Exp Camera Rp59rb | Halaman tidak menyebut uji coba |
| **ProCCD** (id1616113199, 亚玲 查) | 13+, "contains advertising" | Langganan VIP (bulanan/tahunan) + lifetime + kamera satuan | VIP Monthly4 Rp69rb; VIP Yearly / Yearly VIP with Trial Rp99rb; Yearly VIP with Trial2 Rp149rb; **Lifetime Purchase Promo Rp179rb**; **New Lifetime Purchase Rp299rb**; IXUS210 Rp19rb; Original2 Rp19rb | Nama item "with Trial"; durasi tidak tertulis |
| **Huji Cam** (id781383622, Manhole, Inc.) | 4+ | Satu pembelian | Extra Options Rp19rb (impor foto dari galeri dan opsi lain) | Tidak ada |
| **NOMO CAM** (id1362548649, Beijing Lingguang Zaixian) | 4+ | Kamera satuan + langganan tahunan | 5 kamera Rp0 (TOY F, FR2, ROMA, TOY K, 2007); NOMO 135 M Rp19rb; NOMO EATS Rp39rb; NOMO 135 B Rp39rb; NOMO Happiness Rp39rb; **NOMO PRO (1 Year) Rp359rb** | NOMO PRO bertanda "Free Trial" |
| **Kapi Cam - Y2K & CCD Camera** (id6740760807, TETRAS.AI HONGKONG) | 4+ | Langganan mingguan/bulanan/tahunan + lifetime + **poin** | Weekly Rp9rb; Monthly Rp39rb dan Rp99rb; Yearly Rp349rb; **Life-time Rp799rb**; 100 points Rp119rb; 600 points Rp599rb | Catatan versi 4.39.1: "3-day trial". Catatan 4.37.0: PRO memberi "ad-free experience" (berarti versi gratis beriklan, dugaan) |
| **1998 Cam** (id1450480287, AAAI Studio LLC) | 4+, "contains advertising" | Langganan bulanan/tahunan + lifetime | Monthly Rp29rb, Rp45rb, Rp69rb, Rp99rb; Yearly Rp229rb, Rp259rb, Rp499rb; **Lifetime Rp799rb** | Catatan versi 2.1.9: "Free trial details now show clearly on the yearly option" |
| **Kuji Cam** (id1468247478, Kuji Cam Inc) | 4+ | Langganan + permanen | Monthly Member Rp18rb; Annual Member Rp99rb; **Permanent Member Rp299rb** | Teks standar "if offered"; versi terakhir 2021 |

- Sumber (semua terbukti, diakses 2026-11-18): https://apps.apple.com/id/app/dazz-cam-vintage-camera/id1422471180 · https://apps.apple.com/id/app/id1616113199 · https://apps.apple.com/id/app/huji-cam/id781383622 · https://apps.apple.com/id/app/id1362548649 · https://apps.apple.com/id/app/id6740760807 · https://apps.apple.com/id/app/id1450480287 · https://apps.apple.com/id/app/id1468247478
- "KAPI" punya dua aplikasi berbeda. **KAPI Action / Kapi - Vintage Film Camera** (id1602677577) mengembalikan 404 di toko Indonesia (diakses 2026-11-18). Tabel memakai Kapi Cam (id6740760807).
- Dibanding riset 16 Nov ("Rp19–49rb per kamera, Pro Rp199rb"): rentang kamera/aksesori Dazz sekarang **Rp19rb–Rp59rb**, dan Dazz juga menjual Pro langganan Rp69rb (periode tidak tertulis). Pro sekali bayar tetap Rp199rb.
- **Uji coba kamera sebelum beli** (sekunder, lama, cek ulang): ulasan TapSmart (5 Mar 2020) tentang Dazz Cam: hanya lima kamera foto dan satu kamera video yang gratis; kamera berbayar tidak ditandai sampai diketuk dan langsung memunculkan ajakan beli; "it's possible to test each camera", tetapi hasil uji tidak bisa disimpan. Sumber: https://www.tapsmart.com/apps/dazz-cam-creaky-quirky-vintage-cameras/ (diakses 2026-11-18). Tidak ditemukan sumber 2026 yang memastikan perilaku ini masih sama.
- **NOMO CAM di toko AS** (sekunder, katalog paywall Adapty): NOMO PRO (1 Year) US$24,99; kamera satuan US$0,99–1,99; lima kamera US$0. Sumber: https://adapty.io/paywall-library/nomo-cam/ (diakses 2026-11-18). Halaman App Store ID sendiri menulis harga perpanjangan "USD 24.99" di teks syarat, padahal daftar item menulis Rp359rb.

### 2. Aplikasi koleksi, scrapbook, dan jurnal (App Store Indonesia, diakses 2026-11-18, cek ulang)

| Aplikasi | Model | Item dan harga | Catatan |
|---|---|---|---|
| **Shuffles by Pinterest** (id1573869498) | Gratis, **tanpa** pembelian dalam aplikasi | Tidak ada bagian In-App Purchases | Rating 13+. Template dan wallpaper kustom tanpa biaya |
| **Planner & Journal - Zinnia** (id1485310935, Pixite) | Langganan saja | Premium Weekly Rp65rb; Monthly Rp139rb, Rp159rb, Rp199rb; Yearly Rp429rb, Rp569rb, Rp619rb; Zinnia Premium Rp599rb; "SECRET DISCOUNT YEARLY" Rp499rb | Uji coba 7 hari; deskripsi: "$34.99/year". Stiker dan washi tape bagian dari konten Studio, **tidak** dijual sebagai paket terpisah |
| **Day One** (id1044867788, Bloom Built) | Langganan bertingkat (Silver, Gold) | Silver Rp149rb (1 bulan), Rp240rb, Rp799rb (tahunan); Gold Rp349rb; Premium Yearly Rp799rb | "Start a free trial today". Ada fitur "Journal Themes" dan cetak buku fisik |
| **Locket Widget** (id1600525061, Locket Labs) | Gratis + Locket Gold + paket foto | Locket Gold Rp29rb, Rp49rb, Rp69rb, Rp599rb; 10 Photo Pack Rp39rb dan Rp79rb; 20 Photo Pack Rp99rb | Halaman tidak menjelaskan isi Gold maupun Photo Pack |

- Sumber (terbukti): https://apps.apple.com/id/app/id1573869498 · https://apps.apple.com/id/app/id1485310935 · https://apps.apple.com/id/app/id1044867788 · https://apps.apple.com/id/app/id1600525061 (semua diakses 2026-11-18)
- **Polarsteps** (sekunder, cuplikan pusat bantuan): aplikasi gratis; Travel Book fisik dihargai per **rentang halaman** (Standard Premium hingga 400 halaman, Lay-Flat hingga 120), harga final hanya di checkout. Halaman resmi tidak bisa dibuka (403/404); angka harga tidak didapat. Sumber: https://support.polarsteps.com/hc/en-us/articles/37414570726674-What-determines-the-cost-of-the-Travel-Book (dari hasil pencarian, diakses 2026-11-18)
- Riset [`2026-11-18-editor-kolase-variatif.md`](2026-11-18-editor-kolase-variatif.md) mencatat PicCollage menjual "banyak paket berbayar terpisah" untuk latar dan stiker; harga paketnya tidak dicek di riset ini.

### 3. Lifetime vs langganan, aturan toko, titik harga

**3a. Data pasar (RevenueCat, sekunder-tepercaya; data penyedia, bukan audit independen)**

- State of Subscription Apps 2026 (115.000+ aplikasi, US$16 mlr+, aset bertanggal Mar 2026, metrik tahun 2025):
  - Campuran monetisasi semua kategori: langganan saja 63,5%; langganan + lifetime 23,2%; langganan + consumable 10,7%; ketiganya 2,5%.
  - **Photo & Video**: kombinasi dengan lifetime 33,0% (tertinggi antarkategori); median trial-ke-bayar 22,2%; 68,2% trial ≤ 4 hari; paket mingguan muncul di 10–33% paywall dengan Photo & Video di ujung atas.
  - Lifetime = 4–18% langganan terjual per kategori, < 5% per geografi.
  - Paywall keras vs freemium (unduh-ke-bayar D35): median 10,7% vs 2,1%; retensi tahun pertama hampir sama.
  - **IN/SEA (geografi pengguna)**: median D35 0,7% (kuartil atas > 1,9%); median trial-ke-bayar 15,2%; median harga bulanan US$3,75, tahunan US$18,32 (sekitar 46–54% pasar papan atas). Indonesia tidak dipisah.
  - Sumber: https://www.revenuecat.com/state-of-subscription-apps-2026/ (diakses 2026-11-18)
- Blog RevenueCat "lifetime subscriptions" (Daphne Tideman, 12 Nov 2025):
  - Untung: uang di muka "at least five years' worth of revenue upfront"; membantu aplikasi bootstrap tumbuh tanpa modal luar.
  - Risiko: bisa "cannibalize your most valuable customers"; sulit upsell pengguna lifetime; biaya berjalan tetap ada; perhatikan "double payment issues", permintaan refund, dan beban dukungan.
  - Harga lifetime "often priced at 5–12x the annual subscription" (rentang 2x sampai hampir 12x). Sekitar 18–24% aplikasi di kebanyakan kategori menawarkan langganan + lifetime.
  - Saran: perlakukan lifetime sebagai promosi musiman/terbatas, cek LTV kohort, bila ragu pasang lebih tinggi.
  - Konteks: artikel ini tentang lifetime **sebagai alternatif langganan**. Untuk aplikasi yang hanya menjual item sekali bayar (seperti rencana K-025), tidak ada angka pembanding yang ditemukan.
  - Sumber: https://www.revenuecat.com/blog/growth/lifetime-subscriptions.md (diakses 2026-11-18)
- Rasio lifetime : tahunan yang teramati di App Store ID (hitungan peneliti dari tabel §1): ProCCD 299/99 ≈ 3,0x; Kuji 299/99 ≈ 3,0x; Kapi 799/349 ≈ 2,3x; 1998 Cam 799/229–499 ≈ 1,6–3,5x.

**3b. App Store Review Guidelines (terbukti; halaman bertanda "Last Updated: October 16, 2026")**

- **3.1.1**: membuka fitur atau konten wajib lewat in-app purchase; tidak boleh lewat kunci lisensi, kode QR, dan sejenisnya. "you should make sure you have a **restore mechanism** for any restorable in-app purchases." Mata uang yang dibeli tidak boleh kedaluwarsa. **Loot box** wajib membuka peluang tiap item sebelum pembelian. Hadiah (gifting) item IAP boleh, refund hanya ke pembeli asli.
- **3.1.1, uji coba untuk aplikasi non-langganan**: boleh memakai item **Non-Consumable Price Tier 0** bernama "XX-day Trial"; sebelum uji coba mulai, aplikasi wajib menyebut durasi, konten yang hilang setelahnya, dan biaya lanjutan.
- **3.1.2(a)**: langganan wajib memberi "ongoing value", minimal 7 hari, berlaku di semua perangkat. Contoh yang pantas: konten episodik, pembaruan substansial terus-menerus, akses koleksi besar atau terus diperbarui, SaaS, cloud. Pengguna harus mendapat yang dibayar "without performing additional tasks, such as posting on social media, uploading contacts, checking in to the app a certain number of times". Bila beralih ke langganan, jangan cabut fungsi yang sudah dibeli. Bait-and-switch berujung penghapusan.
- **3.1.2(c)**: sebelum meminta berlangganan, jelaskan apa yang didapat untuk harga itu.
- **Pengantar Bagian 3**: Apple menolak item "clear rip-offs" dan harga "irrationally high".
- **5.6**: aplikasi tidak boleh "trick them into making unwanted purchases ... raise prices in a tricky manner, charge for features or content that are not delivered, or engage in any other manipulative practices".
- Sumber: https://developer.apple.com/app-store/review/guidelines/ (diakses 2026-11-18)

**3c. Google Play (terbukti)**

- Kebijakan Payments: aplikasi di Play wajib memakai penagihan Google Play untuk pembelian dalam aplikasi, termasuk "add-on items, characters, and avatars", kecuali bagian 3, 8, atau 9 berlaku. Developer wajib memberi tahu syarat dan harga dengan jelas dan akurat; harga di aplikasi harus sama dengan di antarmuka penagihan Play; item acak wajib membuka peluang "in advance of, and in close and timely proximity to, that purchase". Tanggal berlaku tidak tertulis di halaman. Sumber: https://support.google.com/googleplay/android-developer/answer/9858738?hl=en (diakses 2026-11-18)
- Integrasi Billing: pembelian wajib di-*acknowledge* "within three days so that the purchase isn't automatically refunded and entitlement revoked"; panggil `queryPurchasesAsync()` saat koneksi Billing berhasil (saat aplikasi dibuka atau kembali ke depan) agar semua pembelian, termasuk dari perangkat lain, terproses. Sumber: https://developer.android.com/google/play/billing/integrate (diakses 2026-11-18). (Dugaan: RevenueCat menangani keduanya; lihat riset 17 Nov.)
- **User choice billing**: Indonesia tercantum sebagai pasar pilot; di luar EEA hanya aplikasi non-gim; potongan biaya layanan 4%. Sumber: https://support.google.com/googleplay/android-developer/answer/12570971?hl=en (diakses 2026-11-18)
- **KPPU** (sekunder): 22 Jan 2025 KPPU memerintahkan Google menghentikan kewajiban Google Play Billing, membuka UCB untuk semua developer, potongan biaya minimal 5% selama satu tahun, dan denda Rp202,5 mlr. Sumber: https://techcrunch.com/2025/01/22/google-hit-with-12-6m-fine-in-indonesia-for-monopolistic-practices-in-payment-system (diakses 2026-11-18). Menurut cuplikan pencarian, Mahkamah Agung menolak banding akhir Google sekitar Maret 2026 (Jakarta Post 15 Mar 2026; halaman 403, belum dibaca langsung). Apakah dokumentasi Google sudah menyesuaikan putusan: tidak ditemukan.

**3d. Titik harga Rupiah**

- Apple (terbukti): sampai 800 titik harga baku + 100 titik lebih tinggi atas permintaan; harga diatur dari satu *base storefront* lalu disamakan otomatis ke 174 toko lain; Apple "will never change the price in your base country or region"; toko yang diatur manual tidak lagi disesuaikan Apple. Sumber: https://developer.apple.com/help/app-store-connect/manage-in-app-purchases/set-a-price-for-an-in-app-purchase (diakses 2026-11-18)
- Apple 27 Agu 2026 (terbukti): harga aplikasi dan IAP di Indonesia (serta Israel, Maroko, Kongo) diperbarui per 14 Sep 2026 kecuali Indonesia dipilih sebagai base storefront; langganan auto-renew tidak berubah. Alasan umum: pajak dan kurs. Sumber: https://developer.apple.com/news/?id=artln8br (diakses 2026-11-18)
- **Daftar resmi titik harga IDR tidak ditemukan** di halaman publik (hanya bisa diunduh dari App Store Connect). Titik yang **teramati** di §1–§2 (terbukti sebagai harga tampil, bukan daftar resmi): Rp9rb, 18rb, 19rb, 29rb, 39rb, 45rb, 49rb, 59rb, 65rb, 69rb, 79rb, 99rb, 119rb, 139rb, 149rb, 159rb, 179rb, 199rb, 229rb, 240rb, 259rb, 299rb, 349rb, 359rb, 429rb, 499rb, 569rb, 599rb, 619rb, 799rb. **Rp25rb tidak teramati.**
- Google Play: rentang harga per mata uang ada di tabel https://play.google.com/supported-locations (tidak terbaca alat). Blog Android Developers (Mar 2021) menyebut Indonesia termasuk pasar harga di bawah US$1 dan contoh bundel IDR 3.000. Sumber: https://android-developers.googleblog.com/2021/03/sub-dollar-pricing-expansion-in-20.html (diakses 2026-11-18, data lama)

### 4. Cetak buku fisik

- **Apple 3.1.3(e)** (terbukti): "If your app enables people to purchase physical goods or services that will be consumed outside of the app, you **must use purchase methods other than in-app purchase** to collect those payments, such as Apple Pay or traditional credit card entry." Catatan: **3.1.5** di versi sekarang berjudul "Cryptocurrencies", bukan barang fisik. Pengantar 3.1.3: aplikasi dalam bagian ini tidak boleh mendorong metode bayar selain IAP di dalam aplikasi (kecuali toko AS dan pengecualian 3.1.1(a)/3.1.3(a)). Sumber: https://developer.apple.com/app-store/review/guidelines/ (diakses 2026-11-18)
- **Google Play** (terbukti): penagihan Play **tidak boleh** dipakai bila pembayaran terutama untuk "the purchase or rental of physical goods". Sumber: https://support.google.com/googleplay/android-developer/answer/9858738?hl=en (diakses 2026-11-18)
- Contoh pembanding: Day One ("Print capabilities turn your digital journal into a premium physical book", terbukti dari halaman App Store ID) dan Polarsteps Travel Book (sekunder, §2).
- **Layanan photobook Indonesia** (cek ulang; harga promo sering berubah):

| Layanan | Harga | Catatan | Sumber (diakses 2026-11-18) |
|---|---|---|---|
| IDPhotobook | Square 20×20 cm 40 hlm Rp250rb → promo **Rp150rb**; Landscape 30×20 cm 60 hlm Rp350rb → Rp285rb; Portrait 20×30 cm 40 hlm Rp320rb → Rp260rb; Mini 10×15 cm 30 hlm Rp150rb → **Rp85rb** | Editor web di ponsel, tata letak otomatis, cetak 2–3 hari kerja, kirim seluruh Indonesia; jenis sampul per varian tidak ditulis | https://promo.idphotobook.com/ |
| PrintHUB (Jakarta Utara) | Mulai **Rp100rb** per buku, minimal 1 unit | Cetak digital offset (printer Fujifilm); pesan lewat WhatsApp dengan berkas jadi; tidak ada API | https://www.printhub.co.id/products-promotional-materials/product-buku/product-photobook/ |
| Cetak Photo, Lavanilla | Mulai Rp85rb (soft cover 15×15) s.d. Rp400rb (hard cover + kotak), Lavanilla "Dari Rp180.000" | **Hanya dari cuplikan pencarian**; situs cetakphoto.com tidak bisa dijangkau dari sesi ini | https://cetakphoto.com/catalog/preview/photobook/ · https://lavanilla.id/collections/cetak-foto/photobook |

- API cetak sesuai permintaan (Peecho, Lulu, Cloudprinter, Gelato, photobook.ai) ada, tetapi **tidak ada sumber yang memastikan titik cetak di Indonesia** (sekunder, hasil pencarian 2026-11-18).

### 5. Regulasi Indonesia

**5a. PPN PMSE (terbukti, cek ulang)**

- Halaman DJP "Pajak Digital": pemungut PPN PMSE memungut **12% × DPP nilai lain 11/12** dari nilai yang dibayar pembeli (tarif efektif 11%). Dasar yang dicantumkan antara lain PMK 48/PMK.03/2020 dan PER-12/PJ/2020. **Apple Distribution International Limited** (No. 12) dan **Google Asia Pacific Pte. Ltd.** (No. 4) tercantum sebagai PMSE luar negeri, tanggal pembaruan daftar 31/08/2026. Sumber: https://www.pajak.go.id/id/digitaltax (diakses 2026-11-18)
- Apple 8 Apr 2022: harga App Store Indonesia tidak berubah, tetapi *proceeds* developer **yang berbasis di luar Indonesia** disesuaikan karena PPN naik 10% → 11%. Sumber: https://developer.apple.com/news/?id=3g0zsfvn (diakses 2026-11-18)
- Tafsiran: harga yang tampil di App Store Indonesia sudah termasuk PPN, dan PPN dipotong dari bagian developer. Perlakuan untuk developer **berdomisili Indonesia** (seperti pemilik) tidak ditemukan; tanyakan ke konsultan pajak.
- Cetak buku fisik yang dijual sendiri (di luar IAP) bukan dipungut Apple/Google; kewajiban PPN dan izin PMSE ada di penjual (dugaan, belum diriset).

**5b. PP Tunas, Permenkomdigi 9/2026, Kepmenkomdigi 142/2026**

- Dari riset 17 Nov (tidak dibuka ulang): PP 17/2025 Ps. 7 ayat (2) huruf a melarang praktik terselubung (dark pattern); "eksploitasi Anak sebagai konsumen" adalah salah satu dari tujuh aspek risiko; Permenkomdigi 9/2026 Ps. 15 ayat (1) huruf b–c menyebut produk berbayar sekali bayar atau langganan dan fasilitas pembayaran sebagai indikator; Ps. 26 ayat (4) mengakui "kontrol transaksi *in-app purchase*" dan kontrol pengeluaran akun Anak sebagai mitigasi; KM142 Lampiran I indikator D menyebut gamifikasi (poin, *badge*, *streak*, *daily reward*, *loot box*) sebagai tanda desain menarik bagi Anak.
- **Baru dibaca hari ini: KM142 Lampiran II, tabel parameter** (terbukti, PDF resmi; bobot dalam %, kolom "YA/DITEMUKAN"; PLF = Produk, Layanan, dan Fitur):

| Kode | Parameter (diringkas dekat teks asli) | Bobot | Hal. |
|---|---|---|---|
| EK01 | PLF memiliki fitur yang memfasilitasi pihak lain menawarkan barang/jasa kepada pengguna Anak (indikator menyebut iklan, konten berbayar, atau sejenisnya) | 21,43 | 42 |
| EK02 | Menargetkan pengguna Anak untuk kepentingan finansial/bisnis **pihak lain** (optimasi iklan, penentuan harga, strategi penjualan berdasarkan hasil pemrofilan Anak) | 19,05 | 43 |
| EK03 | Sama dengan EK02 untuk kepentingan **PSE sendiri** | 16,67 | 44 |
| EK04 | PLF menggunakan "*Dark Pattern/Deceptive Design* yang mengarahkan pengguna Anak melakukan tindakan tertentu tanpa kesadaran penuh (contoh: membeli item, berlangganan, membagikan data)"; konfigurasi teknis: desain antarmuka dan arsitektur pilihan, termasuk mekanisme persetujuan, pembelian, dan pembagian data | 14,29 | 45 |
| EK05 | Fitur pembayaran yang memungkinkan pengguna Anak membeli barang/jasa **tanpa verifikasi orang tua/wali** | 11,90 | 46 |
| EK06 | Pembaruan langganan otomatis untuk pengguna Anak tanpa persetujuan/verifikasi orang tua/wali (indikator menyebut pembayaran "baik satu kali maupun secara berlangganan") | 9,52 | 47 |
| EK07 | Fitur yang melibatkan pengguna Anak dalam aktivitas yang menghasilkan keuntungan finansial/bisnis bagi PSE atau pihak ketiga | 7,14 | 48 |
| AD04 | Notifikasi dorong, email, atau pop-up yang mendorong pengguna Anak memakai PLF | 13,25 | 59 |
| AD05 | Elemen peruntungan (undian) dan/atau taruhan kepada pengguna Anak | 11,59 | 60 |
| AD06 | Pemberian insentif/reward (contoh: diskon, voucher, reward dalam gim, fitur eksklusif) kepada pengguna Anak | 9,93 | 61 |
| AD07 | Fitur kompetisi (peringkat, skor, *leaderboard*) yang dapat diakses pengguna Anak | 6,62 | 62 |

  - Bobot EK01–EK07 berjumlah 100. Aspek Adiksi dibaca sampai AD08 (hal. 63); parameter sesudahnya tidak dibaca.
  - Sumber: https://jdih.komdigi.go.id/index.php/produk_hukum/unduh/id/1009/t/keputusan+menteri+komunikasi+dan+digital+nomor+142+tahun+2026 (diakses 2026-11-18)
- Hubungan dengan K-017 (pengguna 18+, perlindungan tingkat anak untuk semua): tafsiran di §Kesimpulan. Penilaian resminya wewenang `penasihat-privasi`.

**5c. UU 8/1999 Perlindungan Konsumen (sekunder: pasal.id berlabel "Berlaku, Sesuai naskah acuan"; teks BPK 403)**

- Ps. 4 huruf c: hak konsumen "atas informasi yang benar, jelas, dan jujur mengenai kondisi dan jaminan barang dan/atau jasa". Sumber: https://pasal.id/peraturan/uu/uu-no-8-tahun-1999/pasal-4 (diakses 2026-11-18)
- Ps. 10: pelaku usaha yang menawarkan barang/jasa dilarang membuat pernyataan tidak benar atau menyesatkan mengenai (a) harga atau tarif, (b) kegunaan, (c) kondisi, tanggungan, jaminan, hak, atau ganti rugi, (d) **tawaran potongan harga atau hadiah menarik**, (e) bahaya penggunaan. Sumber: https://pasal.id/peraturan/uu/uu-no-8-tahun-1999/pasal-10 (diakses 2026-11-18)
- Ps. 62 ayat (1): pelanggaran antara lain Ps. 8, 9, 10, 13 ayat (2), 15, 17, 18 "dipidana dengan pidana penjara paling lama 5 (lima) tahun atau pidana denda paling banyak Rp2.000.000.000,00". Sumber: https://pasal.id/peraturan/uu/uu-no-8-tahun-1999/pasal-62 (diakses 2026-11-18)
- PP 80/2019 (PMSE) Ps. 13 tentang kewajiban informasi benar, jelas, jujur: hanya dari kutipan sekunder (Hukumonline); teks resmi tidak terbuka (503). Lihat "Belum terjawab".

### 6. Dark pattern pembelian dan paywall jujur

- **deceptive.design** (sekunder tepercaya; kosakata, bukan hukum): 18 jenis, termasuk *sneaking*, *forced action*, *hard to cancel*, *preselection*, *hidden subscription*, *hidden costs*, *trick wording*, *visual interference*, *fake social proof*, *fake urgency*, *nagging*, *fake scarcity*, *confirmshaming*, *comparison prevention*, *addictive design*, dan ***currency confusion*** (uang nyata diubah ke mata uang virtual sehingga pengeluaran kabur). Sumber: https://www.deceptive.design/types (diakses 2026-11-18)
- **FTC "Bringing Dark Patterns to Light"** (Sep 2022; siaran pers 15 Sep 2022, terbukti): empat kelompok: iklan terselubung dan urgensi palsu (mis. hitung mundur palsu), sulit membatalkan langganan atau tagihan, menyembunyikan syarat penting dan *junk fees*, menipu agar membagikan data. Sumber: https://www.ftc.gov/news-events/news/press-releases/2022/09/ftc-report-shows-rise-sophisticated-dark-patterns-designed-trick-trap-consumers (diakses 2026-11-18)
- **Jaringan CPC UE, "Key principles on in-game virtual currencies"** (21 Mar 2025, sekunder; *soft law*): harga harus jelas dalam uang nyata untuk mata uang virtual dan item yang dibelinya; hindari praktik yang menyembunyikan biaya. Sumber: https://www.reedsmith.com/articles/qas-on-the-eu-consumer-protection-authorities-joint-guidance-paper/ dan https://esportslegal.news/wp-content/uploads/2025/03/Key-principles-on-in-game-virtual-currencies.pdf (diakses 2026-11-18)
- **Digital Fairness Act UE** (diusulkan 11 Nov 2026, sekunder; masih bisa berubah): daftar hitam dark pattern antara lain kelangkaan palsu ("Only 1 left"), mempermalukan pilihan konsumen ("We're sad to see you go"), pilihan baku yang harus ditolak; harga penuh sejak awal termasuk biaya dan pajak; nilai pembelian dalam aplikasi wajib dalam mata uang nyata; mata uang virtual mati secara baku untuk anak; larangan loot box dan *pay-to-win/pay-to-progress* yang menekan anak. Sumber: https://www.lewissilkin.com/insights/2026/11/11/european-commission-publishes-long-awaited-digital-fairness-act-102o9b5 (diakses 2026-11-18). Hanya berlaku di UE; dicatat sebagai arah regulasi.
- **Pola yang teramati di pasar** (terbukti dari §1–§2, dicatat sebagai contoh, bukan tuduhan): item bernama "SECRET DISCOUNT YEARLY" (Zinnia), "Lifetime Purchase Promo" (ProCCD), banyak varian harga untuk produk bernama sama (1998 Cam, Locket, Day One), mata uang "points" (Kapi), kamera berbayar tanpa penanda sampai diketuk (Dazz, sekunder 2020).

## Kesimpulan

**Fakta bersumber.** Aplikasi kamera retro di App Store Indonesia memakai tiga pola: kamera/aksesori satuan Rp19rb–Rp59rb (Dazz, NOMO, ProCCD, Huji), langganan Rp9rb/minggu sampai Rp359rb/tahun (Kapi, ProCCD, 1998 Cam, NOMO, Kuji), dan sekali bayar untuk semua Rp179rb–Rp799rb (Dazz Rp199rb, ProCCD Rp179–299rb, Kuji Rp299rb, Kapi dan 1998 Cam Rp799rb). Aplikasi jurnal yang diperiksa menjual langganan, bukan paket stiker satuan; Shuffles gratis tanpa IAP. Di Photo & Video, 33% aplikasi menggabungkan langganan dengan lifetime, dan konversi pengguna IN/SEA termasuk yang terendah (median D35 0,7%). Apple mewajibkan IAP untuk konten digital dan mekanisme pulihkan pembelian, mengizinkan uji coba non-langganan lewat item Tier 0, dan melarang memaksa unggah ke media sosial demi hadiah. Barang fisik wajib dibayar di luar IAP (Apple 3.1.3(e)) dan dilarang lewat penagihan Play. Apple dan Google tercatat sebagai pemungut PPN PMSE (12% × 11/12). KM142 memberi bobot risiko pada dark pattern pembelian (EK04), pembayaran tanpa verifikasi orang tua (EK05), langganan otomatis (EK06), undian (AD05), reward atau diskon (AD06), notifikasi pendorong (AD04), dan peringkat (AD07). UU PK Ps. 10 huruf d melarang pernyataan menyesatkan tentang potongan harga.

**Tafsiran (peneliti, bukan keputusan).**
- Struktur di brief (kamera satuan + paket tema + Pas Kolektor sekali bayar, tanpa langganan, gacha, koin, atau iklan) sesuai dengan pola pasar yang paling sederhana. Struktur itu juga menghindari parameter KM142 yang bobotnya terbesar untuk aplikasi tanpa iklan (EK01–EK03, EK06, AD05).
- Yang tetap tersentuh adalah EK05 (fasilitas pembayaran). Untuk aplikasi 18+ dengan perlindungan tingkat anak (K-017), pertanyaannya: apakah verifikasi usia K-017 cukup sebagai jawaban EK05, atau perlu kontrol tambahan seperti persetujuan pembelian keluarga dari platform? Ini wewenang `penasihat-privasi`.
- "Pas Kolektor" yang mencakup "yang terbit nanti" adalah janji konten masa depan. Apple 5.6 melarang menagih "content that are not delivered", dan RevenueCat mencatat risiko kanibalisasi serta beban dukungan jangka panjang. Kalimat cakupannya perlu dirumuskan sempit dan jujur.
- Uji coba kamera di jendela bidik (efek + bodi, hasil tidak bisa disimpan) bukan item IAP, jadi tidak perlu Tier 0 "XX-day Trial". Apple 3.1.1 hanya mengatur uji coba berbasis waktu.

### Tabel "pantas dijual / tidak pantas / nanti" (TAFSIRAN, bukan keputusan; keputusan membuka toko tetap pada pemilik, K-007)

| Item | Penilaian (tafsiran) | Alasan dan sumber pendukung |
|---|---|---|
| Kamera satuan (skin = bodi + LUT + suara) | **Pantas dijual** | Pola utama pasar (§1); kosmetik, tidak mengunci inti. Wajib bisa dicoba di jendela bidik, harga Rupiah penuh di tombol, pulihkan pembelian (3.1.1) |
| Paket tema buku (sampul + hiasan + selotip + kertas) | **Pantas dijual**, dengan syarat opsi editor K-031 tetap gratis | Kosmetik tambahan. Pembanding paket stiker berbayar ada (PicCollage, riset 18 Nov), tetapi jurnal besar memilih langganan (§2), jadi minat belum terbukti di pasar ini |
| Pas Kolektor sekali bayar | **Pantas dijual dengan syarat** | Pola Dazz/ProCCD/Kuji (§1). Syarat: cakupan "terbit nanti" ditulis jelas; perbandingan dengan total harga satuan yang **nyata**, tanpa harga coret (UU PK Ps. 10 d; FTC); tidak menjadi pilihan terpilih lebih dulu (deceptive.design *preselection*; DFA) |
| Mencoba kamera berbayar sebelum beli | **Gratis (bukan dijual)**, disarankan | Mengurangi kesan "terjebak paywall" yang dikeluhkan pada Dazz (TapSmart 2020); Apple 3.1.2(c) dan 5.6 soal kejelasan |
| Memotret, hapus latar, Rapikan, buku dan editor, kota dan landmark, misi dan lencana, gaya kartu share, sinkronisasi | **Tidak dijual** | Inti produk. Menjual kota atau landmark menghalangi koleksi; menjual hapus latar atau kuota menjadi pembatas inti (bukan kosmetik) |
| Langganan (di MVP dan awal toko) | **Tidak pantas untuk sekarang** | 3.1.2(a) menuntut "ongoing value"; KM142 EK06; konversi IN/SEA rendah (RevenueCat). Bisa ditinjau bila ada biaya berjalan nyata (lihat "Nanti") |
| Kotak acak / gacha / undian | **Tidak pantas** | KM142 AD05 (undian); Apple dan Play wajib membuka peluang; DFA menargetkan loot box |
| Koin, poin, mata uang virtual | **Tidak pantas** | *Currency confusion* (deceptive.design); CPC UE dan DFA: harga uang nyata; Kapi menjual "points" sebagai contoh pasar |
| Iklan (termasuk "hapus iklan" berbayar) | **Tidak pantas** | KM142 EK01 bobot terbesar (21,43). ProCCD dan 1998 Cam berlabel "contains advertising"; Kapi kemungkinan beriklan (dugaan, §1) |
| Hapus watermark berbayar | **Tidak pantas** | Tafsiran: menjadikan share lebih buruk untuk yang tidak membayar; kartu share adalah jalur pertumbuhan (riset kartu share 18 Nov) |
| Hadiah atau diskon untuk berbagi, streak, atau undang teman | **Tidak pantas** | Apple 3.1.2(a) ("posting on social media ... checking in"); KM142 AD06 (reward/diskon); riset tinjauan privasi 18 Nov (Tambah Punyamu tanpa hadiah) |
| Hitung mundur, "promo terbatas", harga coret, "diskon rahasia" | **Tidak pantas** | UU PK Ps. 10 huruf d; FTC (urgensi palsu); deceptive.design; DFA |
| Notifikasi promo / pop-up beli berulang | **Tidak pantas** | KM142 AD04, EK04; deceptive.design *nagging* |
| Harga atau penawaran berbeda per pengguna (berdasarkan perilaku) | **Tidak pantas** | KM142 EK02–EK03 (pemrofilan); K-017 tanpa pemrofilan |
| Cetak buku fisik | **Nanti** | Boleh di luar IAP (3.1.3(e)), wajib di luar Play Billing. Butuh gateway pembayaran Indonesia, mitra cetak (Rp85rb–Rp285rb promo per buku di IDPhotobook; mulai Rp100rb PrintHUB), logistik, PPN dan izin PMSE, dan data pribadi alamat kirim (menyentuh K-017/UU PDP). Beban berat untuk developer solo |
| Hadiahkan kamera/tema ke teman | **Nanti** | Apple 3.1.1 mengizinkan gifting; menyentuh fitur sosial K-008 |
| "Traktir developer" (tip) | **Nanti** | Apple 3.1.1 mengizinkan tip lewat IAP; belum diriset untuk Play |
| Langganan berbasis biaya nyata (mis. ruang cloud lebih besar) | **Nanti**, hanya bila biaya storage menekan (spesifikasi §9 risiko 4) | Contoh "cloud support" di 3.1.2(a) |

### Saran kisaran harga (TAFSIRAN, **cek ulang** di App Store Connect dan Play Console saat toko dibuka)

| Item | Kisaran saran | Patokan pasar (§1) | Catatan |
|---|---|---|---|
| Kamera satuan | **Rp19rb–Rp29rb**; kamera paling istimewa paling tinggi Rp39rb | Dazz Rp19–59rb, NOMO Rp19–39rb, ProCCD/Huji Rp19rb | Contoh brief Rp29rb dan Rp39rb ada di separuh atas pasar. Rp19rb sama dengan titik terendah yang umum |
| Paket tema buku | **Rp15rb–Rp29rb** | Tidak ada pembanding paket stiker di aplikasi yang diperiksa | **Rp25rb tidak teramati sebagai titik harga Apple**; yang teramati Rp19rb dan Rp29rb. Pastikan di daftar titik harga App Store Connect |
| Pas Kolektor | **Rp99rb–Rp199rb**, dan lebih murah dari total harga satuan yang benar-benar dijual | Dazz Rp199rb; ProCCD Rp179rb (promo) dan Rp299rb; Kuji Rp299rb | Contoh brief Rp149rb ada dalam kisaran. Saran RevenueCat: bila ragu, lebih tinggi. Bila katalog kecil saat toko dibuka, harga Pas yang terlalu jauh di bawah total satuan memperbesar kanibalisasi |

## Belum terjawab

- **Harga Google Play Indonesia** semua aplikasi di §1–§2 dan rentang harga min/maks IDR di Play (halaman Play tidak terbaca; tabel supported-locations tidak terbaca).
- **Daftar resmi titik harga App Store dalam IDR** (hanya di App Store Connect), termasuk apakah Rp25.000 tersedia.
- Periode langganan "Dazz Pro Rp69rb", isi Locket Gold dan Photo Pack, isi "Extra Options" Huji selain impor foto.
- Apakah Dazz, NOMO, atau ProCCD **sekarang** membolehkan mencoba kamera berbayar sebelum membeli (sumber terbaru tidak ada; TapSmart 2020).
- Harga paket stiker/tema satuan di PicCollage atau aplikasi scrapbook lain di toko Indonesia.
- Harga Travel Book Polarsteps dan cetak Day One untuk pengiriman ke Indonesia.
- Perlakuan PPN dan PPh untuk **developer perorangan berdomisili Indonesia** atas penjualan lewat App Store dan Play.
- Teks resmi PP 80/2019 Ps. 13 dan pasal penawaran elektronik (peraturan.go.id 503); status Permendag 31/2023.
- Apakah dokumentasi Google Play sudah mengikuti putusan KPPU/MA (UCB untuk semua developer, potongan ≥ 5%); teks putusan MA tidak dibaca.
- Parameter KM142 aspek Adiksi setelah AD08 dan aspek lain yang relevan dengan pembelian.
- Gateway pembayaran Indonesia (mis. untuk cetak buku) dan syarat izinnya: tidak diriset.
- Family Sharing untuk item non-consumable di App Store dan padanannya di Play: tidak diriset.
- Konversi atau tingkat pembelian untuk aplikasi yang **hanya** menjual item sekali bayar (tanpa langganan): tidak ditemukan data.
