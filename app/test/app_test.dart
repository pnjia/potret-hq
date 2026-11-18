import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:potret/features/book/ui/book_screen.dart';
import 'package:potret/main.dart';

void main() {
  testWidgets('aplikasi terbuka di layar buku', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: PotretApp()));

    expect(find.byType(BookScreen), findsOneWidget);
    expect(find.text('Prototipe buku K-012'), findsOneWidget);
  });
}
