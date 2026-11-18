import 'dart:math' as math;
import 'dart:ui' show FramePhase, FrameTiming;

/// Anggaran satu frame pada target 30 fps (K-016).
const double frameBudgetMs = 1000 / 30;

/// Batas frame tersendat (K-016: tidak boleh ada setelah shader dipanaskan).
const double jankThresholdMs = 50;

/// Batas lolos K-016: persentase frame (UI dan raster) dalam anggaran.
const double k016MinPercentWithinBudget = 95;

/// Satu frame yang tergambar saat `PageCurl` aktif.
class FrameSample {
  const FrameSample({
    required this.frameNumber,
    required this.buildMs,
    required this.rasterMs,
    required this.totalSpanMs,
    required this.vsyncStartUs,
    this.flipIndex = 0,
  });

  factory FrameSample.fromTiming(FrameTiming t, {int flipIndex = 0}) {
    double ms(Duration d) => d.inMicroseconds / 1000;
    return FrameSample(
      frameNumber: t.frameNumber,
      buildMs: ms(t.buildDuration),
      rasterMs: ms(t.rasterDuration),
      totalSpanMs: ms(t.totalSpan),
      vsyncStartUs: t.timestampInMicroseconds(FramePhase.vsyncStart),
      flipIndex: flipIndex,
    );
  }

  final int frameNumber;

  /// Durasi build di thread UI.
  final double buildMs;

  /// Durasi raster di thread raster (sisi CPU; kerja GPU yang tertunda bisa
  /// muncul sebagai raster lambat di frame berikutnya).
  final double rasterMs;

  /// Dari vsync sampai raster selesai.
  final double totalSpanMs;
  final int vsyncStartUs;

  /// Urutan balik halaman (1 = balik pertama sejak buka/reset).
  final int flipIndex;

  double get worstMs => math.max(buildMs, rasterMs);
}

/// p50/p90/p99/maks dengan metode nearest-rank.
class Percentiles {
  const Percentiles({
    required this.p50,
    required this.p90,
    required this.p99,
    required this.max,
  });

  factory Percentiles.of(Iterable<double> values) {
    final sorted = values.toList()..sort();
    if (sorted.isEmpty) {
      return const Percentiles(p50: 0, p90: 0, p99: 0, max: 0);
    }
    return Percentiles(
      p50: percentile(sorted, 50),
      p90: percentile(sorted, 90),
      p99: percentile(sorted, 99),
      max: sorted.last,
    );
  }

  final double p50;
  final double p90;
  final double p99;
  final double max;

  Map<String, double> toJson() => {
        'p50': _r(p50),
        'p90': _r(p90),
        'p99': _r(p99),
        'max': _r(max),
      };
}

/// Persentil nearest-rank dari daftar yang sudah urut naik.
double percentile(List<double> sorted, double p) {
  if (sorted.isEmpty) return 0;
  final rank = (p / 100 * sorted.length).ceil();
  return sorted[(rank - 1).clamp(0, sorted.length - 1)];
}

double _r(double v) => (v * 100).roundToDouble() / 100;

/// Ringkasan frame selama gestur/animasi buka halaman.
class FrameStats {
  const FrameStats({
    required this.count,
    required this.pctBuildWithinBudget,
    required this.pctRasterWithinBudget,
    required this.pctBothWithinBudget,
    required this.build,
    required this.raster,
    required this.totalSpan,
    required this.framesOverJank,
    required this.worst,
    required this.interval,
    required this.intervalsOverJank,
  });

  factory FrameStats.fromSamples(List<FrameSample> samples) {
    final n = samples.length;
    double pct(bool Function(FrameSample) ok) =>
        n == 0 ? 0 : samples.where(ok).length * 100 / n;

    FrameSample? worst;
    for (final s in samples) {
      if (worst == null || s.worstMs > worst.worstMs) worst = s;
    }

    // Interval antar-frame hanya dari nomor frame yang berurutan, supaya jeda
    // antar-gestur tidak ikut terhitung.
    final byNumber = [...samples]
      ..sort((a, b) => a.frameNumber.compareTo(b.frameNumber));
    final intervals = <double>[];
    for (var i = 1; i < byNumber.length; i++) {
      if (byNumber[i].frameNumber == byNumber[i - 1].frameNumber + 1) {
        intervals.add(
          (byNumber[i].vsyncStartUs - byNumber[i - 1].vsyncStartUs) / 1000,
        );
      }
    }

    return FrameStats(
      count: n,
      pctBuildWithinBudget: pct((s) => s.buildMs <= frameBudgetMs),
      pctRasterWithinBudget: pct((s) => s.rasterMs <= frameBudgetMs),
      pctBothWithinBudget: pct(
        (s) => s.buildMs <= frameBudgetMs && s.rasterMs <= frameBudgetMs,
      ),
      build: Percentiles.of(samples.map((s) => s.buildMs)),
      raster: Percentiles.of(samples.map((s) => s.rasterMs)),
      totalSpan: Percentiles.of(samples.map((s) => s.totalSpanMs)),
      framesOverJank: samples.where((s) => s.worstMs > jankThresholdMs).length,
      worst: worst,
      interval: intervals.isEmpty ? null : Percentiles.of(intervals),
      intervalsOverJank: intervals.where((v) => v > jankThresholdMs).length,
    );
  }

  final int count;
  final double pctBuildWithinBudget;
  final double pctRasterWithinBudget;
  final double pctBothWithinBudget;
  final Percentiles build;
  final Percentiles raster;
  final Percentiles totalSpan;

  /// Frame dengan build atau raster > 50 ms.
  final int framesOverJank;
  final FrameSample? worst;

  /// Jarak vsync antar-frame berurutan (mencerminkan fps efektif).
  final Percentiles? interval;
  final int intervalsOverJank;

  /// Kriteria K-016. Pemanasan shader dilakukan sebelum halaman pertama, jadi
  /// semua frame yang terekam ikut dihitung.
  bool get passesK016 =>
      count > 0 &&
      pctBothWithinBudget >= k016MinPercentWithinBudget &&
      framesOverJank == 0;

  Map<String, Object?> toJson() => {
        'frames': count,
        'pctUiWithin33ms': _r(pctBuildWithinBudget),
        'pctRasterWithin33ms': _r(pctRasterWithinBudget),
        'pctBothWithin33ms': _r(pctBothWithinBudget),
        'uiMs': build.toJson(),
        'rasterMs': raster.toJson(),
        'totalSpanMs': totalSpan.toJson(),
        'framesOver50ms': framesOverJank,
        'worstFrame': worst == null
            ? null
            : {
                'uiMs': _r(worst!.buildMs),
                'rasterMs': _r(worst!.rasterMs),
                'flip': worst!.flipIndex,
              },
        'intervalMs': interval?.toJson(),
        'intervalsOver50ms': intervalsOverJank,
        'passesK016': passesK016,
      };
}

/// Ringkasan waktu muat (ms): dari minta gambar sampai gambar siap.
class LoadStats {
  const LoadStats(this.samplesMs);

  final List<double> samplesMs;

  int get count => samplesMs.length;
  Percentiles get percentiles => Percentiles.of(samplesMs);

  Map<String, Object?> toJson() => {
        'count': count,
        ...percentiles.toJson(),
      };
}
