---
description: Akhiri sesi - timpa STATUS.md, pastikan keputusan dan pertanyaan tercatat, jalankan cek-hq, usulkan commit
allowed-tools: Read, Grep, Glob, Edit, Write, Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(node scripts/cek-hq.mjs:*)
---

Catatan tambahan dari pengguna (boleh kosong): $ARGUMENTS

1. Kumpulkan apa yang terjadi di sesi ini: percakapan, `git status --short`, `git diff --stat`, dan `git log --oneline` sejak awal sesi.
2. **Keputusan**: bila sesi ini memutuskan sesuatu yang belum tercatat, tanyakan apakah perlu dicatat lewat `/catat-keputusan`. Jangan mencatat sendiri tanpa persetujuan.
3. **Pertanyaan**: celah atau konflik baru ditambahkan sebagai Q- di `docs/pertanyaan.md`. Yang terjawab dipindah ke tabel "Terjawab" beserta nomor K-nya.
4. **Timpa** `STATUS.md` (jangan menambah riwayat). Pertahankan kepala file, lalu isi:
   - `Terakhir diperbarui: <tanggal hari ini>`
   - **Fokus sekarang**: satu fokus + URL kartu Trello bila ada.
   - **Titik berhenti sesi terakhir**: maksimal 5 butir, cukup konkret supaya sesi berikutnya bisa langsung lanjut (file, fungsi, perintah terakhir yang dijalankan, hasilnya).
   - **Langkah berikutnya**: 1–3 butir berurutan.
   - **Tertunda** dan **Menunggu keputusan** (nomor Q- saja).
   - Total maksimal ±60 baris. Riwayat tidak ditulis di sini karena sudah ada di `git log`.
5. Jalankan `node scripts/cek-hq.mjs`. Perbaiki error yang ditimbulkan sesi ini; laporkan sisanya.
6. Usulkan satu pesan commit dalam bahasa Inggris. Jangan commit atau push tanpa diminta.
7. Laporkan: ringkasan 3 baris, hasil cek-hq, dan pesan commit usulan.
