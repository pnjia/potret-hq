import 'package:material_ui/material_ui.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/design_tokens.dart';
import '../../../core/widgets/app_navigation_bar.dart';
import '../../book/ui/book_screen.dart';
import 'home_screen.dart';

/// Kerangka aplikasi: navigasi bawah lima tab (K-035) dan halaman per tab.
///
/// Halaman dibuat saat tabnya pertama dibuka (Buku memuat shader dan gambar,
/// jadi tidak ikut dimuat saat aplikasi dibuka), lalu dipertahankan.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const _pages = [
    AppTab.home,
    AppTab.book,
    AppTab.missions,
    AppTab.profile,
  ];

  AppTab _current = AppTab.home;
  final _visited = <AppTab>{AppTab.home};

  void _select(AppTab tab) {
    if (tab == AppTab.camera) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => const ComingSoonScreen(
            title: 'Potret',
            body: 'Kamera berbodi dan potong otomatis dibangun di Fase 2.',
          ),
        ),
      );
      return;
    }
    setState(() {
      _current = tab;
      _visited.add(tab);
    });
  }

  Widget _page(AppTab tab) => switch (tab) {
    AppTab.home => HomeScreen(
      onOpenCamera: () => _select(AppTab.camera),
      onOpenBook: () => _select(AppTab.book),
      onOpenMissions: () => _select(AppTab.missions),
    ),
    AppTab.book => const BookScreen(),
    AppTab.missions => const ComingSoonScreen(
      title: 'Misi',
      body: 'Misi mingguan dan lencana menyusul (kartu Misi mingguan).',
      showBack: false,
    ),
    AppTab.profile => const ComingSoonScreen(
      title: 'Profil',
      body: 'Profil, privasi, dan hapus akun menyusul (kartu Login).',
      showBack: false,
    ),
    AppTab.camera => throw StateError('Kamera bukan halaman tab'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _pages.indexOf(_current),
        children: [
          for (final tab in _pages)
            _visited.contains(tab) ? _page(tab) : const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: AppNavigationBar(
        current: _current,
        onSelected: _select,
      ),
    );
  }
}

/// Halaman sementara untuk fitur yang belum dibangun.
class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({
    super.key,
    required this.title,
    required this.body,
    this.showBack = true,
  });

  final String title;
  final String body;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(TokenSpacing.screenMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBack) ...[
              Semantics(
                button: true,
                label: 'Kembali',
                excludeSemantics: true,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.square(TokenSize.touchTargetMin),
                    padding: EdgeInsets.zero,
                    foregroundColor: TokenColors.inkPrimary,
                    side: const BorderSide(
                      color: TokenColors.inkPrimary,
                      width: TokenBorder.ink,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TokenRadius.ticket),
                    ),
                  ),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(height: TokenSpacing.blockGap),
            ],
            Semantics(
              header: true,
              child: Text(title, style: AppTextStyles.h1),
            ),
            const SizedBox(height: 8),
            Text(body, style: AppTextStyles.body),
          ],
        ),
      ),
    );
    return showBack ? Scaffold(body: content) : content;
  }
}
