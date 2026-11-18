import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:potret/features/book/state/benchmark_report.dart';
import 'package:potret/features/book/state/frame_stats.dart';
import 'package:potret/features/book/state/renderer_probe.dart';

void main() {
  test('laporan bisa di-encode JSON dan tidak memuat lokasi', () {
    const sample = FrameSample(
      frameNumber: 1,
      buildMs: 5,
      rasterMs: 12,
      totalSpanMs: 20,
      vsyncStartUs: 0,
      flipIndex: 1,
    );
    final stats = FrameStats.fromSamples(const [sample]);
    final report = buildReport(
      all: stats,
      firstFlip: stats,
      flips: 1,
      pageLoad: const LoadStats([40, 60]),
      thumbLoad: const LoadStats([5]),
      turnWaitMs: const [],
      currentRss: 200 * 1024 * 1024,
      maxRss: 250 * 1024 * 1024,
      now: DateTime(2026, 11, 18),
      ctx: ReportContext(
        renderer: 'Shader',
        probe: interpretProbe(
          r: 51,
          g: 255,
          b: 0,
          impellerEnabled: true,
          isIOS: false,
        ),
        assetsJson: const {'prepareMs': 1},
        logicalWidth: 360,
        logicalHeight: 740,
        devicePixelRatio: 2,
        pageCount: 20,
        cachedPages: 5,
        cacheCapacity: 5,
        cacheBytes: 5 * 720 * 1480 * 4,
        cachedThumbs: 20,
        thumbBytes: 20 * 144 * 296 * 4,
        lastAutoTest: null,
      ),
    );
    final text = reportJson(report);
    final decoded = jsonDecode(text) as Map<String, dynamic>;
    Map<String, dynamic> part(String k) => decoded[k] as Map<String, dynamic>;
    expect(part('frames')['passesK016'], isTrue);
    expect(part('memory')['rssMb'], 200);
    expect(part('memory')['pageTextures'], '5/5');
    expect(part('renderer')['backend'], 'Impeller OpenGLES');
    expect(part('screen')['pagePx'], '720x1480');
    for (final banned in ['lat', 'lon', 'latitude', 'longitude', 'gps']) {
      expect(text.toLowerCase().contains('"$banned"'), isFalse);
    }
    final summary = reportSummary(report, stats);
    expect(summary, contains('Impeller OpenGLES'));
    expect(summary, contains('LOLOS'));
  });
}
