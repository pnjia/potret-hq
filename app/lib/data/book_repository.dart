import 'package:drift/drift.dart';

import 'ids.dart';
import 'local/app_database.dart';
import 'models/enums.dart';

export 'local/app_database.dart' show Book, Chapter, Page, Placement;

/// Buku, bab, halaman, dan penempatan. Satu buku per pengguna (K-004).
class BookRepository {
  BookRepository(this._db);

  final AppDatabase _db;

  /// Buku satu-satunya; dibuat saat pertama dibutuhkan.
  Future<Book> ensureBook() async {
    final existing = await (_db.select(_db.books)..limit(1)).getSingleOrNull();
    if (existing != null) return existing;
    return _db
        .into(_db.books)
        .insertReturning(BooksCompanion.insert(id: newId()));
  }

  /// Bab untuk satu kota; dibuat di urutan berikutnya bila belum ada.
  Future<Chapter> ensureChapter(String cityId) {
    return _db.transaction(() async {
      final book = await ensureBook();
      final existing =
          await (_db.select(_db.chapters)..where(
                (c) => c.bookId.equals(book.id) & c.cityId.equals(cityId),
              ))
              .getSingleOrNull();
      if (existing != null) return existing;
      final next = await _nextOrder(
        _db.chapters,
        _db.chapters.order,
        _db.chapters.bookId.equals(book.id),
      );
      return _db
          .into(_db.chapters)
          .insertReturning(
            ChaptersCompanion.insert(
              id: newId(),
              bookId: book.id,
              cityId: cityId,
              order: next,
            ),
          );
    });
  }

  Stream<List<Chapter>> watchChapters() => (_db.select(
    _db.chapters,
  )..orderBy([(c) => OrderingTerm.asc(c.order)])).watch();

  /// Menambah halaman di akhir bab.
  Future<Page> addPage(
    String chapterId,
    PageKind kind, {
    String? templateId,
    PaperStyle paperStyle = PaperStyle.plain,
  }) async {
    final next = await _nextOrder(
      _db.pages,
      _db.pages.order,
      _db.pages.chapterId.equals(chapterId),
    );
    return _db
        .into(_db.pages)
        .insertReturning(
          PagesCompanion.insert(
            id: newId(),
            chapterId: chapterId,
            kind: kind,
            templateId: Value(templateId),
            order: next,
            paperStyle: Value(paperStyle),
          ),
        );
  }

  Stream<List<Page>> watchPages(String chapterId) =>
      (_db.select(_db.pages)
            ..where((p) => p.chapterId.equals(chapterId))
            ..orderBy([(p) => OrderingTerm.asc(p.order)]))
          .watch();

  /// Menempel temuan di halaman (menggantikan penempatan lamanya bila ada).
  Future<void> place(PlacementsCompanion placement) =>
      _db.into(_db.placements).insertOnConflictUpdate(placement);

  Stream<List<Placement>> watchPlacements(String pageId) =>
      (_db.select(_db.placements)
            ..where((p) => p.pageId.equals(pageId))
            ..orderBy([(p) => OrderingTerm.asc(p.z)]))
          .watch();

  /// Mengubah posisi oleh pengguna: halaman itu tidak pernah diacak ulang
  /// sistem lagi (K-005).
  Future<void> arrangeManually(
    String findingId, {
    double? x,
    double? y,
    double? scale,
    double? rotation,
  }) =>
      (_db.update(
        _db.placements,
      )..where((p) => p.findingId.equals(findingId))).write(
        PlacementsCompanion(
          x: x == null ? const Value.absent() : Value(x),
          y: y == null ? const Value.absent() : Value(y),
          scale: scale == null ? const Value.absent() : Value(scale),
          rotation: rotation == null ? const Value.absent() : Value(rotation),
          isManuallyArranged: const Value(true),
        ),
      );

  /// Lepas dari halaman: penempatan dihapus, temuan tetap ada (K-037).
  Future<void> detach(String findingId) => (_db.delete(
    _db.placements,
  )..where((p) => p.findingId.equals(findingId))).go();

  /// Temuan di satu kota yang belum ditempel (baki "Belum ditempel", K-037).
  Stream<List<Finding>> watchUnplaced(String cityId) {
    final query =
        _db.select(_db.findings).join([
            leftOuterJoin(
              _db.placements,
              _db.placements.findingId.equalsExp(_db.findings.id),
            ),
          ])
          ..where(
            _db.findings.cityId.equals(cityId) &
                _db.placements.findingId.isNull(),
          )
          ..orderBy([OrderingTerm.desc(_db.findings.createdAt)]);
    return query.map((row) => row.readTable(_db.findings)).watch();
  }

  Future<int> _nextOrder(
    TableInfo<Table, dynamic> table,
    GeneratedColumn<int> order,
    Expression<bool> where,
  ) async {
    final max = order.max();
    final row =
        await (_db.selectOnly(table)
              ..addColumns([max])
              ..where(where))
            .getSingle();
    return (row.read(max) ?? -1) + 1;
  }
}
