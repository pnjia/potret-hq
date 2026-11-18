import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import '../../../core/theme/design_tokens.dart';
import '../state/book_providers.dart';
import '../state/curl_geometry.dart';

/// Menggambar halaman yang sedang dibaca: diam (satu gambar) atau `PageCurl`.
///
/// Repaint dipicu oleh [geometry], bukan rebuild widget, supaya biaya thread
/// UI per frame hanya `paint()` ini.
class PageCurlPainter extends CustomPainter {
  PageCurlPainter({
    required this.geometry,
    required this.front,
    required this.under,
    required this.renderer,
    required this.uniforms,
    required this.flipY,
    required this.onCurlFrame,
  }) : super(repaint: geometry);

  final ValueListenable<CurlGeometry> geometry;

  /// Halaman yang melengkung (atau satu-satunya halaman saat diam).
  final ui.Image? front;

  /// Halaman di bawahnya; null = tidak ada `PageCurl` aktif.
  final ui.Image? under;
  final CurlRenderer renderer;
  final CurlUniforms uniforms;
  final bool flipY;

  /// Dipanggil setiap frame yang menggambar `PageCurl` (untuk perekam frame).
  final VoidCallback onCurlFrame;

  @override
  void paint(Canvas canvas, Size size) {
    final f = front;
    if (f == null) return;
    final u = under;
    final rect = Offset.zero & size;
    if (u == null) {
      _drawImage(canvas, f, rect);
      return;
    }
    onCurlFrame();
    final g = geometry.value;
    switch (renderer) {
      case CurlRenderer.shader:
        uniforms.set(
          size: size,
          geometry: g,
          flipY: flipY,
          paper: TokenColors.paperRaised,
          front: f,
          under: u,
        );
        canvas.drawRect(rect, Paint()..shader = uniforms.shader);
      case CurlRenderer.canvas:
        _paintFlatFold(canvas, size, g, f, u);
    }
  }

  static void _drawImage(Canvas canvas, ui.Image img, Rect dst) {
    canvas.drawImageRect(
      img,
      Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble()),
      dst,
      Paint()..filterQuality = FilterQuality.low,
    );
  }

  /// Pembanding tanpa shader: lipatan datar (jari-jari 0) dengan clip dan
  /// pantulan. Tidak semulus silinder, tetapi murah.
  static void _paintFlatFold(
    Canvas canvas,
    Size size,
    CurlGeometry g,
    ui.Image front,
    ui.Image under,
  ) {
    final rect = Offset.zero & size;
    final n = g.normal;
    final p = g.axisPoint;
    final t = Offset(-n.dy, n.dx);
    final big = (size.width + size.height) * 4;

    _drawImage(canvas, under, rect);

    // Bayangan di halaman bawah, tepat di luar garis lipat.
    final shadowW = size.width * 0.06;
    canvas
      ..save()
      ..clipRect(rect)
      ..drawPath(
        Path()
          ..moveTo(p.dx + t.dx * big, p.dy + t.dy * big)
          ..lineTo(p.dx - t.dx * big, p.dy - t.dy * big)
          ..lineTo(
            p.dx - t.dx * big + n.dx * shadowW,
            p.dy - t.dy * big + n.dy * shadowW,
          )
          ..lineTo(
            p.dx + t.dx * big + n.dx * shadowW,
            p.dy + t.dy * big + n.dy * shadowW,
          )
          ..close(),
        Paint()
          ..shader = ui.Gradient.linear(
            p,
            p + n * shadowW,
            [const Color(0x55000000), const Color(0x00000000)],
          ),
      )
      ..restore();

    // Separuh yang masih datar (d < 0).
    final flatSide = Path()
      ..moveTo(p.dx + t.dx * big, p.dy + t.dy * big)
      ..lineTo(p.dx - t.dx * big, p.dy - t.dy * big)
      ..lineTo(
        p.dx - t.dx * big - n.dx * big,
        p.dy - t.dy * big - n.dy * big,
      )
      ..lineTo(
        p.dx + t.dx * big - n.dx * big,
        p.dy + t.dy * big - n.dy * big,
      )
      ..close();
    canvas
      ..save()
      ..clipRect(rect)
      ..clipPath(flatSide);
    _drawImage(canvas, front, rect);

    // Punggung halaman: pantulan bagian d > 0 terhadap garis lipat.
    final pn = p.dx * n.dx + p.dy * n.dy;
    final m = Float64List(16)
      ..[0] = 1 - 2 * n.dx * n.dx
      ..[1] = -2 * n.dx * n.dy
      ..[4] = -2 * n.dx * n.dy
      ..[5] = 1 - 2 * n.dy * n.dy
      ..[10] = 1
      ..[12] = 2 * pn * n.dx
      ..[13] = 2 * pn * n.dy
      ..[15] = 1;
    canvas
      ..transform(m)
      ..drawRect(rect, Paint()..color = TokenColors.paperRaised);
    canvas.drawImageRect(
      front,
      Rect.fromLTWH(0, 0, front.width.toDouble(), front.height.toDouble()),
      rect,
      Paint()
        ..filterQuality = FilterQuality.low
        ..color = const Color(0x1A000000),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(PageCurlPainter old) =>
      old.front != front ||
      old.under != under ||
      old.renderer != renderer ||
      old.flipY != flipY ||
      old.uniforms != uniforms;
}

/// Gambar statis (thumbnail). Tidak memiliki gambar; pemiliknya `PageStore`.
class StaticImagePainter extends CustomPainter {
  const StaticImagePainter(this.image);

  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Offset.zero & size,
      Paint()..filterQuality = FilterQuality.low,
    );
  }

  @override
  bool shouldRepaint(StaticImagePainter old) => old.image != image;
}
