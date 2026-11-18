import 'package:flutter_test/flutter_test.dart';
import 'package:potret/core/theme/design_tokens.dart';
import 'package:potret/features/book/state/book_models.dart';
import 'package:potret/features/book/state/dummy_book.dart';

void main() {
  final book = buildDummyBook();

  test('buku dummy berisi 20 halaman berurutan dalam 2 bab', () {
    expect(book.pageCount, 20);
    expect(book.pages.map((p) => p.order), List.generate(20, (i) => i));
    expect(book.pages.map((p) => p.id).toSet().length, 20);
    expect(book.chapters.length, 2);
  });

  test('setiap bab diawali halaman pembatas', () {
    for (final c in book.chapters) {
      final first = book.pages.firstWhere((p) => p.chapterId == c.id);
      expect(first.kind, PageKind.divider);
    }
  });

  test('halaman temuan bebas berisi 3-6 penempatan dengan rotasi kecil', () {
    for (final page in book.pages.where((p) => p.kind == PageKind.free)) {
      final ps = book.placementsOf(page);
      expect(ps.length, inInclusiveRange(3, 6), reason: page.id);
      for (final p in ps) {
        expect(
          p.rotation.abs(),
          lessThanOrEqualTo(TokenMotion.placementRotationMaxDeg),
        );
        expect(book.cutoutIndexByFinding[p.findingId], isNotNull);
      }
    }
  });

  test('halaman landmark punya slot kosong untuk siluet "???"', () {
    final landmark = book.pages.where((p) => p.kind == PageKind.landmark);
    expect(landmark, isNotEmpty);
    final hasEmpty = landmark.any(
      (p) => book.placementsOf(p).length < book.landmarkSlotsByPage[p.id]!,
    );
    expect(hasEmpty, isTrue);
  });

  test('ada halaman yang pernah diatur manual', () {
    final manual = book.pages.where(
      (p) => book.placementsOf(p).any((x) => x.isManuallyArranged),
    );
    expect(manual.length, 2);
  });
}
