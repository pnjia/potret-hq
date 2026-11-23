import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../core/category_style.dart';
import '../models/enums.dart';
import 'tables.dart';

part 'app_database.g.dart';

/// Database lokal aplikasi (drift/SQLite, K-027). Sumber kebenaran di
/// perangkat; Supabase menyusul sebagai cermin (kartu skema Supabase ditahan).
@DriftDatabase(tables: [Findings, Books, Chapters, Pages, Placements])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  /// Database di penyimpanan aplikasi.
  factory AppDatabase.onDevice() => AppDatabase(driftDatabase(name: 'potret'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
