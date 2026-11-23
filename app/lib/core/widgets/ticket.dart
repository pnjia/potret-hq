import 'package:material_ui/material_ui.dart';

import '../theme/app_text_styles.dart';
import '../theme/design_tokens.dart';

/// Garis tepi karcis: persegi dengan sudut [TokenRadius.ticket] dan dua takik
/// setengah lingkaran di tepi atas dan bawah, tepat di garis sobekan
/// ([stubWidth] dari kanan). Dipakai bersama oleh clip dan garis tepi.
Path ticketPath(
  Size size, {
  double stubWidth = TokenSize.ticketStub,
  double notchRadius = TokenSize.ticketNotch,
}) {
  final w = size.width, h = size.height;
  const r = TokenRadius.ticket;
  final nx = w - stubWidth;
  final n = notchRadius;
  return Path()
    ..moveTo(r, 0)
    ..lineTo(nx - n, 0)
    ..arcToPoint(
      Offset(nx + n, 0),
      radius: Radius.circular(n),
      clockwise: false,
    )
    ..lineTo(w - r, 0)
    ..arcToPoint(Offset(w, r), radius: const Radius.circular(r))
    ..lineTo(w, h - r)
    ..arcToPoint(Offset(w - r, h), radius: const Radius.circular(r))
    ..lineTo(nx + n, h)
    ..arcToPoint(
      Offset(nx - n, h),
      radius: Radius.circular(n),
      clockwise: false,
    )
    ..lineTo(r, h)
    ..arcToPoint(Offset(0, h - r), radius: const Radius.circular(r))
    ..lineTo(0, r)
    ..arcToPoint(const Offset(r, 0), radius: const Radius.circular(r))
    ..close();
}

/// Tanda tangan A: karcis berlubang (karcis angkot/parkir/bioskop).
///
/// Badan karcis berisi [child]; sobekan selebar [TokenSize.ticketStub] berisi
/// [stubLabel] vertikal (nomor seri atau sisa hari). Karcis putih memakai
/// [outlined] (garis Tinta 2 px yang mengikuti takik). Datar, tanpa bayangan.
class Ticket extends StatelessWidget {
  const Ticket({
    super.key,
    required this.child,
    this.stubLabel,
    this.color = TokenColors.highlightPrimary,
    this.outlined = false,
    this.foreground = TokenColors.inkPrimary,
    this.onTap,
    this.semanticLabel,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;

  /// Teks sobekan; dikapitalkan otomatis (`ticketSerial`).
  final String? stubLabel;
  final Color color;
  final bool outlined;

  /// Warna teks sobekan dan garis perforasi.
  final Color foreground;
  final VoidCallback? onTap;

  /// Label pembaca layar untuk seluruh karcis bila bisa diketuk.
  final String? semanticLabel;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final body = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(padding: padding, child: child),
          ),
          SizedBox(
            width: TokenSize.ticketStub,
            child: stubLabel == null
                ? null
                : Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        AppTextStyles.applyCase(
                          stubLabel!,
                          TokenTextStyles.ticketSerial,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        style: AppTextStyles.ticketSerial.copyWith(
                          color: foreground,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );

    final ticket = CustomPaint(
      foregroundPainter: _TicketEdgePainter(
        outlined: outlined,
        perforation: foreground.withValues(alpha: outlined ? 1 : 0.55),
      ),
      child: ClipPath(
        clipper: _TicketClipper(),
        child: Material(
          color: color,
          child: InkWell(onTap: onTap, child: body),
        ),
      ),
    );

    if (onTap == null && semanticLabel == null) return ticket;
    return Semantics(
      button: onTap != null,
      label: semanticLabel,
      excludeSemantics: semanticLabel != null,
      child: ticket,
    );
  }
}

class _TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => ticketPath(size);

  @override
  bool shouldReclip(_TicketClipper oldClipper) => false;
}

class _TicketEdgePainter extends CustomPainter {
  _TicketEdgePainter({required this.outlined, required this.perforation});

  final bool outlined;
  final Color perforation;

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width - TokenSize.ticketStub;
    const inset = TokenSize.ticketNotch + 4;
    final dash = Paint()
      ..color = perforation
      ..strokeWidth = TokenBorder.ink;
    for (var y = inset; y < size.height - inset; y += 8) {
      canvas.drawLine(
        Offset(x, y),
        Offset(x, (y + 4).clamp(0, size.height - inset)),
        dash,
      );
    }
    if (outlined) {
      canvas.drawPath(
        ticketPath(size),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = TokenBorder.ink
          ..color = TokenColors.inkPrimary,
      );
    }
  }

  @override
  bool shouldRepaint(_TicketEdgePainter old) =>
      old.outlined != outlined || old.perforation != perforation;
}
