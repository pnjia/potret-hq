import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'dummy_book.dart';

/// Sisi gambar cutout palsu (piksel). Cutout asli nanti WebP terkompresi.
const int fakeCutoutPx = 384;

/// Membuat [fakeCutoutCount] gambar "cutout palsu" secara prosedural, lalu
/// meng-encode-nya ke PNG. Saat halaman dimuat, PNG ini di-decode ulang,
/// meniru jalur cutout asli (file terkompresi → decode → gambar halaman).
/// Tidak memakai foto dari mana pun.
Future<List<Uint8List>> generateFakeCutouts() async {
  final result = <Uint8List>[];
  for (var i = 0; i < fakeCutoutCount; i++) {
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    _paintCutout(canvas, i, fakeCutoutPx.toDouble());
    final picture = recorder.endRecording();
    final image = await picture.toImage(fakeCutoutPx, fakeCutoutPx);
    picture.dispose();
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    result.add(bytes!.buffer.asUint8List());
  }
  return result;
}

const _palette = [
  ui.Color(0xFFB5523B),
  ui.Color(0xFF2F5D8C),
  ui.Color(0xFF4F7A3A),
  ui.Color(0xFFD9A441),
  ui.Color(0xFF7A4E8C),
  ui.Color(0xFF3C3C3C),
  ui.Color(0xFFC2385F),
  ui.Color(0xFF6B8E9E),
];

/// Setiap bentuk digambar dua kali: garis putih tebal (tepi stiker), lalu
/// isi bergradasi supaya terlihat seperti foto yang dipotong.
void _paintCutout(ui.Canvas canvas, int kind, double s) {
  final rng = math.Random(kind * 7919 + 13);
  final base = _palette[kind % _palette.length];
  final shapes = <ui.Path>[];
  ui.Path rrect(double l, double t, double r, double b, double rad) =>
      ui.Path()
        ..addRRect(ui.RRect.fromLTRBR(l, t, r, b, ui.Radius.circular(rad)));
  ui.Path oval(double cx, double cy, double rad) => ui.Path()
    ..addOval(ui.Rect.fromCircle(center: ui.Offset(cx, cy), radius: rad));

  switch (kind) {
    case 0: // gerobak
      shapes
        ..add(rrect(s * .12, s * .30, s * .88, s * .66, s * .04))
        ..add(rrect(s * .18, s * .16, s * .82, s * .32, s * .03))
        ..add(oval(s * .30, s * .74, s * .09))
        ..add(oval(s * .70, s * .74, s * .09));
    case 1: // pintu
      shapes.add(
        ui.Path()
          ..moveTo(s * .25, s * .92)
          ..lineTo(s * .25, s * .30)
          ..arcToPoint(
            ui.Offset(s * .75, s * .30),
            radius: ui.Radius.circular(s * .25),
          )
          ..lineTo(s * .75, s * .92)
          ..close(),
      );
    case 2: // lampu jalan
      shapes
        ..add(rrect(s * .46, s * .28, s * .54, s * .94, s * .02))
        ..add(rrect(s * .30, s * .10, s * .70, s * .30, s * .08));
    case 3: // daun
      shapes.add(
        ui.Path()
          ..moveTo(s * .50, s * .06)
          ..quadraticBezierTo(s * .95, s * .45, s * .50, s * .94)
          ..quadraticBezierTo(s * .05, s * .45, s * .50, s * .06)
          ..close(),
      );
    case 4: // papan nama
      shapes
        ..add(rrect(s * .08, s * .22, s * .92, s * .58, s * .03))
        ..add(rrect(s * .20, s * .58, s * .26, s * .90, s * .01))
        ..add(rrect(s * .74, s * .58, s * .80, s * .90, s * .01));
    case 5: // cangkir
      shapes
        ..add(rrect(s * .20, s * .30, s * .70, s * .82, s * .10))
        ..add(oval(s * .76, s * .52, s * .12));
    case 6: // sepeda
      shapes
        ..add(oval(s * .26, s * .66, s * .18))
        ..add(oval(s * .74, s * .66, s * .18))
        ..add(rrect(s * .26, s * .40, s * .74, s * .48, s * .02));
    default: // jendela
      shapes.add(rrect(s * .16, s * .14, s * .84, s * .86, s * .03));
  }

  final outline = ui.Paint()
    ..color = const ui.Color(0xFFFFFFFF)
    ..style = ui.PaintingStyle.stroke
    ..strokeWidth = s * .05
    ..strokeJoin = ui.StrokeJoin.round;
  for (final p in shapes) {
    canvas.drawPath(p, outline);
  }

  final light = ui.Color.lerp(base, const ui.Color(0xFFFFFFFF), 0.35)!;
  final dark = ui.Color.lerp(base, const ui.Color(0xFF000000), 0.35)!;
  final fill = ui.Paint()
    ..shader = ui.Gradient.linear(
      ui.Offset(s * rng.nextDouble(), 0),
      ui.Offset(s * rng.nextDouble(), s),
      [light, base, dark],
      [0, 0.5, 1],
    );
  for (final p in shapes) {
    canvas.drawPath(p, fill);
  }

  // Bintik detail: tekstur "foto" kasar.
  final speck = ui.Paint();
  for (final p in shapes) {
    final b = p.getBounds();
    for (var k = 0; k < 40; k++) {
      final o = ui.Offset(
        b.left + rng.nextDouble() * b.width,
        b.top + rng.nextDouble() * b.height,
      );
      if (!p.contains(o)) continue;
      speck.color = (rng.nextBool() ? light : dark).withValues(alpha: 0.5);
      canvas.drawCircle(o, s * (0.006 + rng.nextDouble() * 0.012), speck);
    }
  }
}
