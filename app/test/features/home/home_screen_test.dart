// Beranda v5 di dalam kerangka navigasi: golden di lebar 360 (Infinix Hot 11
// Play) dan 390 (mockup), pedoman aksesibilitas, dan navigasi antar-tab.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:potret/core/category_style.dart';
import 'package:potret/core/theme/app_theme.dart';
import 'package:potret/data/demo_seed.dart';
import 'package:potret/data/finding_repository.dart';
import 'package:potret/data/local/app_database.dart';
import 'package:potret/data/providers.dart';
import 'package:potret/features/book/state/book_providers.dart';
import 'package:potret/features/book/state/page_turn_sound.dart';
import 'package:potret/features/book/ui/book_screen.dart';
import 'package:potret/features/home/ui/app_shell.dart';
import 'package:potret/features/home/ui/home_screen.dart';

import '../../support/golden_support.dart';
import '../../support/test_database.dart';

Widget _app(AppDatabase db) => ProviderScope(
  overrides: [
    appDatabaseProvider.overrideWithValue(db),
    // Tes tidak memuat shader atau plugin audio buku.
    bookAssetsProvider.overrideWith((ref) => Completer<BookAssets>().future),
    pageTurnSoundProvider.overrideWith((ref) => SilentPageTurnSound()),
  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: buildAppTheme(),
    home: const AppShell(),
  ),
);

/// Database di memori, diisi 13 temuan contoh (angka mockup V5Beranda).
Future<AppDatabase> _seeded(WidgetTester tester) async {
  final db = memoryDatabase();
  addTearDown(db.close);
  await tester.runAsync(() => seedDemoFindings(FindingRepository(db)));
  return db;
}

/// Menunggu query drift dan katalog (dimuat di isolate) selesai, sampai
/// hero Beranda tampil. Waktu tes palsu tidak menjalankan isolate, jadi
/// ditunggu dengan waktu nyata.
Future<void> _settle(WidgetTester tester, {Finder? until}) async {
  final done = until ?? find.text('SUKABUMI');
  for (var i = 0; i < 100; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 20)),
    );
    await tester.pump();
    if (done.evaluate().isNotEmpty) break;
  }
  await tester.pump();
}

void main() {
  setUpAll(loadAppFonts);

  for (final (width, height) in [(360.0, 800.0), (390.0, 844.0)]) {
    testWidgets('Beranda ${width.toInt()} dp', (tester) async {
      setSurface(tester, width, height);
      await tester.pumpWidget(_app(await _seeded(tester)));
      await _settle(tester);
      await precacheAssetImages(tester);

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.text('Beranda'), findsWidgets);
      expect(find.text('SUKABUMI'), findsOneWidget);
      expect(find.bySemanticsLabel('13 dari 100 temuan'), findsOneWidget);
      expect(
        find.bySemanticsLabel(RegExp('^Potret sekarang, temuan nomor 014')),
        findsOneWidget,
      );
      expect(
        find.bySemanticsLabel(RegExp('^Misi minggu ini: Potret 5 papan nama')),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);

      await expectLater(
        find.byType(AppShell),
        matchesGoldenFile('goldens/home_${width.toInt()}.png'),
      );

      final handle = tester.ensureSemantics();
      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      handle.dispose();
      await unmountApp(tester);
    });
  }

  testWidgets('karcis Potret membuka layar kamera sementara', (tester) async {
    setSurface(tester, 360, 800);
    await tester.pumpWidget(_app(await _seeded(tester)));
    await _settle(tester);
    await tester.tap(find.bySemanticsLabel(RegExp('^Potret sekarang')));
    await tester.pumpAndSettle();
    expect(
      find.text('Kamera berbodi dan potong otomatis dibangun di Fase 2.'),
      findsOneWidget,
    );
    await tester.tap(find.bySemanticsLabel('Kembali'));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
    await unmountApp(tester);
  });

  testWidgets('tab Buku membuka prototipe buku, tab Beranda kembali', (
    tester,
  ) async {
    setSurface(tester, 360, 800);
    await tester.pumpWidget(_app(await _seeded(tester)));
    await _settle(tester);
    expect(
      find.byType(BookScreen),
      findsNothing,
      reason: 'Buku dimuat saat tabnya dibuka',
    );

    await tester.tap(find.bySemanticsLabel('Buku'));
    await tester.pump();
    expect(find.byType(BookScreen), findsOneWidget);

    await tester.tap(find.bySemanticsLabel('Beranda'));
    await tester.pump();
    expect(find.byType(HomeScreen).hitTestable(), findsOneWidget);
    await unmountApp(tester);
  });

  testWidgets('Beranda kosong: 0/100, No. 001, tiga slot kosong', (
    tester,
  ) async {
    setSurface(tester, 360, 800);
    final db = memoryDatabase();
    addTearDown(db.close);
    await tester.pumpWidget(_app(db));
    await _settle(tester);
    expect(find.text('SUKABUMI'), findsOneWidget);
    expect(find.bySemanticsLabel('0 dari 100 temuan'), findsOneWidget);
    expect(find.bySemanticsLabel(RegExp('temuan nomor 001')), findsOneWidget);
    expect(find.text('tempel berikutnya'), findsNWidgets(3));
    await unmountApp(tester);
  });

  testWidgets('temuan baru langsung menaikkan angka Beranda', (tester) async {
    setSurface(tester, 360, 800);
    final db = await _seeded(tester);
    await tester.pumpWidget(_app(db));
    await _settle(tester);
    expect(find.bySemanticsLabel('13 dari 100 temuan'), findsOneWidget);
    await tester.runAsync(
      () => FindingRepository(db).add(
        cityId: 'sukabumi',
        category: CategoryId.plant,
        cameraId: 'saku-35',
        cutoutUrl: 'asset:assets/demo/mochi.png',
      ),
    );
    await _settle(tester, until: find.bySemanticsLabel('14 dari 100 temuan'));
    expect(find.bySemanticsLabel('14 dari 100 temuan'), findsOneWidget);
    expect(find.bySemanticsLabel(RegExp('temuan nomor 015')), findsOneWidget);
    await unmountApp(tester);
  });
}
