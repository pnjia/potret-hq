# Laporan analisis: dari `inzta-hq` ke HQ potret

> Dibuat: 16 Nov 2026. Disetujui pemilik 16 Nov 2026 ("Setuju semua, gabung"). Keputusan yang lahir dari laporan ini: K-013, K-014, K-015.
> Repo referensi `Inzta-Moto/inzta-hq` dibaca saja (tidak diubah). Path bertanda `inzta-hq:` merujuk file di repo itu, per commit `b04b4d9`.
> Dokumen ini snapshot. Bila struktur HQ berubah, catat keputusan baru; laporan ini tidak diperbarui.

## A. Peta repo referensi

`inzta-hq` adalah knowledge base tim dua orang untuk kontrak website klien. Isinya 1.448 file; kode website ada di repo terpisah.

| Bagian | Isi | Fungsi |
|---|---|---|
| `CLAUDE.md` → `AGENTS.md` | `CLAUDE.md` hanya `@AGENTS.md`; `AGENTS.md` 108 baris (11,3 KB) | Kontrak repo: urutan baca, tabel sumber kebenaran, aturan, agen, cek sebelum commit |
| `docs/context/` | `BRIEF.md` (465 baris), `ASSUMPTIONS.md` (A-001…A-160) | Pintu masuk dan pertanyaan terbuka |
| `docs/handoff/` | `current.md` (712 baris), `log/` (105 file) | Serah terima antarsesi dan antaranggota |
| `docs/steering/` | business, rules, workflow, tech | Aturan tetap |
| `docs/adr/` | 58 ADR + indeks | Keputusan |
| `docs/pipelines/` | 11 pipeline | Urutan tahap dengan gerbang manusia |
| `docs/specs/` | F-000…F-031 | Spec fitur website |
| `docs/client/`, `reports/`, `notulen/`, `plans/` | Dokumen klien | Kebutuhan kontrak |
| `knowledge/`, `research/` | Ringkasan per kanal; snapshot riset bertanggal | Pengetahuan |
| `data/`, `layout/sosmed/` | KPI CSV + `schema.json`, `tokens.json`, `motor-model.json` | Data mesin |
| `.claude/agents/` | 12 agen, masing-masing memuat skill di awal (field `skills`) | Spesialis |
| `.claude/skills/` | 62 skill: ±17 pengetahuan, ±45 alur kerja `/inzta-*` | Pengetahuan dan perintah |
| `scripts/`, `.githooks/`, `.github/workflows/` | 41 skrip cek, pre-commit, CI ±15 langkah | Penegak otomatis |

**Cara kerja agen.**
- Setiap permintaan non-trivial wajib lewat skill router (`inzta-hq:.claude/skills/inzta-orchestrator/SKILL.md`, tabel rute ±40 baris).
- Pekerjaan bertahap didelegasikan dengan template brief: tujuan, input, output, batas, selesai bila, laporan balik.
- Agen spesialis tidak bisa memanggil agen lain, jadi rantai "lalu verifier" dijalankan sesi utama.
- Pasangan pembuat-pemeriksa wajib: writer → editor, reviewer → verifier (ambang keyakinan ≥80), designer → kritikus (LOLOS ≥4,0).
- Pipeline berhenti di setiap gerbang manusia.
- Akhir sesi: `/inzta-handoff`, yang menulis ke tiga tempat (log, `current.md`, `BRIEF.md`).

## B. Dipertahankan, diubah, dibuang

**Dipertahankan:**
- Satu pintu masuk.
- Keputusan append-only dengan entri pengganti.
- ID untuk pertanyaan terbuka.
- Riset sebagai snapshot bertanggal.
- Trello hanya sebagai pelacak, dengan ID repo.
- Template brief sub-agen.
- Kriteria "selesai bila".
- Larangan membaca `.env`.
- Rem "dua percobaan lalu laporkan".

**Diubah:**

| Referensi | potret |
|---|---|
| BRIEF + handoff/current + 105 log | Satu `STATUS.md`, ditimpa tiap sesi, ±60 baris; riwayat di `git log` |
| 58 file ADR + indeks | `docs/keputusan.md` satu file append-only, field "Ditolak" wajib |
| Router 126 baris + 62 skill | Tabel rute ±10 baris di `CLAUDE.md`; pengetahuan berupa dokumen biasa |
| Glosarium marketing (bahan belajar) | Glosarium proyek: istilah → nama di kode, pemetaan field, sinonim yang dihindari |
| 41 skrip cek wajib + CI | Satu skrip sukarela `scripts/cek-hq.mjs` |

**Dibuang: semua gerbang.** Kualitas yang hilang dan penggantinya:

| Gerbang yang dibuang | Kualitas yang hilang | Pengganti ringan di potret |
|---|---|---|
| G0, G2, S1 (persetujuan klien) | Validasi isi oleh pemilik domain | Tidak relevan untuk proyek solo; keputusan lewat `/catat-keputusan` |
| "Diperiksa PJ", G3, S2 (cek pasca-tayang) | Pengecekan setelah rilis | `docs/teknis/rilis.md`, checklist pribadi |
| Writer ≠ editor | Mata kedua, mengurangi bias membenarkan diri | Checklist "selesai" di setiap agen; mata kedua opsional (`/code-review` bawaan) |
| Reviewer → verifier ≥80 | Penyaringan temuan palsu | Setiap temuan berbukti `file:baris`/URL dan berlabel **terbukti** atau **dugaan** |
| Papan, konsep, musik, preview, kritikus LOLOS ≥4,0 | Kesepakatan arah visual sebelum kerja mahal | Contoh acuan di `docs/desain/acuan/` + checklist desainer "bandingkan dengan acuan dulu" |
| Gerbang spec 0, 0b, 1 | Kesepakatan sebelum menulis kode | Spesifikasi sudah dikunci; fitur baru diberi "Selesai bila" di kartu Trello |
| Pre-commit `check-sensitive`, CI | Konsistensi mekanis, kebocoran rahasia | `.gitignore`, deny di `.claude/settings.json`, `node scripts/cek-hq.mjs` sukarela |
| `cek-kirim-klien`, `uji-pembaca` | Kejelasan dokumen klien | Tidak relevan |

## C. Kekurangan referensi, diukur dengan prinsip pemilik

| # | Prinsip | Nilai | Bukti |
|---|---|---|---|
| 1 | `CLAUDE.md` sebagai peta ringkas | Sebagian | 108 baris, tetapi `inzta-hq:AGENTS.md:81` satu baris 1.012 karakter (flag skrip, path `D:\`, nomor ADR); baris 32, 35, 80 juga >400 karakter. Router 126 baris wajib dibaca untuk setiap permintaan |
| 2 | Satu file status + ritual awal/akhir | Rusak karena tumbuh | `inzta-hq:docs/context/BRIEF.md:3` mengaku pintu masuk, tetapi "Langkah berikutnya" (baris 34 dst.) berisi ±85 entri bertanggal sampai 6 Nov, dengan item dicoret (baris 56, 59–63). `inzta-hq:docs/handoff/current.md:3` mengaku "hanya merangkum sesi terakhir tiap orang", padahal isinya 86 bagian dalam 712 baris. Ritual awal tidak punya perintah |
| 3 | Keputusan mencatat alasan dan alternatif ditolak; tidak dihapus | Sebagian | Alternatif ditolak digabung ke "Alasan" (`inzta-hq:docs/templates/adr.md:17`). 19 baris "superseded (sebagian)" di `inzta-hq:docs/adr/README.md`, jadi aturan yang berlaku harus dirangkai dari banyak ADR. ADR "proposed" menggantung (ADR-0009, ADR-0018). Nomor bentrok antarbranch (`inzta-hq:docs/handoff/current.md:59`) |
| 4 | Glosarium konsisten | Gagal | Hanya `inzta-hq:knowledge/glosarium-marketing.md` (401 baris, bahan belajar), tanpa pemetaan ke kode. Status berbeda per pipeline: kalender artikel `brief`/`draf` vs `inzta-hq:scripts/check-sosmed.mjs:32` `naskah`/`desain`/`diserahkan`. "PJ", "RND", "sesi PM" tidak didefinisikan di `AGENTS.md` |
| 5 | Satu sumber kebenaran; Trello untuk status | Gagal | `inzta-hq:docs/trello.md:5` menyebut repo menang, tetapi `inzta-hq:docs/trello.md:42` sengaja menduplikasi status ke `content/kalender.md`. Status yang sama juga ada di front matter artikel, kolom Status `docs/specs/_index.md`, "Status" BRIEF, dan handoff |
| 6 | Stabil dipisah dari cepat berubah | Gagal | Satu sel `inzta-hq:docs/specs/_index.md` (baris F-005) berisi deskripsi + status + PR + tanggal. BRIEF mencampur Ringkasan dan jurnal harian. Dokumen aturan `inzta-hq:docs/steering/workflow.md:18` berisi tenggat "Rabu, 4 November 2026" |
| 7 | Data mesin dalam JSON + skema | Sebagian | Ada `layout/sosmed/tokens.json`, `data/motor-model.json`, `layout/sosmed/wajib-buram.json`, tetapi hanya `data/kpi/schema.json` yang berskema. Skema token tersirat di skrip tes; `motor-model.json` menaruh dokumentasi di field `catatan` |
| 8 | Contoh acuan konkret | Sebagian (sosmed saja) | `layout/sosmed/contoh/`, `layout/sosmed/sistem/sistem.html`, `knowledge/referensi-motion.md` (16 baris; URL referensi masih diminta, BRIEF:54). Website tanpa acuan |
| 9 | Riset bertanggal dan bersumber; baris "terakhir diverifikasi" | Lulus | Nama file `research/` bertanggal, README berstatus, ±36 dokumen punya baris verifikasi. Lemah: ringkasan di `knowledge/` tidak bertanggal per klaim; banyak fakta "[resmi] hanya dari cuplikan pencarian" (`inzta-hq:docs/handoff/current.md:151`) |
| 10 | Batas sub-agen jelas, checklist mandiri, tanpa gerbang | Sebagian | Tools, batas, dan laporan balik ada, tetapi "selesai" bergantung pada gerbang luar. Path output agen tidak ada: `docs/reports/seo/`, `docs/reports/iklan/`, `content/materi-iklan/` |

**11. Temuan lain dari sudut pandang AI pembaca:**
- **Dokumen basi saling bertentangan.** `inzta-hq:docs/onboarding.md` langkah 6 dan `inzta-hq:docs/pipelines/README.md:9` masih menyuruh FigCraft/EffectCraft, padahal ADR-0056/0057 sudah menggantinya. Skill arsip `inzta-figcraft` ("jangan dipakai") tetap dimuat di daftar skill setiap sesi.
- **Beban konteks.** 62 deskripsi skill (sebagian >1.000 karakter, misalnya `inzta-iklan`) ikut dimuat di setiap sesi sebelum pekerjaan dimulai.
- **Ketergantungan mesin lokal di kontrak bersama.** `C:\Users\PLN\Downloads`, `D:\Projects\_tmp`, dan `layout/render.ps1` tidak berlaku di sesi cloud.
- **Fakta, kutipan chat, dan keputusan bercampur di status.** Contoh: `inzta-hq:docs/context/BRIEF.md:86` ("±21.04", "jam dari HP Sehan, tidak akurat").
- **Bahasa spec campur.** Spec besar ditulis dalam bahasa Inggris (`inzta-hq:docs/specs/_index.md:3`), sisanya Indonesia.

## D. Struktur potret (dibangun)

Keputusan: HQ **digabung** dengan kode aplikasi (K-013).

```
potret-hq/
├── CLAUDE.md               peta (<150 baris) + @STATUS.md dimuat otomatis
├── README.md               panduan harian untuk pemilik
├── STATUS.md               satu-satunya status; ditimpa tiap sesi
├── LAPORAN-ANALISIS.md     dokumen ini (snapshot)
├── .gitignore
├── .claude/
│   ├── settings.json       deny .env/kunci, allow git baca-saja + cek-hq; tanpa hook
│   ├── agents/             8 sub-agen (bagian E)
│   └── commands/           mulai-sesi, akhiri-sesi, catat-keputusan, catat-riset, cek-hq
├── docs/
│   ├── cara-kerja.md       lapisan pengetahuan, ritual, aturan bersama agen, Trello
│   ├── keputusan.md        APPEND-ONLY · K-001…K-015
│   ├── pertanyaan.md       Q-001…Q-014 menunggu keputusan pemilik
│   ├── produk/             STABIL · spesifikasi-sistem-v1.md (DIKUNCI), glosarium.md
│   ├── riset/              BERTANGGAL · README + 2026-11-16-riset-awal.md
│   ├── desain/             STABIL · arah-visual.md, acuan/ (README, kartu-share, halaman-buku)
│   ├── teknis/             STABIL · arsitektur, buku, kamera, backend, rilis
│   └── kepatuhan/          STABIL · privasi-dan-regulasi.md
├── data/                   MESIN · design-tokens.json, cameras.json, cities.json
│   ├── schema/             JSON Schema draft 2020-12 untuk ketiganya
│   └── README.md
├── templates/              keputusan, riset, brief-subagen, kartu-trello
└── scripts/cek-hq.mjs      pemeriksaan sukarela, tanpa dependensi
```

| Folder | Alasan |
|---|---|
| Root (`CLAUDE.md`, `STATUS.md`, `README.md`) | Tiga hal yang dibaca setiap sesi: peta untuk AI, status, dan panduan manusia. Semuanya pendek |
| `docs/produk/` | Apa yang dibangun. Stabil dan dikunci; glosarium dipisah supaya bisa dirujuk tanpa membaca seluruh spesifikasi |
| `docs/keputusan.md` | Satu file karena masih kecil dan mudah dipindai; append-only menjaga riwayat |
| `docs/pertanyaan.md` | Celah dipisah dari keputusan supaya agen punya tempat melapor tanpa memutuskan |
| `docs/riset/` | Snapshot bertanggal; usang = riset baru, bukan edit |
| `docs/desain/` | Arah visual + acuan konkret, karena "estetik" saja tidak bisa diuji |
| `docs/teknis/` | Satu file per area agen. AI cukup membaca area yang relevan (progressive disclosure) |
| `docs/kepatuhan/` | Kewajiban hukum berubah dan perlu baris verifikasi sendiri |
| `data/` + `schema/` | Data yang dibaca kode dan agen harus bisa divalidasi mesin |
| `templates/` | Format yang diulang (keputusan, riset, brief, kartu) |
| `.claude/` | Agen dan perintah sesi ikut ke setiap clone dan sesi cloud |
| `app/`, `supabase/` (belum ada) | Dibuat saat prototipe K-012 dimulai; `app/CLAUDE.md` hanya dimuat saat bekerja di sana |

## E. Sub-agen

Tanpa orchestrator; sesi utama yang mengatur pembagian.

| Agen | Lingkup | Boleh menulis |
|---|---|---|
| `arsitek-flutter` | Struktur app, drift, sinkronisasi, plugin, onboarding | `docs/teknis/arsitektur.md`, `app/` di luar fitur spesialis |
| `animasi-buku` | Page-curl, suara, lazy load, tata letak (`isManuallyArranged`), render video share | `docs/teknis/buku.md`, `app/lib/features/book/`, `share/` |
| `kamera-cutout` | Kamera, LUT, `native_cutout`, kuas masker, labeling, lokasi sesaat, EXIF | `docs/teknis/kamera.md`, `app/lib/features/camera/`, `finding/` |
| `backend-supabase` | Postgres, RLS, Storage, Auth, hapus akun, follow/lapor/blokir, entitlement | `docs/teknis/backend.md`, `supabase/` |
| `desainer-visual` | Token, arah visual, template, skin, kartu share, acuan | `docs/desain/`, `data/design-tokens.json` |
| `kurator-katalog` | Kota, landmark, kategori, misi, lencana | `data/cities.json`, katalog baru di `data/` |
| `penasihat-privasi` | PP Tunas, UU PDP, aturan toko. Pembantu yang tidak memblokir | `docs/kepatuhan/`, `docs/pertanyaan.md` |
| `peneliti` | Riset web bertanggal | file baru di `docs/riset/` |

Setiap agen memuat:
- frontmatter (`name`, `description` dengan contoh pemicu, `tools`);
- daftar baca dulu;
- lingkup dan bukan-lingkup (dengan agen tujuan);
- file yang boleh dan tidak boleh disentuh;
- checklist selesai yang diperiksa sendiri;
- bentuk laporan balik.

Aturan bersama ada sekali di `docs/cara-kerja.md` §3, tidak diulang di tiap agen.

## F. Celah dan konflik di spesifikasi (dicatat, tidak diputuskan)

Semuanya tercatat di `docs/pertanyaan.md`:

| Q | Ringkas |
|---|---|
| Q-001 | PP Tunas kemungkinan mendefinisikan anak sebagai di bawah 18 tahun, sehingga dasar K-001 perlu dicek ke teks asli |
| Q-002 | Apakah tahun lahir (deklarasi mandiri) cukup sebagai verifikasi usia |
| Q-003 | `path_foto_asli_lokal` tersinkron atau hanya lokal |
| Q-004 | Taksonomi kategori dan pemetaan label ML Kit |
| Q-005 | Kota MVP |
| Q-006 | Nama aplikasi |
| Q-007 | Palet dan tipografi (token masih placeholder) |
| Q-008 | Sumber dan lisensi suara |
| Q-009 | RevenueCat atau `in_app_purchase` |
| Q-010 | Simpan tahun lahir atau penanda usia saja |
| Q-011 | Perangkat acuan dan target performa page-curl (dibutuhkan prototipe K-012) |
| Q-012 | Ganti nama repo setelah digabung |
| Q-013 | State management dan struktur folder Flutter |
| Q-014 | Arti angka "23/100" di stempel kota |

Konflik urutan kerja: spesifikasi §10 menaruh "Susun board Trello" sebelum prototipe, sedangkan pemilik menetapkan langkah berikutnya "Prototipe animasi buka halaman (K-012)". `STATUS.md` mengikuti pemilik dan mencatat Trello sebagai tertunda.
