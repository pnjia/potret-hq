import 'package:material_ui/material_ui.dart';

import '../theme/design_tokens.dart';

/// Tanda tangan C: coretan stabilo. Blok Lime miring di ±58% bagian bawah
/// huruf dengan tepi tegas (bukan gradasi). Pengganti badge kapsul.
///
/// Lime tidak pernah menjadi satu-satunya penanda status (K-035).
class Highlight extends StatelessWidget {
  const Highlight({
    super.key,
    required this.child,
    this.padStart = true,
    this.padEnd = true,
  });

  final Widget child;

  /// Lebihan blok 3 px di kiri/kanan. Dimatikan di sambungan antarkata
  /// supaya frasa terlihat satu coretan.
  final bool padStart;
  final bool padEnd;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: const _HighlightPainter(),
    child: Padding(
      padding: EdgeInsets.only(left: padStart ? 3 : 0, right: padEnd ? 3 : 0),
      child: child,
    ),
  );
}

class _HighlightPainter extends CustomPainter {
  const _HighlightPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    // Garis atas dan bawah miring ±4° (sesuai gradien 176° di mockup).
    final slant = (w * 0.07).clamp(0.0, h * 0.12);
    final path = Path()
      ..moveTo(0, h * 0.34)
      ..lineTo(w, h * 0.34 - slant)
      ..lineTo(w, h * 0.88 - slant)
      ..lineTo(0, h * 0.88)
      ..close();
    canvas.drawPath(path, Paint()..color = TokenColors.highlightPrimary);
  }

  @override
  bool shouldRepaint(_HighlightPainter oldDelegate) => false;
}

/// Teks dengan satu frasa distabilo. Frasa dipecah per kata supaya bisa
/// pindah baris; spasi di antara kata ikut distabilo.
class HighlightedText extends StatelessWidget {
  const HighlightedText(
    this.text, {
    super.key,
    required this.highlight,
    required this.style,
  });

  final String text;

  /// Bagian dari [text] yang distabilo (kemunculan pertama).
  final String highlight;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final at = text.indexOf(highlight);
    if (highlight.isEmpty || at < 0) return Text(text, style: style);
    final words = highlight.split(' ');
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: text.substring(0, at)),
          for (var i = 0; i < words.length; i++)
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: Highlight(
                padStart: i == 0,
                padEnd: i == words.length - 1,
                child: Text(
                  i < words.length - 1 ? '${words[i]} ' : words[i],
                  style: style,
                ),
              ),
            ),
          TextSpan(text: text.substring(at + highlight.length)),
        ],
      ),
      semanticsLabel: text,
    );
  }
}
