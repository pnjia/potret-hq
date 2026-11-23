import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'book_repository.dart';
import 'catalog_repository.dart';
import 'finding_repository.dart';
import 'local/app_database.dart';

/// Database lokal. Tes menimpanya dengan database di memori.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase.onDevice();
  ref.onDispose(db.close);
  return db;
});

final findingRepositoryProvider = Provider<FindingRepository>(
  (ref) => FindingRepository(ref.watch(appDatabaseProvider)),
);

final bookRepositoryProvider = Provider<BookRepository>(
  (ref) => BookRepository(ref.watch(appDatabaseProvider)),
);

final catalogRepositoryProvider = Provider<CatalogRepository>(
  (ref) => CatalogRepository(rootBundle),
);

/// Katalog kota dan landmark yang dibundel; dimuat sekali.
final catalogProvider = FutureProvider<Catalog>(
  (ref) => ref.watch(catalogRepositoryProvider).load(),
);
