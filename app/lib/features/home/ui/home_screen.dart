import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/category_style.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/widgets/app_icon.dart';
import '../../../core/widgets/category_label.dart';
import '../../../core/widgets/highlight.dart';
import '../../../core/widgets/ticket.dart';
import '../state/home_providers.dart';

/// Beranda v5 (mockup V5Beranda, usulan v5 §3.6): progres kota sebagai hero
/// kliping Kobalt, karcis Potret dan karcis misi, lalu temuan yang baru
/// ditempel.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
    required this.onOpenCamera,
    required this.onOpenBook,
    required this.onOpenMissions,
  });

  final VoidCallback onOpenCamera;
  final VoidCallback onOpenBook;
  final VoidCallback onOpenMissions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(homeSummaryProvider);
    // Nilai lama tetap tampil saat ringkasan dihitung ulang.
    final summary = async.value;
    if (summary == null) {
      if (!async.hasError) return const SizedBox.shrink();
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(TokenSpacing.screenMargin),
          child: Text(
            'Beranda gagal dimuat. Tutup lalu buka lagi aplikasinya.',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          TokenSpacing.screenMargin,
          12,
          TokenSpacing.screenMargin,
          32,
        ),
        // Tiap elemen jadi node semantik sendiri (judul tidak ikut terbaca
        // sebagai tombol kota, angka hero tidak tergabung dengan bilah).
        children: [
          for (final block in [
            _Header(cityName: summary.cityName),
            const SizedBox(height: TokenSpacing.blockGap),
            _CityHero(summary: summary),
            const SizedBox(height: TokenSpacing.blockGap + 12),
            _ActionTickets(
              summary: summary,
              onOpenCamera: onOpenCamera,
              onOpenMissions: onOpenMissions,
            ),
            const SizedBox(height: TokenSpacing.blockGap + 8),
            _RecentSection(recent: summary.recent, onOpenBook: onOpenBook),
          ])
            Semantics(explicitChildNodes: true, child: block),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Semantics(
            header: true,
            child: Text('Beranda', style: AppTextStyles.h1),
          ),
        ),
        Semantics(
          button: true,
          label: 'Ganti kota, sekarang $cityName',
          excludeSemantics: true,
          child: OutlinedButton(
            onPressed: () => ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Pilih kota belum tersedia.')),
              ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, TokenSize.touchTargetMin),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              foregroundColor: TokenColors.inkPrimary,
              side: const BorderSide(
                color: TokenColors.inkPrimary,
                width: TokenBorder.ink,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TokenRadius.ticket),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  cityName,
                  style: AppTextStyles.withWeight(AppTextStyles.body, 700),
                ),
                const SizedBox(width: 6),
                const AppIcon(AppIconGlyph.chevronDown, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Hero: kliping Kobalt miring -1°, raster titik memudar dari kanan atas,
/// nama kota, angka temuan, bilah progres, dan stiker terbaru yang menembus
/// tepi kanan bawah.
class _CityHero extends StatelessWidget {
  const _CityHero({required this.summary});

  final HomeSummary summary;

  @override
  Widget build(BuildContext context) {
    const onHero = TokenColors.paperScreen;
    final fraction = (summary.findingCount / summary.findingTarget).clamp(
      0.0,
      1.0,
    );
    final sticker = summary.latestLandmarkSticker;
    return Transform.rotate(
      angle: TokenMotion.heroRotationDeg * math.pi / 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 204,
            decoration: BoxDecoration(
              color: TokenColors.actionPrimary,
              borderRadius: BorderRadius.circular(TokenRadius.paper),
            ),
            child: CustomPaint(
              painter: const _DotRasterPainter(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 120, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppTextStyles.applyCase(
                          summary.cityName,
                          TokenTextStyles.displayXl,
                        ),
                        style: AppTextStyles.displayXl.copyWith(color: onHero),
                        semanticsLabel: summary.cityName,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Semantics(
                      label:
                          '${summary.findingCount} dari ${summary.findingTarget} temuan',
                      excludeSemantics: true,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${summary.findingCount}',
                            style: AppTextStyles.numberLarge.copyWith(
                              color: onHero,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '/${summary.findingTarget}',
                            style: AppTextStyles.numberPair.copyWith(
                              color: onHero,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'temuan',
                            style: AppTextStyles.label.copyWith(
                              color: onHero,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Semantics(
                      label: 'Progres temuan ${summary.cityName}',
                      value: '${(fraction * 100).round()} persen',
                      excludeSemantics: true,
                      child: Container(
                        width: 172,
                        height: 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: onHero,
                            width: TokenBorder.ink,
                          ),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: fraction,
                          child: const ColoredBox(
                            color: TokenColors.highlightPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (sticker != null)
            Positioned(
              right: -4,
              bottom: -26,
              width: 118,
              child: Transform.rotate(
                angle: sticker.rotationDeg * math.pi / 180,
                child: Image(
                  image: sticker.image,
                  semanticLabel: sticker.description,
                  fit: BoxFit.contain,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Raster titik koran (1,3 px tiap 7 px), putih 22% di kanan atas lalu
/// memudar. Pendukung, bukan tanda tangan; tidak di bawah teks kecil.
class _DotRasterPainter extends CustomPainter {
  const _DotRasterPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final origin = Offset(size.width, 0);
    final reach = size.shortestSide * 1.3;
    final paint = Paint();
    for (var y = 3.5; y < size.height; y += 7) {
      for (var x = size.width - 3.5; x > size.width * 0.35; x -= 7) {
        final fade = 1 - (Offset(x, y) - origin).distance / reach;
        if (fade <= 0) continue;
        paint.color = TokenColors.paperScreen.withValues(alpha: 0.22 * fade);
        canvas.drawCircle(Offset(x, y), 1.3, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotRasterPainter oldDelegate) => false;
}

class _ActionTickets extends StatelessWidget {
  const _ActionTickets({
    required this.summary,
    required this.onOpenCamera,
    required this.onOpenMissions,
  });

  final HomeSummary summary;
  final VoidCallback onOpenCamera;
  final VoidCallback onOpenMissions;

  @override
  Widget build(BuildContext context) {
    final serial = summary.nextFindingNumber.toString().padLeft(3, '0');
    final mission = summary.mission;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Ticket(
              color: TokenColors.highlightPrimary,
              stubLabel: 'No. $serial',
              onTap: onOpenCamera,
              semanticLabel: 'Potret sekarang, temuan nomor $serial',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: TokenColors.inkPrimary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const AppIcon(
                      AppIconGlyph.shutter,
                      size: 20,
                      color: TokenColors.paperScreen,
                    ),
                  ),
                  const SizedBox(height: 18),
                  // Dua baris tetap; mengecil bila karcis sempit, tidak
                  // pernah patah di tengah kata.
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppTextStyles.applyCase(
                        'Potret\nsekarang',
                        TokenTextStyles.ticketLarge,
                      ),
                      style: AppTextStyles.ticketLarge,
                      semanticsLabel: 'Potret sekarang',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Ticket(
              color: TokenColors.paperScreen,
              outlined: true,
              stubLabel: 'Sisa ${mission.daysLeft} hari',
              onTap: onOpenMissions,
              semanticLabel:
                  'Misi minggu ini: ${mission.title}, ${mission.progress} dari ${mission.target}, sisa ${mission.daysLeft} hari',
              padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Misi minggu ini', style: AppTextStyles.meta),
                  const SizedBox(height: 6),
                  HighlightedText(
                    mission.title,
                    highlight: mission.highlight,
                    style: AppTextStyles.withWeight(
                      AppTextStyles.body,
                      700,
                    ).copyWith(height: 1.3),
                  ),
                  const Spacer(),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${mission.progress}',
                        style: AppTextStyles.numberLarge.copyWith(fontSize: 30),
                      ),
                      Text(
                        '/${mission.target}',
                        style: AppTextStyles.withWeight(
                          AppTextStyles.numberPair,
                          400,
                        ).copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentSection extends StatelessWidget {
  const _RecentSection({required this.recent, required this.onOpenBook});

  final List<RecentSticker> recent;
  final VoidCallback onOpenBook;

  @override
  Widget build(BuildContext context) {
    final slots = recent.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Semantics(
                header: true,
                child: Text('Baru ditempel', style: AppTextStyles.h2),
              ),
            ),
            TextButton(
              onPressed: onOpenBook,
              style: TextButton.styleFrom(
                foregroundColor: TokenColors.actionPrimary,
                minimumSize: const Size(
                  TokenSize.touchTargetMin,
                  TokenSize.touchTargetMin,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
              ),
              child: Text(
                'Buka buku',
                style: AppTextStyles.withWeight(AppTextStyles.body, 700)
                    .copyWith(
                      color: TokenColors.actionPrimary,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: TokenColors.actionPrimary,
                      decorationThickness: 2,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var i = 0; i < 3; i++) ...[
              if (i > 0) const SizedBox(width: 8),
              Expanded(
                child: i < slots.length
                    ? _StickerSlot(sticker: slots[i], onTap: onOpenBook)
                    : const _EmptySlot(),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _StickerSlot extends StatelessWidget {
  const _StickerSlot({required this.sticker, required this.onTap});

  final RecentSticker sticker;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final category = CategoryStyle.of(sticker.category).label;
    return Semantics(
      button: true,
      label: '${sticker.description}, kategori $category. Buka di buku',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            SizedBox(
              height: 96,
              child: Transform.rotate(
                angle: sticker.rotationDeg * math.pi / 180,
                child: Image(
                  image: sticker.image,
                  semanticLabel: sticker.description,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Rapat; bila teks diperbesar pengguna, label mengecil alih-alih
            // terpotong.
            FittedBox(
              fit: BoxFit.scaleDown,
              child: CategoryLabel(sticker.category, dense: true),
            ),
          ],
        ),
      ),
    );
  }
}

/// Slot kosong: garis putus dan tulisan tangan "tempel berikutnya".
class _EmptySlot extends StatelessWidget {
  const _EmptySlot();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132,
      child: CustomPaint(
        painter: const _DashedRectPainter(),
        child: Center(
          child: Text(
            'tempel berikutnya',
            textAlign: TextAlign.center,
            style: AppTextStyles.bookNote.copyWith(
              color: TokenColors.inkSecondary,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  const _DashedRectPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = TokenColors.inkSecondary
      ..strokeWidth = 1.5;
    void dashed(Offset a, Offset b) {
      final len = (b - a).distance;
      final dir = (b - a) / len;
      for (var d = 0.0; d < len; d += 9) {
        canvas.drawLine(a + dir * d, a + dir * math.min(d + 5, len), paint);
      }
    }

    final r = Offset.zero & size;
    dashed(r.topLeft, r.topRight);
    dashed(r.topRight, r.bottomRight);
    dashed(r.bottomRight, r.bottomLeft);
    dashed(r.bottomLeft, r.topLeft);
  }

  @override
  bool shouldRepaint(_DashedRectPainter oldDelegate) => false;
}
