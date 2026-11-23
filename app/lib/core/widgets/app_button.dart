import 'package:material_ui/material_ui.dart';

import '../theme/app_text_styles.dart';
import '../theme/design_tokens.dart';

enum AppButtonVariant {
  /// Kobalt, teks putih. Satu per layar.
  primary,

  /// Putih dengan garis Tinta 2 px.
  secondary,
}

/// Tombol v5: tinggi [TokenSize.buttonHeight], radius [TokenRadius.ticket],
/// datar tanpa bayangan, label 16/800.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  /// Lebar penuh (bawaan) atau selebar isinya.
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final size = Size(
      expand ? double.infinity : TokenSize.touchTargetMin,
      TokenSize.buttonHeight,
    );
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TokenRadius.ticket),
    );
    // Warna teks diambil dari foregroundColor tombol.
    final text = Text(label);
    return switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: size,
          shape: shape,
          elevation: 0,
          backgroundColor: TokenColors.actionPrimary,
          foregroundColor: TokenColors.paperScreen,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: text,
      ),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: size,
          shape: shape,
          backgroundColor: TokenColors.paperScreen,
          foregroundColor: TokenColors.inkPrimary,
          side: const BorderSide(
            color: TokenColors.inkPrimary,
            width: TokenBorder.ink,
          ),
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: text,
      ),
    };
  }
}
