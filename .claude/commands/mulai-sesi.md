---
description: Mulai sesi - baca STATUS, keputusan terbaru, pertanyaan terbuka, dan git log, lalu usulkan langkah pertama
allowed-tools: Read, Grep, Glob, Bash(git status:*), Bash(git log:*), Bash(git branch:*)
---

Fokus tambahan dari pengguna (boleh kosong): $ARGUMENTS

1. `STATUS.md` sudah dimuat lewat `CLAUDE.md`. Bila isinya tidak terlihat di konteks, baca filenya.
2. Baca tiga entri keputusan terakhir di `docs/keputusan.md` (cari judul `### K-`), dan catat entri yang punya baris `Menggantikan:`.
3. Baca tabel "Terbuka" di `docs/pertanyaan.md`.
4. Jalankan `git status --short`, `git branch --show-current`, dan `git log --oneline -10`.
5. Bila tool Trello tersedia dan STATUS menyebut URL kartu, baca kartu itu (baca saja, jangan diubah).
6. Laporkan dalam maksimal 8 baris:
   - Fokus sekarang dan titik berhenti terakhir.
   - Perubahan yang belum di-commit, bila ada.
   - Pertanyaan terbuka yang menghalangi fokus sekarang.
   - **Satu** usulan langkah pertama, beserta agen yang cocok bila perlu (tabel di `CLAUDE.md`).
7. Bila fokus dari pengguna berbeda dengan STATUS, ikuti pengguna dan sebutkan perbedaannya.

Jangan mengubah file apa pun di perintah ini.
