import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:potret/features/book/state/book_providers.dart';
import 'package:potret/features/book/state/fake_cutouts.dart';
import 'package:potret/features/book/state/frame_recorder.dart';
import 'package:potret/features/book/state/page_turn_sound.dart';
import 'package:potret/features/book/state/renderer_probe.dart';
import 'package:potret/features/book/ui/book_reader.dart';
import 'package:potret/features/book/ui/book_screen.dart';

/// Tes asap layar buku dengan shader dan gambar halaman asli (flutter_tester,
/// Skia). Bukan ukuran performa.
void main() {
  testWidgets('balik halaman maju dengan jari lalu laporan bisa dibuat', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(360, 740));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    late BookAssets assets;
    await tester.runAsync(() async {
      final curl = await ui.FragmentProgram.fromAsset('shaders/page_curl.frag');
      final probe = await probeRenderer(
        await ui.FragmentProgram.fromAsset('shaders/renderer_probe.frag'),
      );
      assets = BookAssets(
        curlProgram: curl,
        probe: probe,
        cutoutPng: await generateFakeCutouts(),
        prepareMs: 0,
        warmupMs: 0,
      );
    });

    final recorder = FrameRecorder();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bookAssetsProvider.overrideWith((ref) async => assets),
          pageTurnSoundProvider.overrideWith((ref) => SilentPageTurnSound()),
          frameRecorderProvider.overrideWith((ref) => recorder),
        ],
        child: const MaterialApp(home: BookScreen()),
      ),
    );
    await tester.pump();

    // Tunggu lazy load halaman 1 dan 2 (render nyata, di luar fake async).
    for (var i = 0; i < 20; i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 50)),
      );
      await tester.pump();
    }
    expect(find.textContaining('hal 1/20'), findsOneWidget);

    // Tarik dari tepi kanan ke kiri: balik maju.
    await tester.timedDragFrom(
      const Offset(340, 500),
      const Offset(-300, -20),
      const Duration(milliseconds: 300),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('hal 2/20'), findsOneWidget);
    expect(recorder.flipCount, 1);
    expect(tester.takeException(), isNull);

    final state = tester.state<BookReaderState>(find.byType(BookReader));
    final report = state.buildCurrentReport();
    expect(report['flips'], 1);
    expect((report['memory']! as Map)['pageTextures'], isA<String>());
  });
}
