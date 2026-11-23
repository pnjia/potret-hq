import 'package:material_ui/material_ui.dart';

import '../category_style.dart';
import '../theme/app_text_styles.dart';
import '../theme/design_tokens.dart';
import 'app_icon.dart';

/// Karcis kecil dengan takik r 4 di kiri dan kanan (label kategori).
Path categoryTagPath(Size size) {
  final w = size.width, h = size.height;
  const n = TokenSize.ticketNotch / 2;
  const r = TokenRadius.ticket;
  final mid = h / 2;
  return Path()
    ..moveTo(r, 0)
    ..lineTo(w - r, 0)
    ..arcToPoint(Offset(w, r), radius: const Radius.circular(r))
    ..lineTo(w, mid - n)
    ..arcToPoint(
      Offset(w, mid + n),
      radius: const Radius.circular(n),
      clockwise: false,
    )
    ..lineTo(w, h - r)
    ..arcToPoint(Offset(w - r, h), radius: const Radius.circular(r))
    ..lineTo(r, h)
    ..arcToPoint(Offset(0, h - r), radius: const Radius.circular(r))
    ..lineTo(0, mid + n)
    ..arcToPoint(
      Offset(0, mid - n),
      radius: const Radius.circular(n),
      clockwise: false,
    )
    ..lineTo(0, r)
    ..arcToPoint(const Offset(r, 0), radius: const Radius.circular(r))
    ..close();
}

/// Label kategori: selalu ikon + teks Tinta dengan garis [TokenBorder.tag],
/// karena warna kategori < 3:1 terhadap putih (K-035). Terpilih: garis
/// [TokenBorder.ink], centang, bobot 800.
///
/// Bila [onTap] diisi, area ketuknya setinggi [TokenSize.touchTargetMin].
class CategoryLabel extends StatelessWidget {
  const CategoryLabel(
    this.category, {
    super.key,
    this.selected = false,
    this.dense = false,
    this.onTap,
  });

  final CategoryId category;
  final bool selected;

  /// Rapat (padding 8, ikon 14) untuk kolom sempit seperti slot Beranda.
  final bool dense;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = CategoryStyle.of(category);
    final text = selected
        ? AppTextStyles.withWeight(AppTextStyles.label, 800)
        : AppTextStyles.label;
    final tag = CustomPaint(
      painter: _TagPainter(
        fill: style.color,
        border: selected ? TokenBorder.ink : TokenBorder.tag,
      ),
      child: Padding(
        padding: dense
            ? const EdgeInsets.fromLTRB(8, 5, 8, 5)
            : const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(style.icon, size: dense ? 14 : 16),
            SizedBox(width: dense ? 4 : 6),
            Text(style.label, style: text),
            if (selected) ...[
              const SizedBox(width: 6),
              const AppIcon(AppIconGlyph.check, size: 16, strokeWidth: 2.5),
            ],
          ],
        ),
      ),
    );

    final label = selected
        ? 'Kategori ${style.label}, terpilih'
        : 'Kategori ${style.label}';
    if (onTap == null) {
      return Semantics(label: label, excludeSemantics: true, child: tag);
    }
    return Semantics(
      button: true,
      selected: selected,
      label: 'Kategori ${style.label}',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: TokenSize.touchTargetMin,
          ),
          child: Align(widthFactor: 1, child: tag),
        ),
      ),
    );
  }
}

class _TagPainter extends CustomPainter {
  _TagPainter({required this.fill, required this.border});

  final Color fill;
  final double border;

  @override
  void paint(Canvas canvas, Size size) {
    final path = categoryTagPath(size);
    canvas.drawPath(path, Paint()..color = fill);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = border
        ..color = TokenColors.inkPrimary,
    );
  }

  @override
  bool shouldRepaint(_TagPainter old) =>
      old.fill != fill || old.border != border;
}
