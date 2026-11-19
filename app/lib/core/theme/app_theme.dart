import 'package:material_ui/material_ui.dart';

import 'design_tokens.dart';

/// Tema terang aplikasi (K-035), dibangun dari [TokenColors] dan kawan-kawan.
///
/// UI putih, Kobalt untuk aksi, Tinta untuk teks dan garis. Lime hanya untuk
/// stabilo dan penanda, jadi tidak dipetakan ke peran Material. Radius 0/2/4,
/// tanpa bayangan UI, tombol setinggi 56 dengan garis tinta 2 px.
ThemeData buildAppTheme() {
  const scheme = ColorScheme.light(
    primary: TokenColors.actionPrimary,
    onPrimary: TokenColors.paperScreen,
    secondary: TokenColors.inkPrimary,
    onSecondary: TokenColors.paperScreen,
    error: TokenColors.stateError,
    onError: TokenColors.paperScreen,
    surface: TokenColors.paperScreen,
    onSurface: TokenColors.inkPrimary,
    onSurfaceVariant: TokenColors.inkSecondary,
    outline: TokenColors.inkPrimary,
    surfaceContainerHighest: TokenColors.paperMuted,
  );

  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(TokenRadius.ticket),
  );
  const buttonSize = Size(TokenSize.touchTargetMin, TokenSize.buttonHeight);

  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: TokenColors.paperScreen,
    fontFamily: TokenTypography.body,
    cardTheme: CardThemeData(
      color: TokenColors.paperScreen,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TokenRadius.ticket),
        side: const BorderSide(
          color: TokenColors.inkPrimary,
          width: TokenBorder.ink,
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: buttonShape,
        minimumSize: buttonSize,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: buttonShape,
        minimumSize: buttonSize,
        foregroundColor: TokenColors.inkPrimary,
        side: const BorderSide(
          color: TokenColors.inkPrimary,
          width: TokenBorder.ink,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: buttonShape,
        minimumSize: const Size(
          TokenSize.touchTargetMin,
          TokenSize.touchTargetMin,
        ),
      ),
    ),
  );
}
