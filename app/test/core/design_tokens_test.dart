// Menjaga salinan token di lib/core/theme/design_tokens.dart tetap sama dengan
// data/design-tokens.json (sumber tunggal, K-021). `flutter test` dijalankan
// dari app/, jadi file JSON ada di ../data/.

import 'dart:convert';
import 'dart:io';
import 'dart:ui' show Color;

import 'package:flutter_test/flutter_test.dart';
import 'package:potret/core/theme/design_tokens.dart';

void main() {
  final json = jsonDecode(
    File('../data/design-tokens.json').readAsStringSync(),
  ) as Map<String, dynamic>;

  String hex(Color c) =>
      '#${(c.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  Object? token(String path) {
    Object? node = json;
    for (final key in path.split('.')) {
      node = (node as Map<String, dynamic>)[key];
    }
    return node;
  }

  test('warna sama dengan JSON', () {
    const colors = {
      'paper.base': TokenColors.paperBase,
      'paper.raised': TokenColors.paperRaised,
      'paper.line': TokenColors.paperLine,
      'paper.tape': TokenColors.paperTape,
      'ink.primary': TokenColors.inkPrimary,
      'ink.secondary': TokenColors.inkSecondary,
      'accent.primary': TokenColors.accentPrimary,
      'accent.secondary': TokenColors.accentSecondary,
      'state.error': TokenColors.stateError,
      'state.success': TokenColors.stateSuccess,
    };
    final groups = token('color') as Map<String, dynamic>;
    final jsonKeys = [
      for (final g in groups.entries)
        for (final k in (g.value as Map<String, dynamic>).keys) '${g.key}.$k',
    ];
    expect(
      colors.keys.toSet(),
      jsonKeys.toSet(),
      reason: 'token warna bertambah atau berkurang',
    );
    for (final e in colors.entries) {
      final value = (token('color.${e.key}') as Map)['value'] as String;
      expect(hex(e.value), value.toUpperCase(), reason: e.key);
    }
  });

  test('tipografi, spasi, radius, gerak sama dengan JSON', () {
    expect(
      TokenTypography.display,
      (token('typography.display') as Map)['family'],
    );
    expect(TokenTypography.body, (token('typography.body') as Map)['family']);
    expect(
      TokenTypography.handwriting,
      (token('typography.handwriting') as Map)['family'],
    );
    expect(TokenSpacing.unit, (token('spacing.unit') as Map)['value']);
    expect(TokenRadius.card, (token('radius.card') as Map)['value']);
    expect(TokenRadius.button, (token('radius.button') as Map)['value']);
    expect(
      TokenMotion.placementRotationMaxDeg,
      (token('motion.placementRotationMax') as Map)['value'],
    );
    final pageCurl = (token('motion.pageCurl') as Map)['value'] as num?;
    expect(TokenMotion.pageCurl?.inMilliseconds, pageCurl?.toInt());
  });
}
