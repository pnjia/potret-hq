// Token desain potret (K-021).
//
// Sumber tunggal: data/design-tokens.json di root repo. Nilai di sini adalah
// salinan manual. Kecocokannya dijaga oleh test/core/design_tokens_test.dart,
// yang membaca file JSON itu dan gagal bila ada nilai yang berbeda.
// Ubah JSON-nya dulu, lalu salin ke sini. Jangan menambah token yang tidak ada
// di JSON.

import 'dart:ui' show Color;

/// `color.*` di data/design-tokens.json.
abstract final class TokenColors {
  static const Color paperBase = Color(0xFFF3EEE4);
  static const Color paperRaised = Color(0xFFFBF8F2);
  static const Color paperLine = Color(0xFFDCD3C3);
  static const Color paperTape = Color(0xFFE6D6A3);

  static const Color inkPrimary = Color(0xFF1F1C19);
  static const Color inkSecondary = Color(0xFF5F584F);

  static const Color accentPrimary = Color(0xFFC2385F);
  static const Color accentSecondary = Color(0xFF2F5D8C);

  static const Color stateError = Color(0xFFB42318);
  static const Color stateSuccess = Color(0xFF2E7652);
}

/// `typography.*` di data/design-tokens.json.
///
/// File font belum dibundel di `assets/`. Sampai ditambahkan, Flutter jatuh ke
/// font bawaan sistem.
abstract final class TokenTypography {
  static const String display = 'Fraunces';
  static const String body = 'Plus Jakarta Sans';
  static const String handwriting = 'Caveat';
}

/// `spacing.*` di data/design-tokens.json (satuan px = logical pixel).
abstract final class TokenSpacing {
  /// Satuan dasar; spasi memakai kelipatan 4.
  static const double unit = 4;
}

/// `radius.*` di data/design-tokens.json.
abstract final class TokenRadius {
  static const double card = 6;
  static const double button = 8;
}

/// `motion.*` di data/design-tokens.json.
abstract final class TokenMotion {
  /// Durasi page-curl. Masih placeholder (null) sampai prototipe K-012 diukur.
  static const Duration? pageCurl = null;

  /// Batas rotasi acak penempatan, dalam derajat (-4 sampai +4).
  static const double placementRotationMaxDeg = 4;
}
