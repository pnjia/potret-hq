import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/category_style.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../data/catalog_repository.dart';
import '../../../data/cutout_image.dart';
import '../../../data/finding_repository.dart';
import '../../../data/providers.dart';

/// Ringkasan yang ditampilkan Beranda: progres kota aktif, nomor temuan
/// berikutnya, misi minggu ini, dan temuan yang baru ditempel.
final class HomeSummary {
  const HomeSummary({
    required this.cityName,
    required this.findingCount,
    required this.findingTarget,
    required this.latestLandmarkSticker,
    required this.mission,
    required this.recent,
  });

  final String cityName;

  /// Angka stempel kota "13/100" (K-028).
  final int findingCount;
  final int findingTarget;

  /// Stiker landmark terbaru di hero; null bila belum ada.
  final RecentSticker? latestLandmarkSticker;
  final MissionSummary mission;

  /// Paling banyak tiga temuan terbaru, terbaru lebih dulu.
  final List<RecentSticker> recent;

  /// Nomor seri temuan berikutnya di kota ini ("No. 014").
  int get nextFindingNumber => findingCount + 1;
}

final class MissionSummary {
  const MissionSummary({
    required this.title,
    required this.highlight,
    required this.progress,
    required this.target,
    required this.daysLeft,
  });

  /// Judul misi, mis. "Potret 5 papan nama".
  final String title;

  /// Kata kunci yang distabilo di dalam [title].
  final String highlight;
  final int progress;
  final int target;
  final int daysLeft;
}

final class RecentSticker {
  const RecentSticker({
    required this.image,
    required this.category,
    required this.description,
    this.rotationDeg = 0,
  });

  /// Gambar cutout temuan.
  final ImageProvider image;
  final CategoryId category;

  /// Teks alternatif untuk pembaca layar.
  final String description;
  final double rotationDeg;

  /// Dari baris temuan. Rotasi kecil tetap per temuan (±4°, K-035).
  factory RecentSticker.fromFinding(
    Finding f, {
    String? landmarkName,
    double? rotationDeg,
  }) {
    final label = CategoryStyle.of(f.category).label;
    final description = landmarkName ?? f.note ?? 'Temuan $label';
    final max = TokenMotion.placementRotationMaxDeg;
    // Dari waktu pembuatan, supaya stabil antarsesi: -1..1.
    final spread = (f.createdAt.millisecondsSinceEpoch ~/ 1000 % 9) / 8 * 2 - 1;
    return RecentSticker(
      image: cutoutImage(f.cutoutUrl),
      category: f.category,
      description: description,
      rotationDeg: rotationDeg ?? (spread * max).roundToDouble(),
    );
  }
}

/// Kota yang sedang ditampilkan Beranda. Bawaan: kota temuan terakhir, atau
/// kota MVP (K-029) bila belum ada temuan.
class ActiveCityNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() async =>
      await ref.read(findingRepositoryProvider).latestCityId() ??
      CatalogRepository.defaultCityId;

  void select(String cityId) => state = AsyncData(cityId);
}

final activeCityIdProvider = AsyncNotifierProvider<ActiveCityNotifier, String>(
  ActiveCityNotifier.new,
);

final findingCountInCityProvider = StreamProvider.autoDispose
    .family<int, String>(
      (ref, cityId) =>
          ref.watch(findingRepositoryProvider).watchCountInCity(cityId),
    );

final recentFindingsInCityProvider = StreamProvider.autoDispose
    .family<List<Finding>, String>(
      (ref, cityId) =>
          ref.watch(findingRepositoryProvider).watchRecentInCity(cityId),
    );

final latestLandmarkFindingProvider = StreamProvider.autoDispose
    .family<Finding?, String>(
      (ref, cityId) => ref
          .watch(findingRepositoryProvider)
          .watchLatestLandmarkInCity(cityId),
    );

/// Misi CONTOH sampai katalog misi ada (kartu Misi mingguan). Angkanya sama
/// dengan mockup V5Beranda.
const placeholderMission = MissionSummary(
  title: 'Potret 5 papan nama',
  highlight: 'papan nama',
  progress: 2,
  target: 5,
  daysLeft: 4,
);

/// Ringkasan Beranda dari katalog dan [FindingRepository]; ikut berubah
/// setiap kali temuan bertambah.
final homeSummaryProvider = FutureProvider.autoDispose<HomeSummary>((
  ref,
) async {
  final cityId = await ref.watch(activeCityIdProvider.future);
  final catalog = await ref.watch(catalogProvider.future);
  final count = await ref.watch(findingCountInCityProvider(cityId).future);
  final recent = await ref.watch(recentFindingsInCityProvider(cityId).future);
  final landmark = await ref.watch(
    latestLandmarkFindingProvider(cityId).future,
  );
  final city = catalog.city(cityId);
  String? landmarkName(String? id) {
    for (final l in catalog.landmarksOf(cityId)) {
      if (l.id == id) return l.name;
    }
    return null;
  }

  return HomeSummary(
    cityName: city?.name ?? cityId,
    findingCount: count,
    findingTarget: city?.findingTarget ?? 100,
    latestLandmarkSticker: landmark == null
        ? null
        : RecentSticker.fromFinding(
            landmark,
            landmarkName: landmarkName(landmark.landmarkId),
            // Stiker hero menembus tepi kliping dengan rotasi +7° (usulan v5).
            rotationDeg: 7,
          ),
    mission: placeholderMission,
    recent: [
      for (final f in recent)
        RecentSticker.fromFinding(f, landmarkName: landmarkName(f.landmarkId)),
    ],
  );
});
