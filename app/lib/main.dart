import 'package:flutter/foundation.dart'
    show LicenseEntryWithLineBreaks, LicenseRegistry;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import 'core/theme/app_theme.dart';
import 'features/home/ui/app_shell.dart';

void main() {
  registerFontLicenses();
  runApp(const ProviderScope(child: PotretApp()));
}

/// Mendaftarkan lisensi OFL ketiga font (assets/fonts/) ke halaman lisensi.
void registerFontLicenses() {
  const fonts = {
    'Anybody': 'assets/fonts/OFL-Anybody.txt',
    'Plus Jakarta Sans': 'assets/fonts/OFL-PlusJakartaSans.txt',
    'Nanum Pen Script': 'assets/fonts/OFL-NanumPenScript.txt',
  };
  LicenseRegistry.addLicense(() async* {
    for (final e in fonts.entries) {
      yield LicenseEntryWithLineBreaks([
        e.key,
      ], await rootBundle.loadString(e.value));
    }
  });
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
      home: const AppShell(),
    );
  }
}
