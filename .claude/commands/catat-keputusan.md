---
description: Catat keputusan baru sebagai entri K- berikutnya di docs/keputusan.md (append-only)
argument-hint: "<judul singkat keputusan>"
allowed-tools: Read, Grep, Glob, Edit
---

Judul keputusan: $ARGUMENTS

1. Baca `docs/keputusan.md` dan tentukan nomor berikutnya (K- terakhir + 1, tiga digit).
2. Susun entri dengan `templates/keputusan.md`: Tanggal (hari ini), Keputusan (kalimat yang bisa diuji), Alasan, **Ditolak** (alternatif + alasannya), Konsekuensi. Isinya diambil dari percakapan; bila alternatif yang ditolak belum jelas, tanyakan dulu.
3. Bila keputusan ini mengganti keputusan lama, tambahkan baris `Menggantikan: K-XXX` di entri **baru**. Entri lama tidak diedit dan tidak dihapus.
4. Bila keputusan ini menjawab pertanyaan, tambahkan baris `Menjawab: Q-XXX`, lalu pindahkan baris Q- itu dari tabel "Terbuka" ke "Terjawab" di `docs/pertanyaan.md`.
5. Tambahkan entri di **akhir** `docs/keputusan.md`. Tunjukkan entri lengkapnya ke pengguna.
6. Sebutkan dokumen stabil yang ikut terdampak (spesifikasi, `docs/teknis/`, `data/`, glosarium). Jangan diubah tanpa diminta. Spesifikasi v1 yang dikunci tidak diedit; cukup catat bahwa keputusan baru berlaku di atasnya.
