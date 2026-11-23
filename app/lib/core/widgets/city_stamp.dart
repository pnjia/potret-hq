import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../theme/app_text_styles.dart';
import '../theme/design_tokens.dart';

/// Tanda tangan B: cap pos kota. Cincin ganda, nama kota melengkung di atas,
/// "KLIPING KOTA" di bawah, angka temuan "13" dengan "/100" (K-028), dan empat
/// garis gelombang pembatal di kanan. Tata letak mengikuti `cap.svg`
/// (viewBox 220×132, cincin r 60 dan r 40).
///
/// Aturan tinta: Kobalt di atas kertas/putih, Lime di atas Kobalt. Diameter
/// cincin luar minimal [TokenSize.stampMinScreen] di layar.
///
/// Versi ini vektor bersih. Efek tinta tidak rata (goyang tepi dan bintik
/// kosong) menyusul sebagai `stampAsset` PNG per kota (usulan v5 §3.4).
class CityStamp extends StatelessWidget {
  const CityStamp({
    super.key,
    required this.cityName,
    required this.findingCount,
    required this.findingTarget,
    this.diameter = TokenSize.stampMinScreen,
    this.color = TokenColors.actionPrimary,
  }) : assert(diameter >= TokenSize.stampMinScreen);

  final String cityName;
  final int findingCount;
  final int findingTarget;

  /// Diameter cincin luar (logical px).
  final double diameter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final s = diameter / 120;
    return Semantics(
      label: 'Cap $cityName, $findingCount dari $findingTarget temuan',
      image: true,
      excludeSemantics: true,
      child: SizedBox(
        width: 220 * s,
        height: 132 * s,
        child: CustomPaint(
          painter: _CityStampPainter(
            cityName: cityName,
            count: findingCount,
            target: findingTarget,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _CityStampPainter extends CustomPainter {
  _CityStampPainter({
    required this.cityName,
    required this.count,
    required this.target,
    required this.color,
  });

  final String cityName;
  final int count;
  final int target;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 220;
    canvas.save();
    canvas.scale(s);
    const c = Offset(66, 66);
    final ink = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Gelombang pembatal, mulai tepat di luar cincin luar.
    ink.strokeWidth = 3;
    for (var i = 0; i < 4; i++) {
      final y = 40.0 + i * 16;
      final wave = Path()..moveTo(130, y);
      for (var x = 130.0; x <= 214; x += 2) {
        wave.lineTo(x, y + 4 * math.sin((x - 130) / 24 * 2 * math.pi));
      }
      canvas.drawPath(wave, ink);
    }

    ink.strokeWidth = 3.4;
    canvas.drawCircle(c, 60, ink);
    ink.strokeWidth = 2.4;
    canvas.drawCircle(c, 40, ink);

    final arcStyle = textStyleFromToken(
      TokenTextStyles.ticketSerial,
      color: color,
    );
    _drawArcText(
      canvas,
      cityName.toUpperCase(),
      arcStyle.copyWith(fontSize: 13, letterSpacing: 1.6),
      center: c,
      radius: 46,
      top: true,
    );
    _drawArcText(
      canvas,
      'KLIPING KOTA',
      arcStyle.copyWith(fontSize: 9, letterSpacing: 1.2),
      center: c,
      radius: 47.5,
      top: false,
    );

    final number = TextPainter(
      text: TextSpan(
        text: '$count',
        style: AppTextStyles.numberLarge.copyWith(color: color, fontSize: 34),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final pair = TextPainter(
      text: TextSpan(
        text: '/$target',
        style: AppTextStyles.numberPair.copyWith(color: color, fontSize: 12),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final blockH = number.height + pair.height;
    number.paint(canvas, Offset(c.dx - number.width / 2, c.dy - blockH / 2));
    pair.paint(
      canvas,
      Offset(c.dx - pair.width / 2, c.dy - blockH / 2 + number.height),
    );
    number.dispose();
    pair.dispose();
    canvas.restore();
  }

  /// Menulis teks melengkung, terpusat di atas (dibaca searah jarum jam) atau
  /// di bawah (dibaca dari kiri ke kanan, kepala huruf ke arah pusat).
  void _drawArcText(
    Canvas canvas,
    String text,
    TextStyle style, {
    required Offset center,
    required double radius,
    required bool top,
  }) {
    final glyphs = [
      for (final ch in text.characters)
        TextPainter(
          text: TextSpan(text: ch, style: style),
          textDirection: TextDirection.ltr,
        )..layout(),
    ];
    final total = glyphs.fold<double>(0, (a, g) => a + g.width);
    final sweep = total / radius;
    var angle = top ? -math.pi / 2 - sweep / 2 : math.pi / 2 + sweep / 2;
    for (final g in glyphs) {
      final half = g.width / 2 / radius;
      angle += top ? half : -half;
      canvas.save();
      canvas.translate(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.rotate(top ? angle + math.pi / 2 : angle - math.pi / 2);
      // Atas: alas huruf menghadap pusat. Bawah: kepala huruf menghadap pusat.
      g.paint(canvas, Offset(-g.width / 2, -g.height / 2));
      canvas.restore();
      angle += top ? half : -half;
      g.dispose();
    }
  }

  @override
  bool shouldRepaint(_CityStampPainter old) =>
      old.cityName != cityName ||
      old.count != count ||
      old.target != target ||
      old.color != color;
}
