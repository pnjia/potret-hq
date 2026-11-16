---
description: Jalankan pemeriksaan HQ (tautan, skema JSON, frontmatter agen, glosarium, panjang CLAUDE.md dan STATUS.md) dan jelaskan hasilnya
allowed-tools: Read, Grep, Glob, Edit, Bash(node scripts/cek-hq.mjs:*)
---

1. Jalankan `node scripts/cek-hq.mjs`.
2. Jelaskan setiap ERROR dengan bahasa sederhana dan usulkan perbaikannya. PERINGATAN cukup diringkas.
3. Perbaiki yang mekanis (tautan salah ketik, key JSON keliru) bila pengguna setuju. Jangan mengubah isi keputusan atau spesifikasi v1.

Pemeriksaan ini sukarela, bukan syarat commit (K-015).
