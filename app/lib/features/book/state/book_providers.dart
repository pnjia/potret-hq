import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'curl_geometry.dart';
import 'dummy_book.dart';
import 'fake_cutouts.dart';
import 'frame_recorder.dart';
import 'page_turn_sound.dart';
import 'renderer_probe.dart';

/// Buku dummy ±20 halaman (prototipe K-012).
final dummyBookProvider = Provider<DummyBook>((ref) => buildDummyBook());

/// Suara buka halaman; ditimpa dengan [SilentPageTurnSound] di tes.
final pageTurnSoundProvider = Provider.autoDispose<PageTurnSound>((ref) {
  final sound = AudioPlayersPageTurnSound();
  sound.prepare();
  ref.onDispose(sound.dispose);
  return sound;
});

/// Perekam frame untuk layar buku.
final frameRecorderProvider = Provider.autoDispose<FrameRecorder>((ref) {
  final recorder = FrameRecorder()..attach();
  ref.onDispose(recorder.detach);
  return recorder;
});

/// Cara menggambar `PageCurl`.
enum CurlRenderer {
  /// Fragment shader silinder (pendekatan utama).
  shader('Shader'),

  /// Lipatan datar dengan Canvas (pembanding/cadangan, tanpa shader).
  canvas('Kanvas');

  const CurlRenderer(this.label);
  final String label;
}

class CurlRendererNotifier extends Notifier<CurlRenderer> {
  @override
  CurlRenderer build() => CurlRenderer.shader;

  void set(CurlRenderer value) => state = value;
}

final curlRendererProvider =
    NotifierProvider<CurlRendererNotifier, CurlRenderer>(
  CurlRendererNotifier.new,
);

/// Penimpa manual `flipY` untuk diagnosis. Null = pakai hasil probe.
/// Dipakai bila isi halaman yang melengkung terlihat terbalik di perangkat.
class FlipYOverrideNotifier extends Notifier<bool?> {
  @override
  bool? build() => null;

  void set(bool? value) => state = value;
}

final flipYOverrideProvider = NotifierProvider<FlipYOverrideNotifier, bool?>(
  FlipYOverrideNotifier.new,
);

/// Aset yang disiapkan sebelum halaman pertama tampil.
class BookAssets {
  const BookAssets({
    required this.curlProgram,
    required this.probe,
    required this.cutoutPng,
    required this.prepareMs,
    required this.warmupMs,
  });

  final ui.FragmentProgram curlProgram;
  final RendererProbeResult probe;
  final List<Uint8List> cutoutPng;

  /// Lama menyiapkan semuanya (muat shader, probe, cutout palsu, pemanasan).
  final double prepareMs;

  /// Lama pemanasan shader `PageCurl` saja.
  final double warmupMs;

  Map<String, Object?> toJson() => {
        'prepareMs': prepareMs.round(),
        'shaderWarmupMs': warmupMs.round(),
      };
}

/// Precache `FragmentProgram`, probe renderer, buat cutout palsu, lalu
/// panaskan shader `PageCurl` dengan satu gambar offscreen. Semua ini selesai
/// sebelum halaman pertama tampil (K-016).
final bookAssetsProvider = FutureProvider.autoDispose<BookAssets>((ref) async {
  final total = Stopwatch()..start();
  final curl = await ui.FragmentProgram.fromAsset('shaders/page_curl.frag');
  final probeProgram =
      await ui.FragmentProgram.fromAsset('shaders/renderer_probe.frag');
  final probe = await probeRenderer(probeProgram);
  final cutouts = await generateFakeCutouts();
  final warm = Stopwatch()..start();
  await warmUpCurlShader(curl, flipY: probe.flipY);
  warm.stop();
  total.stop();
  return BookAssets(
    curlProgram: curl,
    probe: probe,
    cutoutPng: cutouts,
    prepareMs: total.elapsedMicroseconds / 1000,
    warmupMs: warm.elapsedMicroseconds / 1000,
  );
});

/// Menggambar `PageCurl` sekali ke gambar offscreen supaya pipeline shader
/// sudah dikompilasi driver sebelum gestur pertama.
Future<void> warmUpCurlShader(
  ui.FragmentProgram program, {
  required bool flipY,
}) async {
  const side = 64.0;
  const size = ui.Size(side, side);
  ui.Image solid(ui.Color c) {
    final r = ui.PictureRecorder();
    ui.Canvas(r).drawColor(c, ui.BlendMode.src);
    final p = r.endRecording();
    final img = p.toImageSync(side.toInt(), side.toInt());
    p.dispose();
    return img;
  }

  final front = solid(const ui.Color(0xFFFFFFFF));
  final under = solid(const ui.Color(0xFF888888));
  final shader = program.fragmentShader();
  final geometry = CurlGeometry.fromPose(
    size,
    defaultPose(size, distance: side * 0.8),
  );
  CurlUniforms(shader).set(
    size: size,
    geometry: geometry,
    flipY: flipY,
    paper: const ui.Color(0xFFFBF8F2),
    front: front,
    under: under,
  );
  final recorder = ui.PictureRecorder();
  ui.Canvas(recorder).drawRect(
    ui.Offset.zero & size,
    ui.Paint()..shader = shader,
  );
  final picture = recorder.endRecording();
  final out = await picture.toImage(side.toInt(), side.toInt());
  // Membaca piksel memaksa GPU benar-benar menyelesaikan gambar ini.
  await out.toByteData();
  out.dispose();
  picture.dispose();
  shader.dispose();
  front.dispose();
  under.dispose();
}

/// Uniform `PageCurl` diakses lewat nama (slot), bukan indeks, supaya tidak
/// bergantung pada urutan deklarasi di shaders/page_curl.frag. Slot dibuat
/// sekali per [ui.FragmentShader]; shader dipakai ulang antar-frame.
class CurlUniforms {
  CurlUniforms(this.shader)
      : _size = _vec(shader, 'uSize', 2),
        _axis = _vec(shader, 'uAxis', 2),
        _normal = _vec(shader, 'uNormal', 2),
        _radius = shader.getUniformFloat('uRadius'),
        _flipY = shader.getUniformFloat('uFlipY'),
        _paper = _vec(shader, 'uPaper', 3),
        _front = shader.getImageSampler('uFront'),
        _under = shader.getImageSampler('uUnder');

  final ui.FragmentShader shader;
  final List<ui.UniformFloatSlot> _size;
  final List<ui.UniformFloatSlot> _axis;
  final List<ui.UniformFloatSlot> _normal;
  final ui.UniformFloatSlot _radius;
  final ui.UniformFloatSlot _flipY;
  final List<ui.UniformFloatSlot> _paper;
  final ui.ImageSamplerSlot _front;
  final ui.ImageSamplerSlot _under;

  static List<ui.UniformFloatSlot> _vec(
    ui.FragmentShader s,
    String name,
    int n,
  ) =>
      List.generate(n, (i) => s.getUniformFloat(name, i));

  void set({
    required ui.Size size,
    required CurlGeometry geometry,
    required bool flipY,
    required ui.Color paper,
    required ui.Image front,
    required ui.Image under,
  }) {
    _size[0].set(size.width);
    _size[1].set(size.height);
    _axis[0].set(geometry.axisPoint.dx);
    _axis[1].set(geometry.axisPoint.dy);
    _normal[0].set(geometry.normal.dx);
    _normal[1].set(geometry.normal.dy);
    _radius.set(geometry.radius);
    _flipY.set(flipY ? 1 : 0);
    _paper[0].set(paper.r);
    _paper[1].set(paper.g);
    _paper[2].set(paper.b);
    // `ImageSamplerSlot.set` memakai filter `none` (nearest), yang membuat
    // bagian melengkung bergerigi. Indeks slot dipakai untuk filter bilinear.
    shader
      ..setImageSampler(
        _front.shaderIndex,
        front,
        filterQuality: ui.FilterQuality.low,
      )
      ..setImageSampler(
        _under.shaderIndex,
        under,
        filterQuality: ui.FilterQuality.low,
      );
  }
}
