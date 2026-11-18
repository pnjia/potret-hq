import 'book_models.dart';
import 'page_layout.dart';

/// Jumlah gambar cutout palsu yang dibuat secara prosedural.
const int fakeCutoutCount = 8;

/// Satu bab kota di buku dummy.
class DummyChapter {
  const DummyChapter({
    required this.id,
    required this.cityName,
    required this.targetFindings,
  });

  final String id;
  final String cityName;

  /// Pembagi angka stempel kota (K-028, default 100).
  final int targetFindings;
}

/// Buku dummy prototipe K-012: ±20 halaman, tanpa data asli.
class DummyBook {
  DummyBook({
    required this.book,
    required this.chapters,
    required this.pages,
    required this.placementsByPage,
    required this.cutoutIndexByFinding,
    required this.captionByFinding,
    required this.landmarkSlotsByPage,
  });

  final Book book;
  final List<DummyChapter> chapters;
  final List<Page> pages;
  final Map<String, List<Placement>> placementsByPage;
  final Map<String, int> cutoutIndexByFinding;
  final Map<String, String> captionByFinding;

  /// Jumlah slot landmark per halaman landmark (slot tanpa temuan = "???").
  final Map<String, int> landmarkSlotsByPage;

  int get pageCount => pages.length;

  DummyChapter chapterOf(Page page) =>
      chapters.firstWhere((c) => c.id == page.chapterId);

  List<Placement> placementsOf(Page page) =>
      placementsByPage[page.id] ?? const [];

  /// Jumlah temuan di satu bab (angka kiri stempel kota, K-028).
  int findingCountInChapter(String chapterId) => pages
      .where((p) => p.chapterId == chapterId)
      .fold(0, (sum, p) => sum + placementsOf(p).length);
}

const _captions = [
  'gerobak bakso',
  'pintu biru',
  'lampu jalan',
  'daun ketapang',
  'papan nama toko',
  'cangkir kopi',
  'sepeda tua',
  'jendela kayu',
];

/// Membangun buku dummy secara deterministik.
DummyBook buildDummyBook() {
  const chapters = [
    DummyChapter(id: 'bab-sukabumi', cityName: 'Sukabumi', targetFindings: 100),
    DummyChapter(id: 'bab-bandung', cityName: 'Bandung', targetFindings: 100),
  ];
  // (kind, templateId, jumlah temuan) per halaman, 10 per bab.
  const plan = <(PageKind, String, int)>[
    (PageKind.divider, 'divider', 0),
    (PageKind.landmark, 'landmark-4', 3),
    (PageKind.landmark, 'landmark-4', 1),
    (PageKind.free, 'free-3', 3),
    (PageKind.free, 'free-4', 4),
    (PageKind.free, 'free-5', 5),
    (PageKind.free, 'free-6', 6),
    (PageKind.free, 'free-4', 4),
    (PageKind.free, 'free-5', 5),
    (PageKind.free, 'free-3', 3),
  ];

  final pages = <Page>[];
  final placements = <String, List<Placement>>{};
  final cutoutOf = <String, int>{};
  final captionOf = <String, String>{};
  final landmarkSlots = <String, int>{};
  var findingNo = 0;

  for (final chapter in chapters) {
    for (final (kind, templateId, count) in plan) {
      final order = pages.length;
      final page = Page(
        id: 'hal-${(order + 1).toString().padLeft(2, '0')}',
        chapterId: chapter.id,
        kind: kind,
        templateId: templateId,
        order: order,
      );
      pages.add(page);
      if (kind == PageKind.landmark) {
        landmarkSlots[page.id] = pageTemplates[templateId]!.slots.length;
      }
      final ids = <String>[];
      for (var i = 0; i < count; i++) {
        findingNo++;
        final id = 'temuan-${findingNo.toString().padLeft(3, '0')}';
        ids.add(id);
        cutoutOf[id] = (findingNo * 5) % fakeCutoutCount;
        captionOf[id] = _captions[(findingNo * 3) % _captions.length];
      }
      var arranged = arrangePlacements(page: page, findingIds: ids);
      // Satu halaman per bab dibuat "pernah diatur manual" (K-005), supaya
      // jalur tata ulang otomatis bisa diuji menghormatinya.
      if (order % 10 == 4) {
        arranged = [
          for (final p in arranged)
            p.copyWith(
              x: 1 - p.x,
              rotation: -p.rotation,
              isManuallyArranged: true,
            ),
        ];
      }
      placements[page.id] = arranged;
    }
  }

  return DummyBook(
    book: const Book(id: 'buku-dummy', userId: 'pengguna-dummy', themeId: 'kertas'),
    chapters: chapters,
    pages: pages,
    placementsByPage: placements,
    cutoutIndexByFinding: cutoutOf,
    captionByFinding: captionOf,
    landmarkSlotsByPage: landmarkSlots,
  );
}
