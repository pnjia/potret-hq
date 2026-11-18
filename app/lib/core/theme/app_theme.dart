import 'package:material_ui/material_ui.dart';

import 'design_tokens.dart';

/// Tema terang aplikasi, dibangun dari [TokenColors] dan kawan-kawan.
///
/// Peran warna Material yang tidak punya token di data/design-tokens.json
/// dibiarkan memakai bawaan [ColorScheme.light]. Putih di atas aksen
/// mengikuti catatan kontras `accent.primary` di file token.
ThemeData buildAppTheme() {
  const scheme = ColorScheme.light(
    primary: TokenColors.accentPrimary,
    onPrimary: Colors.white,
    secondary: TokenColors.accentSecondary,
    onSecondary: Colors.white,
    error: TokenColors.stateError,
    onError: Colors.white,
    surface: TokenColors.paperBase,
    onSurface: TokenColors.inkPrimary,
    onSurfaceVariant: TokenColors.inkSecondary,
    outline: TokenColors.paperLine,
  );

  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(TokenRadius.button),
  );

  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: TokenColors.paperBase,
    fontFamily: TokenTypography.body,
    cardTheme: CardThemeData(
      color: TokenColors.paperRaised,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TokenRadius.card),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(shape: buttonShape),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(shape: buttonShape),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(shape: buttonShape),
    ),
  );
}
