// Nilai enum entitas glosarium (docs/produk/glosarium.md bagian 4). Disimpan
// di drift sebagai nama enum, sama dengan nilai teks di Postgres nanti.
// Mengganti nama nilai berarti migrasi data: jangan diubah diam-diam.

/// `Finding.edgeStyle` (K-031, K-037). Bawaan [dieCut].
enum EdgeStyle { none, dieCut, snipped, pinking, torn }

/// `Finding.edgeWidth` (K-037).
enum EdgeWidth { s, m, l }

/// `Page.kind` (spesifikasi §4.5).
enum PageKind { divider, landmark, free }

/// `Page.paperStyle` (K-037).
enum PaperStyle { plain, lined, dotted, grid }

/// `Placement.tapePosition` (K-037).
enum TapePosition { none, oneCorner, twoCorners, top }

/// `Placement.tapePattern` (K-043).
enum TapePattern { plain, striped, grid, halftone, ticket, text }

/// `Placement.noteInk` (K-031, K-037).
enum NoteInk { ink, cobalt, sepia, stampRed, magenta, green }
