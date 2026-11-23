import 'dart:ui';

/// Mengurai atribut `d` SVG menjadi [Path].
///
/// Cukup untuk ikon v5 yang digambar di mockup: perintah M, L, H, V, C, S, Q,
/// A, Z (huruf besar dan kecil). Bukan pengurai SVG lengkap.
Path parseSvgPath(String d) {
  final path = Path();
  final tokens = _tokenize(d);
  var i = 0;
  var cmd = '';
  var cur = Offset.zero;
  var start = Offset.zero;
  Offset? lastCtrl;

  double next() => double.parse(tokens[i++]);

  while (i < tokens.length) {
    if (_isCommand(tokens[i])) cmd = tokens[i++];
    final rel = cmd == cmd.toLowerCase();
    Offset pt(double x, double y) => rel ? cur + Offset(x, y) : Offset(x, y);

    switch (cmd.toUpperCase()) {
      case 'M':
        cur = pt(next(), next());
        start = cur;
        path.moveTo(cur.dx, cur.dy);
        // Pasangan berikutnya setelah M diperlakukan sebagai L.
        cmd = rel ? 'l' : 'L';
        lastCtrl = null;
      case 'L':
        cur = pt(next(), next());
        path.lineTo(cur.dx, cur.dy);
        lastCtrl = null;
      case 'H':
        final x = next();
        cur = Offset(rel ? cur.dx + x : x, cur.dy);
        path.lineTo(cur.dx, cur.dy);
        lastCtrl = null;
      case 'V':
        final y = next();
        cur = Offset(cur.dx, rel ? cur.dy + y : y);
        path.lineTo(cur.dx, cur.dy);
        lastCtrl = null;
      case 'C':
        final c1 = pt(next(), next());
        final c2 = pt(next(), next());
        final end = pt(next(), next());
        path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, end.dx, end.dy);
        lastCtrl = c2;
        cur = end;
      case 'S':
        final c1 = lastCtrl == null ? cur : cur * 2 - lastCtrl;
        final c2 = pt(next(), next());
        final end = pt(next(), next());
        path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, end.dx, end.dy);
        lastCtrl = c2;
        cur = end;
      case 'Q':
        final c = pt(next(), next());
        final end = pt(next(), next());
        path.quadraticBezierTo(c.dx, c.dy, end.dx, end.dy);
        lastCtrl = null;
        cur = end;
      case 'A':
        final rx = next();
        final ry = next();
        final rotation = next();
        final largeArc = next() != 0;
        final sweep = next() != 0;
        final end = pt(next(), next());
        path.arcToPoint(
          end,
          radius: Radius.elliptical(rx, ry),
          rotation: rotation,
          largeArc: largeArc,
          clockwise: sweep,
        );
        lastCtrl = null;
        cur = end;
      case 'Z':
        path.close();
        cur = start;
        lastCtrl = null;
        // Z tidak punya angka; lanjut ke perintah berikutnya.
        continue;
      default:
        throw FormatException('Perintah path SVG tidak didukung: $cmd', d);
    }
    // Angka tambahan tanpa huruf perintah mengulang perintah yang sama:
    // loop berlanjut dengan `cmd` yang sama.
  }
  return path;
}

bool _isCommand(String t) => t.length == 1 && 'MmLlHhVvCcSsQqAaZz'.contains(t);

List<String> _tokenize(String d) {
  final out = <String>[];
  final re = RegExp(r'[MmLlHhVvCcSsQqAaZz]|-?(?:\d+\.?\d*|\.\d+)(?:e-?\d+)?');
  for (final m in re.allMatches(d)) {
    out.add(m.group(0)!);
  }
  return out;
}
