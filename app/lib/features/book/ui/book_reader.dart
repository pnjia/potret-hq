import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/theme/design_tokens.dart';
import '../state/benchmark_report.dart';
import '../state/book_providers.dart';
import '../state/curl_geometry.dart';
import '../state/dummy_book.dart';
import '../state/frame_recorder.dart';
import '../state/frame_stats.dart';
import '../state/page_cache.dart';
import '../state/page_turn_sound.dart';
import 'page_curl_painter.dart';
import 'page_painter.dart';

/// Jeda antar-balikan di uji otomatis (memberi waktu lazy load bekerja,
/// seperti jeda membaca).
const Duration autoTestPause = Duration(milliseconds: 250);

/// Lebar thumbnail (logical px).
const double thumbWidth = 72;

/// Satu balikan halaman yang sedang berjalan.
class _Turn {
  _Turn({
    required this.forward,
    required this.front,
    required this.under,
    required this.pose,
    required this.startX,
  });

  final bool forward;
  final ui.Image front;
  final ui.Image under;
  CurlPose pose;
  final double startX;
}

/// Pembaca buku dummy dengan `PageCurl`.
class BookReader extends ConsumerStatefulWidget {
  const BookReader({
    super.key,
    required this.assets,
    required this.size,
    required this.pixelRatio,
    required this.onAutoTestDone,
  });

  final BookAssets assets;
  final Size size;
  final double pixelRatio;
  final VoidCallback onAutoTestDone;

  @override
  ConsumerState<BookReader> createState() => BookReaderState();
}

class BookReaderState extends ConsumerState<BookReader>
    with SingleTickerProviderStateMixin {
  late final DummyBook _book;
  late final FrameRecorder _recorder;
  late final PageTurnSound _sound;
  late PageStore<ui.Image> _pages;
  late PageStore<ui.Image> _thumbs;
  late final CurlUniforms _uniforms;
  late final AnimationController _anim;
  late final ValueNotifier<CurlGeometry> _geometry;

  int _current = 0;
  _Turn? _turn;
  double _animFrom = 0;
  double _animTo = 0;
  Curve _animCurve = Curves.easeOut;
  bool _autoRunning = false;
  bool _autoCancel = false;
  bool _flushing = false;
  bool _showThumbs = false;
  String? _lastAutoTest;

  Size get _size => widget.size;
  bool get isAutoRunning => _autoRunning;

  @override
  void initState() {
    super.initState();
    _book = ref.read(dummyBookProvider);
    _recorder = ref.listenManual(frameRecorderProvider, (_, _) {}).read();
    _sound = ref.listenManual(pageTurnSoundProvider, (_, _) {}).read();
    _uniforms = CurlUniforms(widget.assets.curlProgram.fragmentShader());
    _geometry = ValueNotifier(CurlGeometry.flat(_size));
    _anim = AnimationController(vsync: this)..addListener(_onAnimTick);

    _initStores();
  }

  /// Membuat penyimpan halaman dan thumbnail untuk ukuran halaman sekarang.
  void _initStores() {
    _pages = PageStore<ui.Image>(
      pageCount: _book.pageCount,
      load: (i) => renderPageImage(
        book: _book,
        index: i,
        size: _size,
        pixelRatio: widget.pixelRatio,
        cutoutPng: widget.assets.cutoutPng,
      ),
      dispose: (img) => img.dispose(),
      onLoaded: (i, ms) {
        _recorder.pageLoadMs.add(ms);
        if (mounted && i == _current) setState(() {});
      },
    );
    // Thumbnail kecil: semua halaman muat di cache (radius = jumlah halaman).
    _thumbs = PageStore<ui.Image>(
      pageCount: _book.pageCount,
      radius: _book.pageCount,
      load: (i) => renderPageImage(
        book: _book,
        index: i,
        size: _size,
        pixelRatio: thumbWidth * widget.pixelRatio / _size.width,
        cutoutPng: widget.assets.cutoutPng,
      ),
      dispose: (img) => img.dispose(),
      onLoaded: (i, ms) {
        _recorder.thumbLoadMs.add(ms);
        if (mounted) setState(() {});
      },
    );
    _pages.focus(_current);
  }

  @override
  void didUpdateWidget(BookReader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.size != widget.size ||
        oldWidget.pixelRatio != widget.pixelRatio) {
      // Ukuran halaman berubah (rotasi, multi-window): semua tekstur dibuat
      // ulang. Balikan yang sedang berjalan dibatalkan.
      _anim.stop();
      if (_turn != null) _recorder.endFlip();
      _turn = null;
      _geometry.value = CurlGeometry.flat(widget.size);
      _pages.disposeAll();
      _thumbs.disposeAll();
      _initStores();
    }
  }

  @override
  void dispose() {
    _anim.dispose();
    _geometry.dispose();
    _uniforms.shader.dispose();
    _pages.disposeAll();
    _thumbs.disposeAll();
    super.dispose();
  }

  // ---------------------------------------------------------------- balikan

  void _setPose(_Turn t, CurlPose pose) {
    t.pose = pose;
    _geometry.value = CurlGeometry.fromPose(_size, pose);
  }

  double _endFor(CurlPose pose) =>
      CurlGeometry.endDistance(_size, pose.corner, pose.normal);

  void _beginTurn(_Turn t) {
    _turn = t;
    _pages.paused = true;
    _thumbs.paused = true;
    _recorder.beginFlip();
    _sound.play();
    _setPose(t, t.pose);
    setState(() {});
  }

  void _finishTurn({required bool committed}) {
    final t = _turn;
    if (t == null) return;
    if (committed) _current += t.forward ? 1 : -1;
    _turn = null;
    _recorder.endFlip();
    _geometry.value = CurlGeometry.flat(_size);
    _pages
      ..focus(_current)
      ..paused = false;
    _thumbs.paused = false;
    if (mounted) setState(() {});
  }

  void _onAnimTick() {
    final t = _turn;
    if (t == null) return;
    final v = _animCurve.transform(_anim.value);
    _setPose(t, t.pose.withDistance(_animFrom + (_animTo - _animFrom) * v));
  }

  Future<void> _animateDistance(_Turn t, double target, Curve curve) async {
    final end = _endFor(t.pose);
    _animFrom = t.pose.distance;
    _animTo = target;
    _animCurve = curve;
    final frac = ((target - _animFrom).abs() / end).clamp(0.0, 1.0);
    final ms = (pageCurlDuration.inMilliseconds * frac).round();
    _anim.duration = Duration(milliseconds: ms < 80 ? 80 : ms);
    await _anim.forward(from: 0).orCancel.catchError((_) {});
  }

  /// Gambar halaman untuk balikan; null bila belum dimuat.
  (ui.Image, ui.Image)? _imagesFor({required bool forward}) {
    final frontIdx = forward ? _current : _current - 1;
    final underIdx = forward ? _current + 1 : _current;
    if (frontIdx < 0 || underIdx >= _book.pageCount) return null;
    final f = _pages.peek(frontIdx);
    final u = _pages.peek(underIdx);
    if (f == null || u == null) {
      final sw = Stopwatch()..start();
      unawaited(
        Future.wait([_pages.obtain(frontIdx), _pages.obtain(underIdx)])
            .then((_) => _recorder.turnWaitMs.add(sw.elapsedMicroseconds / 1000))
            .catchError((Object _) {}),
      );
      return null;
    }
    return (f, u);
  }

  void _onPanStart(DragStartDetails d) {
    if (_turn != null || _autoRunning || _flushing) return;
    final forward = d.localPosition.dx > _size.width * 0.5;
    final images = _imagesFor(forward: forward);
    if (images == null) return;
    CurlPose pose;
    if (forward) {
      final corner = Offset(
        _size.width,
        d.localPosition.dy.clamp(_size.height * 0.1, _size.height * 0.95),
      );
      pose = CurlPose.fromTouch(corner, d.localPosition);
    } else {
      final base = defaultPose(_size);
      pose = base.withDistance(_endFor(base));
    }
    _beginTurn(
      _Turn(
        forward: forward,
        front: images.$1,
        under: images.$2,
        pose: pose,
        startX: d.localPosition.dx,
      ),
    );
  }

  void _onPanUpdate(DragUpdateDetails d) {
    final t = _turn;
    if (t == null || _anim.isAnimating || _autoRunning) return;
    if (t.forward) {
      _setPose(t, CurlPose.fromTouch(t.pose.corner, d.localPosition));
    } else {
      final dx = d.localPosition.dx - t.startX;
      final p = (1 - dx / (_size.width * 0.9)).clamp(0.0, 1.0);
      _setPose(t, t.pose.withDistance(_endFor(t.pose) * p));
    }
  }

  Future<void> _onPanEnd(DragEndDetails d) async {
    final t = _turn;
    if (t == null || _anim.isAnimating || _autoRunning) return;
    final end = _endFor(t.pose);
    final progress = t.pose.distance / end;
    final vx = d.velocity.pixelsPerSecond.dx;
    final bool commit;
    if (t.forward) {
      commit = vx < -400 || (progress > 0.25 && vx <= 400);
    } else {
      commit = vx > 400 || (progress < 0.75 && vx >= -400);
    }
    final target = (t.forward == commit) ? end : 0.0;
    await _animateDistance(t, target, Curves.easeOut);
    _finishTurn(committed: commit);
  }

  // ------------------------------------------------------------ uji otomatis

  /// Membalik semua halaman maju lalu mundur dengan kecepatan tetap
  /// ([pageCurlDuration] per balikan, jeda [autoTestPause]).
  Future<void> runAutoTest() async {
    if (_turn != null || _flushing) return;
    if (_autoRunning) {
      _autoCancel = true;
      return;
    }
    setState(() {
      _autoRunning = true;
      _autoCancel = false;
      _showThumbs = false;
    });
    _recorder.reset();
    _jumpTo(0);
    try {
      await Future.wait([_pages.obtain(0), _pages.obtain(1)]);
    } on StateError {
      _autoCancel = true;
    }
    final n = _book.pageCount - 1;
    var done = 0;
    try {
      for (var i = 0; i < n && !_autoCancel && mounted; i++, done++) {
        await _autoFlip(forward: true);
      }
      for (var i = 0; i < n && !_autoCancel && mounted; i++, done++) {
        await _autoFlip(forward: false);
      }
    } on StateError {
      // Ukuran layar berubah di tengah uji: penyimpan halaman dibuat ulang.
      _autoCancel = true;
    }
    if (!mounted) return;
    _lastAutoTest = '$done balikan ($n maju + $n mundur rencana), '
        '${pageCurlDuration.inMilliseconds} ms per balikan, jeda '
        '${autoTestPause.inMilliseconds} ms${_autoCancel ? ', DIHENTIKAN' : ''}';
    await flushTimings();
    if (!mounted) return;
    setState(() => _autoRunning = false);
    widget.onAutoTestDone();
  }

  Future<void> _autoFlip({required bool forward}) async {
    final frontIdx = forward ? _current : _current - 1;
    final underIdx = forward ? _current + 1 : _current;
    final sw = Stopwatch()..start();
    final front = await _pages.obtain(frontIdx);
    final under = await _pages.obtain(underIdx);
    if (sw.elapsedMicroseconds > 1000) {
      _recorder.turnWaitMs.add(sw.elapsedMicroseconds / 1000);
    }
    if (!mounted) return;
    final base = defaultPose(_size);
    final end = _endFor(base);
    final t = _Turn(
      forward: forward,
      front: front,
      under: under,
      pose: base.withDistance(forward ? 0 : end),
      startX: 0,
    );
    _beginTurn(t);
    await _animateDistance(t, forward ? end : 0, Curves.easeInOut);
    _finishTurn(committed: true);
    await Future<void>.delayed(autoTestPause);
  }

  /// Menunggu `FrameTiming` terakhir dikirim engine. Engine mengirimnya
  /// berkelompok dan hanya saat ada frame baru, jadi indikator progres
  /// ditampilkan sebentar untuk memicu frame.
  Future<void> flushTimings() async {
    setState(() => _flushing = true);
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (mounted) setState(() => _flushing = false);
  }

  void _jumpTo(int index) {
    if (_turn != null) return;
    setState(() => _current = index);
    _pages.focus(index);
  }

  void toggleThumbnails() => setState(() => _showThumbs = !_showThumbs);

  // ----------------------------------------------------------------- laporan

  Map<String, Object?> buildCurrentReport() {
    var pageBytes = 0;
    for (final i in _pages.cachedIndices) {
      final img = _pages.peek(i)!;
      pageBytes += img.width * img.height * 4;
    }
    var thumbBytes = 0;
    for (final i in _thumbs.cachedIndices) {
      final img = _thumbs.peek(i)!;
      thumbBytes += img.width * img.height * 4;
    }
    return buildReport(
      all: _recorder.stats,
      firstFlip: _recorder.firstFlipStats,
      flips: _recorder.flipCount,
      pageLoad: LoadStats(_recorder.pageLoadMs),
      thumbLoad: LoadStats(_recorder.thumbLoadMs),
      turnWaitMs: _recorder.turnWaitMs,
      ctx: ReportContext(
        renderer: ref.read(curlRendererProvider).label,
        flipYOverride: ref.read(flipYOverrideProvider),
        probe: widget.assets.probe,
        assetsJson: widget.assets.toJson(),
        logicalWidth: _size.width,
        logicalHeight: _size.height,
        devicePixelRatio: widget.pixelRatio,
        pageCount: _book.pageCount,
        cachedPages: _pages.cachedCount,
        cacheCapacity: _pages.capacity,
        cacheBytes: pageBytes,
        cachedThumbs: _thumbs.cachedCount,
        thumbBytes: thumbBytes,
        lastAutoTest: _lastAutoTest,
      ),
    );
  }

  FrameStats get currentStats => _recorder.stats;

  void resetStats() {
    _recorder.reset();
    _lastAutoTest = null;
    setState(() {});
  }

  // ------------------------------------------------------------------ build

  @override
  Widget build(BuildContext context) {
    final renderer = ref.watch(curlRendererProvider);
    final flipY = ref.watch(flipYOverrideProvider) ?? widget.assets.probe.flipY;
    final t = _turn;
    final front = t?.front ?? _pages.peek(_current);
    final probe = widget.assets.probe;
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: RepaintBoundary(
              child: CustomPaint(
                size: _size,
                painter: PageCurlPainter(
                  geometry: _geometry,
                  front: front,
                  under: t?.under,
                  renderer: renderer,
                  uniforms: _uniforms,
                  flipY: flipY,
                  onCurlFrame: _recorder.markFrame,
                ),
              ),
            ),
          ),
        ),
        if (front == null)
          const Center(child: CircularProgressIndicator()),
        Positioned(
          left: 8,
          top: 4,
          child: IgnorePointer(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: TokenColors.inkPrimary.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(TokenRadius.card),
              ),
              child: Text(
                '${probe.backend.label} · ${renderer.label}'
                '${flipY != probe.flipY ? ' · flipY manual' : ''} · '
                'hal ${_current + 1}/${_book.pageCount} · '
                '${_recorder.flipCount} balikan'
                '${_autoRunning ? ' · UJI OTOMATIS' : ''}',
                style: textTheme.labelSmall?.copyWith(
                  color: TokenColors.paperRaised,
                ),
              ),
            ),
          ),
        ),
        if (_flushing)
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: LinearProgressIndicator(),
          ),
        if (_showThumbs)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: thumbWidth * _size.height / _size.width + 24,
            child: _ThumbnailStrip(
              store: _thumbs,
              count: _book.pageCount,
              current: _current,
              onTap: (i) {
                _jumpTo(i);
                setState(() => _showThumbs = false);
              },
            ),
          ),
      ],
    );
  }
}

/// Strip thumbnail: dimuat malas saat item dibangun (ListView.builder).
class _ThumbnailStrip extends StatelessWidget {
  const _ThumbnailStrip({
    required this.store,
    required this.count,
    required this.current,
    required this.onTap,
  });

  final PageStore<ui.Image> store;
  final int count;
  final int current;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: TokenColors.inkPrimary.withValues(alpha: 0.85),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: count,
        itemBuilder: (context, i) {
          final img = store.peek(i);
          if (img == null) unawaited(store.obtain(i));
          return GestureDetector(
            onTap: () => onTap(i),
            child: Container(
              width: thumbWidth,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: TokenColors.paperBase,
                border: Border.all(
                  color: i == current
                      ? TokenColors.accentPrimary
                      : TokenColors.paperLine,
                  width: 2,
                ),
              ),
              child: img == null
                  ? Center(
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(color: TokenColors.inkSecondary),
                      ),
                    )
                  : CustomPaint(painter: StaticImagePainter(img)),
            ),
          );
        },
      ),
    );
  }
}
