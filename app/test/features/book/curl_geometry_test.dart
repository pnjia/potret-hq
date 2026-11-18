import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:potret/features/book/state/curl_geometry.dart';

void main() {
  const size = Size(360, 740);
  final corners = [
    Offset.zero,
    const Offset(360, 0),
    const Offset(0, 740),
    const Offset(360, 740),
  ];

  test('sudut halaman yang ditarik berada tepat di bawah jari', () {
    const corner = Offset(360, 600);
    const touch = Offset(200, 560);
    final pose = CurlPose.fromTouch(corner, touch);
    final g = CurlGeometry.fromPose(size, pose);
    final r = g.radius;
    // Sudut ada di jarak u = (D + piR)/2 dari sumbu, lalu rebah di
    // d = piR - u. Titik layar itu harus sama dengan posisi jari.
    final u = g.signedDistance(corner);
    expect(u, closeTo((pose.distance + math.pi * r) / 2, 1e-6));
    final screen = g.axisPoint + g.normal * (math.pi * r - u);
    expect((screen - touch).distance, lessThan(1e-6));
  });

  test('arah lengkungan tidak pernah berbalik ke kiri', () {
    final pose = CurlPose.fromTouch(const Offset(360, 400), const Offset(350, 50));
    expect(pose.normal.dx, greaterThanOrEqualTo(CurlPose.minNormalX - 1e-9));
    expect(pose.normal.distance, closeTo(1, 1e-9));
  });

  test('halaman datar: tidak ada titik halaman yang tergulung', () {
    final g = CurlGeometry.flat(size);
    for (final k in corners) {
      final d = g.signedDistance(k);
      expect(d, lessThan(0));
      // Lipatan pantulan (punggung) jatuh di luar halaman.
      final qb = k + g.normal * (math.pi * g.radius - 2 * d);
      expect(qb.dx > size.width || qb.dy > size.height, isTrue);
    }
    expect(g.progress, 0);
  });

  test('pada jarak akhir halaman sudah terbalik penuh', () {
    final pose = defaultPose(size);
    final end = CurlGeometry.endDistance(size, pose.corner, pose.normal);
    final g = CurlGeometry.fromPose(size, pose.withDistance(end));
    expect(g.progress, 1);
    for (final k in corners) {
      // Semua titik layar berada di luar silinder: hanya halaman bawah.
      expect(g.signedDistance(k), greaterThanOrEqualTo(g.radius));
    }
  });

  test('progres naik monoton terhadap jarak tarik', () {
    final pose = defaultPose(size);
    final end = CurlGeometry.endDistance(size, pose.corner, pose.normal);
    var last = -1.0;
    for (var i = 1; i <= 10; i++) {
      final p = CurlGeometry.fromPose(size, pose.withDistance(end * i / 10)).progress;
      expect(p, greaterThan(last));
      last = p;
    }
  });
}
