# Cek nama "Kliping Kota": merek, domain, media sosial, toko, bundle ID

> Diriset: 2026-11-20 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: status merek (data WIPO untuk Indonesia hanya sampai 30 Okt 2026, dan PDKI belum terbaca langsung), ketersediaan domain (bisa dibeli orang lain kapan saja), handle media sosial, daftar aplikasi di toko, semua harga domain (promo berubah).
> Dipakai oleh: K-023 (konsekuensi "cek PDKI, domain, media sosial"), Q-015 (bundle ID final)

## Pertanyaan

1. Adakah merek terdaftar atau dimohonkan di Indonesia yang sama atau mirip "Kliping Kota", terutama kelas 9 dan 42 (juga 35 dan 41)?
2. Apakah domain `klipingkota.com`, `.id`, `.app`, `.co.id`, `.my.id` masih tersedia, dan berapa kisaran harganya?
3. Apakah handle `@klipingkota` (dan varian) sudah dipakai di Instagram, TikTok, X, YouTube, Threads?
4. Adakah aplikasi bernama sama/mirip, atau ID paket `id.klipingkota.*`, di Google Play dan App Store?
5. Bundle ID mana yang paling masuk akal: `id.klipingkota.app`, `com.klipingkota.app`, atau `id.potret.app`?

## Cara pencarian (dibaca dulu)

- Semua akses dilakukan 2026-11-20 dari sesi cloud, dengan User-Agent generik. Tidak ada akun dibuat, tidak ada formulir registrar diisi, tidak ada yang dibeli.
- **PDKI** (`pdki-indonesia.dgip.go.id`) diblokir layanan keamanan Imperva/Incapsula dari jaringan sesi ini (rincian di Temuan 1). Sebagai gantinya dipakai **WIPO Global Brand Database**, yang memuat data DGIP Indonesia. Artinya hasil merek di bawah **bukan hasil PDKI langsung**.
- **WIPO** dibuka dengan Chromium + Playwright (halaman memakai tantangan ALTCHA yang lolos otomatis di peramban, tanpa klik). Hasil dibaca dari halaman yang dirender, dengan filter kantor `fcoffice=ID` (DGIP).
- **Domain**: RDAP registri (Verisign untuk .com/.net, Google Registry untuk .app, PANDI untuk .id) dan DNS-over-HTTPS Google (`dns.google/resolve`). 404 RDAP + NXDOMAIN = belum terdaftar saat dicek.
- **Media sosial**: ambil halaman profil publik dengan `curl`, dibandingkan dengan **kontrol** (akun yang pasti ada dan handle acak yang pasti tidak ada).
- **Toko**: iTunes Search/Lookup API dan halaman pencarian/detail Google Play.

## Temuan 1: merek

### PDKI tidak terjangkau (terbukti)

- `curl https://pdki-indonesia.dgip.go.id/` → HTTP 302 ke halaman "Loading" berisi skrip `/_Incapsula_Resource`. `.../search?type=trademark&keyword=kliping%20kota` → HTTP 200 berisi hanya skrip Incapsula (tanpa isi).
- Chromium + Playwright lewat proxy sesi → HTTP 403, halaman **"Access denied · Error 15 · This request was blocked by our security service"**, Powered by Imperva, waktu 2026-11-20 06:21:57 UTC, Incident ID `2211000070478396802-238643192157897203`.
- `https://pdki-indonesia.dgip.go.id/api/search?keyword=kliping&type=trademark` → HTTP 403 (Incapsula). Host `pdki-indonesia-api.dgip.go.id` tidak ada di DNS (NXDOMAIN dari `dns.google`).
- Label: **terbukti** bahwa PDKI tidak bisa dicek dari sesi cloud. Hasil PDKI **tidak ditebak**.

### WIPO Global Brand Database, data Indonesia

- Cakupan DGIP (Indonesia) di WIPO: 2.008.814 catatan, **dari 25 Mar 1961 sampai 30 Okt 2026**.
  - Sumber: https://branddb.wipo.int/en/coverage (diakses 2026-11-20)
- Hasil pencarian nama merek, filter kantor ID (semua **terbukti** dari halaman hasil WIPO):

| Kueri (strategi WIPO) | Hasil di kantor ID | Catatan |
|---|---|---|
| "kliping" (kata utuh) | **0** | Seluruh dunia: 5 hasil, tidak ada yang di Indonesia (KLIPING di Brasil kelas 18, 25, 35; "Internet kliping" di Serbia kelas 35, 38, 42) |
| "kliping\*" (wildcard) | 0 | |
| "klipingkota" (fuzzy, mirip ejaan) | 1 | `KELILINGKOTA est 2024 Nasi Mandhi + LOGO`, Abdul Kamil Alatas, **kelas 43** (restoran), Registered 18 Mar 2025, IDM001306173. Seluruh dunia juga hanya hasil ini |
| "klipingkota" (phonetic, mirip bunyi) | 0 | |
| "kliping kota" (kata utuh) | 0 yang memuat "kliping" | Kueri dua kata dibaca sebagai OR; seluruh dunia 1.359 hasil karena kata "kota" |
| "kliping" (fuzzy) | 163 | Tidak ada satu pun yang memuat "kliping". Isinya KIPLING, KEEPING, KELILING, KLIRING, CRIPING, KLINTING, dsb. |
| "kliping" (phonetic) | 42 | Tidak ada yang memuat "kliping". Isinya KELABANG, CLUBBING, GELAPUNG, dsb. |
| "clipping" / "cliping" / "klipping" (kata utuh) | 0 / 0 / 0 | |
| "klip" (kata utuh) | 31 | Lihat tabel berikut |

- Hasil yang paling dekat dan berada di kelas 9, 35, 41, atau 42 (dari kueri di atas):

| Merek | Pemilik | Kelas | Status (WIPO) | Nomor |
|---|---|---|---|---|
| klip.id | PT. AIDI DIGITAL GLOBAL | 42 | Registered (8 Agu 2024) | IDM001201691 |
| TERNAK KLIP | Mohammad Bayu Farhannanta | 35 | Registered (20 Apr 2026) | JID2025094139 |
| TERNAK KLIP LOGO | Mohammad Bayu Farhannanta | 35 | Registered (27 Okt 2026) | IDM001528337 |
| KKI KOMUNITAS KLIP INDONESIA | Louis Alfian Wibowo | 35 | Registered (3 Agu 2026) | IDM001489522 |
| DE KLIP | PT Cipta Televisi Pendidikan Indonesia | 41 (juga 16, 18, 25) | Expired (14 Agu 2019) | IDM000306192 |
| Keliling.id & Lukisan | PT. Tera Global Karya | 9, 35 | Registered (3 Apr 2023) | IDM001071653 |
| BLIVING | PT. Grha Digital Indonesia | 9, 11, 42, 45 | Registered (14 Jul 2021) | IDM000872423 |
| 100 HARI KELILING INDONESIA | PT. Gramedia Media Nusantara | 9 (juga 41) | Registered (27 Jul 2015) | IDM000486783 |
| Kliring Komoditi Indonesia | PT Kliring Komoditi Indonesia | 36, 42 | Registered (27 Jan 2026) | JID2025072744 |
| KIPLING | VF International SAGL | 35 | Registered (29 Des 2022) | IDM000481457 |
| SNIPSNAPZ KEEPING MEMORIES | Twister Technologies Sdn Bhd | 42 | Expired (7 Feb 2023) | IDM000482915 |

  - Sumber: https://branddb.wipo.int/en/similarname/results (kueri `brandName` dengan strategi Simple/Fuzzy/Phonetic dan `fcoffice=ID`, diakses 2026-11-20). Contoh URL: `https://branddb.wipo.int/en/similarname/results?sort=score%20desc&start=0&rows=100&asStructure={"boolean":"AND","bricks":[{"key":"brandName","value":"kliping","strategy":"Fuzzy"}]}&fcoffice=ID`

### Tafsiran (bukan fakta)

- Tidak ada merek "Kliping", "Kliping Kota", atau "Klipingkota" di data Indonesia sampai 30 Okt 2026. Merek terdekat ("KELILINGKOTA", kelas 43 restoran) berbeda kelas dan berbeda arti; risiko kebingungan rendah.
- Merek berunsur "klip" di kelas 35/42 (klip.id, Ternak Klip) memakai kata "klip" (potongan video), bukan "kliping". "Ternak Klip" juga ada sebagai aplikasi di kedua toko (lihat Temuan 4). Kemiripannya parsial; menurut saya tidak menghalangi, tetapi itu tafsiran awam, bukan pendapat ahli merek.
- "Kliping" adalah kata umum (guntingan berita; tugas sekolah). Unsur pembeda "Kliping Kota" bisa dianggap lemah oleh pemeriksa merek (Pasal 20 UU 20/2016, lihat riset 17 Nov). Ini **dugaan**; perlu pendapat konsultan KI.
- Celah data: permohonan yang diajukan setelah 30 Okt 2026, atau yang belum diumumkan DGIP, tidak terlihat di WIPO.

## Temuan 2: domain

### Fakta (semua terbukti, dicek 2026-11-20)

| Domain | RDAP | DNS (NS dan A) | Status |
|---|---|---|---|
| klipingkota.com | 404 (rdap.verisign.com dan rdap.org) | NXDOMAIN | Belum terdaftar |
| klipingkota.id | 404 "Domain Not Found" (rdap.pandi.id) | NXDOMAIN | Belum terdaftar |
| klipingkota.app | 404 "klipingkota.app not found" (pubapi.registry.google) | NXDOMAIN | Belum terdaftar |
| klipingkota.co.id | 404 (rdap.pandi.id) | NXDOMAIN | Belum terdaftar |
| klipingkota.my.id | 404 (rdap.pandi.id) | NXDOMAIN | Belum terdaftar |
| klipingkota.net | 404 (rdap.verisign.com) | NXDOMAIN | Belum terdaftar |
| klipingkota.org | 404 (rdap.org) | NXDOMAIN | Belum terdaftar |
| kliping.com | 200, didaftarkan 24 Agu 2003, berakhir 24 Agu 2027 | — | Milik pihak lain |
| kliping.id | 200, didaftarkan 17 Jun 2020, berakhir 17 Jun 2027 | — | Milik pihak lain |
| kliping.app | 404 | — | Belum terdaftar |
| potret.id | 200, didaftarkan 18 Agu 2014, berakhir 18 Agu 2027 | — | Milik pihak lain |
| potret.com | 200, didaftarkan 9 Nov 2003, berakhir 13 Agu 2027 | — | Milik pihak lain |
| potret.app | 404 | — | Belum terdaftar |

- Sumber: `https://rdap.verisign.com/com/v1/domain/<nama>`, `https://pubapi.registry.google/rdap/domain/<nama>`, `https://rdap.pandi.id/rdap/domain/<nama>`, `https://rdap.org/domain/<nama>`, `https://dns.google/resolve?name=<nama>&type=NS` (semua diakses 2026-11-20)
- Catatan: 404 RDAP berarti tidak ada di basis data registri saat dicek. Domain premium atau yang dicadangkan registri tetap bisa ditolak saat checkout; ini tidak dicek.

### Harga dan syarat (cek ulang sebelum dipakai)

- **.com**: Cloudflare Registrar US$10,46/tahun (daftar dan perpanjang), menurut situs pemantau harga pihak ketiga (diperbarui 2026-11-19). Hostinger ID: Rp109.900 tahun pertama, Rp209.900 tahun berikutnya. Rumahweb: promo Rp121.900, perpanjang Rp195.000 (dari agregator whtop).
  - Sumber: https://cfdomainpricing.com/ · https://www.hostinger.com/id/tld/domain-id · https://www.whtop.com/id/plans/rumahweb.com/82985 (diakses 2026-11-20)
- **.app**: Cloudflare Registrar US$8,20 daftar, US$14,20 perpanjang (pihak ketiga, sama seperti di atas). Seluruh .app ada di daftar HSTS preload, jadi situs wajib HTTPS.
  - Sumber: https://cfdomainpricing.com/ · https://get.app/ (diakses 2026-11-20)
- **.id**: Hostinger ID Rp189.900 atau Rp210.900 tahun pertama (halaman tidak konsisten), perpanjang mulai Rp252.900. Agregator menyebut kisaran umum sekitar Rp300.000/tahun. Hostinger menulis .id, .my.id, .web.id tidak butuh dokumen khusus. Halaman syarat PANDI (`pandi.id/syarat-pendaftaran/`) mengembalikan HTTP 503, jadi syarat resmi **belum terbaca** (dugaan: KTP mungkin tetap diminta registrar untuk WNI).
  - Sumber: https://www.hostinger.com/id/tld/domain-id (diakses 2026-11-20)
- **.co.id**: sekitar Rp300.000–320.000/tahun (agregator, dugaan). Butuh dokumen badan usaha (Hostinger menyebut SIUP, TDP, KTP; sekarang umumnya NIB). Pemilik adalah developer perorangan, jadi .co.id kemungkinan **tidak bisa** didaftarkan tanpa badan usaha (tafsiran).
- **.my.id**: sekitar Rp9.000–16.900 tahun pertama, perpanjang sekitar Rp27.900 (agregator GoodStats dan Hostinger, dugaan).
  - Sumber: https://goodstats.id/article/domain-id-di-indonesia-2026-uAhrP (diakses 2026-11-20, lewat hasil pencarian)

## Temuan 3: media sosial

| Platform | Handle | Hasil | Kontrol | Label |
|---|---|---|---|---|
| YouTube | @klipingkota, @kliping.kota | HTTP 404 "404 Not Found" | @youtube → 200; handle acak → 404 | **Terbukti** tidak ada channel dengan handle ini |
| X | @klipingkota, @kliping_kota | HTTP 404 "User Profile Not Found" | @x dan @elonmusk → 200 dengan nama profil | **Terbukti** tidak ada profil aktif. Akun yang ditangguhkan/dinonaktifkan bisa tetap menahan handle (tidak bisa dipastikan) |
| TikTok | @klipingkota, @kliping.kota | Data halaman `"statusCode":10221`, tanpa `uniqueId` | @tiktok → `statusCode 0` + `uniqueId`; handle acak → 10221 | **Terbukti** tidak ada profil publik; apakah handle bisa didaftarkan tidak bisa dipastikan tanpa membuat akun |
| Instagram | @klipingkota, @kliping.kota | Dialihkan ke halaman login | Akun @instagram juga dialihkan ke login | **Tidak bisa dipastikan** |
| Threads | @klipingkota | HTTP 200, halaman kosong tanpa judul profil | Akun yang pasti ada juga tanpa judul | **Tidak bisa dipastikan** (Threads memakai handle Instagram) |

- Varian `@klipingkota.app` tidak dicek terpisah (tidak berarti bila `@klipingkota` tersedia).
- Pencarian web `"klipingkota" OR "kliping kota"` dan `instagram "klipingkota"`: tidak ada situs, produk, atau akun bernama "klipingkota". Yang muncul hanya "kliping berita" milik pemerintah daerah (misalnya "Kliping Digital Surakarta", kliping BPS Jakarta Selatan 2017).
  - Sumber: https://etd.repository.ugm.ac.id/home/detail_pencarian_downloadfiles/371541 · https://jakselkota.bps.go.id/en/news/2017/01/27/35/kliping-berita-online-edisi-tanggal-27--28--29-januari-2017.html (diakses 2026-11-20)

## Temuan 4: toko aplikasi

### App Store (iTunes Search API, terbukti)

- `term=kliping kota`, `country=id`: **0 hasil**. `term=klipingkota`, `country=id`: 0 hasil. (Di `country=us` kedua kueri hanya mengembalikan aplikasi acak tanpa kata "kliping".)
- `term=kliping`, `country=id`: 23 hasil. Yang memuat kata itu hanya **"Kliping"** (Kliping d.o.o., `si.kliping.kliping`, News, rilis 2011-05-04). Juga "Ternak Klip" (PT Media Klip Nusantara, `com.ternakklip.app`, Lifestyle, 2026-04-24). Di `country=us` juga muncul "Ninamedia" (Ninamedia Kliping doo Novi Sad, News).
- Lookup bundle ID `id.klipingkota.app`, `com.klipingkota.app`, `id.klipingkota`, `com.klipingkota`, `id.potret.app` (`country=id`): semuanya **0 hasil**.
  - Sumber: https://itunes.apple.com/search?term=kliping&country=id&entity=software&limit=25 · https://itunes.apple.com/search?term=kliping+kota&country=id&entity=software · https://itunes.apple.com/lookup?bundleId=id.klipingkota.app&country=id (diakses 2026-11-20)
- Catatan: lookup hanya menemukan aplikasi yang sudah terbit dan tersedia di negara itu. Bundle ID yang sudah didaftarkan developer lain tetapi belum terbit tidak terlihat.

### Google Play (terbukti)

- `q=kliping kota`: 50 nama terbaca, tidak ada yang memuat "Kliping" (isinya gim membangun kota, Gojek, Grab).
- `q=klipingkota`: halaman berisi "Tidak ada hasil untuk klipingkota".
- `q=kliping`: 15 nama terbaca; yang memuat kata itu hanya "Kliping" (`si.kliping.kliping`). Juga "Ternak Klip" (`com.ternakklip.app`), "Klippod", "KlipC".
- Halaman detail `id.klipingkota.app`, `com.klipingkota.app`, `id.klipingkota`, `id.potret.app`: semuanya HTTP 404 "Tidak Ditemukan" (kontrol `si.kliping.kliping` → 200).
  - Sumber: https://play.google.com/store/search?q=kliping&c=apps&hl=id&gl=ID · https://play.google.com/store/search?q=klipingkota&c=apps&hl=id&gl=ID · https://play.google.com/store/apps/details?id=id.klipingkota.app (diakses 2026-11-20)
- Catatan: 404 hanya berarti tidak ada aplikasi publik dengan ID itu di Play untuk wilayah ID. ID yang sudah dipakai di Play Console orang lain (draf, aplikasi dihapus) tidak terlihat.

## Temuan 5: aturan bundle ID

- **Android**: "Once you publish your app, you should never change the application ID. If you change the application ID, Google Play Store treats the upload as a completely different app." Aturan nama: minimal dua segmen, setiap segmen diawali huruf, karakter hanya `[a-zA-Z0-9_]` (tanpa tanda hubung). Disarankan sama dengan `namespace`. Halaman tidak mewajibkan pemilikan domain.
  - Sumber: https://developer.android.com/build/configure-app-module (diakses 2026-11-20)
- **iOS**: bundle ID hanya alfanumerik, tanda hubung, dan titik; "Typically, you use a reverse-DNS format"; tidak peka huruf besar/kecil. "After you upload a build to App Store Connect, you can't change the bundle ID or delete the associated explicit App ID in your developer account."
  - Sumber: https://developer.apple.com/documentation/bundleresources/information-property-list/cfbundleidentifier (diakses 2026-11-20, lewat JSON dokumentasi)

### Tafsiran: perbandingan tiga kandidat

| Kandidat | Domain asal (reverse-DNS) | Kelebihan | Kekurangan |
|---|---|---|---|
| `id.klipingkota.app` | klipingkota.id (tersedia) | Sesuai usulan Q-015; menandai produk Indonesia; domain .id tersedia dan tanpa syarat badan usaha (dugaan) | Mengikat nama publik selamanya; bila K-023 diganti, ID tetap memuat nama lama (tidak terlihat pengguna, hanya kosmetik) |
| `com.klipingkota.app` | klipingkota.com (tersedia) | Pola paling umum; .com paling murah dan paling dikenal | Sama soal nama; tidak ada keunggulan nyata dibanding .id untuk pasar Indonesia |
| `id.potret.app` | potret.id (**milik pihak lain** sejak 2014) | Netral terhadap pergantian nama publik | Melanggar kebiasaan reverse-DNS (domainnya milik orang lain); tidak bisa dipakai untuk App Links/Universal Links atas nama itu |

- Bundle ID tidak wajib cocok dengan domain milik sendiri (tidak ada aturan itu di dua halaman resmi di atas). Kecocokan berguna untuk tautan (Android App Links `assetlinks.json`, iOS Universal Links `apple-app-site-association`, tautan login Supabase) dan untuk menghindari tabrakan dengan pemilik domain (tafsiran).

## Kesimpulan

**Fakta bersumber**: di data merek Indonesia yang dimuat WIPO (sampai 30 Okt 2026) tidak ada merek "Kliping", "Kliping Kota", atau "Klipingkota"; merek terdekat adalah "KELILINGKOTA" (kelas 43, restoran) dan merek berunsur "klip" di kelas 35/42 (klip.id, Ternak Klip). PDKI sendiri diblokir Imperva dari sesi ini (Error 15) dan **belum dicek langsung**. Domain `klipingkota.com`, `.id`, `.app`, `.co.id`, `.my.id`, `.net`, `.org` semuanya belum terdaftar (RDAP 404 + NXDOMAIN); `kliping.com`, `kliping.id`, dan `potret.id` sudah milik pihak lain. Handle `klipingkota` tidak dipakai di YouTube, X, dan TikTok; Instagram dan Threads tidak bisa dipastikan. Di kedua toko tidak ada aplikasi "Kliping Kota" atau ID `id.klipingkota.*`/`com.klipingkota.*`; yang ada hanya "Kliping" (aplikasi berita Slovenia) yang sudah tercatat di riset 17 Nov.

**Tafsiran**: nama **aman (risiko rendah)**, dengan dua catatan: (1) hasil merek baru final setelah PDKI dicek langsung dari jaringan Indonesia/peramban biasa, dan (2) kata "kliping" bersifat umum sehingga daya pembeda untuk pendaftaran merek perlu ditanyakan ke konsultan KI. Rekomendasi: amankan **klipingkota.id** (sekitar Rp190.000–300.000/tahun) sebagai domain utama dan **klipingkota.com** (sekitar US$10,5 atau Rp110.000–210.000/tahun) sebagai domain pelindung; `.app` (US$8,2, perpanjang US$14,2) opsional. Bundle ID: **`id.klipingkota.app`** untuk Android dan iOS, sesuai usulan Q-015 dan cocok dengan domain .id yang dibeli. Keputusan final tetap lewat `/catat-keputusan`, dan sebaiknya dilakukan setelah domain benar-benar dimiliki dan PDKI dicek, karena ID permanen begitu build pertama diunggah.

## Belum terjawab

- **PDKI langsung**: dicek manual oleh pemilik di https://pdki-indonesia.dgip.go.id (peramban biasa, jaringan Indonesia), kata kunci "kliping", "kliping kota", "klipingkota", kelas 9, 35, 41, 42. Termasuk permohonan setelah 30 Okt 2026.
- **Instagram dan Threads**: ketersediaan `@klipingkota` hanya bisa dipastikan dari aplikasi/akun yang login (misalnya mencoba mengganti username akun uji tanpa menyimpan).
- **Handle yang ditahan**: X dan TikTok bisa menahan handle akun yang ditangguhkan/dihapus; ketersediaan nyata baru pasti saat mendaftar.
- **Syarat resmi PANDI** untuk .id dan .co.id (halaman PANDI HTTP 503 saat diakses).
- **Daya pembeda "Kliping Kota"** sebagai merek (Pasal 20 UU 20/2016) dan kelas yang perlu didaftarkan: butuh konsultan KI.
- **Bundle ID yang terdaftar tapi belum terbit** di akun developer lain (App Store Connect/Play Console) tidak bisa dilihat dari luar; baru pasti saat mendaftarkan App ID/aplikasi.
