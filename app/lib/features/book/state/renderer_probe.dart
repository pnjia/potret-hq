import 'dart:io' show Platform;
import 'dart:typed_data';
import 'dart:ui' as ui;

/// Backend renderer yang benar-benar dipakai engine di perangkat ini.
enum RendererBackend {
  impellerOpenGles('Impeller OpenGLES'),
  impellerVulkan('Impeller Vulkan'),
  impellerMetal('Impeller Metal'),
  skia('Skia'),
  unknown('tidak diketahui');

  const RendererBackend(this.label);
  final String label;
}

/// Hasil probe renderer, diambil sekali saat buku dibuka.
class RendererProbeResult {
  const RendererProbeResult({
    required this.backend,
    required this.impellerEnabled,
    required this.flipY,
    required this.rawRgb,
  });

  final RendererBackend backend;

  /// `ui.ImageFilter.isShaderFilterSupported`: true bila Impeller aktif.
  final bool impellerEnabled;

  /// True bila tekstur dari `Picture.toImage` terbaca terbalik di shader.
  final bool flipY;

  /// Piksel mentah hasil probe (untuk diagnosis di laporan).
  final List<int> rawRgb;

  Map<String, Object?> toJson() => {
        'backend': backend.label,
        'impellerEnabled': impellerEnabled,
        'flipY': flipY,
        'probeRgb': rawRgb,
      };
}

/// Mengartikan piksel probe (lihat shaders/renderer_probe.frag).
RendererProbeResult interpretProbe({
  required int r,
  required int g,
  required int b,
  required bool impellerEnabled,
  required bool isIOS,
}) {
  RendererBackend backend;
  if (r >= 230) {
    backend = RendererBackend.skia;
  } else if (r >= 25 && r <= 80) {
    backend = RendererBackend.impellerOpenGles;
  } else if (r >= 128 && r <= 178) {
    backend =
        isIOS ? RendererBackend.impellerMetal : RendererBackend.impellerVulkan;
  } else {
    backend = RendererBackend.unknown;
  }
  return RendererProbeResult(
    backend: backend,
    impellerEnabled: impellerEnabled,
    flipY: b > g,
    rawRgb: [r, g, b],
  );
}

/// Menggambar shader probe ke gambar 1x1 lalu membaca pikselnya.
///
/// Tekstur uji dibuat lewat `Picture.toImage`, jalur yang sama dengan gambar
/// halaman, sehingga hasil `flipY` berlaku untuk `PageCurl`.
Future<RendererProbeResult> probeRenderer(ui.FragmentProgram program) async {
  final texRecorder = ui.PictureRecorder();
  ui.Canvas(texRecorder)
    ..drawRect(
      const ui.Rect.fromLTWH(0, 0, 4, 2),
      ui.Paint()..color = const ui.Color(0xFFFF0000),
    )
    ..drawRect(
      const ui.Rect.fromLTWH(0, 2, 4, 2),
      ui.Paint()..color = const ui.Color(0xFF0000FF),
    );
  final texPicture = texRecorder.endRecording();
  final tex = await texPicture.toImage(4, 4);
  texPicture.dispose();

  final shader = program.fragmentShader()
    ..setFloat(0, 1)
    ..setFloat(1, 1)
    ..setImageSampler(0, tex);
  final recorder = ui.PictureRecorder();
  ui.Canvas(recorder).drawRect(
    const ui.Rect.fromLTWH(0, 0, 1, 1),
    ui.Paint()..shader = shader,
  );
  final picture = recorder.endRecording();
  final out = await picture.toImage(1, 1);
  final bytes = await out.toByteData();
  picture.dispose();
  out.dispose();
  tex.dispose();
  shader.dispose();

  final data = bytes ?? ByteData(4);
  return interpretProbe(
    r: data.getUint8(0),
    g: data.getUint8(1),
    b: data.getUint8(2),
    impellerEnabled: ui.ImageFilter.isShaderFilterSupported,
    isIOS: Platform.isIOS,
  );
}
