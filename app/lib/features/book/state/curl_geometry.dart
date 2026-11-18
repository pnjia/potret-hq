import 'dart:math' as math;
import 'dart:ui' show Offset, Size;

/// Durasi dasar satu kali `PageCurl` penuh (maju atau mundur) pada animasi
/// otomatis. Konstanta lokal: `TokenMotion.pageCurl` masih null sampai angka
/// dari Hot 11 Play ada (K-012). Ubah di sini saja.
const Duration pageCurlDuration = Duration(milliseconds: 520);

/// Jari-jari silinder lengkungan maksimum, sebagai pecahan lebar halaman.
const double curlMaxRadiusFraction = 0.11;

/// Pose `PageCurl`: sudut halaman yang ditarik ([corner]), arah lengkungan
/// ([normal], vektor satuan dari jari menuju [corner]), dan jarak tarik
/// ([distance], dari [corner] ke titik sentuh).
class CurlPose {
  const CurlPose({
    required this.corner,
    required this.normal,
    required this.distance,
  });

  /// Pose dari posisi jari saat menarik halaman maju. Sudut halaman selalu
  /// berada di bawah jari. Arah dibatasi supaya lengkungan selalu ke kanan.
  factory CurlPose.fromTouch(Offset corner, Offset touch) {
    final delta = corner - touch;
    if (delta.distance < 1e-3) {
      return CurlPose(corner: corner, normal: const Offset(1, 0), distance: 0);
    }
    var dir = delta / delta.distance;
    if (dir.dx < minNormalX) {
      final dy = dir.dy == 0 ? 1.0 : dir.dy.sign;
      dir = Offset(minNormalX, dy * math.sqrt(1 - minNormalX * minNormalX));
    }
    return CurlPose(corner: corner, normal: dir, distance: delta.distance);
  }

  /// Komponen x minimum [normal]: lengkungan tidak boleh berbalik arah.
  static const double minNormalX = 0.45;

  final Offset corner;
  final Offset normal;
  final double distance;

  CurlPose withDistance(double d) =>
      CurlPose(corner: corner, normal: normal, distance: d);

  Offset get touch => corner - normal * distance;
}

/// Hasil hitung `PageCurl` yang dikirim ke shader sebagai uniform.
///
/// Model silinder: bagian halaman yang melewati sumbu (arah [normal]) digulung
/// pada silinder berjari-jari [radius] yang sumbunya melewati [axisPoint].
class CurlGeometry {
  const CurlGeometry({
    required this.axisPoint,
    required this.normal,
    required this.radius,
    required this.progress,
  });

  /// Halaman datar (tidak ada lengkungan yang terlihat).
  factory CurlGeometry.flat(Size size) => CurlGeometry(
        axisPoint: Offset(size.width * 4, size.height / 2),
        normal: const Offset(1, 0),
        radius: maxRadiusFor(size),
        progress: 0,
      );

  factory CurlGeometry.fromPose(Size size, CurlPose pose) {
    final r = math.min(maxRadiusFor(size), pose.distance / math.pi);
    if (pose.distance <= 0.5) return CurlGeometry.flat(size);
    final uCorner = (pose.distance + math.pi * r) / 2;
    final end = endDistance(size, pose.corner, pose.normal);
    return CurlGeometry(
      axisPoint: pose.corner - pose.normal * uCorner,
      normal: pose.normal,
      radius: r,
      progress: (pose.distance / end).clamp(0.0, 1.0),
    );
  }

  static double maxRadiusFor(Size size) => size.width * curlMaxRadiusFraction;

  /// Jarak tarik saat halaman sudah sepenuhnya terbalik: silinder dan lipatan
  /// sudah keluar dari semua sudut halaman.
  static double endDistance(Size size, Offset corner, Offset normal) {
    final r = maxRadiusFor(size);
    final corners = [
      Offset.zero,
      Offset(size.width, 0),
      Offset(0, size.height),
      Offset(size.width, size.height),
    ];
    var m = double.infinity;
    for (final k in corners) {
      final d = (k - corner).dx * normal.dx + (k - corner).dy * normal.dy;
      m = math.min(m, d);
    }
    return 2 * (r - m) - math.pi * r + 2;
  }

  final Offset axisPoint;
  final Offset normal;
  final double radius;

  /// 0 = halaman datar, 1 = halaman sudah terbalik penuh.
  final double progress;

  /// Jarak bertanda titik layar [p] dari sumbu, searah [normal].
  double signedDistance(Offset p) =>
      (p - axisPoint).dx * normal.dx + (p - axisPoint).dy * normal.dy;
}

/// Pose awal untuk animasi otomatis dan gestur mundur: sudut kanan bawah,
/// lengkungan sedikit miring.
CurlPose defaultPose(Size size, {double distance = 0}) {
  const n = Offset(0.985, 0.17); // ±10°
  final len = n.distance;
  return CurlPose(
    corner: Offset(size.width, size.height * 0.86),
    normal: n / len,
    distance: distance,
  );
}
