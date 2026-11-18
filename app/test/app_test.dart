import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:potret/features/book/state/book_providers.dart';
import 'package:potret/features/book/state/page_turn_sound.dart';
import 'package:potret/features/book/ui/book_screen.dart';
import 'package:potret/main.dart';

void main() {
  testWidgets('aplikasi terbuka di layar buku', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Tes tidak memuat shader atau plugin audio.
          bookAssetsProvider.overrideWith(
            (ref) => Completer<BookAssets>().future,
          ),
          pageTurnSoundProvider.overrideWith((ref) => SilentPageTurnSound()),
        ],
        child: const PotretApp(),
      ),
    );

    expect(find.byType(BookScreen), findsOneWidget);
    expect(find.text('Prototipe buku K-012'), findsOneWidget);
    expect(find.text('Menyiapkan shader dan halaman…'), findsOneWidget);
  });
}
