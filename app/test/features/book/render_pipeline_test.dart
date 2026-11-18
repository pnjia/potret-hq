import 'dart:ui' as ui;

import 'package:flutter_test/flutter_test.dart';
import 'package:potret/features/book/state/book_providers.dart';
import 'package:potret/features/book/state/curl_geometry.dart';
import 'package:potret/features/book/state/dummy_book.dart';
import 'package:potret/features/book/state/fake_cutouts.dart';
import 'package:potret/features/book/state/renderer_probe.dart';
import 'package:potret/features/book/ui/page_painter.dart';

/// Jalur nyata di flutter_tester: shader termuat, uniform bernama ada,
/// pemanasan, probe, dan render halaman berjalan tanpa error. Bukan ukuran
/// performa (flutter_tester bukan perangkat).
void main() {
  testWidgets('shader PageCurl, probe, dan render halaman', (tester) async {
    await tester.runAsync(() async {
      final curl = await ui.FragmentProgram.fromAsset('shaders/page_curl.frag');
      final probeProgram =
          await ui.FragmentProgram.fromAsset('shaders/renderer_probe.frag');

      final probe = await probeRenderer(probeProgram);
      // flutter_tester: hasil apa pun boleh, asal terbaca.
      expect(probe.rawRgb.length, 3);
      expect(probe.backend, isNot(RendererBackend.unknown));

      await warmUpCurlShader(curl, flipY: probe.flipY);

      final cutouts = await generateFakeCutouts();
      expect(cutouts.length, fakeCutoutCount);

      final book = buildDummyBook();
      const size = ui.Size(180, 370);
      final images = <ui.Image>[];
      for (final i in [0, 1, 3]) {
        images.add(
          await renderPageImage(
            book: book,
            index: i,
            size: size,
            pixelRatio: 1,
            cutoutPng: cutouts,
          ),
        );
      }
      expect(images.first.width, 180);
      expect(images.first.height, 370);

      // Satu frame PageCurl offscreen dengan gambar halaman asli.
      final u = CurlUniforms(curl.fragmentShader());
      u.set(
        size: size,
        geometry: CurlGeometry.fromPose(size, defaultPose(size, distance: 200)),
        flipY: probe.flipY,
        paper: const ui.Color(0xFFFBF8F2),
        front: images[0],
        under: images[1],
      );
      final rec = ui.PictureRecorder();
      ui.Canvas(rec).drawRect(ui.Offset.zero & size, ui.Paint()..shader = u.shader);
      final pic = rec.endRecording();
      final out = await pic.toImage(180, 370);
      expect(out.width, 180);
      out.dispose();
      pic.dispose();
      u.shader.dispose();
      for (final img in images) {
        img.dispose();
      }
    });
  });
}
