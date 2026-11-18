import 'dart:math' as math;

import '../../../core/theme/design_tokens.dart';
import 'book_models.dart';

/// Satu slot di template halaman: titik tengah (0..1) dan skala relatif lebar.
class TemplateSlot {
  const TemplateSlot(this.x, this.y, this.scale);

  final double x;
  final double y;
  final double scale;
}

/// Template halaman (usulan kerja prototipe). Rupa final dirancang
/// `desainer-visual`; lihat docs/desain/acuan/halaman-buku.md.
class PageTemplate {
  const PageTemplate(this.id, this.slots);

  final String id;
  final List<TemplateSlot> slots;
}

/// Template yang dipakai buku dummy. Slot temuan bebas 3–6 per halaman.
const Map<String, PageTemplate> pageTemplates = {
  'divider': PageTemplate('divider', []),
  'landmark-4': PageTemplate('landmark-4', [
    TemplateSlot(0.29, 0.30, 0.36),
    TemplateSlot(0.71, 0.30, 0.36),
    TemplateSlot(0.29, 0.66, 0.36),
    TemplateSlot(0.71, 0.66, 0.36),
  ]),
  'free-3': PageTemplate('free-3', [
    TemplateSlot(0.34, 0.24, 0.50),
    TemplateSlot(0.66, 0.50, 0.46),
    TemplateSlot(0.36, 0.76, 0.48),
  ]),
  'free-4': PageTemplate('free-4', [
    TemplateSlot(0.30, 0.24, 0.40),
    TemplateSlot(0.70, 0.30, 0.40),
    TemplateSlot(0.32, 0.62, 0.42),
    TemplateSlot(0.70, 0.76, 0.40),
  ]),
  'free-5': PageTemplate('free-5', [
    TemplateSlot(0.28, 0.20, 0.36),
    TemplateSlot(0.72, 0.24, 0.36),
    TemplateSlot(0.50, 0.48, 0.40),
    TemplateSlot(0.28, 0.76, 0.36),
    TemplateSlot(0.72, 0.78, 0.36),
  ]),
  'free-6': PageTemplate('free-6', [
    TemplateSlot(0.28, 0.19, 0.34),
    TemplateSlot(0.72, 0.21, 0.34),
    TemplateSlot(0.30, 0.48, 0.34),
    TemplateSlot(0.70, 0.50, 0.34),
    TemplateSlot(0.28, 0.79, 0.34),
    TemplateSlot(0.72, 0.80, 0.34),
  ]),
};

/// Halaman dianggap "pernah diatur manual" bila salah satu penempatannya
/// bertanda [Placement.isManuallyArranged].
bool isPageManuallyArranged(List<Placement> placements) =>
    placements.any((p) => p.isManuallyArranged);

/// Hash FNV-1a 32-bit: seed stabil lintas platform dari id halaman.
int stableSeed(String text) {
  var hash = 0x811c9dc5;
  for (final unit in text.codeUnits) {
    hash ^= unit;
    hash = (hash * 0x01000193) & 0xFFFFFFFF;
  }
  return hash;
}

/// Mesin tata letak otomatis berbasis template (spesifikasi §4.5, K-005).
///
/// Satu-satunya jalur tata ulang otomatis di modul buku. Aturan:
/// - Halaman yang pernah diatur manual: penempatan lama dikembalikan apa
///   adanya. Temuan baru hanya mengisi slot template yang kosong; tidak ada
///   penempatan lama yang dipindah, diputar, atau diubah urutan z-nya.
/// - Halaman otomatis: semua temuan ditata ulang dari template, dengan rotasi
///   acak kecil (maks. [TokenMotion.placementRotationMaxDeg]) dan geseran
///   kecil, deterministik per [Page.id] dan [salt].
List<Placement> arrangePlacements({
  required Page page,
  required List<String> findingIds,
  List<Placement> existing = const [],
  int salt = 0,
}) {
  final template = pageTemplates[page.templateId];
  if (template == null) {
    throw ArgumentError.value(page.templateId, 'templateId', 'tidak dikenal');
  }
  final rng = math.Random(stableSeed(page.id) ^ salt);
  final maxRot = TokenMotion.placementRotationMaxDeg;

  Placement auto(String findingId, TemplateSlot slot, int z) => Placement(
        findingId: findingId,
        pageId: page.id,
        x: slot.x + (rng.nextDouble() - 0.5) * 0.04,
        y: slot.y + (rng.nextDouble() - 0.5) * 0.04,
        scale: slot.scale * (0.92 + rng.nextDouble() * 0.12),
        rotation: (rng.nextDouble() * 2 - 1) * maxRot,
        z: z,
      );

  if (isPageManuallyArranged(existing)) {
    final kept = List<Placement>.of(existing);
    final placedIds = kept.map((p) => p.findingId).toSet();
    final newIds = findingIds.where((id) => !placedIds.contains(id)).toList();
    // Slot dianggap terpakai bila ada penempatan lama di dekatnya.
    final freeSlots = template.slots.where((slot) {
      return !kept.any(
        (p) => (p.x - slot.x).abs() < 0.12 && (p.y - slot.y).abs() < 0.12,
      );
    }).toList();
    var z = kept.fold<int>(0, (m, p) => math.max(m, p.z)) + 1;
    for (var i = 0; i < newIds.length && i < freeSlots.length; i++) {
      kept.add(auto(newIds[i], freeSlots[i], z++));
    }
    return kept;
  }

  final result = <Placement>[];
  for (var i = 0; i < findingIds.length && i < template.slots.length; i++) {
    result.add(auto(findingIds[i], template.slots[i], i));
  }
  return result;
}
