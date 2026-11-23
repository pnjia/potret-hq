import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:potret/features/book/state/book_providers.dart';
import 'package:potret/features/book/state/page_turn_sound.dart';
import 'package:potret/features/home/ui/app_shell.dart';
import 'package:potret/features/home/ui/home_screen.dart';
import 'package:potret/main.dart';

void main() {
  testWidgets('aplikasi terbuka di Beranda dengan navigasi bawah', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bookAssetsProvider.overrideWith(
            (ref) => Completer<BookAssets>().future,
          ),
          pageTurnSoundProvider.overrideWith((ref) => SilentPageTurnSound()),
        ],
        child: const PotretApp(),
      ),
    );

    expect(find.byType(AppShell), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
    for (final label in ['Beranda', 'Buku', 'Potret', 'Misi', 'Profil']) {
      expect(find.bySemanticsLabel(label), findsWidgets, reason: label);
    }
  });
}
