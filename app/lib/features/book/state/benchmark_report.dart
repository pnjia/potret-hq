import 'dart:convert';
import 'dart:io' show Platform, ProcessInfo;

import 'package:flutter/foundation.dart';

import 'frame_stats.dart';
import 'renderer_probe.dart';

/// Info layar dan cache saat laporan dibuat.
class ReportContext {
  const ReportContext({
    required this.renderer,
    this.flipYOverride,
    required this.probe,
    required this.assetsJson,
    required this.logicalWidth,
    required this.logicalHeight,
    required this.devicePixelRatio,
    required this.pageCount,
    required this.cachedPages,
    required this.cacheCapacity,
    required this.cacheBytes,
    required this.cachedThumbs,
    required this.thumbBytes,
    required this.lastAutoTest,
  });

  final String renderer;

  /// Penimpa manual flipY (null = hasil probe dipakai).
  final bool? flipYOverride;
  final RendererProbeResult probe;
  final Map<String, Object?> assetsJson;
  final double logicalWidth;
  final double logicalHeight;
  final double devicePixelRatio;
  final int pageCount;
  final int cachedPages;
  final int cacheCapacity;
  final int cacheBytes;
  final int cachedThumbs;
  final int thumbBytes;

  /// Deskripsi uji otomatis terakhir, atau null bila hanya gestur manual.
  final String? lastAutoTest;
}

String get buildModeName =>
    kProfileMode ? 'profile' : (kReleaseMode ? 'release' : 'debug');

double _mb(int bytes) => (bytes / 1024 / 1024 * 10).roundToDouble() / 10;

/// Laporan lengkap sebagai Map siap-JSON. Tidak memuat lokasi apa pun.
Map<String, Object?> buildReport({
  required FrameStats all,
  required FrameStats firstFlip,
  required int flips,
  required LoadStats pageLoad,
  required LoadStats thumbLoad,
  required List<double> turnWaitMs,
  required ReportContext ctx,
  DateTime? now,
  int? currentRss,
  int? maxRss,
}) {
  int? rss;
  int? peak;
  try {
    rss = currentRss ?? ProcessInfo.currentRss;
    peak = maxRss ?? ProcessInfo.maxRss;
  } catch (_) {
    // Tidak tersedia di semua platform.
  }
  return {
    'app': 'potret prototipe K-012',
    'createdAt': (now ?? DateTime.now()).toIso8601String(),
    'buildMode': buildModeName,
    'os': '${Platform.operatingSystem} ${Platform.operatingSystemVersion}',
    'renderer': ctx.probe.toJson(),
    'curlRenderer': ctx.renderer,
    'flipYOverride': ctx.flipYOverride,
    'screen': {
      'logical': '${ctx.logicalWidth.round()}x${ctx.logicalHeight.round()}',
      'dpr': ctx.devicePixelRatio,
      'pagePx':
          '${(ctx.logicalWidth * ctx.devicePixelRatio).round()}x${(ctx.logicalHeight * ctx.devicePixelRatio).round()}',
    },
    'autoTest': ctx.lastAutoTest,
    'flips': flips,
    'frames': all.toJson(),
    'firstFlip': firstFlip.toJson(),
    'pageLoadMs': pageLoad.toJson(),
    'thumbLoadMs': thumbLoad.toJson(),
    'turnWaits': {
      'count': turnWaitMs.length,
      ...Percentiles.of(turnWaitMs).toJson(),
    },
    'startup': ctx.assetsJson,
    'memory': {
      'rssMb': rss == null ? null : _mb(rss),
      'maxRssMb': peak == null ? null : _mb(peak),
      'pageTextures': '${ctx.cachedPages}/${ctx.cacheCapacity}',
      'pageTexturesMb': _mb(ctx.cacheBytes),
      'thumbs': ctx.cachedThumbs,
      'thumbsMb': _mb(ctx.thumbBytes),
    },
  };
}

String reportJson(Map<String, Object?> report) =>
    const JsonEncoder.withIndent(' ').convert(report);

String _f(double v) => v.toStringAsFixed(1);

/// Ringkasan teks berbahasa Indonesia untuk layar hasil.
String reportSummary(Map<String, Object?> r, FrameStats all) {
  final renderer = r['renderer']! as Map<String, Object?>;
  final mem = r['memory']! as Map<String, Object?>;
  final load = r['pageLoadMs']! as Map<String, Object?>;
  final b = StringBuffer()
    ..writeln('Mode build: ${r['buildMode']}')
    ..writeln(
      'Renderer: ${renderer['backend']} (flipY ${renderer['flipY']}) · '
      'PageCurl: ${r['curlRenderer']}',
    )
    ..writeln('Balik halaman: ${r['flips']} · frame terekam: ${all.count}')
    ..writeln(
      'Frame ≤33,3 ms: UI ${_f(all.pctBuildWithinBudget)}% · '
      'raster ${_f(all.pctRasterWithinBudget)}% · '
      'keduanya ${_f(all.pctBothWithinBudget)}%',
    )
    ..writeln(
      'UI ms p50/p90/p99/maks: ${_f(all.build.p50)}/${_f(all.build.p90)}/'
      '${_f(all.build.p99)}/${_f(all.build.max)}',
    )
    ..writeln(
      'Raster ms p50/p90/p99/maks: ${_f(all.raster.p50)}/${_f(all.raster.p90)}/'
      '${_f(all.raster.p99)}/${_f(all.raster.max)}',
    )
    ..writeln('Frame >50 ms: ${all.framesOverJank}');
  final iv = all.interval;
  if (iv != null) {
    b.writeln(
      'Jarak antar-frame ms p50/p90/maks: ${_f(iv.p50)}/${_f(iv.p90)}/'
      '${_f(iv.max)} (>50 ms: ${all.intervalsOverJank})',
    );
  }
  b
    ..writeln(
      'Muat halaman ms p50/p90/maks: ${load['p50']}/${load['p90']}/'
      '${load['max']} (n=${load['count']})',
    )
    ..writeln(
      'Memori RSS: ${mem['rssMb']} MB (puncak ${mem['maxRssMb']} MB) · '
      'tekstur halaman ${mem['pageTextures']} = ${mem['pageTexturesMb']} MB',
    )
    ..write(
      all.count == 0
          ? 'Belum ada data frame.'
          : (all.passesK016
              ? 'Target K-016: LOLOS (bila mode build = profile)'
              : 'Target K-016: BELUM LOLOS'),
    );
  return b.toString();
}
