import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/category_style.dart';

/// Ringkasan yang ditampilkan Beranda: progres kota aktif, nomor temuan
/// berikutnya, misi minggu ini, dan temuan yang baru ditempel.
final class HomeSummary {
  const HomeSummary({
    required this.cityName,
    required this.findingCount,
    required this.findingTarget,
    required this.latestSticker,
    required this.mission,
    required this.recent,
  });

  final String cityName;

  /// Angka stempel kota "13/100" (K-028).
  final int findingCount;
  final int findingTarget;

  /// Stiker temuan terbaru di hero (dekoratif).
  final RecentSticker latestSticker;
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
    required this.asset,
    required this.category,
    required this.description,
    this.rotationDeg = 0,
  });

  /// Gambar cutout (sementara: aset contoh).
  final String asset;
  final CategoryId category;

  /// Teks alternatif untuk pembaca layar.
  final String description;
  final double rotationDeg;
}

/// Data CONTOH sampai `FindingRepository` dan katalog misi ada (kartu skema
/// Supabase dan kartu misi). Angkanya sama dengan mockup V5Beranda.
const demoHomeSummary = HomeSummary(
  cityName: 'Sukabumi',
  findingCount: 13,
  findingTarget: 100,
  latestSticker: RecentSticker(
    asset: 'assets/demo/church.png',
    category: CategoryId.building,
    description: 'Gereja bermenara, temuan terbaru',
    rotationDeg: 7,
  ),
  mission: MissionSummary(
    title: 'Potret 5 papan nama',
    highlight: 'papan nama',
    progress: 2,
    target: 5,
    daysLeft: 4,
  ),
  recent: [
    RecentSticker(
      asset: 'assets/demo/mochi.png',
      category: CategoryId.food,
      description: 'Mochi dalam keranjang bambu',
      rotationDeg: -3,
    ),
    RecentSticker(
      asset: 'assets/demo/angkot.png',
      category: CategoryId.vehicle,
      description: 'Angkot hijau',
      rotationDeg: 2,
    ),
    RecentSticker(
      asset: 'assets/demo/warung-sign.png',
      category: CategoryId.sign,
      description: 'Papan nama Warung Kopi',
      rotationDeg: -4,
    ),
  ],
);

/// Ringkasan Beranda. Sementara mengembalikan [demoHomeSummary].
final homeSummaryProvider = Provider<HomeSummary>((ref) => demoHomeSummary);
