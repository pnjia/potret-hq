import '../core/category_style.dart';
import 'finding_repository.dart';

/// Aktifkan dengan `--dart-define=DEMO_DATA=true` (APK uji sebelum kamera
/// ada). Build rilis tidak pernah memakainya.
const demoDataEnabled = bool.fromEnvironment('DEMO_DATA');

/// Mengisi 13 temuan contoh di Sukabumi bila database masih kosong. Angkanya
/// sama dengan mockup V5Beranda: 13/100, landmark terbaru gereja, tiga temuan
/// terbaru mochi, angkot, papan Warung Kopi. Gambar dari `assets/demo/`.
Future<void> seedDemoFindings(FindingRepository repo, {DateTime? now}) async {
  if (await repo.latestCityId() != null) return;
  final base = now ?? DateTime(2026, 11, 20, 16);
  const older = [
    ('assets/demo/angkot.png', CategoryId.vehicle),
    ('assets/demo/mochi.png', CategoryId.food),
    ('assets/demo/warung-sign.png', CategoryId.sign),
  ];
  for (var i = 0; i < 9; i++) {
    final (asset, category) = older[i % older.length];
    await repo.add(
      cityId: 'sukabumi',
      category: category,
      cameraId: 'saku-35',
      cutoutUrl: 'asset:$asset',
      createdAt: base.subtract(Duration(days: 10 - i)),
    );
  }
  await repo.add(
    cityId: 'sukabumi',
    landmarkId: 'sukabumi-gereja-sidang-kristus',
    category: CategoryId.building,
    cameraId: 'saku-35',
    cutoutUrl: 'asset:assets/demo/church.png',
    note: 'menara jam, sore hari',
    createdAt: base.subtract(const Duration(hours: 3)),
  );
  const latest = [
    ('assets/demo/warung-sign.png', CategoryId.sign, 'Papan nama Warung Kopi'),
    ('assets/demo/angkot.png', CategoryId.vehicle, 'angkot sore-sore'),
    ('assets/demo/mochi.png', CategoryId.food, 'mochi oleh-oleh'),
  ];
  for (var i = 0; i < latest.length; i++) {
    final (asset, category, note) = latest[i];
    await repo.add(
      cityId: 'sukabumi',
      category: category,
      cameraId: 'saku-35',
      cutoutUrl: 'asset:$asset',
      note: note,
      createdAt: base.subtract(Duration(hours: 2 - i)),
    );
  }
}
