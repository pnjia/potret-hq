# Template brief sub-agen

Sub-agen tidak melihat percakapan. Isi semua bagian; yang tidak relevan tulis "–".

```
Agen: <nama di .claude/agents/>
Tujuan: <hasil yang diminta, satu kalimat>
Konteks: <fakta penting dari percakapan yang tidak ada di file; keputusan K- dan Q- yang relevan>
Input (wajib dibaca): <path file>
Output: <path file yang ditulis dan formatnya, atau "jawaban teks saja">
Batas: <yang tidak boleh dilakukan atau disentuh di tugas ini>
Selesai bila: <kriteria yang bisa dicek, termasuk perintah yang harus lolos>
Laporan balik: <bentuk ringkasan yang diharapkan>
```

## Contoh

```
Agen: animasi-buku
Tujuan: Bandingkan dua pendekatan page-curl untuk prototipe K-012 dan rekomendasikan satu.
Konteks: Risiko #1 spesifikasi adalah page-curl tidak mulus di Android kelas menengah. Q-011 (target fps) belum dijawab; pakai 60 fps sebagai asumsi kerja dan sebut asumsinya.
Input: docs/teknis/buku.md, docs/produk/spesifikasi-sistem-v1.md §4.5 dan §9
Output: bagian baru "Perbandingan pendekatan" di docs/teknis/buku.md
Batas: belum membuat app/; tidak mengubah keputusan.
Selesai bila: dua pendekatan dibandingkan dengan sumber bertanggal, satu rekomendasi beserta risikonya, checklist agen dicentang.
Laporan balik: rekomendasi dalam 3 kalimat, path yang berubah, Q- baru bila ada.
```
