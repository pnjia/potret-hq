// Beranda v5 di dalam kerangka navigasi: golden di lebar 360 (Infinix Hot 11
// Play) dan 390 (mockup), pedoman aksesibilitas, dan navigasi antar-tab.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:potret/core/theme/app_theme.dart';
import 'package:potret/features/book/state/book_providers.dart';
import 'package:potret/features/book/state/page_turn_sound.dart';
import 'package:potret/features/book/ui/book_screen.dart';
import 'package:potret/features/home/ui/app_shell.dart';
import 'package:potret/features/home/ui/home_screen.dart';

import '../../support/golden_support.dart';

Widget _app() => ProviderScope(
  overrides: [
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

void main() {
  setUpAll(loadAppFonts);

  for (final (width, height) in [(360.0, 800.0), (390.0, 844.0)]) {
    testWidgets('Beranda ${width.toInt()} dp', (tester) async {
      setSurface(tester, width, height);
      await tester.pumpWidget(_app());
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
    });
  }

  testWidgets('karcis Potret membuka layar kamera sementara', (tester) async {
    setSurface(tester, 360, 800);
    await tester.pumpWidget(_app());
    await tester.tap(find.bySemanticsLabel(RegExp('^Potret sekarang')));
    await tester.pumpAndSettle();
    expect(
      find.text('Kamera berbodi dan potong otomatis dibangun di Fase 2.'),
      findsOneWidget,
    );
    await tester.tap(find.bySemanticsLabel('Kembali'));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('tab Buku membuka prototipe buku, tab Beranda kembali', (
    tester,
  ) async {
    setSurface(tester, 360, 800);
    await tester.pumpWidget(_app());
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
  });
}
