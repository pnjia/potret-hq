import 'package:flutter_test/flutter_test.dart';
import 'package:potret/features/book/state/renderer_probe.dart';

void main() {
  RendererProbeResult probe(int r, int g, int b, {bool ios = false}) =>
      interpretProbe(r: r, g: g, b: b, impellerEnabled: r < 230, isIOS: ios);

  test('penanda kanal merah dipetakan ke backend', () {
    expect(probe(51, 255, 0).backend, RendererBackend.impellerOpenGles);
    expect(probe(153, 255, 0).backend, RendererBackend.impellerVulkan);
    expect(probe(153, 255, 0, ios: true).backend, RendererBackend.impellerMetal);
    expect(probe(255, 255, 0).backend, RendererBackend.skia);
    expect(probe(0, 0, 0).backend, RendererBackend.unknown);
  });

  test('flipY bila tekstur atas (merah) terbaca sebagai biru', () {
    expect(probe(51, 255, 0).flipY, isFalse);
    expect(probe(51, 0, 255).flipY, isTrue);
  });
}
