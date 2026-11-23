import 'package:material_ui/material_ui.dart';

import 'design_tokens.dart';

/// Mengubah [TokenTextStyle] menjadi [TextStyle]. Anybody dan Plus Jakarta Sans
/// adalah font variabel, jadi bobot dan lebar dipasang lewat [FontVariation]
/// (`wght`, `wdth`) selain [FontWeight].
TextStyle textStyleFromToken(TokenTextStyle t, {Color? color}) {
  final family = switch (t.font) {
    TokenFont.display => TokenTypography.display,
    TokenFont.body => TokenTypography.body,
    TokenFont.handwriting => TokenTypography.handwriting,
  };
  final variable = t.font != TokenFont.handwriting;
  return TextStyle(
    fontFamily: family,
    fontSize: t.size,
    height: t.lineHeight,
    fontWeight: FontWeight.values[(t.weight ~/ 100).clamp(1, 9) - 1],
    fontVariations: variable
        ? [
            FontVariation.weight(t.weight.toDouble()),
            if (t.width != null) FontVariation.width(t.width!),
          ]
        : null,
    letterSpacing: t.letterSpacing,
    color: color ?? TokenColors.inkPrimary,
    // Teks UI tidak pernah dipotong menjadi elipsis diam-diam: pemanggil yang
    // memutuskan overflow.
    leadingDistribution: TextLeadingDistribution.even,
  );
}

/// Gaya teks bawaan v5. Teks KAPITAL (`uppercase` di token) dikapitalkan oleh
/// pemanggil lewat [AppTextStyles.applyCase] supaya pembaca layar tetap
/// menerima teks aslinya.
abstract final class AppTextStyles {
  static final displayXl = textStyleFromToken(TokenTextStyles.displayXl);
  static final numberLarge = textStyleFromToken(TokenTextStyles.numberLarge);
  static final numberPair = textStyleFromToken(TokenTextStyles.numberPair);
  static final h1 = textStyleFromToken(TokenTextStyles.h1);
  static final landmarkName = textStyleFromToken(TokenTextStyles.landmarkName);
  static final successTitle = textStyleFromToken(TokenTextStyles.successTitle);
  static final h2 = textStyleFromToken(TokenTextStyles.h2);
  static final ticketLarge = textStyleFromToken(TokenTextStyles.ticketLarge);
  static final ticketSerial = textStyleFromToken(TokenTextStyles.ticketSerial);
  static final body = textStyleFromToken(TokenTextStyles.body);
  static final button = textStyleFromToken(TokenTextStyles.button);
  static final label = textStyleFromToken(TokenTextStyles.label);
  static final meta = textStyleFromToken(
    TokenTextStyles.meta,
    color: TokenColors.inkSecondary,
  );
  static final bookNote = textStyleFromToken(
    TokenTextStyles.bookNote,
    color: TokenColors.noteInkCobalt,
  );

  /// Mengapitalkan [text] bila gaya tokennya `uppercase`.
  static String applyCase(String text, TokenTextStyle token) =>
      token.uppercase ? text.toUpperCase() : text;

  /// Varian dengan bobot lain (mis. label tab aktif 800). Memperbarui
  /// `wght` sekaligus [FontWeight].
  static TextStyle withWeight(TextStyle style, int weight) {
    final others = (style.fontVariations ?? const <FontVariation>[]).where(
      (v) => v.axis != 'wght',
    );
    return style.copyWith(
      fontWeight: FontWeight.values[(weight ~/ 100).clamp(1, 9) - 1],
      fontVariations: [FontVariation.weight(weight.toDouble()), ...others],
    );
  }
}
