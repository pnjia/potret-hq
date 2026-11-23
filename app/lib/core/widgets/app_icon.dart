import 'package:material_ui/material_ui.dart';

import '../graphics/svg_path.dart';
import '../theme/design_tokens.dart';

/// Ikon garis v5 (K-035): kotak 24, garis 2, ujung persegi. Path diambil apa
/// adanya dari mockup v5 (artboard V5Beranda dan V5Sistem).
enum AppIconGlyph {
  // Navigasi.
  home,
  book,
  shutter,
  ticket,
  idCard,
  // Kategori (urutan sama dengan CategoryId).
  sign,
  food,
  drink,
  vehicle,
  animal,
  plant,
  building,
  object,
  other,
  // Kecil.
  check,
  chevronDown,
}

class _Stroke {
  const _Stroke(this.d, {this.dashed = false, this.fillable = false});

  /// Data path SVG (kotak 24).
  final String d;

  /// Garis putus (2 px garis, 2 px jarak).
  final bool dashed;

  /// Diisi [AppIcon.fill] bila diberikan (atap rumah tab aktif).
  final bool fillable;
}

String _circle(double cx, double cy, double r) =>
    'M${cx - r} $cy a$r $r 0 1 0 ${2 * r} 0 a$r $r 0 1 0 ${-2 * r} 0';

final Map<AppIconGlyph, List<_Stroke>> _glyphs = {
  AppIconGlyph.home: const [
    _Stroke('M3 11L12 4l9 7M5 10v10h14V10', fillable: true),
    _Stroke('M10 20v-5h4v5'),
  ],
  AppIconGlyph.book: const [
    _Stroke(
      'M3 5h7a2 2 0 0 1 2 2v13a2 2 0 0 0-2-2H3zM21 5h-7a2 2 0 0 0-2 2v13a2 2 0 0 1 2-2h7z',
    ),
  ],
  AppIconGlyph.shutter: [
    _Stroke(_circle(12, 12, 8)),
    const _Stroke('M12 4l3 6M20 12l-6 1.5M12 20l-3-6M4 12l6-1.5'),
  ],
  AppIconGlyph.ticket: const [
    _Stroke('M3 7h18v3a2 2 0 0 0 0 4v3H3v-3a2 2 0 0 0 0-4z'),
    _Stroke('M15 7v10', dashed: true),
  ],
  AppIconGlyph.idCard: [
    const _Stroke(
      'M4 5h16a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1z',
    ),
    _Stroke(_circle(9, 11, 2.2)),
    const _Stroke('M6 16c.6-1.6 1.7-2.3 3-2.3s2.4.7 3 2.3M14 10h4M14 13h4'),
  ],
  AppIconGlyph.sign: const [_Stroke('M3 4h18v10H3z M7 14v7 M17 14v7 M7 9h10')],
  AppIconGlyph.food: const [
    _Stroke('M3 11h18a9 9 0 0 1-18 0z M8 7.5c0-2 2-2 2-4 M13 7.5c0-2 2-2 2-4'),
  ],
  AppIconGlyph.drink: const [
    _Stroke('M6 8h12l-1.5 13h-9z M13 8l3-6 M6.5 12h11'),
  ],
  AppIconGlyph.vehicle: [
    const _Stroke('M2 16V7h13l4 4h3v5z M15 7v4h4 M5 7v4h7V7'),
    _Stroke(_circle(7, 17.5, 2)),
    _Stroke(_circle(17, 17.5, 2)),
  ],
  AppIconGlyph.animal: const [
    _Stroke('M2 12c4-6 11-6 15 0-4 6-11 6-15 0z M17 12l5-4v8z'),
  ],
  AppIconGlyph.plant: const [
    _Stroke(
      'M12 21v-9 M12 12c0-4-3-7-8-7 0 4 3 7 8 7z M12 10c0-3 2-6 7-6 0 3-2 6-7 6z',
    ),
  ],
  AppIconGlyph.building: const [
    _Stroke('M4 21V10h16v11 M2 10l10-6 10 6 M10 21v-5h4v5 M7 13h2 M15 13h2'),
  ],
  AppIconGlyph.object: const [
    _Stroke('M3 8l9-4 9 4v10l-9 4-9-4z M3 8l9 4 9-4 M12 12v10'),
  ],
  AppIconGlyph.other: const [_Stroke('M4 4h16v16H4z', dashed: true)],
  AppIconGlyph.check: const [_Stroke('M5 12.5l4.5 4.5L19 7.5')],
  AppIconGlyph.chevronDown: const [_Stroke('M6 9l6 6 6-6')],
};

final Map<AppIconGlyph, List<(Path, _Stroke)>> _parsed = {};

List<(Path, _Stroke)> _pathsFor(AppIconGlyph glyph) => _parsed.putIfAbsent(
  glyph,
  () => [for (final s in _glyphs[glyph]!) (parseSvgPath(s.d), s)],
);

/// Ikon garis tanpa font ikon. Dekoratif kecuali [semanticLabel] diisi.
class AppIcon extends StatelessWidget {
  const AppIcon(
    this.glyph, {
    super.key,
    this.size = 24,
    this.color = TokenColors.inkPrimary,
    this.fill,
    this.strokeWidth = 2,
    this.semanticLabel,
  });

  final AppIconGlyph glyph;
  final double size;
  final Color color;

  /// Isi untuk bagian yang bisa diisi (atap ikon Beranda saat tab aktif).
  final Color? fill;

  /// Tebal garis dalam satuan kotak 24 (diskalakan dengan [size]).
  final double strokeWidth;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final icon = SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _AppIconPainter(glyph, color, fill, strokeWidth),
      ),
    );
    if (semanticLabel == null) return ExcludeSemantics(child: icon);
    return Semantics(label: semanticLabel, image: true, child: icon);
  }
}

class _AppIconPainter extends CustomPainter {
  _AppIconPainter(this.glyph, this.color, this.fill, this.strokeWidth);

  final AppIconGlyph glyph;
  final Color color;
  final Color? fill;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 24, size.height / 24);
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    for (final (path, s) in _pathsFor(glyph)) {
      if (s.fillable && fill != null) {
        canvas.drawPath(path, Paint()..color = fill!);
      }
      canvas.drawPath(s.dashed ? _dash(path, 2.4, 2) : path, stroke);
    }
    canvas.restore();
  }

  Path _dash(Path source, double on, double off) {
    final out = Path();
    for (final metric in source.computeMetrics()) {
      var d = 0.0;
      while (d < metric.length) {
        out.addPath(metric.extractPath(d, d + on), Offset.zero);
        d += on + off;
      }
    }
    return out;
  }

  @override
  bool shouldRepaint(_AppIconPainter old) =>
      old.glyph != glyph ||
      old.color != color ||
      old.fill != fill ||
      old.strokeWidth != strokeWidth;
}
