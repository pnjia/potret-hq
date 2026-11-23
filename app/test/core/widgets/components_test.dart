// Golden dan pedoman aksesibilitas untuk komponen bersama v5 (K-035).
// Perbarui golden dengan: flutter test --update-goldens test/core/widgets

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:potret/core/category_style.dart';
import 'package:potret/core/theme/app_text_styles.dart';
import 'package:potret/core/theme/design_tokens.dart';
import 'package:potret/core/widgets/app_button.dart';
import 'package:potret/core/widgets/app_navigation_bar.dart';
import 'package:potret/core/widgets/category_label.dart';
import 'package:potret/core/widgets/city_stamp.dart';
import 'package:potret/core/widgets/highlight.dart';
import 'package:potret/core/widgets/ticket.dart';

import '../../support/golden_support.dart';

const _subject = ValueKey('subject');

/// Target sentuh ≥ 48, setiap target berlabel, dan (bila [contrast]) pedoman
/// kontras teks bawaan Flutter. Pedoman kontras itu menebak warna dari dua
/// warna terbanyak di area node; untuk node yang memuat blok Lime (tab aktif)
/// tebakannya salah, jadi pasangan warnanya diuji eksak di contrast_test.dart.
Future<void> _expectAccessible(
  WidgetTester tester, {
  bool contrast = true,
}) async {
  final handle = tester.ensureSemantics();
  await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
  await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
  await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
  if (contrast) {
    await expectLater(tester, meetsGuideline(textContrastGuideline));
  }
  handle.dispose();
}

void main() {
  setUpAll(loadAppFonts);

  testWidgets('tombol utama dan kedua', (tester) async {
    setSurface(tester, 360, 200);
    await tester.pumpWidget(
      themed(
        SizedBox(
          key: _subject,
          width: 328,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(label: 'Tempel ke buku', onPressed: () {}),
              const SizedBox(height: 12),
              AppButton(
                label: 'Lihat di buku',
                variant: AppButtonVariant.secondary,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
    expect(
      tester.getSize(find.byType(FilledButton)).height,
      TokenSize.buttonHeight,
    );
    expect(
      tester.getSize(find.byType(OutlinedButton)).height,
      TokenSize.buttonHeight,
    );
    await expectLater(
      find.byKey(_subject),
      matchesGoldenFile('goldens/button.png'),
    );
    await _expectAccessible(tester);
  });

  testWidgets('karcis berlubang: Lime dan putih bergaris', (tester) async {
    setSurface(tester, 360, 220);
    var taps = 0;
    await tester.pumpWidget(
      themed(
        SizedBox(
          key: _subject,
          width: 328,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Ticket(
                    stubLabel: 'No. 014',
                    onTap: () => taps++,
                    semanticLabel: 'Potret sekarang',
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'POTRET\nSEKARANG',
                        style: AppTextStyles.ticketLarge,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Ticket(
                    color: TokenColors.paperScreen,
                    outlined: true,
                    stubLabel: 'Sisa 4 hari',
                    onTap: () {},
                    semanticLabel: 'Misi minggu ini',
                    child: Text('Misi minggu ini', style: AppTextStyles.body),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.bySemanticsLabel('Potret sekarang'));
    expect(taps, 1);
    await tester.pumpAndSettle();
    await expectLater(
      find.byKey(_subject),
      matchesGoldenFile('goldens/ticket.png'),
    );
    await _expectAccessible(tester);
  });

  testWidgets('cap pos kota: Kobalt di kertas, Lime di Kobalt', (tester) async {
    setSurface(tester, 360, 340);
    await tester.pumpWidget(
      themed(
        Column(
          key: _subject,
          mainAxisSize: MainAxisSize.min,
          children: const [
            CityStamp(
              cityName: 'Sukabumi',
              findingCount: 13,
              findingTarget: 100,
              diameter: 120,
            ),
            SizedBox(height: 12),
            ColoredBox(
              color: TokenColors.actionPrimary,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CityStamp(
                  cityName: 'Bogor',
                  findingCount: 123,
                  findingTarget: 100,
                  color: TokenColors.highlightPrimary,
                ),
              ),
            ),
          ],
        ),
        background: TokenColors.paperBook,
      ),
    );
    expect(
      find.bySemanticsLabel('Cap Sukabumi, 13 dari 100 temuan'),
      findsOneWidget,
    );
    expect(
      tester.getSize(find.byType(CityStamp).last).width,
      greaterThanOrEqualTo(TokenSize.stampMinScreen),
    );
    await expectLater(
      find.byKey(_subject),
      matchesGoldenFile('goldens/city_stamp.png'),
    );
  });

  testWidgets('coretan stabilo', (tester) async {
    setSurface(tester, 360, 120);
    await tester.pumpWidget(
      themed(
        SizedBox(
          key: _subject,
          width: 300,
          child: HighlightedText(
            'Potret 5 papan nama minggu ini',
            highlight: 'papan nama',
            style: AppTextStyles.withWeight(
              AppTextStyles.body,
              700,
            ).copyWith(fontSize: 20),
          ),
        ),
      ),
    );
    expect(
      find.bySemanticsLabel('Potret 5 papan nama minggu ini'),
      findsOneWidget,
    );
    await expectLater(
      find.byKey(_subject),
      matchesGoldenFile('goldens/highlight.png'),
    );
    await _expectAccessible(tester);
  });

  testWidgets('label kategori: sembilan kategori, satu terpilih', (
    tester,
  ) async {
    setSurface(tester, 360, 260);
    await tester.pumpWidget(
      themed(
        SizedBox(
          key: _subject,
          width: 340,
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final c in CategoryId.values)
                CategoryLabel(
                  c,
                  selected: c == CategoryId.building,
                  onTap: () {},
                ),
            ],
          ),
        ),
      ),
    );
    expect(find.bySemanticsLabel('Kategori Bangunan'), findsOneWidget);
    await expectLater(
      find.byKey(_subject),
      matchesGoldenFile('goldens/category_label.png'),
    );
    await _expectAccessible(tester);
  });

  testWidgets('navigasi bawah: lima tab berlabel', (tester) async {
    setSurface(tester, 360, 140);
    final selected = <AppTab>[];
    await tester.pumpWidget(
      themed(
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              key: _subject,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppNavigationBar(
                    current: AppTab.home,
                    onSelected: selected.add,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    for (final label in ['Beranda', 'Buku', 'Potret', 'Misi', 'Profil']) {
      expect(find.bySemanticsLabel(label), findsOneWidget, reason: label);
    }
    await tester.tap(find.bySemanticsLabel('Buku'));
    await tester.tap(find.bySemanticsLabel('Potret'));
    expect(selected, [AppTab.book, AppTab.camera]);
    await tester.pumpAndSettle();
    await expectLater(
      find.byKey(_subject),
      matchesGoldenFile('goldens/navigation_bar.png'),
    );
    await _expectAccessible(tester, contrast: false);
  });
}
