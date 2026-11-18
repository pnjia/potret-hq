# Sumber stiker hiasan: lisensi, kecocokan tema v5, dan risiko

> Diriset: 2026-11-18 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: syarat lisensi setiap situs (bisa diubah sepihak, terutama Streamline, unDraw, rawpixel, Pixabay), status hak cipta per berkas (label "public domain" di agregator tidak dijamin), teks resmi UU 28/2014 dan Permenkominfo 21/2012 (dibaca dari salinan OCR pihak ketiga), status merek dagang label lama di PDKI. **Bukan nasihat hukum.** Tafsir hukum final ada di `penasihat-privasi` atau ahli HKI.
> Dipakai oleh: belum (pertanyaan pemilik soal stiker hiasan sampul dan halaman). Terkait K-024, K-030 (logika lisensi suara), K-025 (freemium), K-017 (tidak kekanak-kanakan), usulan v5 `docs/desain/usulan-v5-karcis-kliping.md` §2, §3.4–3.5, §4.

## Pertanyaan

1. Sumber gambar atau stiker gratis mana yang lisensinya mengizinkan pemakaian **komersial** (K-025) **tanpa kewajiban atribusi yang ikut ke kartu share** (logika K-024)?
2. Bagaimana lisensi pustaka ikon, emoji, dan ilustrasi populer (OpenMoji, Twemoji, Noto Emoji, Fluent Emoji, Streamline, unDraw, Humaaans, Open Peeps), dan apakah cocok dengan tema v5 "Karcis & Kliping"?
3. Adakah efemera Indonesia (perangko, karcis, label, iklan Hindia Belanda atau Indonesia awal) yang berstatus domain publik, dan apa dasarnya per sumber?
4. Risiko apa yang tersisa walau lisensinya CC0 atau domain publik: merek dagang, potret orang, masa perlindungan dan hak moral menurut UU 28/2014?
5. Bagaimana biaya dan risiko sumber luar dibanding paket stiker hiasan buatan sendiri?

## Cara pencarian (dibaca dulu)

- Semua sumber diakses **2026-11-18**.
- Sumber primer lebih dulu. Beberapa situs resmi menolak pengambilan otomatis: si.edu dan dashboard.si.edu (403), metmuseum.org (429), rawpixel.com (403), openverse.org (403). Untuk situs itu dipakai salah satu dari:
  - repositori resmi lembaga di GitHub (Met, Openverse);
  - **cuplikan hasil mesin pencari** dari halaman resmi. Ini ditandai "(cuplikan pencarian)" dan perlu dibuka manual sebelum dipakai untuk keputusan.
- Teks undang-undang dibaca dari pasal.id, salinan OCR pihak ketiga yang menandai halamannya "Diproses, belum ditinjau". Salinan resmi ada di https://peraturan.go.id/files/uu28-2014bt.pdf (tidak dibuka).
- Tidak ada aset yang diunduh atau disalin ke repo.

---

## Temuan 1: sumber CC0 dan domain publik

### Fakta

- **Teks resmi CC0 1.0** (dasar bagi Kenney, Smithsonian, Met, Rijksmuseum, Nationaal Archief, Open Peeps, Humaaans)
  - Pelepasan hak berlaku "for any purpose whatsoever, including without limitation commercial, advertising or promotional purposes" (§2).
  - "No trademark or patent rights held by Affirmer are waived, abandoned, surrendered, licensed or otherwise affected" (§4(a)).
  - "Affirmer disclaims responsibility for clearing rights of other persons that may apply to the Work or any use thereof" (§4(c)). §1 menyebut hak yang dimaksud, antara lain "publicity and privacy rights pertaining to a person's image or likeness depicted in a Work".
  - Sumber: https://creativecommons.org/publicdomain/zero/1.0/legalcode.en (diakses 2026-11-18)

- **Public Domain Mark 1.0 (PDM)** (dipakai Openverse dan banyak arsip). PDM adalah **penanda status**, bukan pelepasan hak oleh pemilik.
  - "This work has been identified as being free of known restrictions under copyright law".
  - "You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission."
  - Batasannya: "Persons may have other rights in or related to the work, such as patent or trademark rights"; hak "publicity, image, or privacy rights"; "The work may not be free of known copyright restrictions in all jurisdictions."; "In some jurisdictions moral rights of the author may persist beyond the term of copyright."; "the person who identified the work makes no warranties about the work".
  - Sumber: https://creativecommons.org/publicdomain/mark/1.0/ (diakses 2026-11-18)

- **Openverse** (mesin pencari agregator, bukan pemilik karya)
  - Filter lisensi di antarmuka memuat "CC0" dan "Public Domain Mark", serta filter jenis pemakaian "Use commercially" dan "Modify or adapt" (string `filters.licenses.cc0`, `filters.licenses.pdm`, `filters.licenseTypes.commercial`, `filters.licenseTypes.modification`).
  - Penafian resmi: "Openverse does not verify licensing information for individual works, or whether the generated attribution is accurate or complete." dan "Please independently verify the licensing status and attribution information before reusing the content." Juga: "Openverse can not guarantee the accuracy of license information. Always verify that the work is actually under a CC license."
  - Sumber: https://raw.githubusercontent.com/WordPress/openverse/main/frontend/i18n/data/en.json5 (diakses 2026-11-18); penafian yang sama di https://docs.openverse.org/api/reference/made_with_ov.html (diakses 2026-11-18)

- **Kenney** (aset gim)
  - "all game assets on the asset pages are public domain licensed (CC0)"; "You're free to use them, even in commercial projects."; "Attribution is not required."
  - Sumber: https://kenney.nl/support (diakses 2026-11-18)
  - Katalog memuat tag "UI" dan kategori "Textures"; nama paket yang mungkin relevan: "Scribble Platformer Expansion", "Pattern Pack Extra". Gaya paket tidak terverifikasi dari halaman daftar.
  - Sumber: https://kenney.nl/assets (diakses 2026-11-18)

- **Smithsonian Open Access** (halaman resmi 403; **cuplikan pencarian**)
  - FAQ: "you may use Smithsonian Open Access assets designated as CC0 for commercial purposes without any attribution, permission, or fee paid to the Smithsonian."
  - FAQ: "CC0 only applies to copyright so you may still need someone else's permission to use a CC0-designated digital asset"; pemakaian komersial "might be affected by other restrictions, such as publicity rights, trademark law or even criminal law."
  - Aset **tanpa** tanda CC0 butuh izin tertulis untuk pemakaian komersial (cuplikan dari halaman National Portrait Gallery: "You may not use any assets with usage conditions for commercial purposes").
  - Sumber: https://dashboard.si.edu/openaccess/faq dan https://npg.si.edu/es/node/147453 (cuplikan pencarian, diakses 2026-11-18)
  - Catatan: Smithsonian punya National Postal Museum (koleksi perangko dan efemera pos). Halaman hak reproduksinya (https://postalmuseum.si.edu/rights-and-reproductions) menolak diambil (403), jadi status CC0 koleksi perangkonya **belum terverifikasi**.

- **The Met Open Access** (halaman kebijakan 429; dipakai README GitHub resmi dan **cuplikan pencarian**)
  - README dataset: "The Metropolitan Museum of Art has waived all copyright and related or neighboring rights to this dataset" (CC0), untuk "unrestricted commercial and noncommercial use". README menegaskan "Images are not included and are not part of the dataset" dan "You must not use The Metropolitan Museum of Art's trademarks".
  - Sumber: https://github.com/metmuseum/openaccess (diakses 2026-11-18)
  - Syarat penggunaan (cuplikan pencarian): materi bertanda Open Access boleh dipakai "for any purpose, including commercial and noncommercial use, free of charge and without requiring permission" di bawah CC0. Gambar karya yang masih berhak cipta hanya untuk pemakaian nonkomersial terbatas. Penanda: ikon Open Access di kiri bawah gambar.
  - Sumber: https://www.metmuseum.org/policies/terms-and-conditions dan https://www.metmuseum.org/en/policies/image-resources (cuplikan pencarian, diakses 2026-11-18)

- **Rijksmuseum**
  - Di bawah keterangan hak cipta tiap objek ada "a Public Domain or Creative Commons Zero (CC0) Public Domain Dedication"; artinya "the material is either free of copyright, or the Rijksmuseum has waived its rights" dan "can be freely used, including for commercial purposes, without needing to request permission".
  - Objek yang masih berhak cipta diberi CC BY 4.0 ("as long as you acknowledge the Rijksmuseum as the source"). "In some cases, however, usage restrictions apply, which are clearly indicated on our collection website."
  - Museum meminta kredit walau tidak wajib.
  - Sumber: https://data.rijksmuseum.nl/policy (diakses 2026-11-18; dialihkan dari https://www.rijksmuseum.nl/en/research/conduct-research/data/policy)

- **New York Public Library (NYPL) Digital Collections** (halaman resmi kosong saat diambil; **cuplikan pencarian**)
  - Item domain publik tidak butuh izin NYPL dan "have no known restrictions on their use", tetapi "may be subject to rights of privacy, publicity, or other restrictions depending on the format of the materials and what the items depict".
  - Pernyataan di halaman item: "NYPL believes that this item has no known US copyright restrictions" (keyakinan soal status di **Amerika Serikat**, bukan jaminan).
  - Sumber: https://www.nypl.org/digital-research/projects/nypl-digital-collections (cuplikan pencarian, diakses 2026-11-18); https://scholarlykitchen.sspnet.org/2016/01/19/nypl-shows-academic-libraries-what-public-domain-means/ (sekunder, diakses 2026-11-18)

- **Rawpixel** (halaman lisensi resmi 403; **hanya sumber sekunder**)
  - Public Domain Review mencatat rawpixel membagikan salinan karya domain publik "with a CC0 License". Halaman hasil pencarian rawpixel memberi label "Free Image from public domain license" dan sering menyebut sumber asli (Wikimedia Commons, Flickr, Rijksmuseum).
  - Satu situs pembanding pihak ketiga menulis pemakaian rawpixel dibatasi untuk pemakaian pribadi. Klaim ini bertentangan dengan label CC0 dan **tidak terverifikasi**.
  - Sumber: https://publicdomainreview.org/collections/source/rawpixel/ dan https://licenseorg.com/guide/images/rawpixel (sekunder, diakses 2026-11-18)

- **Wikimedia Commons**
  - "Content in the public domain may not have a strict legal requirement of attribution", tetapi "attribution is recommended to give correct provenance."
  - "you should verify the copyright status of each image just as you would when obtaining images from other sources."
  - Batasan non-hak cipta: "These may include trademarks, patents, personality rights, moral rights, privacy rights".
  - "the Wikimedia Foundation does not provide any warranty regarding the copyright status or correctness of licensing terms."
  - Sumber: https://commons.wikimedia.org/wiki/Commons:Reusing_content_outside_Wikimedia (diakses 2026-11-18)

- **Pixabay** (ilustrasi dan vektor; dibandingkan karena K-024 menerima Pixabay untuk suara)
  - Boleh: "Use Content for free", "Use Content without having to attribute the author", "Modify or adapt Content into new works".
  - Dilarang: menjual atau mendistribusikan secara "Standalone" ("where no creative effort has been applied to the Content"); konten bermerek tidak boleh dipakai "for commercial purposes in relation to goods and services"; konten yang memuat "recognisable people" tidak boleh dipakai secara tidak bermoral atau ilegal.
  - "only the full Content License is legally binding."
  - Sumber: https://pixabay.com/service/license-summary/ (diakses 2026-11-18). Riset 17 Nov mencatat Syarat Layanan Pixabay terakhir diubah 20 Okt 2026 (`docs/riset/2026-11-17-nama-suara-zona-aman.md`).

### Tafsiran (bukan fakta)

- **Lapisan hak yang harus dicek tetap tiga**, walau berkasnya CC0: (1) hak cipta (dilepas oleh CC0); (2) merek dagang (CC0 §4(a) tidak melepasnya); (3) hak orang yang tergambar (CC0 §4(c), PDM). Untuk stiker hiasan, risiko (2) dan (3) bisa ditekan dengan aturan isi: tanpa logo atau nama merek, tanpa orang.
- **CC0 dari pemilik lebih kuat daripada PDM dari agregator.** CC0 adalah pelepasan hak oleh pihak yang mengaku memegang hak, sedangkan PDM hanya "diidentifikasi" bebas di sebagian yurisdiksi. Penafian Openverse membuat Openverse layak dipakai sebagai alat cari, bukan sebagai bukti lisensi. Lisensi dicek di halaman sumber asli.
- **Kecocokan tema v5**: koleksi museum dan perpustakaan kaya efemera cetak (karcis, label, perangko, kartu dagang, cap). Itu bahan yang paling dekat dengan "Karcis & Kliping". Namun gayanya foto benda atau litografi, bukan "cetak saring dua tinta" v5 §3.5. Pemakaian langsung kemungkinan berbenturan dengan aturan "stiker temuan menjadi satu-satunya benda berwarna penuh" (v5 §2). Bahan seperti ini lebih cocok sebagai **acuan bentuk** untuk digambar ulang.
- **Kenney**: lisensinya paling bersih (CC0 dari pembuat, atribusi tidak wajib). Gayanya aset gim. Dugaan: sebagian besar tidak cocok dengan v5 dan berisiko terasa seperti "UI kit" (diagnosis v4 #1, #3), kecuali tekstur atau pola.
- **Rawpixel**: status lisensinya tidak bisa dipastikan dari sumber primer. Rawpixel juga sering mengunggah ulang dari sumber lain. Lebih aman langsung ke sumber aslinya.

---

## Temuan 2: pustaka ikon, emoji, dan ilustrasi populer

### Fakta

| Pustaka | Lisensi persis (kutipan) | Atribusi | Sumber (diakses 2026-11-18) |
|---|---|---|---|
| OpenMoji | "OpenMoji is published under the Creative Commons Share Alike License 4.0" (CC BY-SA 4.0); boleh "for any purpose, even commercially" | **Wajib**: "You must give OpenMoji appropriate credit, and indicate if changes were made." Karya turunan wajib CC BY-SA 4.0. Untuk video: atribusi di deskripsi atau kredit | https://openmoji.org/faq/ |
| CC BY-SA 4.0 (dasar OpenMoji) | "If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original."; "You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits." | Wajib: "You must give appropriate credit, provide a link to the license, and indicate if changes were made." | https://creativecommons.org/licenses/by-sa/4.0/deed.en |
| Twemoji | "Graphics licensed under CC-BY 4.0"; kode MIT | **Wajib** (CC BY). Proyek menerima "a mention in a project README or an 'About' section or footer on a website" | https://github.com/twitter/twemoji |
| Noto Emoji (Google) | "Emoji fonts ... are under the SIL Open Font License, version 1.1."; "Tools and most image resources are under the Apache license, version 2.0." Gambar bendera "in the public domain or otherwise exempt from copyright" | Apache 2.0 mewajibkan menyertakan lisensi dan pemberitahuan saat mendistribusikan (dugaan untuk detailnya; teks Apache tidak dibuka di riset ini) | https://github.com/googlefonts/noto-emoji |
| Microsoft Fluent Emoji | "MIT License", "Copyright (c) Microsoft Corporation." | **Wajib** menyertakan pemberitahuan: "The above copyright notice and this permission notice shall be included in all copies" | https://raw.githubusercontent.com/microsoft/fluentui-emoji/main/LICENSE |
| Streamline (set gratis) | Set open-source memakai CC BY 4.0; set gratis lain memakai "Streamline Free License" | **Wajib**: "Attribution is required for all assets used under the Streamline Free License, not just open-source sets." Kredit ke Streamline dan tautan ke https://streamlinehq.com. Paket berbayar tanpa atribusi | https://help.streamlinehq.com/en/articles/5354376-streamline-free-license |
| unDraw | Lisensi sendiri: "You can use them for noncommercial and commercial purposes." | Tidak wajib: "You do not need to ask permission from or provide credit to the creator or unDraw." Dilarang: menghimpun aset untuk layanan pesaing, mendistribusikan "in packs or otherwise", dan "Using the assets as training data for generative AI models" | https://undraw.co/license |
| Humaaans | "CC0 Free for commercial or personal use by Pablo Stanley." | Tidak wajib (tidak disebut) | https://www.humaaans.com/ |
| Open Peeps | "Free for commercial and personal use under CC0 License."; "The library is in the public domain under the CC0 License." | Tidak wajib (tidak disebut) | https://www.openpeeps.com/ |

### Tafsiran (bukan fakta)

- **Gagal di logika K-024**: OpenMoji (BY-SA), Twemoji (BY), Streamline gratis (BY atau Free License) mewajibkan kredit. Bila stiker hiasan ikut di kartu share, kewajiban itu ikut ke setiap unggahan pengguna. OpenMoji bahkan menambah kewajiban ShareAlike pada hasil turunan. Kartu share hasil gubahan pengguna bisa dianggap karya turunan; ini tafsir hukum yang perlu `penasihat-privasi`.
- **Fluent Emoji (MIT) dan Noto (Apache 2.0)**: syaratnya pemberitahuan lisensi di distribusi, biasanya cukup di layar lisensi aplikasi. Belum jelas apakah gambar yang dirender ke kartu share termasuk "copies" atau "substantial portions" (belum terjawab).
- **Gagal di daftar jangan v5 (§4 no. 9)**: semua pustaka emoji (OpenMoji, Twemoji, Noto, Fluent) berisi **wajah dan emoji**. Humaaans dan Open Peeps berisi **orang dan wajah** dengan gaya ilustrasi startup. unDraw adalah ilustrasi "orang di depan laptop" khas landing page SaaS, gaya yang didiagnosis sebagai "AI slop/template" di v5 §1. Jadi lisensi bersih (unDraw, Humaaans, Open Peeps) pun **tidak cocok** secara visual.
- **Larangan unDraw** soal distribusi "in packs or otherwise" bisa bermasalah bila stiker hiasan dijual sebagai paket kosmetik (K-025). Dugaan, perlu dibaca utuh.

---

## Temuan 3: efemera Indonesia dan Hindia Belanda

### Fakta: dasar hukum Indonesia (UU 28/2014, dibaca dari salinan OCR pasal.id)

- **Pasal 58 ayat (1)**: karya seni rupa (lukisan, gambar, ukiran, kaligrafi, kolase), arsitektur, peta, batik dan motif lain, buku, pamflet, dan lain-lain dilindungi "selama hidup Pencipta dan terus berlangsung selama 70 (tujuh puluh) tahun setelah Pencipta meninggal dunia, terhitung mulai tanggal 1 Januari tahun berikutnya." **Ayat (3)**: bila dimiliki atau dipegang badan hukum, "berlaku selama 50 (lima puluh) tahun sejak pertama kali dilakukan Pengumuman."
  - Sumber: https://pasal.id/peraturan/uu/uu-no-28-tahun-2014/pasal-58 (diakses 2026-11-18; teks OCR rusak di beberapa kata)
- **Pasal 59**: ayat (1) karya fotografi, potret, karya tipografi, karya turunan, kompilasi, dan lain-lain dilindungi 50 tahun sejak Pengumuman pertama. Ayat (2): "Pelindungan Hak Cipta atas Ciptaan berupa karya seni terapan berlaku selama 25 (dua puluh lima) tahun" sejak Pengumuman pertama.
  - Sumber: https://pasal.id/peraturan/uu/uu-no-28-tahun-2014/pasal-59 (diakses 2026-11-18)
- **Pasal 57 ayat (1)**: "Hak moral Pencipta sebagaimana dimaksud dalam Pasal 5 ayat (1) huruf a, huruf b, dan huruf e berlaku tanpa batas waktu." Pasal 5 ayat (1) huruf a adalah hak untuk "tetap mencantumkan atau tidak mencantumkan namanya pada salinan sehubungan dengan pemakaian Ciptaannya untuk umum"; huruf e adalah hak mempertahankan diri dari "distorsi Ciptaan, mutilasi Ciptaan, modifikasi Ciptaan" dan "hal yang bersifat merugikan kehormatan diri atau reputasinya".
  - Sumber: https://pasal.id/peraturan/uu/uu-no-28-tahun-2014/pasal-57 dan https://pasal.id/peraturan/uu/uu-no-28-tahun-2014/pasal-5 (diakses 2026-11-18)
- **Pasal 43 huruf b**: tidak dianggap pelanggaran Hak Cipta: "segala sesuatu yang dilaksanakan oleh atau atas nama pemerintah", "kecuali dinyatakan dilindungi oleh peraturan perundang-undangan", pernyataan pada Ciptaan itu, atau ketika Ciptaan itu diumumkan atau digandakan.
  - Sumber: https://pasal.id/peraturan/uu/uu-no-28-tahun-2014/pasal-43 (diakses 2026-11-18)
- **Pasal 12**: larangan "Penggunaan Secara Komersial ... atas Potret yang dibuatnya guna kepentingan reklame atau periklanan secara komersial tanpa persetujuan tertulis dari orang yang dipotret atau ahli warisnya."
  - Sumber: https://pasal.id/peraturan/uu/uu-no-28-tahun-2014/pasal-12 (diakses 2026-11-18; ayat (1) terpotong)

### Fakta: perangko Indonesia

- **Wikimedia Commons** menganggap perangko Indonesia domain publik "under Article 43(b) of the 2014 Copyright Law" dan meminta templat {{PD-IDGov}}. Commons sendiri mencatat bahwa boleh tidaknya modifikasi atau turunan menurut Pasal 43 belum ditentukan.
  - Sumber: https://commons.wikimedia.org/wiki/Commons:Stamps/Public_domain (diakses 2026-11-18)
- **Templat PD-IDGov**: "Do not use this tag for images which were created or owned by Indonesian state-owned enterprises", karena itu "not government work".
  - Sumber: https://commons.wikimedia.org/wiki/Template:PD-IDGov (diakses 2026-11-18)
- **Permenkominfo 21/2012 tentang Prangko** (dibaca dari pasal.id):
  - Pasal 3 ayat (1): "Penerbitan prangko dilaksanakan oleh Direktur Jenderal." Pelaksanaannya ditugaskan ke Penyelenggara Pos Milik Negara (ayat (2)).
  - Pasal 26 ayat (2): "Pemegang hak cipta prangko dan desain yang terkait dengan proses penerbitan prangko adalah Direktur Jenderal." Pengelolaan hak cipta oleh Penyelenggara Pos Milik Negara (Pasal 27 ayat (1)).
  - Pasal 25: reproduksi untuk informasi, periklanan, atau tujuan komersial lain harus berbeda ukuran dari aslinya dan diberi tanda pembatalan berupa coretan pada nilai nominalnya.
  - Sumber: https://pasal.id/peraturan/permen/permenkominfo-no-21-tahun-2012 (diakses 2026-11-18; berstatus "Diproses, belum ditinjau"). Penerbitan prangko masih berjalan di 2026 (13 seri): https://infopublik.id/kategori/nasional-sosial-budaya/957400/kemenkomdigi-terbitkan-13-seri-prangko-sepanjang-2026 (diakses 2026-11-18)

### Fakta: arsip Belanda dan Hindia Belanda

- **Commons, aturan Indonesia**: Hindia Belanda adalah koloni Belanda sampai 1949; 1912–1982 hak cipta diatur Auteurswet 1912. Karya fotografi yang pertama terbit di Indonesia sebelum 1971 domain publik di Amerika Serikat (tafsiran URAA oleh Commons).
  - Sumber: https://commons.wikimedia.org/wiki/Commons:Copyright_rules_by_territory/Indonesia (diakses 2026-11-18)
- **Commons, perangko Belanda**: "With stamps issued prior to 1989, copyright expires 70 years after publication."; "As of 2026 Dutch stamps created in the period 1852–1955 are considered to be Public Domain." Halaman tidak memuat entri khusus Hindia Belanda (bagian yang terbaca).
  - Sumber: https://commons.wikimedia.org/wiki/Commons:Stamps/Public_domain (diakses 2026-11-18)
- **Leiden University Libraries Digital Collections** (termasuk koleksi KITLV):
  - "You can use all non-copyrighted images freely. All items in the Digital Collections have a copyright statement that applies to that particular image."
  - Gambar yang masih berhak cipta "remain under copyright until 70 years following the year of the death of the creator" dan tidak boleh dipakai ulang tanpa izin tertulis.
  - "Leiden University Libraries assumes no responsibility for damage in any way resulting from or connected with the re-use of images from Digital Collections."
  - Sumber: https://www.library.universiteitleiden.nl/binaries/content/assets/ul2ub/bijzondere-collecties/praktische-informatie/notice_and_takedown_updated-2025.pdf (diakses 2026-11-18)
  - Pada 2016 lebih dari 3.000 gambar KITLV diserahkan ke Wikimedia Commons "in the public domain", "This means that everyone is allowed to use the pictures for free."
  - Sumber: https://library.universiteitleiden.nl/news/2016/07/leiden-university-libraries-donates-more-than-3000-images-to-wikimedia (diakses 2026-11-18)
- **Nationaal Archief**: "Ruim 400.000 foto's zijn beschikbaar onder een CC0 publiek domein verklaring." "Dat geldt zowel voor de scans als voor de metadata."
  - Sumber: https://www.nationaalarchief.nl/onderzoeken/open-data (diakses 2026-11-18)
- **Delpher** (KB, koran dan majalah Belanda termasuk terbitan Hindia Belanda): syarat resmi tidak terbaca. Artikel KB 2018 menyebut publikasi yang penciptanya wafat lebih dari 70 tahun lalu, atau terbit lebih dari 70 tahun lalu, diberi ikon domain publik. KB juga terikat perjanjian dengan penulis dan penerbit untuk materi yang masih dilindungi.
  - Sumber: https://zenodo.org/records/7784883/files/Open%20data%20in%20de%20Koninklijke%20Bibliotheek%20-%20Od%20nr.%205%20-%20Juni%202018.pdf (sekunder, cuplikan pencarian, diakses 2026-11-18)
- **Commons, kategori karcis Indonesia**: "Category:Tickets of Indonesia" ada, dengan subkategori karcis angkutan umum, parkir, dan masuk, tetapi hanya 3 berkas langsung (mis. "Karcis Bioskop Parahyangan Samarinda 1997.jpg", "Karcis Retribusi Pasar Di Kebumen.jpg"). Lisensi per berkas tidak tampil di halaman kategori.
  - Sumber: https://commons.wikimedia.org/wiki/Category:Tickets_of_Indonesia (diakses 2026-11-18)

### Tafsiran (bukan fakta, bukan nasihat hukum)

- **Perangko Indonesia: label Commons kemungkinan tidak cukup untuk produk komersial.** Pasal 43 huruf b UU 28/2014 mengecualikan karya yang "dinyatakan dilindungi oleh peraturan perundang-undangan". Permenkominfo 21/2012 Pasal 26 ayat (2) secara tegas menyatakan Direktur Jenderal sebagai pemegang hak cipta prangko, dan Pasal 25 mengatur syarat reproduksi komersial. Selain itu, pengelolaan hak cipta ditugaskan ke penyelenggara pos milik negara, sedangkan templat PD-IDGov sendiri melarang dipakai untuk karya BUMN. Jadi **perangko Indonesia (setidaknya terbitan sejak 2012) sebaiknya diperlakukan sebagai berhak cipta**. Untuk perangko terbitan sebelum 2012, rezim hukumnya belum diperiksa (lihat "Belum terjawab").
- **Hak moral tanpa batas waktu (Pasal 57) adalah risiko khas Indonesia.** Walau masa hak ekonomi sudah habis, hak pencipta untuk namanya dicantumkan (Pasal 5 ayat (1) huruf a) dan hak menolak "distorsi/mutilasi/modifikasi" (huruf e) tetap berlaku. Untuk efemera lama karya pencipta Indonesia yang dikenal, memotong, mewarnai ulang, atau menjadikannya stiker bisa bersinggungan dengan huruf e. Untuk karya anonim (sebagian besar karcis dan label), risikonya lebih kecil. Ini tafsir hukum yang perlu `penasihat-privasi` atau ahli HKI.
- **Masa perlindungan berbeda per jenis**: label dan kemasan mungkin tergolong "seni terapan" (25 tahun) atau "karya seni rupa" (70 tahun setelah pencipta wafat), atau "dimiliki badan hukum" (50 tahun). Golongan mana yang berlaku untuk label dagang lama tidak bisa ditentukan dari teks pasal saja.
- **Arsip Belanda (Leiden, Nationaal Archief, Delpher)** menilai status menurut hukum Belanda atau Uni Eropa, dan NYPL menurut hukum AS. Status di Indonesia bisa berbeda. Pengguna aplikasi ada di Indonesia, jadi aturan Indonesia yang paling relevan (dugaan).
- **Kecocokan tema**: karcis, perangko, label jamu, dan iklan koran lama Hindia Belanda paling dekat dengan "Karcis & Kliping". Namun ejaan lama (mis. "Tjap", "Djamoe") dan citra kolonial membawa makna sejarah yang mungkin tidak netral untuk produk Gen Z 2026. Ini soal rasa dan konteks, bukan lisensi, dan perlu dinilai pemilik atau `desainer-visual`.
- **Foto Nationaal Archief dan KITLV** sebagian besar foto orang dan tempat. Foto orang terkena hak potret (Pasal 12) dan daftar jangan v5 (wajah). Jadi tidak cocok sebagai stiker hiasan.

---

## Temuan 4: risiko lintas sumber

### Fakta

- **App Store Review Guidelines 5.2.1**: "Don't use protected third-party material such as trademarks, copyrighted works, or patented ideas in your app without permission". Pengantar 5.2: "Make sure your app only includes content that you created or that you have a license to use. Your app may be removed if you've stepped over the line and used content without permission."
  - Sumber: https://developer.apple.com/app-store/review/guidelines/ (diakses 2026-11-18)
- **Google Play, kebijakan kekayaan intelektual**: "We don't allow apps that infringe copyright."; "We don't allow apps that infringe on others' trademarks."; "If your app uses another party's trademarks in a way that is likely to cause confusion, your app may be suspended."
  - Sumber: https://support.google.com/googleplay/android-developer/answer/9888072?hl=en (diakses 2026-11-18)
- **Merek terdaftar bisa hidup tanpa batas**: UU 20/2016 Pasal 35: perlindungan "10 (sepuluh) tahun sejak Tanggal Penerimaan" dan "dapat diperpanjang untuk jangka waktu yang sama".
  - Sumber: https://pasal.id/peraturan/uu/uu-no-20-tahun-2016/pasal-35 (diakses 2026-11-18)
- **Contoh merek lama yang masih aktif**: "Industri Djamu dan Pharmasi Tjap Djago" (Jamu Jago) merayakan ulang tahun ke-105 pada 1 Juni 2023, artinya berdiri sekitar 1918.
  - Sumber: https://www.cnbcindonesia.com/entrepreneur/20230609133410-25-444547/usia-105-tahun-jamu-jago-segarkan-jajaran-direksi (diakses 2026-11-18)

### Tafsiran (bukan fakta, bukan nasihat hukum)

- **Merek di label lama**: hak cipta sebuah label 1920-an bisa sudah habis, tetapi mereknya bisa masih terdaftar dan dipakai (contoh Jamu Jago). CC0 dan PDM tidak melepas merek. Memasang label seperti itu di aplikasi berbayar dan di kartu share bisa dibaca sebagai pemakaian merek pihak lain. Akibatnya bisa melanggar App Store 5.2.1 atau kebijakan merek Google Play. Status merek perlu dicek di PDKI per label; PDKI belum bisa dibaca otomatis (riset 17 Nov).
- **Logo lembaga pemberi CC0**: Met melarang pemakaian mereknya. Dugaan: museum lain serupa. Stiker tidak boleh memuat logo atau nama museum.
- **Hak potret**: Pasal 12 UU 28/2014 dan hak publisitas (CC0 §1, PDM, NYPL, Smithsonian) membuat gambar berisi orang yang bisa dikenali tidak layak, terlebih di kartu share yang beredar di media sosial. Ini sejalan dengan daftar jangan v5 (wajah).
- **Atribusi "yang dianjurkan"** (Rijksmuseum, Commons, Met) tidak wajib, tetapi bisa ditaruh di layar lisensi aplikasi tanpa membebani kartu share.

---

## Temuan 5: paket stiker hiasan buatan sendiri

### Fakta (dari repo)

- Usulan v5 §3.5 sudah memuat teknik lengkap "cetak saring" (bidang `path` datar, raster halftone, lapis garis tinta yang digeser 1,2/−0,8 px, grain `feTurbulence`, tepi die-cut putih dua bayangan). Ada contoh `gereja.svg` dan `cap.svg` di `docs/desain/usulan-v5/`. Sumber: `docs/desain/usulan-v5-karcis-kliping.md` (baris 214–326).
- Elemen yang sudah dirumuskan v5 dan bisa menjadi stiker hiasan: karcis berlubang (§3.4 A), cap pos (§3.4 B), coretan stabilo (§3.4 C), selotip (`tape`, §3.1), raster titik, label karcis kategori, lubang pons. Misi menjanjikan "Hadiah: selotip motif untuk bukumu" (`docs/desain/usulan-v5-karcis-kliping.md:417`).
- Di Flutter, ilustrasi diekspor ke WebP, jadi tidak ada filter SVG yang berjalan saat runtime (`docs/desain/usulan-v5-karcis-kliping.md:326`).
- Preseden: K-024 dan K-030 mengutamakan aset buatan sendiri (foley, sintesis) karena tidak membawa kewajiban lisensi atau kredit (`docs/keputusan.md` (baris 275–289), `:369-384`).

### Tafsiran: perbandingan (bukan fakta)

| Aspek | Buatan sendiri (gaya v5) | Sumber CC0 museum/arsip | Pustaka emoji/ilustrasi |
|---|---|---|---|
| Lisensi | Milik sendiri, tanpa kredit | CC0 bersih untuk hak cipta; merek, potret, hak moral (Indonesia) tetap dicek per berkas | BY/BY-SA/Free License wajib kredit; MIT/Apache wajib pemberitahuan; CC0 (Open Peeps, Humaaans) bersih |
| Cocok tema v5 | Paling cocok, karena dirancang dari aturan v5 | Bahannya cocok (efemera), gayanya tidak (foto, litografi berwarna penuh) | Tidak cocok (wajah, emoji, gaya template) |
| Biaya | Waktu menggambar. Dugaan kasar: 10–20 elemen sederhana (selotip, karcis, cap, panah, label) masing-masing 30–90 menit di SVG, karena teknik dan palet sudah ada | Waktu kurasi dan cek hak per berkas, lalu tetap perlu diolah ulang agar senada | Gratis, tetapi beban kredit dan risiko gaya |
| Risiko | Paling rendah; risiko utama mutu dan konsistensi gambar | Sedang: label PD salah, merek aktif, hak moral, beda yurisdiksi | Tinggi untuk K-024 (kredit) dan v5 §4 |
| Pembeda produk | Tinggi (identitas sendiri, sama seperti foley K-024) | Sedang | Rendah (dipakai banyak aplikasi) |

- Jalan tengah yang mungkin: memakai efemera CC0 museum **hanya sebagai acuan bentuk**, lalu menggambar ulang dengan gaya v5. Dugaan: gambar ulang yang tidak menyalin ekspresi spesifik (hanya meniru jenis benda, misalnya "karcis berlubang") tidak membawa hak dari sumbernya, tetapi batas "meniru" dan "menyalin" adalah tafsir hukum.

---

## Kesimpulan

**Fakta bersumber.** Sumber yang mengizinkan pemakaian komersial tanpa atribusi wajib: Kenney (CC0), Smithsonian Open Access (aset bertanda CC0), Met Open Access (CC0), Rijksmuseum (objek bertanda CC0/Public Domain), Nationaal Archief (foto CC0), Open Peeps dan Humaaans (CC0), unDraw (lisensi sendiri, tanpa kredit, tetapi melarang distribusi "in packs"), dan Pixabay (tanpa kredit, dilarang Standalone dan pemakaian merek). Openverse, Wikimedia Commons, NYPL, dan Leiden hanya menyatakan atau meneruskan status domain publik, dengan penafian bahwa mereka tidak menjamin status itu. OpenMoji (CC BY-SA 4.0), Twemoji (CC BY 4.0), dan Streamline gratis mewajibkan kredit; Fluent Emoji (MIT) dan Noto (Apache 2.0) mewajibkan pemberitahuan lisensi. CC0 dan PDM tidak melepas merek dagang maupun hak orang yang tergambar. UU 28/2014 memberi hak moral pencantuman nama dan anti-distorsi tanpa batas waktu (Pasal 57). Permenkominfo 21/2012 menyatakan Direktur Jenderal sebagai pemegang hak cipta prangko, walau Commons memberi label domain publik.

**Tafsiran (bukan keputusan, bukan nasihat hukum).**

1. **Urutan sumber yang paling aman** untuk stiker hiasan yang ikut ke kartu share:
   1. **Buatan sendiri dengan gaya v5** (selotip, karcis, cap, label, panah, tanda potong, lubang pons). Tanpa lisensi pihak ketiga, paling cocok tema, sejalan dengan semangat K-024/K-030.
   2. **CC0 langsung dari lembaga pemilik**: Smithsonian, Met, Rijksmuseum, Nationaal Archief. Syarat: dicek di halaman objek asli (ikon CC0 atau Open Access), tanpa logo atau merek, tanpa orang, dan sebaiknya karya anonim atau yang penciptanya wafat ≤1955 (agar juga lewat 70 tahun menurut Pasal 58). Paling cocok dipakai sebagai acuan bentuk atau tekstur.
   3. **Kenney (CC0)**: lisensi paling sederhana, tetapi kemungkinan hanya berguna untuk tekstur atau pola (dugaan).
   4. **Wikimedia Commons, Openverse, Leiden, NYPL, Delpher**: hanya sebagai **alat cari**. Setiap berkas dilacak ke sumber dan pencipta aslinya, lalu dinilai menurut hukum Indonesia.
2. **Yang sebaiknya dihindari:**
   - OpenMoji (CC BY-SA: kredit dan ShareAlike), Twemoji (CC BY), Streamline gratis (kredit dan tautan wajib): bertentangan dengan logika K-024.
   - Semua pustaka emoji (OpenMoji, Twemoji, Noto, Fluent), Humaaans, Open Peeps, unDraw: berisi wajah, emoji, atau gaya template, sehingga bertentangan dengan v5 §4 no. 9 dan K-017, walau sebagian lisensinya bersih.
   - Perangko Indonesia: label PD Commons bertentangan dengan Permenkominfo 21/2012 Pasal 26.
   - Label, kemasan, dan iklan lama yang memuat nama merek: merek bisa masih terdaftar (contoh Jamu Jago, sekitar 1918).
   - Foto orang dari arsip mana pun: hak potret (Pasal 12) dan wajah.
   - Rawpixel: status lisensi tidak terverifikasi dari sumber primer, dan sering mengunggah ulang dari sumber lain.
   - Pixabay untuk stiker yang dipakai **apa adanya**: berisiko dihitung Standalone bila tidak diolah. Pixabay juga tidak menjamin aset bebas merek.
3. **Usulan aturan pencatatan** (analog `data/sounds.json` K-024; nama file dan istilah hanya usulan, belum ada di glosarium):
   - Setiap stiker hiasan dicatat di satu file data, misalnya data/decorations.json (usulan, belum ada) dengan skema di `data/schema/`.
   - Field usulan: `id`, `file` (path relatif terhadap `app/`), `use` (`cover`, `page`, `shareCard`), `source` (`own`, `smithsonian`, `met`, `rijksmuseum`, `nationaalArchief`, `kenney`), `license` (`own`, `CC0-1.0`), `url` (halaman objek di situs pemilik, bukan agregator; `null` untuk buatan sendiri), `author` (pencipta asli bila diketahui, atau `anonymous`), `originalYear` (tahun karya asli, untuk cek Pasal 58/59), `basedOn` (URL acuan bila digambar ulang dari karya lain), `checks` (centang: tanpa logo/merek, tanpa orang, tanpa teks merek), `addedAt`.
   - Enum `license` sengaja tidak memuat CC BY, CC BY-SA, CC BY-NC, MIT, Apache, atau "Public Domain Mark" tanpa sumber pemilik. Itu meniru K-024 yang menolak sumber tanpa lisensi jelas. Apakah PDM boleh masuk adalah keputusan pemilik.
   - Aset buatan sendiri mencatat path file sumber (SVG) seperti K-030 mencatat skrip pembuat suara.

## Belum terjawab

- **Teks resmi UU 28/2014** (Pasal 5, 12, 43, 57, 58, 59) belum dicocokkan dengan salinan resmi di peraturan.go.id atau JDIH. Teks dari pasal.id adalah OCR yang belum ditinjau.
- **Ketentuan peralihan UU 28/2014**: apakah karya yang masa perlindungannya sudah habis menurut UU lama (UU 19/2002, UU 6/1982 dan perubahannya, Auteurswet 1912) tetap domain publik, atau dilindungi lagi menurut masa yang lebih panjang. Belum dicari.
- **Perangko Indonesia sebelum Permenkominfo 21/2012** dan perangko Hindia Belanda (1864–1949): hukum mana yang berlaku dan siapa pemegang haknya. Commons tidak punya entri khusus Hindia Belanda di bagian halaman yang terbaca.
- **Apakah Pasal 57 (hak moral tanpa batas) berlaku pada karya yang hak ekonominya sudah habis dan dipakai ulang komersial**, dan bagaimana praktiknya untuk karya anonim. Perlu `penasihat-privasi` atau ahli HKI.
- **Syarat resmi Smithsonian, Met, NYPL, rawpixel, dan Delpher** tidak terbaca langsung (403, 429, atau kosong). Yang dikutip berasal dari cuplikan pencarian, README GitHub, atau sumber sekunder. Perlu dibuka manual.
- **Status CC0 koleksi National Postal Museum (Smithsonian)** untuk perangko dan efemera pos.
- **Teks lengkap lisensi Apache 2.0 dan MIT** soal apakah gambar emoji yang dirender ke kartu share termasuk "copies" yang wajib membawa pemberitahuan. Tidak dibuka, dan kemungkinan tidak relevan karena emoji ditolak tema v5.
- **Teks lengkap lisensi unDraw** soal "in packs or otherwise" bila aset dijual sebagai item kosmetik.
- **Status merek di PDKI** untuk label lama mana pun (PDKI butuh JavaScript; riset 17 Nov).
- **Apakah Openverse menyediakan nilai `pdm` di parameter API** (antarmuka punya filter "Public Domain Mark"; dokumentasi API resmi tidak terbaca).
- **Jumlah dan mutu efemera Indonesia CC0** yang benar-benar tersedia di Rijksmuseum, Smithsonian, dan Met (karcis, label, iklan). Tidak dihitung; tidak ada pencarian koleksi per museum.
- **Perkiraan waktu menggambar stiker hiasan sendiri** di atas adalah dugaan, bukan hasil ukur.
