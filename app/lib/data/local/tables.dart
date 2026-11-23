import 'package:drift/drift.dart';

import '../../core/category_style.dart';
import '../models/enums.dart';

// Tabel lokal dengan nama kolom glosarium (K-014). Nama kolom SQL memakai
// snake_case yang sama dengan Postgres nanti, supaya sinkronisasi tinggal
// mencerminkan. Tidak ada kolom koordinat (K-011) atau tahun lahir (K-018).
//
// URI gambar (`cutoutUrl`, `thumbUrl`): `file://` selama hanya di perangkat,
// `asset:` untuk data contoh, `https://` setelah tersinkron (lib/data/README.md).

@DataClassName('Finding')
class Findings extends Table {
  TextColumn get id => text()();

  /// Null selama belum ada akun (Supabase ditahan).
  TextColumn get userId => text().nullable()();
  TextColumn get cityId => text()();
  TextColumn get landmarkId => text().nullable()();
  TextColumn get category => textEnum<CategoryId>()();
  TextColumn get cameraId => text()();
  TextColumn get cutoutUrl => text()();
  TextColumn get thumbUrl => text().nullable()();

  /// Path foto asli di perangkat. Hanya di drift, tidak pernah tersinkron
  /// (K-019).
  TextColumn get localOriginalPath => text().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get edgeStyle =>
      textEnum<EdgeStyle>().withDefault(Constant(EdgeStyle.dieCut.name))();
  TextColumn get edgeWidth =>
      textEnum<EdgeWidth>().withDefault(Constant(EdgeWidth.m.name))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Book')
class Books extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().nullable()();
  TextColumn get themeId => text().nullable()();

  /// `Book.cover` sebagai JSON (`templateId`, `title`, `findingIds`,
  /// `decorationSetId`; K-037). Null = sampul bawaan.
  TextColumn get cover => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Chapter')
class Chapters extends Table {
  TextColumn get id => text()();
  TextColumn get bookId =>
      text().references(Books, #id, onDelete: KeyAction.cascade)();
  TextColumn get cityId => text()();
  IntColumn get order => integer().named('sort_order')();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {bookId, cityId},
  ];
}

@DataClassName('Page')
class Pages extends Table {
  TextColumn get id => text()();
  TextColumn get chapterId =>
      text().references(Chapters, #id, onDelete: KeyAction.cascade)();
  TextColumn get kind => textEnum<PageKind>()();
  TextColumn get templateId => text().nullable()();
  IntColumn get order => integer().named('sort_order')();
  TextColumn get paperStyle =>
      textEnum<PaperStyle>().withDefault(Constant(PaperStyle.plain.name))();
  TextColumn get stylePresetId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Satu temuan paling banyak satu penempatan. Lepas dari halaman = baris
/// dihapus, temuan tetap ada (K-037).
@DataClassName('Placement')
class Placements extends Table {
  TextColumn get findingId =>
      text().references(Findings, #id, onDelete: KeyAction.cascade)();
  TextColumn get pageId =>
      text().references(Pages, #id, onDelete: KeyAction.cascade)();
  RealColumn get x => real()();
  RealColumn get y => real()();
  RealColumn get scale => real().withDefault(const Constant(1))();

  /// Derajat.
  RealColumn get rotation => real().withDefault(const Constant(0))();
  IntColumn get z => integer().withDefault(const Constant(0))();

  /// Bila true, sistem tidak pernah menata ulang halaman ini (K-005).
  BoolColumn get isManuallyArranged =>
      boolean().withDefault(const Constant(false))();
  TextColumn get tapePosition => textEnum<TapePosition>().withDefault(
    Constant(TapePosition.twoCorners.name),
  )();
  TextColumn get tapePattern =>
      textEnum<TapePattern>().withDefault(Constant(TapePattern.plain.name))();
  TextColumn get noteInk =>
      textEnum<NoteInk>().withDefault(Constant(NoteInk.ink.name))();
  BoolColumn get hasFrame => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {findingId};
}
