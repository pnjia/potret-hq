// Kontras teks WCAG 2.x untuk setiap pasangan warna teks/latar yang dipakai
// komponen v5 (K-035: semua teks >= 4,5:1). Rumus sama dengan
// docs/desain/usulan-v5/kontras.py.

import 'dart:math' as math;
import 'dart:ui' show Color;

import 'package:flutter_test/flutter_test.dart';
import 'package:potret/core/category_style.dart';
import 'package:potret/core/theme/design_tokens.dart';

double _luminance(Color c) {
  double channel(double v) =>
      v <= 0.04045 ? v / 12.92 : math.pow((v + 0.055) / 1.055, 2.4).toDouble();
  return 0.2126 * channel(c.r) + 0.7152 * channel(c.g) + 0.0722 * channel(c.b);
}

double contrast(Color a, Color b) {
  final la = _luminance(a), lb = _luminance(b);
  return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
}

void main() {
  const ink = TokenColors.inkPrimary;
  const ink2 = TokenColors.inkSecondary;
  const white = TokenColors.paperScreen;
  const pairs = <String, (Color, Color)>{
    'teks Tinta di putih': (ink, white),
    'teks Tinta 2 (meta, tab tak aktif) di putih': (ink2, white),
    'teks Tinta di Lime (karcis Potret, tab aktif, stabilo)': (
      ink,
      TokenColors.highlightPrimary,
    ),
    'teks putih di Kobalt (tombol utama, hero)': (
      white,
      TokenColors.actionPrimary,
    ),
    'tautan Kobalt di putih': (TokenColors.actionPrimary, white),
    'teks Tinta di kertas buku': (ink, TokenColors.paperBook),
    'keterangan Kobalt di kertas buku': (
      TokenColors.noteInkCobalt,
      TokenColors.paperBook,
    ),
    'teks Tinta 2 di kertas buku (slot kosong)': (ink2, TokenColors.paperBook),
    'teks putih di Tinta (snackbar)': (white, ink),
  };

  for (final e in pairs.entries) {
    test(e.key, () {
      expect(contrast(e.value.$1, e.value.$2), greaterThanOrEqualTo(4.5));
    });
  }

  test('teks Tinta di setiap warna kategori', () {
    for (final c in CategoryId.values) {
      expect(
        contrast(ink, CategoryStyle.of(c).color),
        greaterThanOrEqualTo(4.5),
        reason: c.name,
      );
    }
  });
}
