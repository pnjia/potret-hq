import 'package:material_ui/material_ui.dart';

/// Layar buku. Untuk sekarang hanya placeholder; prototipe page-curl K-012
/// ditulis di modul ini oleh agen `animasi-buku`.
class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Prototipe buku K-012',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
