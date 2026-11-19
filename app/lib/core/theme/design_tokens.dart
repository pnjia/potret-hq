// Token desain potret (K-035, arah visual v5 "Karcis & Kliping").
//
// Sumber tunggal: data/design-tokens.json di root repo. Nilai di sini adalah
// salinan manual. Kecocokannya dijaga oleh test/core/design_tokens_test.dart,
// yang membaca file JSON itu dan gagal bila ada nilai yang berbeda.
// Ubah JSON-nya dulu, lalu salin ke sini. Jangan menambah token yang tidak ada
// di JSON.

import 'dart:ui' show Color;

/// `color.*` di data/design-tokens.json. Nama = grup + key (camelCase).
abstract final class TokenColors {
  // color.paper
  static const Color paperScreen = Color(0xFFFFFFFF);
  static const Color paperBook = Color(0xFFF6F5F1);
  static const Color paperMuted = Color(0xFFEDEDF0);
  static const Color paperTape = Color(0xFFEBE8DC);

  // color.ink
  static const Color inkPrimary = Color(0xFF121212);
  static const Color inkSecondary = Color(0xFF5B5B66);

  // color.action
  static const Color actionPrimary = Color(0xFF3048FF);
  static const Color actionOnPrimarySoft = Color(0xFFDCE1FF);

  // color.highlight
  static const Color highlightPrimary = Color(0xFFD4F25C);

  // color.state
  static const Color stateError = Color(0xFFB42318);
  static const Color stateSuccess = Color(0xFF2E7652);

  // color.noteInk
  static const Color noteInkInk = Color(0xFF121212);
  static const Color noteInkCobalt = Color(0xFF3048FF);
  static const Color noteInkSepia = Color(0xFF6B4226);
  static const Color noteInkStampRed = Color(0xFFB42318);
  static const Color noteInkMagenta = Color(0xFFC2185B);
  static const Color noteInkGreen = Color(0xFF276B4A);

  // color.category
  static const Color categorySign = Color(0xFF9DB4FF);
  static const Color categoryFood = Color(0xFFFF6FA3);
  static const Color categoryDrink = Color(0xFF5ED1E0);
  static const Color categoryVehicle = Color(0xFFFFD84D);
  static const Color categoryAnimal = Color(0xFFC7A6FF);
  static const Color categoryPlant = Color(0xFF7FD6A6);
  static const Color categoryBuilding = Color(0xFFFF8A5B);
  static const Color categoryObject = Color(0xFFE0C39A);
  static const Color categoryOther = Color(0xFFD6D6DC);
}

/// `typography.*` di data/design-tokens.json.
///
/// File font belum dibundel di `assets/`. Sampai ditambahkan, Flutter jatuh ke
/// font bawaan sistem.
abstract final class TokenTypography {
  static const String display = 'Anybody';
  static const String body = 'Plus Jakarta Sans';
  static const String handwriting = 'Nanum Pen Script';
}

/// `spacing.*` di data/design-tokens.json (satuan px = logical pixel).
abstract final class TokenSpacing {
  /// Satuan dasar; spasi memakai kelipatan 4.
  static const double unit = 4;
  static const double screenMargin = 16;
  static const double blockGap = 16;
}

/// `radius.*` di data/design-tokens.json.
abstract final class TokenRadius {
  static const double none = 0;
  static const double paper = 2;
  static const double ticket = 4;
}

/// `border.*` di data/design-tokens.json.
abstract final class TokenBorder {
  static const double ink = 2;
  static const double tag = 1.5;
}

/// `size.*` di data/design-tokens.json.
abstract final class TokenSize {
  static const double touchTargetMin = 48;
  static const double buttonHeight = 56;
}

/// `motion.*` di data/design-tokens.json (sebagian; tambahkan saat dipakai).
abstract final class TokenMotion {
  /// Durasi page-curl. Masih placeholder (null) sampai prototipe K-012 diukur.
  static const Duration? pageCurl = null;

  /// Batas rotasi acak penempatan otomatis, dalam derajat (-4 sampai +4).
  static const double placementRotationMaxDeg = 4;

  /// Atur manual (K-037): langkah dan batas putar.
  static const double manualRotationStepDeg = 2;
  static const double manualRotationMaxDeg = 15;

  /// Total momen "Cap!".
  static const Duration capTotal = Duration(milliseconds: 1100);
}
