# UX merapikan potongan: hapus latar, mode gunting poligon, dan gaya tepi "digunting"

> Diriset: 2026-11-18 · Oleh: peneliti
> Cek ulang sebelum dipakai untuk keputusan baru: nama menu dan ketersediaan fitur tiap aplikasi (Photoroom, Canva, Adobe Express, Picsart, Instagram, Shuffles, Snapchat sering berganti per versi dan per paket berbayar), versi Flutter dan API `dart:ui` (`ImageFilter.dilate`, `RawMagnifier`, `FragmentProgram`), versi paket pub.dev (`simplify`, `opencv_dart`), dan opsi ML Kit Subject Segmentation (masih beta).
> Dipakai oleh: belum (bahan penyempurnaan layar "Rapikan potongan" mockup v5)

Melengkapi, tidak mengulang:
- `2026-11-17-perangkat-dan-stack.md`: status `native_cutout`, ML Kit Subject Segmentation (beta, API 24+), fragment shader Flutter, Impeller/OpenGLES di PowerVR.
- `2026-11-18-acuan-aplikasi-berkarakter.md`: momen stiker CapWords dan efek stiker iOS (Outline, Comic, Puffy, Shiny).
- `2026-11-18-audit-aksesibilitas-v4.md` temuan T-04: kuas masker sebagai pengecualian "esensial" dan alternatifnya.

Tidak ada aset atau tangkapan layar aplikasi lain yang disalin ke repo. Semua di bawah berupa deskripsi tertulis.

## Pertanyaan

1. Bagaimana aplikasi populer menyediakan alat merapikan potongan: kuas Hapus/Pulihkan, laso bebas dan poligon, seleksi pintar per ketukan, kaca pembesar (loupe), offset kuas, pratinjau latar, kehalusan tepi, dan outline stiker?
2. Bagaimana mode potong poligon/vektor bekerja di layar sentuh: menaruh, memindah, dan menghapus titik, snap ke tepi, kurva vs garis lurus, menutup bentuk, target sentuh?
3. Bagaimana aplikasi stiker/scrapbook menawarkan gaya tepi (die-cut putih, zigzag, sobek, poligonal kasar), dan teknik apa yang realistis di Flutter untuk perangkat kelas menengah?
4. Alternatif aksesibilitas apa yang disediakan untuk gambar bebas (WCAG 2.5.7 dan 2.5.1)?

## Catatan sumber

Semua URL diakses 2026-11-18. Beberapa halaman bantuan resmi menolak pengambilan otomatis (HTTP 403): Canva Help, Adobe HelpX (Express, Photoshop Express, Photoshop iPad), OpenCV docs, Cricut Help. Untuk halaman tersebut isi diambil dari **cuplikan mesin pencari** dan diberi label itu; isinya belum dibaca langsung. Label bukti mengikuti `docs/cara-kerja.md` §3: **terbukti** (dibaca langsung dari sumber) atau **dugaan**.

## Temuan

### A. Alat merapikan potongan per aplikasi

Ringkasan (rincian dan sumber di bawah tabel). "–" berarti tidak disebut di sumber yang terbaca, bukan berarti tidak ada.

| Aplikasi | Hapus/Pulihkan | Seleksi pintar per ketukan/sapuan | Laso | Loupe / offset | Pratinjau latar | Tepi / outline |
|---|---|---|---|---|---|---|
| Apple (lift subject, VisionKit/Vision) | – (sistem tidak menyediakan kuas) | Tekan lama subjek; ketuk titik → `subject(at:)` | – | – | – | Efek stiker Outline dll. (lihat riset 18 Nov) |
| Photoroom | Erase / Restore | Mode Assisted: ketuk area | – | – | – | Outline: Width, Blur, Color |
| Canva | Erase / Restore (cuplikan) | – | – | – | – | – |
| remove.bg | Erase/Restore | Magic Brush: sapuan kasar, AI menentukan area | – | – | – | – |
| Adobe Express (mobile) | Erase + Restore + Invert (cuplikan) | Quick select (cuplikan) | – | – | Area terbuang tampil merah (cuplikan pihak ketiga) | – |
| Photoshop Express (mobile) | Smartcut (cuplikan) | Smartcut | – | – | – | Invert dan Feather (cuplikan) |
| Picsart | Erase / Restore, Brush | Pilihan "person"/"face" | Telusur bebas dengan jari | Zoom; ukuran ujung telusur | Mode "Preview" | Die-cut putih (template Flow) |
| Pinterest Shuffles | – | Potong objek "dengan satu ketukan" | – | – | – | Border; Shape tool (sekunder) |
| Instagram Cutouts | – | Otomatis, lalu "Select manually" (cuplikan) | – | – | – | – |
| Snapchat Scissors | – | – | Gambar garis di sekeliling objek (sekunder) | – | – | – |
| Aplikasi "background eraser" khusus | Erase/Restore | Auto (warna mirip), "Star" (deteksi tepi) | Lasso | Magnifier; offset kursor (sekunder) | – | – |

- **Apple: lift subject dan instance mask** (terbukti)
  - Sesi WWDC23 "Lift subjects from images in your app": pengguna menyorot subjek dengan tekan lama ("Users can highlight a subject by long-pressing on it"); aplikasi bisa mencari subjek di satu titik dengan `subject(at:)` yang mengembalikan nil bila tidak ada subjek. Gambar bisa punya banyak subjek, dan satu subjek bisa gabungan (orang + anjing).
  - Vision "foreground instance mask request": `createScaledMask` menghasilkan "a single channel floating point pixel buffer containing the soft segmentation mask" (masker lunak, bukan biner). Masker instance memberi label per piksel: 0 = latar, instance mulai dari 1, urutan tidak dijamin. Demo memakai label di titik ketuk untuk memilih instance, dan bila ketukan jatuh di latar "I'll fall back to selecting all instances".
  - Analisis subjek disarankan di thread latar karena "resource intensive".
  - Sumber: https://developer.apple.com/videos/play/wwdc2023/10176/ (diakses 2026-11-18)
  - Efek stiker sistem (Original, Outline, Comic, Puffy, Shiny) lewat tekan lama stiker → Add Effect: sudah dicatat di `2026-11-18-acuan-aplikasi-berkarakter.md`. Konfirmasi tambahan: https://www.macrumors.com/how-to/add-effects-to-stickers-in-messages/ (terbit 2023-08-25, diakses 2026-11-18).
  - Sumber resmi Apple yang terbaca tidak menyebut alat untuk menambah/mengurangi bagian potongan secara manual di iOS (lihat "Belum terjawab").

- **Photoroom: Edit Cutout** (terbukti)
  - Dua mode: **Erase** dan **Restore**. Dua cara input: **Assisted** ("tap on the areas you want to remove", Photoroom memilih otomatis berdasarkan warna dan isi gambar) dan **Manual** (kuas; "use the slider to set the brush size", ukuran kuas hanya ada di Manual). Konfirmasi dengan ikon centang.
  - "Edit Cutout never generates new pixels, it just hides or reveals parts of the original image."
  - Halaman yang terbaca tidak menyebut laso, loupe, undo, zoom, atau pengaturan tepi.
  - Sumber: https://help.photoroom.com/en/articles/13742772-remove-and-restore-with-edit-cutout-ios (2026-02-17); https://help.photoroom.com/en/articles/13743688-how-to-use-edit-cutout ; https://help.photoroom.com/en/articles/10839076-remove-part-of-a-photo-with-manual-cutout (semua diakses 2026-11-18)
  - **Outline**: di iPhone/iPad, pilih layer objek → nyalakan Outline → slider **Width** (tebal), slider **Blur** (ketajaman), **Color** (palet, ambil dari gambar, atau hex). Di Android slider tebal bernama **Size**.
  - Sumber: https://help.photoroom.com/en/articles/8597559-add-an-outline-to-an-object (2025-10-20, diakses 2026-11-18)
  - API Photoroom: `outline.width` berupa rasio terhadap ukuran gambar, 0–0,1, default 0,03; `outline.blurRadius` 0–0,025, default 0. Algoritmanya tidak dijelaskan.
  - Sumber: https://docs.photoroom.com/image-editing-api-plus-plan/subject-outline (diakses 2026-11-18)

- **remove.bg: Erase/Restore dan Magic Brush** (terbukti)
  - Setelah latar dihapus, buka Erase/Restore. Magic Brush: "You simply brush roughly over the object, and the AI does the job for you", tanpa memilih piksel atau memperbesar.
  - Sumber: https://remove.bg/help/a/how-to-use-magic-brush (diakses 2026-11-18)

- **Canva Background Remover** (cuplikan mesin pencari; halaman 403)
  - Kuas **Erase** dan **Restore** untuk merapikan hasil; dibuka dengan memilih lagi BG Remover. Satu varian halaman menyebut fitur ini "currently only available on canva.com and the desktop app". Tersedia untuk paket Pro/Business/Education/Nonprofits.
  - Sumber: https://www.canva.com/help/background-remover/ ; https://www.canva.com/help/pixel-eraser/ (diakses 2026-11-18, cuplikan)

- **Adobe Express dan Photoshop Express (mobile)** (cuplikan mesin pencari; halaman 403)
  - Adobe Express: Erase dengan slider ukuran kuas, dua mode (**Quick select** yang menyorot area otomatis, dan kuas lingkaran manual), ikon **Restore**, ikon **Invert**.
  - Sumber: https://helpx.adobe.com/express/mobile/image-creation-and-editing/edit-images/erase-unwanted-parts.html (diakses 2026-11-18, cuplikan)
  - Photoshop Express Cutout: "Refine cutouts using Invert and Feather under Edit Cutout"; menambah area lewat **Smartcut**.
  - Sumber: https://helpx.adobe.com/photoshop-express/mobile/combine-photos/cutout.html (diakses 2026-11-18, cuplikan)
  - Photoshop di iPad: Refine edge dengan kuas tambah/kurang; laso poligonal dan magnetik **tidak ada** di iPad menurut utas permintaan fitur komunitas Adobe (2019–2025).
  - Sumber: https://helpx.adobe.com/photoshop/using/select-mask-on-ipad.html (cuplikan); https://community.adobe.com/feature-requests-846/p-polygonal-lasso-for-ipad-mobile-653176 (cuplikan) (diakses 2026-11-18)

- **Picsart Cutout** (terbukti, blog resmi lama)
  - Pilihan otomatis "person" atau "face" ("will guess the space you're trying to cut out"). Telusur manual dengan jari; disarankan memperbesar dulu karena "it's easier to trace around complex corners" dan mengecilkan ukuran ujung telusur. Lalu "brushing in" bagian yang terlewat, bisa dalam mode "Preview"; fungsi **Erase** dan **Restore**.
  - Sumber: https://picsart.com/blog/make-stickers-with-the-cutout-tool/ (terbit 2021-07-15, diubah 2022-09-23; diakses 2026-11-18)
  - Tutorial 2017: outline dibuat dengan menghapus bagian dalam potongan sehingga tinggal "thin outline", lalu disimpan sebagai stiker.
  - Sumber: https://picsart.com/blog/how-to-make-sticker-outline/ (2017-03-06, diakses 2026-11-18)
  - Picsart Flow punya template "die-cut sticker" yang "adds a clean border around the edges" dan bayangan realistis; tebal tepi tidak disebut.
  - Sumber: https://picsart.com/tutorials/how-to-create-die-cut-sticker-animations-from-photos-with-picsart-flow/ (2026-06-19, diakses 2026-11-18)

- **Pinterest Shuffles** (terbukti untuk "satu ketukan"; sisanya sekunder)
  - TechCrunch (2022-08-01): pengguna bisa "cut out individual objects from within an image using a tap". Halaman App Store: "Cut out objects from an image with a single tap."
  - Sumber: https://techcrunch.com/2022/08/01/pinterest-debuts-a-new-app-shuffles-for-collage-making-and-moodboards/ ; https://apps.apple.com/us/app/-/id1573869498 (diakses 2026-11-18)
  - Fitur yang sama dibawa ke aplikasi utama sebagai "Collages" (TechCrunch 2023-09-14).
  - Sumber: https://techcrunch.com/2023/09/14/pinterests-gen-z-focused-shuffles-app-has-now-inspired-a-new-pinterest-feature (diakses 2026-11-18)
  - Sekunder: menu edit potongan berisi opasitas, **border**, filter, animasi, dan "refine the clipping using the Shape tool".
  - Sumber: https://maketecheasier.com/shuffles-collages-app/ (2025-09-30, diakses 2026-11-18)

- **Instagram Cutouts** (cuplikan mesin pencari; halaman Help Center terbaca kosong)
  - "A sticker will be automatically generated ... If it's not what you wanted, you can tap Select manually in the bottom left". Cara kerja "Select manually" tidak terbaca.
  - Sumber: https://help.instagram.com/iphone-app/1382185835750156 (diakses 2026-11-18, cuplikan). Peluncuran Cutouts sudah dicatat di riset 18 Nov (acuan berkarakter).

- **Snapchat Scissors** (sekunder, lama)
  - Ketuk ikon gunting lalu "outline the part of the photo that you want to turn into a sticker"; stiker bisa diubah ukuran, dipindah, dan disimpan di tab stiker. Halaman bantuan resmi Snapchat tidak ditemukan.
  - Sumber: https://refinery29.com/en-us/2017/04/148292/snapchat-scissors-sticker (2017-04-03, diakses 2026-11-18)

- **Aplikasi penghapus latar khusus (App Store)** (terbukti dari deskripsi toko)
  - Simple BackgroundEraser (DoItWell): "Provide Magnifier view, make erase operation smoothly"; "Wand Erase: select similar colour area automatically"; "Finger Erase ... adjustable erase size". https://apps.apple.com/app/id1152872642
  - Cut Paste Photo AI (Simply Entertaining): Auto ("Color Touch AI"), Manual (gosok jari), **Lasso**, Restore, Undo/Redo/Zoom "For accurate result". https://apps.apple.com/us/app/id1199757068
  - Background Eraser (handyCloset): mode "Star" ("Detects image edges to erase more easily and accurately") dan "Auto" ("Erases similar pixels automatically"). https://apps.apple.com/us/app/-/id926035241
  - Offset kursor (titik hapus digeser dari ujung jari supaya area tidak tertutup jari) untuk Background Eraser Android handyCloset hanya ditemukan di cuplikan ulasan Softpedia (halaman 403): https://mobile.softpedia.com/android/Background-Eraser-Android-Review-2758.html. Ulasan FrostClick (2017-02-05) mengonfirmasi mode Auto dan Extract (penanda), tidak menyebut offset: https://frostclick.com/wp/index.php/2017/02/05/background-eraser
  - Semua diakses 2026-11-18.

- **CapWords**: tidak ditemukan sumber yang menjelaskan alat merapikan potongan manual. Yang terbukti hanya langkah konfirmasi objek (sudah di riset 18 Nov acuan berkarakter).

### B. Mode potong poligon/vektor di layar sentuh

- **Procreate: Freehand selection** (terbukti)
  - "Tap to place corner nodes connected by straight lines to create hard-edged polygonal selections." Garis bebas dan garis poligon bisa digabung dalam satu seleksi ("Combine Freehand and Polygon lines").
  - Menutup: "The origin of your line is marked by a gray circle. Tap it to close your selection." Mengangkat jari tidak menutup seleksi, jadi pengguna bisa melanjutkan.
  - Sumber: https://help.procreate.com/procreate/handbook/5.0/selections/selections-freehand (diakses 2026-11-18)

- **Affinity Photo 2 (iPad): Freehand Selection Tool** (terbukti)
  - Tiga tipe di context toolbar: **Freehand** ("drag ... and release to close"), **Polygonal** ("tap to define the beginning of the selection and then tap again for every change in direction"), **Magnetic** ("tap again to place a custom node position"; "Automatic nodes will be placed along distinct image edges as you continue"). Menutup: "Connect with the selection starting point."
  - Sumber: https://affinity.help/photo2ipad/en-US.lproj/pages/Selections/selections_create.html ; https://affinity.help/photoipad/en-US.lproj/pages/Selections/selections_freehand.html (diakses 2026-11-18)
  - Edit titik (Node Tool): "Tap a node and drag to reposition"; tambah titik dengan mengetuk kurva; hapus lewat "context toolbar, tap Delete"; ubah tipe Sharp/Smooth/Smart.
  - Sumber: https://affinity.help/photo2ipad/English.lproj/pages/CurvesShapes/edit_linesAndShapes.html (diakses 2026-11-18)

- **Linearity Curve (iPad): Node Tool** (terbukti)
  - "To select one single point, tap on it. Now you can move it around"; "Tap any space between two nodes directly on the vector path to add a new point"; hapus lewat tombol Delete di panel, bukan gestur. "You can switch back to a Single Node anytime by double-tapping on the node" (Single = tanpa handle, segmen lurus).
  - Sumber: https://www.linearity.io/academy/curve/ipad/user-guide/vector-editing/editing-tools/ (diakses 2026-11-18)

- **Snap ke tepi (magnetic lasso / intelligent scissors)** (terbukti untuk algoritma)
  - Livewire/Intelligent Scissors (Mortensen & Barrett, 1995): Sobel → biaya per sambungan piksel dari besar gradien → jalur biaya terendah Dijkstra dari titik jangkar ke kursor, diperbarui terus saat kursor bergerak; klik mengunci jalur dan membuat jangkar baru.
  - Sumber: https://en.wikipedia.org/wiki/Livewire_Segmentation_Technique (diakses 2026-11-18)
  - GIMP: titik kontrol disambung kurva yang mengikuti tepi kontras tinggi; dokumentasi lama menyebut hasilnya "pretty crude in a lot of cases". Sumber: https://docs.gimp.org/2.8/en/gimp-tools.html dan halaman `gimp-tool-iscissors` (cuplikan, diakses 2026-11-18).
  - Photoshop iPad tidak punya laso magnetik atau poligonal (lihat bagian A).

- **Target sentuh** (terbukti)
  - Apple HIG: ukuran kontrol default iOS 44×44 pt, minimum 28×28 pt; "Consider spacing between controls as important as size", sekitar 12 pt padding untuk elemen berbingkai dan 24 pt untuk elemen tanpa bingkai.
  - Sumber: https://developer.apple.com/tutorials/data/design/human-interface-guidelines/accessibility.json (versi data halaman HIG Accessibility, diakses 2026-11-18)
  - Android: "touch target size, of at least 48dp×48dp. Larger is even better."
  - Sumber: https://developer.android.com/guide/topics/ui/accessibility/apps (diakses 2026-11-18)

- **Loupe di Flutter** (terbukti untuk API; performa belum diukur)
  - `RawMagnifier` ("A common base class for magnifiers"), parameter `focalPointOffset`, `magnificationScale`, `size` (wajib). Ada juga `Magnifier` (Material) dan `CupertinoMagnifier`.
  - Sumber: https://api.flutter.dev/flutter/widgets/RawMagnifier-class.html (diakses 2026-11-18)
  - Implementasinya memakai `BackdropFilterLayer` dengan `ImageFilter.matrix` dan selalu butuh compositing (`alwaysNeedsCompositing => true`).
  - Sumber: https://codebrowser.dev/flutter/flutter/packages/flutter/lib/src/widgets/magnifier.dart.html (diakses 2026-11-18)

### C. Gaya tepi "digunting" dan tekniknya

- **Die-cut putih (outline)** (terbukti untuk produk; algoritma dari sumber umum)
  - Produk: efek Outline iOS (riset 18 Nov), Outline Photoroom (Width/Blur/Color), template die-cut Picsart Flow (bagian A).
  - Teknik 1, dilasi morfologis: dilasi persegi 10 dengan cakram radius 2 menghasilkan "a square of side 14, with rounded corners" (Minkowski sum). Artinya dilasi masker dengan elemen cakram sama dengan menggeser tepi keluar sejauh radius, dengan sudut membulat.
  - Sumber: https://en.wikipedia.org/wiki/Mathematical_morphology (diakses 2026-11-18)
  - Teknik 2, `dart:ui`: `ImageFilter.dilate({double radiusX, double radiusY})` "dilates each input pixel's channel values to the max value within the given radii"; ada juga `ImageFilter.erode`, `ImageFilter.compose`, dan `ImageFilter.shader` (cek `ImageFilter.isShaderFilterSupported`).
  - Sumber: https://api.flutter.dev/flutter/dart-ui/ImageFilter/ImageFilter.dilate.html ; https://api.flutter.dev/flutter/dart-ui/ImageFilter-class.html (diakses 2026-11-18)
  - Teknik 3, shader sampling tetangga: setiap piksel transparan memeriksa tetangga dalam kotak; batas loop GLSL harus konstanta waktu kompilasi, jadi lebar outline tidak bisa langsung dari uniform. Dengan `MAX_SAMPLE_DISTANCE = 8` ada hingga 288 sampel per piksel. Tutorial memperingatkan biaya naik linear dengan jumlah piksel dan iterasi.
  - Sumber: https://docs.flame-engine.org/main/tutorials/basic_shader/step3.html (diakses 2026-11-18)
  - Teknik 4, offset path vektor: Inkscape Offset LPE "changes the thickness of the whole object"; Cricut Design Space Offset punya jarak dan sudut Rounded/Angular, dan menurut cuplikan hanya ada di aplikasi desktop.
  - Sumber: https://inkscape-manuals.readthedocs.io/en/latest/live-path-effects.html (diakses 2026-11-18); https://help.cricut.com/hc/en-us/articles/360061650414 (cuplikan, 403, diakses 2026-11-18)

- **Tepi poligonal kasar (guntingan tangan)** (terbukti untuk algoritma; penerapannya ke stiker dugaan)
  - Ramer–Douglas–Peucker: mempertahankan titik terjauh dari ruas bila melebihi toleransi ε; ε lebih besar berarti lebih sedikit titik dan bentuk lebih kasar. Kasus terburuk O(n²). Hasilnya bisa berpotongan sendiri bila aproksimasi terlalu kasar (ada varian non-self-intersecting).
  - Sumber: https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm (diakses 2026-11-18)
  - simplify-js memadukan Radial Distance dan Douglas-Peucker; `highQuality` melewati praproses dan "runs ~10-20 times slower". Port Dart: paket `simplify` 1.1.0 (diterbitkan sekitar 2 tahun lalu, 8 likes, unverified uploader, semua platform).
  - Sumber: https://mourner.github.io/simplify-js/ ; https://pub.dev/packages/simplify (diakses 2026-11-18)
  - OpenCV `approxPolyDP` memakai Douglas-Peucker (cuplikan dokumentasi 3.x; halaman 4.x 403). Paket `opencv_dart` 2.2.2 (publisher terverifikasi rainyl.dev, 137 likes) membawa biner native; dampak ukuran APK tidak disebut.
  - Sumber: https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html (cuplikan); https://pub.dev/packages/opencv_dart (diakses 2026-11-18)
  - Tidak ditemukan aplikasi stiker/scrapbook yang menawarkan gaya tepi "poligon kasar" dengan nama tertentu (lihat "Belum terjawab").

- **Zigzag (gunting pinking)** (terbukti untuk bentuk; tidak ditemukan produk)
  - Gunting pinking punya bilah bergigi gergaji yang menghasilkan tepi zigzag; ada pola dekoratif lengkung (arch), gergaji, dan gigi asimetris.
  - Sumber: https://en.wikipedia.org/wiki/Pinking_shears (diakses 2026-11-18)

- **Tepi sobek / kasar** (terbukti untuk teknik Skia; Flutter tidak mengeksposnya)
  - Skia `SkDiscretePathEffect`: "chops a path into discrete segments, and randomly displaces them"; parameter panjang segmen, deviasi maksimum, dan `seedAssist` (seed sama → hasil sama).
  - Sumber: https://api.skia.org/classSkDiscretePathEffect.html (diakses 2026-11-18)
  - `dart:ui` tidak menyediakan kelas PathEffect publik; paket pihak ketiga `extended_path` mengimplementasikan `DiscretePathEffect` dan `DashPathEffect` (cuplikan mesin pencari, belum dicek di pub.dev).
  - Sumber: https://awesome.ecosyste.ms/projects/github.com%2Fhaucky%2Fextended_path (cuplikan, diakses 2026-11-18)
  - Inkscape Roughen LPE "adds imperfections to your shapes to simulate a more organic drawing". Sumber: https://inkscape-manuals.readthedocs.io/en/latest/live-path-effects.html (diakses 2026-11-18)
  - Picsart menawarkan tampilan sobek lewat efek "Paper" dan stiker "ripped paper", bukan pengaturan tepi potongan (cuplikan). Sumber: https://picsart.com/photo-effects/paper/ (cuplikan, diakses 2026-11-18)

- **Alat pendukung di Flutter** (terbukti untuk API)
  - `Path.addPolygon(points, close)`, `Path.combine(PathOperation, a, b)`, `Path.contains(point)`, `computeMetrics()`. Dokumentasi tidak memberi catatan performa untuk `combine`/`contains`.
  - Sumber: https://api.flutter.dev/flutter/dart-ui/Path-class.html (diakses 2026-11-18)
  - Batasan `FragmentProgram` (GLSL, hanya `sampler2D`, UV terbalik di OpenGLES): sudah di riset 17 Nov.

- **Masker dari ML Kit** (terbukti)
  - `enableForegroundConfidenceMask()` memberi masker keyakinan per piksel (contoh kode membandingkan dengan 0,5f); `enableMultipleSubjects()` memberi masker atau bitmap per subjek beserta `startX`, `startY`, `width`, `height`.
  - Sumber: https://developers.google.com/ml-kit/vision/subject-segmentation/android (diakses 2026-11-18)
  - Riset 17 Nov mencatat keluaran `native_cutout` berupa PNG dan `subjectBounds`. Tidak ada catatan bahwa paket itu meneruskan masker keyakinan atau masker per subjek.

### D. Aksesibilitas gambar bebas

- **WCAG 2.5.7 Dragging Movements (AA)** (terbukti)
  - "All functionality that uses a dragging movement for operation can be achieved by a single pointer without dragging, unless dragging is essential". Contoh alternatif di halaman Understanding: slider yang bisa diketuk di titik mana pun; tombol arah untuk peta; **mode seleksi lalu ketuk dua sudut berseberangan** untuk persegi seleksi; ketuk item lalu ketuk pasangannya.
  - Halaman Understanding 2.5.7 tidak membahas gambar bebas secara eksplisit.
  - Sumber: https://www.w3.org/WAI/WCAG22/Understanding/dragging-movements.html (diakses 2026-11-18)
- **WCAG 2.5.1 Pointer Gestures (A)** (terbukti)
  - Pengecualian untuk fungsi yang "inherently and necessarily based on complex paths"; contohnya tanda tangan ("entering your signature may be inherently path-based").
  - Sumber: https://www.w3.org/WAI/WCAG22/Understanding/pointer-gestures.html (diakses 2026-11-18)
- **Alternatif yang disediakan aplikasi lain** (terbukti dari sumber bagian A dan B)
  - Ketukan, bukan seretan: Photoroom Assisted (ketuk area), Shuffles (potong dengan satu ketukan), Apple `subject(at:)` (ketuk titik), Procreate dan Affinity Polygonal (ketuk untuk titik sudut), Adobe Express Quick select.
  - Kontrol tombol/slider: ukuran kuas lewat slider (Photoroom, Adobe Express), Invert (Adobe Express, Photoshop Express), centang untuk konfirmasi (Photoroom), Undo/Redo dan Zoom (Cut Paste Photo AI).
  - Hasil otomatis sebagai titik awal di semua aplikasi di bagian A.

## Kesimpulan

**Fakta bersumber.** Pola yang sama muncul di hampir semua aplikasi:
- hasil otomatis lebih dulu;
- perbaikan dengan pasangan **Hapus/Pulihkan**;
- jalan pintas "pintar" yang dipicu **ketukan** atau sapuan kasar (Photoroom Assisted, remove.bg Magic Brush, Adobe Quick select, Shuffles).

Laso poligon berbasis ketukan dengan titik awal yang diketuk untuk menutup bentuk ada di aplikasi gambar/foto profesional (Procreate, Affinity Photo iPad), bukan di aplikasi stiker konsumen yang ditemukan. Laso magnetik di sentuh hanya ditemukan di Affinity Photo iPad; Photoshop iPad tidak memilikinya. Gaya tepi yang ditawarkan aplikasi konsumen hampir selalu **outline putih/berwarna dengan tebal dan blur** (iOS Outline, Photoroom, Picsart Flow). Tepi sobek di Picsart berupa efek/stiker terpisah, dan zigzag atau poligon kasar tidak ditemukan sebagai pilihan tepi. Flutter menyediakan `ImageFilter.dilate`, `Path.addPolygon`/`Path.combine`, `RawMagnifier`, dan fragment shader, tetapi tidak menyediakan PathEffect seperti `SkDiscretePathEffect`.

**Tafsiran** (bukan keputusan; untuk dibahas pemilik dan agen `kamera-cutout`/`desainer-visual`):

1. **Mode Gunting (poligon) cocok dengan merek "kliping"** dan sekaligus menjadi alternatif tanpa seret untuk kuas (WCAG 2.5.7), karena setiap titik diletakkan dengan ketukan. Garis lurus (tanpa bezier) justru memberi kesan "digunting", jadi bezier tidak perlu.
2. **"Tepi" sebaiknya terpisah dari masker.** Masker menentukan *apa* yang ikut. Gaya tepi menentukan *bagaimana* batasnya digambar, sehingga bisa diganti tanpa merapikan ulang.
3. Gaya "guntingan" bisa dibuat **otomatis dari masker**: kontur masker → RDP dengan ε besar → offset putih. Pengguna tidak harus menaruh titik sendiri untuk mendapat kesan guntingan tangan.

**Usulan alur "Rapikan potongan" v5 yang diperbarui** (tafsiran):

Mode di bilah bawah (kontrol segmen, setiap tombol ≥ 48 dp):
- **Otomatis**: hasil `native_cutout` apa adanya. Tombol "Kembalikan otomatis" tetap ada di semua mode.
- **Kuas** (= `MaskBrush`): Tambah/Hapus, slider ukuran, zoom +/− dan cubit. Bagian terbuang dipucatkan dan diarsir seperti mockup v5. Loupe muncul di atas jari saat menyapu.
- **Gunting** (poligon):
  - ketuk untuk menaruh titik; titik tersambung garis lurus;
  - titik awal ditandai lingkaran besar (target ≥ 48 dp), dan mengetuknya menutup bentuk; tombol "Tutup guntingan" sebagai alternatif;
  - titik yang sudah ditaruh bisa diseret; ketuk titik lalu tombol "Hapus titik";
  - "Urungkan titik" menghapus titik terakhir;
  - setelah ditutup, bagian di luar bentuk dibuang (masker baru = masker lama ∩ poligon). Pengguna bisa kembali ke Kuas untuk detail.
- **Tepi**: pilihan gaya + tebal (S/M/L). Pratinjau langsung di alas potong.
- **Lihat hasil**: pratinjau di dua latar (alas putih bergrid dan latar gelap/halaman buku) untuk melihat sisa latar dan halo.

Urutan langkah:
1. Buka layar → mode Otomatis, dengan gaya tepi bawaan sudah tampil.
2. Bila perlu: Gunting untuk bentuk kasar, lalu Kuas untuk detail (urutan bebas; Urungkan/Ulangi berlaku lintas mode).
3. Tepi: pilih gaya.
4. Lihat hasil.
5. Simpan.

Gaya tepi yang ditawarkan:
- **Tanpa tepi**.
- **Tepi putih die-cut**: dilasi masker + isi putih, sudut membulat.
- **Guntingan**: kontur masker disederhanakan RDP lalu diberi tepi putih; sudut tajam.
- **Zigzag pinking**: gigi segitiga di sepanjang kontur offset.
- **Sobek**: kontur offset dengan perpindahan acak ber-seed seperti `SkDiscretePathEffect`, plus serat putih.

Prioritas (usulan):

| Prioritas | Isi |
|---|---|
| **Wajib** | Kuas Tambah/Hapus + slider ukuran; Urungkan/Ulangi; Kembalikan otomatis; tombol zoom +/− (alternatif cubit); pratinjau di dua latar; satu gaya tepi putih die-cut dengan satu tebal bawaan |
| **Bagus** | Mode Gunting poligon (taruh, seret, hapus, tutup); loupe saat menyapu; gaya Guntingan (RDP otomatis); pilihan tebal tepi S/M/L |
| **Nanti** | Snap ke tepi (magnetic/livewire); ketuk untuk memilih subjek (butuh masker per subjek/instance, belum diteruskan `native_cutout`); offset kuas dari jari; slider kehalusan tepi (feather, butuh masker keyakinan); Zigzag dan Sobek; kurva bezier (tidak disarankan untuk estetika gunting) |

Risiko performa (semua **dugaan**, belum diukur di Infinix Hot 11 Play / PowerVR GE8320):
- **Resolusi masker**: menyapu masker resolusi penuh kamera setiap frame berat. Bekerja di salinan resolusi turun (misalnya sisi panjang 1024–1536 px), lalu terapkan ke resolusi ekspor saat simpan. Angka ini belum diuji.
- **Kuas**: menggambar goresan sebagai `Path` di atas masker dengan `BlendMode` dan merasterisasi (`toImage`) hanya saat jari diangkat lebih murah daripada mengubah piksel di Dart setiap frame. Riwayat Urungkan sebaiknya menyimpan goresan/poligon, bukan salinan bitmap, supaya hemat memori.
- **Tepi die-cut**: `ImageFilter.dilate` memakai radius x/y (kemungkinan kernel kotak), sehingga sudut bisa kotak. Sudut bulat butuh blur + ambang atau shader jarak. Shader sampling tetangga dengan radius 8 berarti hingga 288 sampel per piksel. Hitung sekali saat gaya/tebal berubah lalu simpan sebagai gambar, jangan per frame.
- **Loupe**: `RawMagnifier` memakai BackdropFilter dan memaksa compositing. Biayanya di Impeller OpenGLES pada PowerVR belum diketahui. Alternatifnya, gambar potongan yang diperbesar dengan `drawImageRect` biasa.
- **Kontur + RDP**: menelusuri kontur (misalnya marching squares) dan RDP sebaiknya di isolate. RDP terburuk O(n²) dan bisa menghasilkan poligon yang berpotongan sendiri, sehingga perlu pemeriksaan atau ε adaptif.
- **Paket native tambahan**: `opencv_dart` menambah biner native dengan ukuran yang tidak disebut. Implementasi Dart murni (marching squares + `simplify`) lebih ringan, tetapi `simplify` dirawat satu uploader yang tidak terverifikasi.

**Istilah baru yang diusulkan** (belum ada di glosarium; tidak dipakai di kode sebelum disetujui):
- "Gunting" / `ScissorPolygon`: mode potong poligon.
- "Gaya tepi" / `edgeStyle`, dengan nilai `none`, `dieCut`, `snipped`, `pinking`, `torn`.
- "Tebal tepi" / `edgeWidth`.

## Belum terjawab

- Apakah iOS 17+ (Photos/Messages) menyediakan alat manual untuk menambah atau mengurangi bagian subjek: tidak ditemukan di sumber Apple yang terbaca.
- Cara kerja "Select manually" di Instagram Cutouts (halaman Help Center terbaca kosong) dan alat manual di Shuffles selain "Shape tool" (hanya sumber sekunder).
- Isi halaman Canva, Adobe Express, Photoshop Express, Photoshop iPad, OpenCV 4.x, dan Cricut: hanya cuplikan mesin pencari karena 403.
- Apakah Picsart saat ini punya laso, loupe, atau offset kuas di Cutout: blog resmi yang terbaca (2017–2022) tidak menyebutnya.
- Aplikasi yang memakai offset kuas dari jari dengan dokumentasi primer: hanya cuplikan ulasan Softpedia (403).
- Aplikasi stiker/scrapbook yang menawarkan tepi zigzag, sobek, atau poligon kasar sebagai pilihan tepi potongan: tidak ditemukan.
- Bentuk kernel `ImageFilter.dilate` (kotak atau bulat) dan dukungannya di Impeller OpenGLES: dokumentasi tidak menyebut.
- Biaya `RawMagnifier`/BackdropFilter, `ImageFilter.dilate`, dan shader outline di PowerVR GE8320: tidak ada benchmark.
- Apakah `native_cutout` bisa meneruskan masker keyakinan ML Kit atau masker instance Vision (untuk feather dan ketuk-pilih subjek): perlu cek kode paket.
- Status paket `extended_path` di pub.dev (versi, perawat): belum dicek.
- Ukuran tepi die-cut yang lazim untuk stiker cetak (mm): halaman StickerApp yang terbaca tidak memuatnya.
