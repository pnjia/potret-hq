import 'package:flutter_test/flutter_test.dart';
import 'package:potret/core/category_style.dart';
import 'package:potret/data/book_repository.dart';
import 'package:potret/data/finding_repository.dart';
import 'package:potret/data/local/app_database.dart';
import 'package:potret/data/models/enums.dart';

import '../support/test_database.dart';

void main() {
  late AppDatabase db;
  late BookRepository books;
  late FindingRepository findings;

  setUp(() {
    db = memoryDatabase();
    books = BookRepository(db);
    findings = FindingRepository(db);
  });
  tearDown(() => db.close());

  Future<Finding> finding(String city) => findings.add(
    cityId: city,
    category: CategoryId.sign,
    cameraId: 'saku-35',
    cutoutUrl: 'file:///x.webp',
  );

  test('satu buku per pengguna (K-004)', () async {
    final a = await books.ensureBook();
    final b = await books.ensureBook();
    expect(b.id, a.id);
  });

  test('bab per kota, urut sesuai kota pertama kali dibuka', () async {
    final sukabumi = await books.ensureChapter('sukabumi');
    final bogor = await books.ensureChapter('bogor');
    final again = await books.ensureChapter('sukabumi');
    expect(again.id, sukabumi.id);
    expect([sukabumi.order, bogor.order], [0, 1]);
    expect((await books.watchChapters().first).map((c) => c.cityId), [
      'sukabumi',
      'bogor',
    ]);
  });

  test('halaman bertambah di akhir bab dengan kertas pilihan', () async {
    final chapter = await books.ensureChapter('sukabumi');
    await books.addPage(chapter.id, PageKind.divider);
    await books.addPage(
      chapter.id,
      PageKind.free,
      paperStyle: PaperStyle.lined,
    );
    final pages = await books.watchPages(chapter.id).first;
    expect(pages.map((p) => (p.order, p.kind, p.paperStyle)), [
      (0, PageKind.divider, PaperStyle.plain),
      (1, PageKind.free, PaperStyle.lined),
    ]);
  });

  test('tempel, atur manual, dan lepas dari halaman (K-005, K-037)', () async {
    final chapter = await books.ensureChapter('sukabumi');
    final page = await books.addPage(chapter.id, PageKind.free);
    final a = await finding('sukabumi');
    final b = await finding('sukabumi');

    expect((await books.watchUnplaced('sukabumi').first).length, 2);

    await books.place(
      PlacementsCompanion.insert(
        findingId: a.id,
        pageId: page.id,
        x: 0.3,
        y: 0.4,
      ),
    );
    final placed = (await books.watchPlacements(page.id).first).single;
    expect(placed.isManuallyArranged, isFalse);
    expect(placed.tapePattern, TapePattern.plain);
    expect(placed.tapePosition, TapePosition.twoCorners);
    expect(placed.noteInk, NoteInk.ink);
    expect((await books.watchUnplaced('sukabumi').first).map((f) => f.id), [
      b.id,
    ]);

    await books.arrangeManually(a.id, rotation: 8, scale: 1.2);
    final arranged = (await books.watchPlacements(page.id).first).single;
    expect(arranged.isManuallyArranged, isTrue);
    expect((arranged.rotation, arranged.scale, arranged.x), (8.0, 1.2, 0.3));

    await books.detach(a.id);
    expect(await books.watchPlacements(page.id).first, isEmpty);
    expect(await findings.byId(a.id), isNotNull, reason: 'temuan tetap ada');
    expect((await books.watchUnplaced('sukabumi').first).length, 2);
  });
}
