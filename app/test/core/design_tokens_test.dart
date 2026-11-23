// Menjaga salinan token di lib/core/theme/design_tokens.dart tetap sama dengan
// data/design-tokens.json (sumber tunggal, K-035). `flutter test` dijalankan
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
      'paper.screen': TokenColors.paperScreen,
      'paper.book': TokenColors.paperBook,
      'paper.muted': TokenColors.paperMuted,
      'paper.tape': TokenColors.paperTape,
      'ink.primary': TokenColors.inkPrimary,
      'ink.secondary': TokenColors.inkSecondary,
      'action.primary': TokenColors.actionPrimary,
      'action.onPrimarySoft': TokenColors.actionOnPrimarySoft,
      'highlight.primary': TokenColors.highlightPrimary,
      'state.error': TokenColors.stateError,
      'state.success': TokenColors.stateSuccess,
      'noteInk.ink': TokenColors.noteInkInk,
      'noteInk.cobalt': TokenColors.noteInkCobalt,
      'noteInk.sepia': TokenColors.noteInkSepia,
      'noteInk.stampRed': TokenColors.noteInkStampRed,
      'noteInk.magenta': TokenColors.noteInkMagenta,
      'noteInk.green': TokenColors.noteInkGreen,
      'category.sign': TokenColors.categorySign,
      'category.food': TokenColors.categoryFood,
      'category.drink': TokenColors.categoryDrink,
      'category.vehicle': TokenColors.categoryVehicle,
      'category.animal': TokenColors.categoryAnimal,
      'category.plant': TokenColors.categoryPlant,
      'category.building': TokenColors.categoryBuilding,
      'category.object': TokenColors.categoryObject,
      'category.other': TokenColors.categoryOther,
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
    expect(
      TokenSpacing.screenMargin,
      (token('spacing.screenMargin') as Map)['value'],
    );
    expect(TokenSpacing.blockGap, (token('spacing.blockGap') as Map)['value']);
    expect(TokenRadius.none, (token('radius.none') as Map)['value']);
    expect(TokenRadius.paper, (token('radius.paper') as Map)['value']);
    expect(TokenRadius.ticket, (token('radius.ticket') as Map)['value']);
    expect(TokenBorder.ink, (token('border.ink') as Map)['value']);
    expect(TokenBorder.tag, (token('border.tag') as Map)['value']);
    expect(
      TokenSize.touchTargetMin,
      (token('size.touchTargetMin') as Map)['value'],
    );
    expect(
      TokenSize.buttonHeight,
      (token('size.buttonHeight') as Map)['value'],
    );
    expect(
      TokenMotion.manualRotationStepDeg,
      (token('motion.manualRotationStep') as Map)['value'],
    );
    expect(
      TokenMotion.manualRotationMaxDeg,
      (token('motion.manualRotationMax') as Map)['value'],
    );
    expect(
      TokenMotion.capTotal.inMilliseconds,
      (token('motion.capTotal') as Map)['value'],
    );
    expect(
      TokenMotion.placementRotationMaxDeg,
      (token('motion.placementRotationMax') as Map)['value'],
    );
    final pageCurl = (token('motion.pageCurl') as Map)['value'] as num?;
    expect(TokenMotion.pageCurl?.inMilliseconds, pageCurl?.toInt());
  });

  test('ukuran karcis/cap dan rotasi sama dengan JSON', () {
    num v(String path) => (token(path) as Map)['value'] as num;
    expect(TokenSize.ticketStub, v('size.ticketStub'));
    expect(TokenSize.ticketNotch, v('size.ticketNotch'));
    expect(TokenSize.stampMinScreen, v('size.stampMinScreen'));
    expect(TokenSize.stampMinShare, v('size.stampMinShare'));
    expect(TokenMotion.clippingRotationMaxDeg, v('motion.clippingRotationMax'));
    expect(TokenMotion.stampRotationMinDeg, v('motion.stampRotationMin'));
    expect(TokenMotion.stampRotationMaxDeg, v('motion.stampRotationMax'));
    expect(TokenMotion.heroRotationDeg, v('motion.heroRotation'));
  });

  test('gaya teks sama dengan JSON', () {
    final styles = token('textStyle') as Map<String, dynamic>;
    expect(
      TokenTextStyles.all.keys.toSet(),
      styles.keys.toSet(),
      reason: 'gaya teks bertambah atau berkurang',
    );
    for (final e in TokenTextStyles.all.entries) {
      final j = styles[e.key] as Map<String, dynamic>;
      final t = e.value;
      expect(t.font.name, j['font'], reason: '${e.key}.font');
      expect(t.size, j['size'], reason: '${e.key}.size');
      expect(t.lineHeight, j['lineHeight'], reason: '${e.key}.lineHeight');
      expect(t.weight, j['weight'], reason: '${e.key}.weight');
      expect(t.width, j['width'], reason: '${e.key}.width');
      expect(
        t.letterSpacing,
        j['letterSpacing'],
        reason: '${e.key}.letterSpacing',
      );
      expect(t.uppercase, j['uppercase'], reason: '${e.key}.uppercase');
    }
  });
}
