import 'package:flutter_test/flutter_test.dart';
import 'package:potret/core/category_style.dart';
import 'package:potret/data/book_repository.dart';
import 'package:potret/data/finding_repository.dart';
import 'package:potret/data/local/app_database.dart';
import 'package:potret/data/models/enums.dart';

import '../support/test_database.dart';

void main() {
  late AppDatabase db;
  late FindingRepository repo;

  setUp(() {
    db = memoryDatabase();
    repo = FindingRepository(db);
  });
  tearDown(() => db.close());

  Future<Finding> add(String city, DateTime at, {String? landmarkId}) =>
      repo.add(
        cityId: city,
        landmarkId: landmarkId,
        category: CategoryId.food,
        cameraId: 'saku-35',
        cutoutUrl: 'file:///data/cutouts/x.webp',
        createdAt: at,
      );

  test(
    'skema lokal tidak punya kolom koordinat atau tahun lahir (K-011, K-018)',
    () {
      final columns = [
        for (final table in db.allTables)
          for (final c in table.$columns) '${table.actualTableName}.${c.name}',
      ];
      // Dicek per kata nama kolom (template_id mengandung "lat" tapi bukan
      // koordinat).
      const forbidden = {
        'lat',
        'lng',
        'latitude',
        'longitude',
        'location',
        'birth',
        'year',
      };
      final offending = columns.where(
        (c) => c.split('.').last.split('_').any(forbidden.contains),
      );
      expect(offending, isEmpty);
      // Nama kolom SQL = Postgres nanti (glosarium bagian 4).
      expect(columns, contains('findings.local_original_path'));
      expect(columns, contains('pages.sort_order'));
      expect(columns, contains('placements.is_manually_arranged'));
    },
  );

  test('temuan baru memakai tepi bawaan Die-cut ukuran M (K-031)', () async {
    final f = await add('sukabumi', DateTime(2026, 11, 20));
    expect(f.edgeStyle, EdgeStyle.dieCut);
    expect(f.edgeWidth, EdgeWidth.m);
    expect(
      f.id,
      matches(
        RegExp(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
        ),
      ),
    );
    expect(await repo.byId(f.id), f);
  });

  test('jumlah, temuan terbaru, dan landmark terbaru per kota', () async {
    for (var i = 0; i < 5; i++) {
      await add('sukabumi', DateTime(2026, 11, 1 + i));
    }
    await add(
      'sukabumi',
      DateTime(2026, 11, 3, 12),
      landmarkId: 'sukabumi-stasiun',
    );
    await add('bogor', DateTime(2026, 11, 30));

    expect(await repo.watchCountInCity('sukabumi').first, 6);
    expect(await repo.watchCountInCity('bogor').first, 1);

    final recent = await repo.watchRecentInCity('sukabumi').first;
    expect(recent.map((f) => f.createdAt.day), [5, 4, 3]);

    final landmark = await repo.watchLatestLandmarkInCity('sukabumi').first;
    expect(landmark?.landmarkId, 'sukabumi-stasiun');
    expect(await repo.watchLatestLandmarkInCity('bogor').first, isNull);
    expect(await repo.latestCityId(), 'bogor');
  });

  test('jumlah ikut berubah saat temuan ditambah', () async {
    final counts = repo.watchCountInCity('sukabumi');
    final expectation = expectLater(counts, emitsInOrder([0, 1]));
    await Future<void>.delayed(Duration.zero);
    await add('sukabumi', DateTime(2026, 11, 20));
    await expectation;
  });

  test('ubah tepi dan keterangan', () async {
    final f = await add('sukabumi', DateTime(2026, 11, 20));
    await repo.updateEdge(f.id, EdgeStyle.pinking, EdgeWidth.l);
    await repo.updateNote(f.id, 'angkot sore-sore');
    final updated = await repo.byId(f.id);
    expect(updated?.edgeStyle, EdgeStyle.pinking);
    expect(updated?.edgeWidth, EdgeWidth.l);
    expect(updated?.note, 'angkot sore-sore');
  });

  test('hapus temuan ikut menghapus penempatannya', () async {
    final books = BookRepository(db);
    final chapter = await books.ensureChapter('sukabumi');
    final page = await books.addPage(chapter.id, PageKind.free);
    final f = await add('sukabumi', DateTime(2026, 11, 20));
    await books.place(
      PlacementsCompanion.insert(
        findingId: f.id,
        pageId: page.id,
        x: 0.5,
        y: 0.5,
      ),
    );
    expect(await books.watchPlacements(page.id).first, hasLength(1));

    await repo.delete(f.id);
    expect(await repo.byId(f.id), isNull);
    expect(await books.watchPlacements(page.id).first, isEmpty);
  });
}
