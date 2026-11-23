import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potret/data/catalog_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  for (final name in ['cities.json', 'categories.json']) {
    test('assets/catalog/$name sama dengan data/$name', () {
      expect(
        File('assets/catalog/$name').readAsStringSync(),
        File('../data/$name').readAsStringSync(),
        reason: 'jalankan: python3 tool/sync_catalog.py',
      );
    });
  }

  test(
    'katalog memuat Sukabumi dan landmark-nya, tanpa entri contoh',
    () async {
      final catalog = await CatalogRepository(rootBundle).load();
      final sukabumi = catalog.city(CatalogRepository.defaultCityId);
      expect(sukabumi?.name, 'Sukabumi');
      expect(sukabumi?.findingTarget, 100);
      final landmarks = catalog.landmarksOf('sukabumi');
      expect(landmarks.length, greaterThanOrEqualTo(20));
      expect(landmarks.every((l) => l.radiusM > 0), isTrue);
      expect(
        catalog.city('bandung'),
        isNull,
        reason: 'entri contoh dihapus (K-041)',
      );
    },
  );
}
