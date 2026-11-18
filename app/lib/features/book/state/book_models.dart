// Model buku untuk prototipe K-012.
//
// Nama kelas dan field mengikuti glosarium (`Book`, `Page`, `Placement`,
// `Page.kind`). Ini model memori saja: entitas yang sebenarnya nanti tinggal
// di `lib/data/` (drift + Supabase) dan dibuat oleh `arsitek-flutter`.
// Hanya field yang dipakai prototipe yang ditulis.

/// `Page.kind` di glosarium.
enum PageKind { divider, landmark, free }

/// Satu buku milik pengguna (glosarium: `Book`).
class Book {
  const Book({required this.id, required this.userId, required this.themeId});

  final String id;
  final String userId;
  final String themeId;
}

/// Satu halaman buku berbasis template (glosarium: `Page`).
class Page {
  const Page({
    required this.id,
    required this.chapterId,
    required this.kind,
    required this.templateId,
    required this.order,
  });

  final String id;
  final String chapterId;
  final PageKind kind;
  final String templateId;
  final int order;
}

/// Posisi temuan di halaman (glosarium: `Placement`).
///
/// `x` dan `y` adalah titik tengah dalam koordinat ternormalisasi halaman
/// (0..1). `scale` relatif terhadap lebar halaman. `rotation` dalam derajat.
class Placement {
  const Placement({
    required this.findingId,
    required this.pageId,
    required this.x,
    required this.y,
    required this.scale,
    required this.rotation,
    required this.z,
    this.isManuallyArranged = false,
  });

  final String findingId;
  final String pageId;
  final double x;
  final double y;
  final double scale;
  final double rotation;
  final int z;

  /// Halaman yang pernah diatur manual tidak boleh diacak ulang (K-005).
  final bool isManuallyArranged;

  Placement copyWith({
    double? x,
    double? y,
    double? scale,
    double? rotation,
    int? z,
    bool? isManuallyArranged,
  }) {
    return Placement(
      findingId: findingId,
      pageId: pageId,
      x: x ?? this.x,
      y: y ?? this.y,
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      z: z ?? this.z,
      isManuallyArranged: isManuallyArranged ?? this.isManuallyArranged,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is Placement &&
      other.findingId == findingId &&
      other.pageId == pageId &&
      other.x == x &&
      other.y == y &&
      other.scale == scale &&
      other.rotation == rotation &&
      other.z == z &&
      other.isManuallyArranged == isManuallyArranged;

  @override
  int get hashCode => Object.hash(
        findingId,
        pageId,
        x,
        y,
        scale,
        rotation,
        z,
        isManuallyArranged,
      );
}
