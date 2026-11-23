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

/// `typography.*` di data/design-tokens.json. Font dibundel di
/// `assets/fonts/` (lihat README di sana); nama keluarga = nama di pubspec.
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

  /// Lebar sobekan karcis (tetap, bukan persen).
  static const double ticketStub = 30;

  /// Jari-jari takik karcis besar. Label kategori memakai setengahnya (4).
  static const double ticketNotch = 8;

  /// Diameter minimal cap pos kota di layar dan di kartu share 1080 px.
  static const double stampMinScreen = 96;
  static const double stampMinShare = 240;
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

  /// Rotasi kliping (dan kartu share): -3 sampai +3 derajat.
  static const double clippingRotationMaxDeg = 3;

  /// Rotasi cap pos: -12 sampai -6 derajat.
  static const double stampRotationMinDeg = -12;
  static const double stampRotationMaxDeg = -6;

  /// Rotasi kliping hero Beranda.
  static const double heroRotationDeg = -1;

  /// Total momen "Cap!".
  static const Duration capTotal = Duration(milliseconds: 1100);
}

/// Peran font di `textStyle.*.font`.
enum TokenFont { display, body, handwriting }

/// Satu entri `textStyle.*` di data/design-tokens.json. Data saja; diubah
/// menjadi `TextStyle` oleh `core/theme/app_text_styles.dart`.
final class TokenTextStyle {
  const TokenTextStyle({
    required this.font,
    required this.size,
    required this.lineHeight,
    required this.weight,
    required this.width,
    required this.letterSpacing,
    required this.uppercase,
  });

  final TokenFont font;
  final double size;

  /// Kelipatan ukuran huruf; null = bawaan font.
  final double? lineHeight;
  final int weight;

  /// Sumbu `wdth` Anybody dalam persen; null = tidak dipasang.
  final double? width;
  final double letterSpacing;
  final bool uppercase;
}

/// `textStyle.*` di data/design-tokens.json.
abstract final class TokenTextStyles {
  /// Nama kota di hero.
  static const displayXl = TokenTextStyle(
    font: TokenFont.display,
    size: 64,
    lineHeight: 0.86,
    weight: 900,
    width: 50,
    letterSpacing: 0.5,
    uppercase: true,
  );

  /// Angka besar ("13").
  static const numberLarge = TokenTextStyle(
    font: TokenFont.display,
    size: 44,
    lineHeight: 1.0,
    weight: 900,
    width: 55,
    letterSpacing: 0,
    uppercase: false,
  );

  /// Angka pasangan ("/100").
  static const numberPair = TokenTextStyle(
    font: TokenFont.display,
    size: 24,
    lineHeight: 1.0,
    weight: 300,
    width: 130,
    letterSpacing: 0,
    uppercase: false,
  );
  static const h1 = TokenTextStyle(
    font: TokenFont.display,
    size: 28,
    lineHeight: 1.0,
    weight: 800,
    width: 75,
    letterSpacing: -0.2,
    uppercase: false,
  );
  static const landmarkName = TokenTextStyle(
    font: TokenFont.display,
    size: 32,
    lineHeight: 1.0,
    weight: 800,
    width: 75,
    letterSpacing: -0.2,
    uppercase: false,
  );
  static const successTitle = TokenTextStyle(
    font: TokenFont.display,
    size: 56,
    lineHeight: 0.9,
    weight: 900,
    width: 60,
    letterSpacing: 0,
    uppercase: false,
  );
  static const h2 = TokenTextStyle(
    font: TokenFont.display,
    size: 20,
    lineHeight: 1.1,
    weight: 800,
    width: 75,
    letterSpacing: 0,
    uppercase: false,
  );

  /// Karcis besar ("POTRET SEKARANG").
  static const ticketLarge = TokenTextStyle(
    font: TokenFont.display,
    size: 30,
    lineHeight: 0.9,
    weight: 900,
    width: 60,
    letterSpacing: 0.3,
    uppercase: true,
  );

  /// Sobekan karcis dan nomor seri ("NO. 014").
  static const ticketSerial = TokenTextStyle(
    font: TokenFont.display,
    size: 13,
    lineHeight: 1.0,
    weight: 700,
    width: 70,
    letterSpacing: 0.5,
    uppercase: true,
  );
  static const body = TokenTextStyle(
    font: TokenFont.body,
    size: 16,
    lineHeight: 1.45,
    weight: 400,
    width: null,
    letterSpacing: 0,
    uppercase: false,
  );
  static const button = TokenTextStyle(
    font: TokenFont.body,
    size: 16,
    lineHeight: 1.0,
    weight: 800,
    width: null,
    letterSpacing: 0,
    uppercase: false,
  );
  static const label = TokenTextStyle(
    font: TokenFont.body,
    size: 13,
    lineHeight: null,
    weight: 700,
    width: null,
    letterSpacing: 0,
    uppercase: false,
  );
  static const meta = TokenTextStyle(
    font: TokenFont.body,
    size: 13,
    lineHeight: 1.35,
    weight: 500,
    width: null,
    letterSpacing: 0,
    uppercase: false,
  );

  /// Keterangan di buku (tulisan tangan).
  static const bookNote = TokenTextStyle(
    font: TokenFont.handwriting,
    size: 24,
    lineHeight: 1.05,
    weight: 400,
    width: null,
    letterSpacing: 0.3,
    uppercase: false,
  );

  /// Semua entri, dengan key JSON-nya (dipakai tes kecocokan).
  static const all = <String, TokenTextStyle>{
    'displayXl': displayXl,
    'numberLarge': numberLarge,
    'numberPair': numberPair,
    'h1': h1,
    'landmarkName': landmarkName,
    'successTitle': successTitle,
    'h2': h2,
    'ticketLarge': ticketLarge,
    'ticketSerial': ticketSerial,
    'body': body,
    'button': button,
    'label': label,
    'meta': meta,
    'bookNote': bookNote,
  };
}
