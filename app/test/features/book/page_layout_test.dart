import 'package:flutter_test/flutter_test.dart';
import 'package:potret/core/theme/design_tokens.dart';
import 'package:potret/features/book/state/book_models.dart';
import 'package:potret/features/book/state/page_layout.dart';

void main() {
  const page = Page(
    id: 'hal-x',
    chapterId: 'bab',
    kind: PageKind.free,
    templateId: 'free-5',
    order: 0,
  );

  test('tata letak otomatis deterministik dan rotasinya dalam batas', () {
    final a = arrangePlacements(page: page, findingIds: ['a', 'b', 'c']);
    final b = arrangePlacements(page: page, findingIds: ['a', 'b', 'c']);
    expect(a, b);
    for (final p in a) {
      expect(
        p.rotation.abs(),
        lessThanOrEqualTo(TokenMotion.placementRotationMaxDeg),
      );
      expect(p.isManuallyArranged, isFalse);
    }
  });

  test('halaman otomatis boleh ditata ulang (salt berbeda, posisi berbeda)', () {
    final a = arrangePlacements(page: page, findingIds: ['a', 'b']);
    final b = arrangePlacements(page: page, findingIds: ['a', 'b'], salt: 99);
    expect(a, isNot(equals(b)));
  });

  test('halaman yang pernah diatur manual tidak diacak ulang (K-005)', () {
    final manual = [
      const Placement(
        findingId: 'a',
        pageId: 'hal-x',
        x: 0.9,
        y: 0.1,
        scale: 0.3,
        rotation: 3.5,
        z: 4,
        isManuallyArranged: true,
      ),
      const Placement(
        findingId: 'b',
        pageId: 'hal-x',
        x: 0.1,
        y: 0.9,
        scale: 0.2,
        rotation: -1,
        z: 1,
      ),
    ];
    for (final salt in [0, 1, 42]) {
      final result = arrangePlacements(
        page: page,
        findingIds: ['a', 'b', 'c'],
        existing: manual,
        salt: salt,
      );
      // Penempatan lama sama persis dan urutannya tetap.
      expect(result.take(2).toList(), manual);
      // Temuan baru ditambahkan di slot kosong, di atas z lama.
      expect(result.length, 3);
      expect(result[2].findingId, 'c');
      expect(result[2].z, greaterThan(4));
    }
  });

  test('template tidak dikenal ditolak', () {
    const bad = Page(
      id: 'hal-y',
      chapterId: 'bab',
      kind: PageKind.free,
      templateId: 'tidak-ada',
      order: 0,
    );
    expect(
      () => arrangePlacements(page: bad, findingIds: ['a']),
      throwsArgumentError,
    );
  });

  test('stableSeed stabil', () {
    expect(stableSeed('hal-01'), stableSeed('hal-01'));
    expect(stableSeed('hal-01'), isNot(stableSeed('hal-02')));
  });
}
