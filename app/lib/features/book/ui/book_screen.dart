import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../state/benchmark_report.dart';
import '../state/book_providers.dart';
import 'book_reader.dart';

/// Layar buku: prototipe `PageCurl` K-012 dengan alat ukur frame time.
class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({super.key});

  @override
  ConsumerState<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends ConsumerState<BookScreen> {
  final _readerKey = GlobalKey<BookReaderState>();

  void _showResults() {
    final reader = _readerKey.currentState;
    if (reader == null) return;
    final report = reader.buildCurrentReport();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => _ResultsSheet(
        report: report,
        summary: reportSummary(report, reader.currentStats),
        onReset: () {
          reader.resetStats();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final assets = ref.watch(bookAssetsProvider);
    final renderer = ref.watch(curlRendererProvider);
    final flipOverride = ref.watch(flipYOverrideProvider);
    final ready = assets.hasValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prototipe buku K-012'),
        actions: [
          IconButton(
            tooltip: 'Uji otomatis (balik semua halaman maju lalu mundur)',
            icon: const Icon(Icons.play_arrow),
            onPressed: ready ? () => _readerKey.currentState?.runAutoTest() : null,
          ),
          IconButton(
            tooltip: 'Thumbnail halaman',
            icon: const Icon(Icons.view_carousel),
            onPressed:
                ready ? () => _readerKey.currentState?.toggleThumbnails() : null,
          ),
          IconButton(
            tooltip: 'Hasil ukur',
            icon: const Icon(Icons.speed),
            onPressed: ready ? _showResults : null,
          ),
          PopupMenuButton<String>(
            tooltip: 'Pengaturan ukur',
            onSelected: (value) {
              if (value == 'flip') {
                final probe = assets.value?.probe.flipY ?? false;
                ref
                    .read(flipYOverrideProvider.notifier)
                    .set(flipOverride == null ? !probe : null);
                return;
              }
              ref
                  .read(curlRendererProvider.notifier)
                  .set(CurlRenderer.values.byName(value));
              // Data lama tidak boleh tercampur dengan mode lain.
              _readerKey.currentState?.resetStats();
            },
            itemBuilder: (context) => [
              for (final r in CurlRenderer.values)
                CheckedPopupMenuItem(
                  value: r.name,
                  checked: r == renderer,
                  child: Text('PageCurl: ${r.label}'),
                ),
              const PopupMenuDivider(),
              CheckedPopupMenuItem(
                value: 'flip',
                checked: flipOverride != null,
                child: const Text('Balik sumbu Y manual (diagnosis)'),
              ),
            ],
          ),
        ],
      ),
      body: assets.when(
        loading: () => const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Menyiapkan shader dan halaman…'),
            ],
          ),
        ),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Gagal menyiapkan buku: $e'),
          ),
        ),
        data: (data) => LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.biggest;
            return BookReader(
              key: _readerKey,
              assets: data,
              size: size,
              pixelRatio: MediaQuery.devicePixelRatioOf(context),
              onAutoTestDone: _showResults,
            );
          },
        ),
      ),
    );
  }
}

class _ResultsSheet extends StatelessWidget {
  const _ResultsSheet({
    required this.report,
    required this.summary,
    required this.onReset,
  });

  final Map<String, Object?> report;
  final String summary;
  final VoidCallback onReset;

  Future<void> _copy(BuildContext context, String text, String what) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$what disalin. Tempel ke chat.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final json = reportJson(report);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Hasil ukur', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Flexible(
              child: SingleChildScrollView(
                child: SelectableText(
                  summary,
                  style: const TextStyle(fontSize: 13, height: 1.4),
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              icon: const Icon(Icons.copy),
              label: const Text('Salin hasil (JSON)'),
              onPressed: () => _copy(context, json, 'Hasil JSON'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => _copy(context, summary, 'Ringkasan'),
              child: const Text('Salin ringkasan'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: onReset,
              child: const Text('Hapus data ukur'),
            ),
          ],
        ),
      ),
    );
  }
}
