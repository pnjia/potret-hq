import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:potret/data/local/app_database.dart';

/// Database di memori untuk tes. Peringatan "beberapa database" dimatikan
/// karena tiap tes membuat database sendiri.
AppDatabase memoryDatabase() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  return AppDatabase(NativeDatabase.memory());
}

/// Melepas pohon widget dan memberi waktu timer pembersih stream drift
/// selesai, supaya tes tidak gagal dengan "A Timer is still pending".
Future<void> unmountApp(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(seconds: 1));
}
