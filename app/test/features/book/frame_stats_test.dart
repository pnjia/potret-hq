import 'dart:ui' show FramePhase, FrameTiming;

import 'package:flutter_test/flutter_test.dart';
import 'package:potret/features/book/state/frame_recorder.dart';
import 'package:potret/features/book/state/frame_stats.dart';

/// FrameTiming sintetis: vsync tiap 33,3 ms, durasi build/raster dalam ms.
FrameTiming timing(int n, double buildMs, double rasterMs, {int? vsyncUs}) {
  final vsync = vsyncUs ?? 1000000 + n * 33333;
  final buildStart = vsync + 500;
  final buildEnd = buildStart + (buildMs * 1000).round();
  final rasterStart = buildEnd + 200;
  final rasterEnd = rasterStart + (rasterMs * 1000).round();
  return FrameTiming(
    vsyncStart: vsync,
    buildStart: buildStart,
    buildFinish: buildEnd,
    rasterStart: rasterStart,
    rasterFinish: rasterEnd,
    rasterFinishWallTime: rasterEnd,
    frameNumber: n,
  );
}

void main() {
  test('percentile nearest-rank', () {
    final v = List<double>.generate(100, (i) => i + 1.0);
    expect(percentile(v, 50), 50);
    expect(percentile(v, 90), 90);
    expect(percentile(v, 99), 99);
    expect(percentile([5], 99), 5);
    expect(percentile([], 50), 0);
  });

  test('statistik dari FrameTiming sintetis', () {
    // 20 frame: 18 normal, 1 raster 40 ms, 1 build 60 ms.
    final samples = <FrameSample>[
      for (var i = 0; i < 18; i++) FrameSample.fromTiming(timing(i, 10, 20)),
      FrameSample.fromTiming(timing(18, 10, 40)),
      FrameSample.fromTiming(timing(19, 60, 20)),
    ];
    final s = FrameStats.fromSamples(samples);
    expect(s.count, 20);
    expect(s.pctBuildWithinBudget, 95);
    expect(s.pctRasterWithinBudget, 95);
    expect(s.pctBothWithinBudget, 90);
    expect(s.framesOverJank, 1);
    expect(s.worst!.frameNumber, 19);
    expect(s.build.p50, 10);
    expect(s.build.max, 60);
    expect(s.raster.p90, 20);
    expect(s.raster.max, 40);
    expect(s.interval!.p50, closeTo(33.333, 0.001));
    expect(s.passesK016, isFalse);
  });

  test('lolos K-016 bila >=95% dalam anggaran dan tidak ada >50 ms', () {
    final samples = <FrameSample>[
      for (var i = 0; i < 19; i++) FrameSample.fromTiming(timing(i, 8, 25)),
      FrameSample.fromTiming(timing(19, 8, 45)),
    ];
    final s = FrameStats.fromSamples(samples);
    expect(s.pctBothWithinBudget, 95);
    expect(s.framesOverJank, 0);
    expect(s.passesK016, isTrue);
  });

  test('interval hanya dari nomor frame berurutan', () {
    final samples = [
      FrameSample.fromTiming(timing(1, 5, 5)),
      FrameSample.fromTiming(timing(2, 5, 5)),
      // Jeda panjang antar-gestur: nomor frame melompat, tidak dihitung.
      FrameSample.fromTiming(timing(50, 5, 5)),
      FrameSample.fromTiming(timing(51, 5, 5, vsyncUs: 1000000 + 50 * 33333 + 60000)),
    ];
    final s = FrameStats.fromSamples(samples);
    expect(s.interval!.p50, closeTo(33.333, 0.001));
    expect(s.interval!.max, closeTo(60, 0.001));
    expect(s.intervalsOverJank, 1);
  });

  test('tanpa data: tidak lolos dan tidak error', () {
    final s = FrameStats.fromSamples(const []);
    expect(s.count, 0);
    expect(s.passesK016, isFalse);
    expect(s.interval, isNull);
    expect(s.toJson()['frames'], 0);
  });

  test('perekam hanya menyimpan frame yang ditandai saat PageCurl aktif', () {
    final r = FrameRecorder()
      ..beginFlip()
      ..markForTest(frameNumber: 10)
      ..markForTest(frameNumber: 11);
    final ts11 = timing(11, 4, 4);
    r
      ..endFlip()
      ..beginFlip()
      // Cocok lewat cap waktu buildStart (cadangan bila nomor frame -1).
      ..markForTest(
        buildStartUs:
            timing(12, 1, 1).timestampInMicroseconds(FramePhase.buildStart),
      );
    r.onTimings([timing(9, 1, 1), timing(10, 3, 3), ts11, timing(12, 1, 1)]);
    expect(r.samples.map((s) => s.frameNumber), [10, 11, 12]);
    expect(r.samples.map((s) => s.flipIndex), [1, 1, 2]);
    expect(r.firstFlipStats.count, 2);
    expect(r.pendingMarks, 0);
    r.reset();
    expect(r.samples, isEmpty);
    expect(r.flipCount, 0);
  });
}
