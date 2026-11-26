// Aset kamera (K-034, K-044): file yang dirujuk data/cameras.json terbundel,
// overlay punya jendela bidik transparan, LUT berformat 512x512, dan
// layout.json memuat kontrol yang muat, tidak bertumpuk, dan cukup besar.

import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<(ui.Image, ByteData)> _decode(String asset) async {
  final bytes = await rootBundle.load(asset);
  final codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List());
  final image = (await codec.getNextFrame()).image;
  final rgba = (await image.toByteData(format: ui.ImageByteFormat.rawRgba))!;
  return (image, rgba);
}

int _alpha(ui.Image image, ByteData rgba, double x, double y) =>
    rgba.getUint8(((y.round() * image.width) + x.round()) * 4 + 3);

ui.Rect _rect(Map<String, dynamic> r) => ui.Rect.fromLTWH(
  (r['x'] as num).toDouble(),
  (r['y'] as num).toDouble(),
  (r['width'] as num).toDouble(),
  (r['height'] as num).toDouble(),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final cameras =
      ((jsonDecode(File('../data/cameras.json').readAsStringSync())
                  as Map<String, dynamic>)['cameras']
              as List)
          .cast<Map<String, dynamic>>();
  final free = cameras.where((c) => c['isFree'] == true).toList();
  final listed = cameras.where((c) => c['isListed'] != false).toList();

  test('4 kamera gratis dan 7 kamera tampil di etalase (K-034)', () {
    expect(free.map((c) => c['id']), ['saku-35', 'kotak-pos', 'koran', 'pagi']);
    expect(listed.length, 7);
  });

  for (final c in listed) {
    test('${c['id']}: ilustrasi etalase 640x440 transparan', () async {
      final (image, rgba) = await _decode(c['shelfImage'] as String);
      expect((image.width, image.height), (640, 440));
      expect(
        _alpha(image, rgba, 1, 1),
        0,
        reason: 'sudut kiri atas transparan',
      );
    });
  }

  for (final c in free) {
    final id = c['id'] as String;
    test(
      '$id: layout memuat kontrol yang muat, tidak bertumpuk, >= 48',
      () async {
        final layout = jsonDecode(
          await rootBundle.loadString(c['layout'] as String),
        ) as Map<String, dynamic>;
        final ref = layout['reference'] as Map<String, dynamic>;
        expect((ref['width'], ref['height']), (390, 844));
        final canvas = ui.Rect.fromLTWH(0, 0, 390, 844);
        final vf = _rect(layout['viewfinder'] as Map<String, dynamic>);
        expect(
          canvas.contains(vf.topLeft) && canvas.contains(vf.bottomRight),
          isTrue,
        );

        final band = layout['stretchBand'] as Map<String, dynamic>;
        expect(band['top'] as num, greaterThan(vf.top));
        expect(band['bottom'] as num, lessThan(vf.bottom));

        final controls = (layout['controls'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(k, _rect(v as Map<String, dynamic>)),
        );
        expect(controls.keys.toSet(), {
          'close',
          'flash',
          'counter',
          'timer',
          'zoom',
          'flip',
          'lastResult',
          'shutter',
          'switchCamera',
        });
        final names = controls.keys.toList();
        for (var i = 0; i < names.length; i++) {
          final r = controls[names[i]]!;
          expect(r.width >= 48 && r.height >= 48, isTrue, reason: names[i]);
          expect(
            r.left >= 0 && r.right <= 390 && r.top >= 0 && r.bottom <= 844,
            isTrue,
            reason: names[i],
          );
          expect(
            r.overlaps(vf),
            isFalse,
            reason: '${names[i]} menutupi jendela bidik',
          );
          for (var j = i + 1; j < names.length; j++) {
            expect(
              r.overlaps(controls[names[j]]!),
              isFalse,
              reason: '${names[i]} x ${names[j]}',
            );
          }
        }
        final grain =
            (layout['effect'] as Map<String, dynamic>)['grain'] as num;
        expect(grain, inInclusiveRange(0, 1));
        expect((layout['effect'] as Map)['name'], c['effectName']);
      },
    );

    test(
      '$id: overlay 1170x2532, jendela bidik transparan, bodi buram',
      () async {
        final layout = jsonDecode(
          await rootBundle.loadString(c['layout'] as String),
        ) as Map<String, dynamic>;
        final vf = _rect(layout['viewfinder'] as Map<String, dynamic>);
        final (image, rgba) = await _decode(c['overlay'] as String);
        expect((image.width, image.height), (1170, 2532));
        expect(_alpha(image, rgba, vf.center.dx * 3, vf.center.dy * 3), 0);
        // Di bawah jendela bidik (panel rana) dan di atasnya (pelat atas).
        expect(_alpha(image, rgba, 195 * 3, (vf.bottom + 20) * 3), 255);
        expect(_alpha(image, rgba, 195 * 3, (vf.top - 12) * 3), 255);
      },
    );

    test('$id: LUT 512x512 (8x8 petak 64^3)', () async {
      final (image, rgba) = await _decode(c['lut'] as String);
      expect((image.width, image.height), (512, 512));
      // Rentang nada tetap lebar: putih masuk (petak biru 63, x=y=63) jauh
      // lebih terang daripada hitam masuk (petak 0, x=y=0). Pagi sengaja
      // mengangkat hitam, jadi yang diuji selisihnya.
      int r(int x, int y) => rgba.getUint8((y * 512 + x) * 4);
      expect(r(7 * 64 + 63, 7 * 64 + 63) - r(0, 0), greaterThan(150));
    });
  }

  test('koran: LUT hitam-putih (merah murni menjadi abu-abu)', () async {
    final (_, rgba) = await _decode('assets/cameras/koran/lut.png');
    // Merah murni: petak biru 0, x = 63, y = 0.
    final i = 63 * 4;
    final (r, g, b) = (
      rgba.getUint8(i),
      rgba.getUint8(i + 1),
      rgba.getUint8(i + 2),
    );
    expect((r - g).abs(), lessThan(8));
    expect((g - b).abs(), lessThan(10));
  });
}
