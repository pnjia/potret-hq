---
description: Tulis riset baru yang bertanggal dan bersumber ke docs/riset/
argument-hint: "<topik atau pertanyaan riset>"
---

Topik riset: $ARGUMENTS

1. Cek `docs/riset/README.md`: adakah riset yang sudah menjawab topik ini? Bila ada dan belum usang, tunjukkan saja.
2. Bila riset perlu web: delegasikan ke agen `peneliti` dengan brief dari `templates/brief-subagen.md` (tujuan, pertanyaan, riset lama yang terkait, output `docs/riset/<tanggal-hari-ini>-<topik-kebab>.md`).
3. Bila bahannya dari percakapan atau dokumen yang diberikan pengguna, tulis sendiri dengan `templates/riset.md`.
4. Pastikan: tanggal di nama file dan kepala file, URL sumber di setiap fakta, bagian "cek ulang sebelum dipakai", serta fakta dan tafsiran dipisah.
5. Tambahkan baris di tabel `docs/riset/README.md`.
6. Riset lama tidak diedit. Bila riset baru menggantikan yang lama, sebut file lama di kepala file baru.
7. Laporkan 3–5 temuan terpenting dan keputusan yang mungkin terdampak, tanpa memutuskannya.
