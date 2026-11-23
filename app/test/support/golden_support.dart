import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:potret/core/theme/app_theme.dart';
import 'package:potret/core/theme/design_tokens.dart';

/// Memuat font yang dibundel (assets/fonts/) supaya golden memakai huruf asli,
/// bukan font kotak bawaan tes.
Future<void> loadAppFonts() async {
  const fonts = {
    TokenTypography.display: 'assets/fonts/Anybody-Variable.ttf',
    TokenTypography.body: 'assets/fonts/PlusJakartaSans-Variable.ttf',
    TokenTypography.handwriting: 'assets/fonts/NanumPenScript-Regular.ttf',
  };
  for (final e in fonts.entries) {
    await (FontLoader(e.key)..addFont(rootBundle.load(e.value))).load();
  }
}

/// Mengatur layar uji: lebar logis [width], tinggi [height], rasio piksel 2.
void setSurface(WidgetTester tester, double width, double height) {
  tester.view.physicalSize = Size(width * 2, height * 2);
  tester.view.devicePixelRatio = 2;
  addTearDown(tester.view.reset);
}

/// Membungkus [child] dengan tema aplikasi di atas latar [background].
Widget themed(Widget child, {Color background = TokenColors.paperScreen}) =>
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: Scaffold(
        backgroundColor: background,
        body: Center(child: child),
      ),
    );

/// Menunggu semua `Image.asset` di pohon selesai di-decode (decode berjalan
/// di luar zona waktu palsu tes).
Future<void> precacheAssetImages(WidgetTester tester) async {
  final images = tester.widgetList<Image>(find.byType(Image)).toList();
  final context = tester.element(find.byType(Scaffold).first);
  await tester.runAsync(() async {
    for (final image in images) {
      await precacheImage(image.image, context);
    }
  });
  await tester.pumpAndSettle();
}
