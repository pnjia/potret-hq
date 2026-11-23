import 'package:material_ui/material_ui.dart';

import '../theme/app_text_styles.dart';
import '../theme/design_tokens.dart';
import 'app_icon.dart';

/// Tab navigasi utama, urut kiri ke kanan.
enum AppTab { home, book, camera, missions, profile }

/// Navigasi bawah v5: lima tab berlabel, garis atas Tinta 2 px, tombol Potret
/// bulat Kobalt 52 px yang menonjol 18 px di tengah. Tab aktif: ikon Tinta
/// penuh, label bobot 800, dan stabilo 6 px di bawah label (Lime bukan
/// satu-satunya penanda).
///
/// [AppTab.camera] bukan halaman: mengetuknya memanggil [onSelected] dan
/// pemanggil membuka kamera.
class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.current,
    required this.onSelected,
  });

  final AppTab current;
  final ValueChanged<AppTab> onSelected;

  static const double barHeight = 64;
  static const double shutterSize = 52;
  static const double shutterRise = 18;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: 'Navigasi utama',
      child: Container(
        height: barHeight + bottom,
        padding: EdgeInsets.only(bottom: bottom),
        decoration: const BoxDecoration(
          color: TokenColors.paperScreen,
          border: Border(
            top: BorderSide(
              color: TokenColors.inkPrimary,
              width: TokenBorder.ink,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _tab(AppTab.home, 'Beranda', AppIconGlyph.home),
            _tab(AppTab.book, 'Buku', AppIconGlyph.book),
            Expanded(
              child: _ShutterTab(onTap: () => onSelected(AppTab.camera)),
            ),
            _tab(AppTab.missions, 'Misi', AppIconGlyph.ticket),
            _tab(AppTab.profile, 'Profil', AppIconGlyph.idCard),
          ],
        ),
      ),
    );
  }

  Widget _tab(AppTab tab, String label, AppIconGlyph glyph) {
    final active = tab == current;
    final color = active ? TokenColors.inkPrimary : TokenColors.inkSecondary;
    final text = Text(
      label,
      style: AppTextStyles.withWeight(
        AppTextStyles.label,
        active ? 800 : 700,
      ).copyWith(color: color),
    );
    return Expanded(
      child: Semantics(
        button: true,
        selected: active,
        label: label,
        excludeSemantics: true,
        child: InkWell(
          onTap: () => onSelected(tab),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(
                glyph,
                color: color,
                fill: active ? TokenColors.highlightPrimary : null,
              ),
              const SizedBox(height: 4),
              active ? _Underline(child: text) : text,
            ],
          ),
        ),
      ),
    );
  }
}

/// Stabilo 6 px di bawah label tab aktif.
class _Underline extends StatelessWidget {
  const _Underline({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    children: [
      const Positioned(
        left: -2,
        right: -2,
        bottom: -1,
        height: 6,
        child: ColoredBox(color: TokenColors.highlightPrimary),
      ),
      child,
    ],
  );
}

class _ShutterTab extends StatelessWidget {
  const _ShutterTab({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Potret',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: -AppNavigationBar.shutterRise - 5,
              // Cincin Tinta 2 px, celah putih 3 px, lalu rana Kobalt 52 px.
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: TokenColors.paperScreen,
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: TokenColors.inkPrimary,
                      width: TokenBorder.ink,
                    ),
                  ),
                ),
                child: Container(
                  width: AppNavigationBar.shutterSize,
                  height: AppNavigationBar.shutterSize,
                  decoration: const BoxDecoration(
                    color: TokenColors.actionPrimary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const AppIcon(
                    AppIconGlyph.shutter,
                    color: TokenColors.paperScreen,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              child: Text(
                'Potret',
                style: AppTextStyles.withWeight(AppTextStyles.label, 800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
