// Aset hiasan, motif selotip, dan kertas latar (K-031, K-037) yang tercatat di
// data/decorations.json harus terbundel di aplikasi dan memakai SVG sederhana
// (lihat tool/make_decorations.py).

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final catalog = jsonDecode(
    File('../data/decorations.json').readAsStringSync(),
  ) as Map<String, dynamic>;
  final files = <String, String>{
    for (final group in ['ornaments', 'tapePatterns', 'paperStyles'])
      for (final item in (catalog[group] as List).cast<Map<String, dynamic>>())
        '$group/${item['id']}': item['file'] as String,
  };

  test('katalog berisi 12 hiasan, 6 motif selotip, 4 kertas latar', () {
    expect((catalog['ornaments'] as List).length, 12);
    expect((catalog['tapePatterns'] as List).length, 6);
    expect(
      (catalog['paperStyles'] as List).map((e) => (e as Map)['id']).toSet(),
      {'plain', 'lined', 'dotted', 'grid'},
    );
  });

  for (final entry in files.entries) {
    test('${entry.key} terbundel dan SVG-nya sederhana', () async {
      final data = await rootBundle.load(entry.value);
      final svg = utf8.decode(data.buffer.asUint8List());
      expect(svg, startsWith('<svg'));
      expect(svg, contains('viewBox='));
      for (final forbidden in [
        '<text',
        '<filter',
        '<pattern',
        '<image',
        'style=',
        '<style',
      ]) {
        expect(
          svg.contains(forbidden),
          isFalse,
          reason: '${entry.value} memuat $forbidden',
        );
      }
    });
  }
}
