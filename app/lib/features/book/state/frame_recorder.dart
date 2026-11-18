import 'dart:ui' as ui;

import 'package:flutter/scheduler.dart';

import 'frame_stats.dart';

/// Merekam `FrameTiming` hanya untuk frame yang menggambar `PageCurl`.
///
/// Cara kerja: setiap kali `PageCurl` digambar, [markFrame] mencatat nomor
/// frame (`PlatformDispatcher.frameData.frameNumber`) dan cap waktu mulai
/// build (`SchedulerBinding.currentSystemFrameTimeStamp`, sama persis dengan
/// `FramePhase.buildStart` menurut dokumentasi `FrameTiming.buildDuration`).
/// Engine mengirim `FrameTiming` secara berkelompok beberapa saat kemudian;
/// yang cocok dengan salah satu penanda disimpan sebagai [FrameSample].
class FrameRecorder {
  FrameRecorder({this.binding});

  /// Null = `SchedulerBinding.instance`.
  final SchedulerBinding? binding;
  SchedulerBinding get _binding => binding ?? SchedulerBinding.instance;
  bool _attached = false;

  final Map<int, int> _markedByNumber = {};
  final Map<int, int> _markedByBuildStart = {};
  final List<FrameSample> samples = [];
  final List<double> pageLoadMs = [];
  final List<double> thumbLoadMs = [];

  /// Waktu gestur/animasi harus menunggu gambar halaman (ms per kejadian).
  final List<double> turnWaitMs = [];

  int _flipIndex = 0;
  bool _active = false;

  int get flipCount => _flipIndex;
  bool get isActive => _active;

  void attach() {
    if (_attached) return;
    _binding.addTimingsCallback(onTimings);
    _attached = true;
  }

  void detach() {
    if (!_attached) return;
    _binding.removeTimingsCallback(onTimings);
    _attached = false;
  }

  /// Mulai satu balikan halaman (gestur atau animasi).
  void beginFlip() {
    _flipIndex++;
    _active = true;
  }

  void endFlip() => _active = false;

  /// Dipanggil dari `paint()` `PageCurl`, yaitu di dalam frame yang sedang
  /// dibangun.
  void markFrame() {
    if (!_active) return;
    final number = ui.PlatformDispatcher.instance.frameData.frameNumber;
    if (number >= 0) _markedByNumber[number] = _flipIndex;
    final ts = _binding.currentSystemFrameTimeStamp.inMicroseconds;
    _markedByBuildStart[ts] = _flipIndex;
  }

  /// Tandai frame secara langsung (dipakai tes).
  void markForTest({int? frameNumber, int? buildStartUs}) {
    if (frameNumber != null) _markedByNumber[frameNumber] = _flipIndex;
    if (buildStartUs != null) _markedByBuildStart[buildStartUs] = _flipIndex;
  }

  void onTimings(List<ui.FrameTiming> timings) {
    for (final t in timings) {
      final byTs = _markedByBuildStart
          .remove(t.timestampInMicroseconds(ui.FramePhase.buildStart));
      final byNo = t.frameNumber >= 0 ? _markedByNumber.remove(t.frameNumber) : null;
      final flip = byNo ?? byTs;
      if (flip != null) samples.add(FrameSample.fromTiming(t, flipIndex: flip));
    }
  }

  /// Jumlah frame yang sudah ditandai tetapi `FrameTiming`-nya belum datang.
  int get pendingMarks => _markedByNumber.length;

  FrameStats get stats => FrameStats.fromSamples(samples);

  /// Statistik balikan pertama saja (petunjuk apakah pemanasan shader cukup).
  FrameStats get firstFlipStats =>
      FrameStats.fromSamples(samples.where((s) => s.flipIndex == 1).toList());

  void reset() {
    samples.clear();
    pageLoadMs.clear();
    thumbLoadMs.clear();
    turnWaitMs.clear();
    _markedByNumber.clear();
    _markedByBuildStart.clear();
    _flipIndex = 0;
    _active = false;
  }
}
