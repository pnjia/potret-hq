import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/theme/app_theme.dart';
import 'features/book/ui/book_screen.dart';

void main() {
  runApp(const ProviderScope(child: PotretApp()));
}

/// Akar aplikasi. Nama kode `potret`; nama yang tampil "Kliping Kota" (K-023).
class PotretApp extends StatelessWidget {
  const PotretApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kliping Kota',
      theme: buildAppTheme(),
      debugShowCheckedModeBanner: false,
      home: const BookScreen(),
    );
  }
}
