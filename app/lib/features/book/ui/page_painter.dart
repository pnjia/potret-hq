import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';

import '../../../core/theme/design_tokens.dart';
import '../state/book_models.dart';
import '../state/dummy_book.dart';
import '../state/page_layout.dart';

/// Merender satu halaman buku dummy menjadi `ui.Image` (tekstur untuk
/// `PageCurl`, atau thumbnail bila [pixelRatio] kecil).
///
/// Jalurnya meniru halaman asli: decode cutout terkompresi pada ukuran yang
/// dibutuhkan → rekam gambar halaman → rasterisasi (`Picture.toImage`).
/// Dipanggil sebelum gestur dimulai (lazy load), bukan di awal gestur.
Future<ui.Image> renderPageImage({
  required DummyBook book,
  required int index,
  required Size size,
  required double pixelRatio,
  required List<Uint8List> cutoutPng,
}) async {
  final page = book.pages[index];
  final placements = book.placementsOf(page);

  final decoded = <String, ui.Image>{};
  for (final p in placements) {
    final cutout = book.cutoutIndexByFinding[p.findingId]!;
    final px = math.max(8, (p.scale * size.width * pixelRatio).round());
    final codec = await ui.instantiateImageCodec(
      cutoutPng[cutout],
      targetWidth: px,
      targetHeight: px,
    );
    decoded[p.findingId] = (await codec.getNextFrame()).image;
    codec.dispose();
  }

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder)..scale(pixelRatio);
  paintPage(canvas, size, book, index, decoded);
  final picture = recorder.endRecording();
  final image = await picture.toImage(
    (size.width * pixelRatio).round(),
    (size.height * pixelRatio).round(),
  );
  picture.dispose();
  for (final img in decoded.values) {
    img.dispose();
  }
  return image;
}

/// Menggambar halaman: kertas, judul bab, isi sesuai `Page.kind`, nomor.
void paintPage(
  Canvas canvas,
  Size size,
  DummyBook book,
  int index,
  Map<String, ui.Image> cutouts,
) {
  final page = book.pages[index];
  final chapter = book.chapterOf(page);
  final w = size.width;
  final h = size.height;

  canvas.drawRect(Offset.zero & size, Paint()..color = TokenColors.paperBase);
  _paperGrain(canvas, size, page.order);
  // Garis tepi jilid di kiri.
  canvas.drawRect(
    Rect.fromLTWH(0, 0, w * 0.02, h),
    Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(w * 0.02, 0),
        [TokenColors.paperLine, TokenColors.paperBase],
      ),
  );

  _text(
    canvas,
    chapter.cityName.toUpperCase(),
    Offset(w * 0.07, h * 0.035),
    size: w * 0.035,
    color: TokenColors.inkSecondary,
    letterSpacing: 2,
  );
  _text(
    canvas,
    '${page.order + 1}',
    Offset(w * 0.5, h * 0.955),
    size: w * 0.035,
    color: TokenColors.inkSecondary,
    center: true,
  );

  switch (page.kind) {
    case PageKind.divider:
      _paintDivider(canvas, size, book, chapter);
    case PageKind.landmark:
      _paintLandmark(canvas, size, book, page, cutouts);
    case PageKind.free:
      _paintPlacements(canvas, size, book, book.placementsOf(page), cutouts);
  }
}

void _paperGrain(Canvas canvas, Size size, int seed) {
  final rng = math.Random(seed * 31 + 7);
  final paint = Paint()
    ..color = TokenColors.paperLine.withValues(alpha: 0.35)
    ..strokeWidth = 0.6;
  for (var i = 0; i < 90; i++) {
    final x = rng.nextDouble() * size.width;
    final y = rng.nextDouble() * size.height;
    canvas.drawLine(
      Offset(x, y),
      Offset(x + 2 + rng.nextDouble() * 6, y + rng.nextDouble() * 1.5),
      paint,
    );
  }
}

void _paintDivider(
  Canvas canvas,
  Size size,
  DummyBook book,
  DummyChapter chapter,
) {
  final c = Offset(size.width * 0.5, size.height * 0.42);
  final r = size.width * 0.30;
  final stamp = Paint()
    ..color = TokenColors.accentPrimary.withValues(alpha: 0.85)
    ..style = PaintingStyle.stroke
    ..strokeWidth = size.width * 0.012;
  canvas
    ..save()
    ..translate(c.dx, c.dy)
    ..rotate(-0.12)
    ..drawCircle(Offset.zero, r, stamp)
    ..drawCircle(Offset.zero, r * 0.86, stamp..strokeWidth = size.width * 0.005);
  _text(
    canvas,
    chapter.cityName.toUpperCase(),
    Offset(0, -r * 0.22),
    size: size.width * 0.075,
    color: TokenColors.accentPrimary,
    center: true,
    weight: FontWeight.w700,
    family: TokenTypography.display,
  );
  // Angka stempel kota: temuan di kota / target (K-028).
  _text(
    canvas,
    '${book.findingCountInChapter(chapter.id)}/${chapter.targetFindings}',
    Offset(0, r * 0.12),
    size: size.width * 0.06,
    color: TokenColors.accentPrimary,
    center: true,
  );
  canvas.restore();
  _text(
    canvas,
    'Bab ${book.chapters.indexOf(chapter) + 1}',
    Offset(size.width * 0.5, size.height * 0.72),
    size: size.width * 0.05,
    color: TokenColors.inkPrimary,
    center: true,
    family: TokenTypography.display,
  );
}

void _paintLandmark(
  Canvas canvas,
  Size size,
  DummyBook book,
  Page page,
  Map<String, ui.Image> cutouts,
) {
  final template = pageTemplates[page.templateId]!;
  final placements = book.placementsOf(page);
  final slots = book.landmarkSlotsByPage[page.id] ?? 0;
  // Slot tanpa temuan: siluet "???" (spesifikasi §4.5).
  for (var i = placements.length; i < slots; i++) {
    final slot = template.slots[i];
    final side = slot.scale * size.width;
    final rect = Rect.fromCenter(
      center: Offset(slot.x * size.width, slot.y * size.height),
      width: side,
      height: side,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(TokenRadius.card)),
      Paint()..color = TokenColors.paperLine,
    );
    _text(
      canvas,
      '???',
      rect.center - Offset(0, side * 0.12),
      size: side * 0.22,
      color: TokenColors.inkSecondary,
      center: true,
      weight: FontWeight.w700,
    );
  }
  _paintPlacements(canvas, size, book, placements, cutouts);
}

void _paintPlacements(
  Canvas canvas,
  Size size,
  DummyBook book,
  List<Placement> placements,
  Map<String, ui.Image> cutouts,
) {
  final sorted = [...placements]..sort((a, b) => a.z.compareTo(b.z));
  final tape = Paint()..color = TokenColors.paperTape.withValues(alpha: 0.85);
  final shadow = Paint()
    ..color = const Color(0x22000000)
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
  for (final p in sorted) {
    final img = cutouts[p.findingId];
    final side = p.scale * size.width;
    canvas
      ..save()
      ..translate(p.x * size.width, p.y * size.height)
      ..rotate(p.rotation * math.pi / 180);
    final rect = Rect.fromCenter(center: Offset.zero, width: side, height: side);
    canvas.drawOval(rect.deflate(side * 0.18).shift(const Offset(2, 3)), shadow);
    if (img != null) {
      canvas.drawImageRect(
        img,
        Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble()),
        rect,
        Paint()..filterQuality = FilterQuality.medium,
      );
    }
    // Selotip di tepi atas.
    canvas
      ..save()
      ..translate(0, -side * 0.42)
      ..rotate(((p.z % 3) - 1) * 0.12)
      ..drawRect(
        Rect.fromCenter(center: Offset.zero, width: side * 0.34, height: side * 0.09),
        tape,
      )
      ..restore();
    _text(
      canvas,
      book.captionByFinding[p.findingId] ?? '',
      Offset(0, side * 0.48),
      size: side * 0.11,
      color: TokenColors.inkPrimary,
      center: true,
      family: TokenTypography.handwriting,
    );
    canvas.restore();
  }
}

void _text(
  Canvas canvas,
  String text,
  Offset at, {
  required double size,
  required Color color,
  bool center = false,
  FontWeight weight = FontWeight.w400,
  String family = TokenTypography.body,
  double letterSpacing = 0,
}) {
  final tp = TextPainter(
    text: TextSpan(
      text: text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: family,
        letterSpacing: letterSpacing,
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();
  tp.paint(canvas, center ? at - Offset(tp.width / 2, 0) : at);
  tp.dispose();
}
