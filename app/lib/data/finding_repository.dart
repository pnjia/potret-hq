import 'package:drift/drift.dart';

import '../core/category_style.dart';
import 'ids.dart';
import 'local/app_database.dart';
import 'models/enums.dart';

export 'local/app_database.dart' show Finding;

/// Temuan (`Finding`). Satu-satunya jalan UI ke tabel temuan.
class FindingRepository {
  FindingRepository(this._db);

  final AppDatabase _db;

  /// Menyimpan temuan baru. Kota dan landmark sudah dicocokkan di perangkat;
  /// koordinat tidak pernah sampai ke sini (K-011).
  Future<Finding> add({
    required String cityId,
    String? landmarkId,
    required CategoryId category,
    required String cameraId,
    required String cutoutUrl,
    String? thumbUrl,
    String? localOriginalPath,
    String? note,
    EdgeStyle edgeStyle = EdgeStyle.dieCut,
    EdgeWidth edgeWidth = EdgeWidth.m,
    DateTime? createdAt,
  }) {
    return _db
        .into(_db.findings)
        .insertReturning(
          FindingsCompanion.insert(
            id: newId(),
            cityId: cityId,
            landmarkId: Value(landmarkId),
            category: category,
            cameraId: cameraId,
            cutoutUrl: cutoutUrl,
            thumbUrl: Value(thumbUrl),
            localOriginalPath: Value(localOriginalPath),
            note: Value(note),
            createdAt: createdAt ?? DateTime.now(),
            edgeStyle: Value(edgeStyle),
            edgeWidth: Value(edgeWidth),
          ),
        );
  }

  Future<Finding?> byId(String id) => (_db.select(
    _db.findings,
  )..where((f) => f.id.equals(id))).getSingleOrNull();

  /// Jumlah temuan di satu kota (angka pertama stempel kota, K-028).
  Stream<int> watchCountInCity(String cityId) {
    final count = _db.findings.id.count();
    final query = _db.selectOnly(_db.findings)
      ..addColumns([count])
      ..where(_db.findings.cityId.equals(cityId));
    return query.map((row) => row.read(count) ?? 0).watchSingle();
  }

  /// Temuan terbaru di satu kota, terbaru lebih dulu.
  Stream<List<Finding>> watchRecentInCity(String cityId, {int limit = 3}) =>
      (_db.select(_db.findings)
            ..where((f) => f.cityId.equals(cityId))
            ..orderBy([(f) => OrderingTerm.desc(f.createdAt)])
            ..limit(limit))
          .watch();

  /// Temuan landmark terbaru di satu kota (stiker hero Beranda).
  Stream<Finding?> watchLatestLandmarkInCity(String cityId) =>
      (_db.select(_db.findings)
            ..where((f) => f.cityId.equals(cityId) & f.landmarkId.isNotNull())
            ..orderBy([(f) => OrderingTerm.desc(f.createdAt)])
            ..limit(1))
          .watchSingleOrNull();

  /// Kota temuan terakhir; null bila belum ada temuan.
  Future<String?> latestCityId() async {
    final row =
        await (_db.select(_db.findings)
              ..orderBy([(f) => OrderingTerm.desc(f.createdAt)])
              ..limit(1))
            .getSingleOrNull();
    return row?.cityId;
  }

  /// Mengubah tepi stiker; berlaku di semua tempat temuan itu tampil (K-037).
  Future<void> updateEdge(String id, EdgeStyle style, EdgeWidth width) =>
      (_db.update(_db.findings)..where((f) => f.id.equals(id))).write(
        FindingsCompanion(edgeStyle: Value(style), edgeWidth: Value(width)),
      );

  Future<void> updateNote(String id, String? note) => (_db.update(
    _db.findings,
  )..where((f) => f.id.equals(id))).write(FindingsCompanion(note: Value(note)));

  /// Hapus temuan permanen (penempatannya ikut terhapus). Berbeda dengan
  /// "Lepas dari halaman" (K-031).
  Future<void> delete(String id) =>
      (_db.delete(_db.findings)..where((f) => f.id.equals(id))).go();
}
