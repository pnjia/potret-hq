import 'dart:convert';

import 'package:flutter/services.dart';

import '../core/category_style.dart';

/// `City` dari data/cities.json (glosarium bagian 4).
final class City {
  const City({
    required this.id,
    required this.name,
    required this.province,
    required this.findingTarget,
    required this.isCurated,
  });

  final String id;
  final String name;
  final String province;

  /// Angka kedua stempel kota, "13/100" (K-028).
  final int findingTarget;
  final bool isCurated;
}

/// `Landmark` dari data/cities.json. `lat`/`lng` adalah titik tempat publik
/// untuk pencocokan radius di perangkat, bukan lokasi pengguna (K-011).
final class Landmark {
  const Landmark({
    required this.id,
    required this.cityId,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
    required this.radiusM,
    required this.verified,
  });

  final String id;
  final String cityId;
  final String name;
  final CategoryId category;
  final double lat;
  final double lng;
  final int radiusM;
  final bool verified;
}

/// Katalog baca-saja yang dibundel di `assets/catalog/` (salinan data/).
final class Catalog {
  const Catalog({required this.cities, required this.landmarks});

  final List<City> cities;
  final List<Landmark> landmarks;

  City? city(String id) {
    for (final c in cities) {
      if (c.id == id) return c;
    }
    return null;
  }

  List<Landmark> landmarksOf(String cityId) => [
    for (final l in landmarks)
      if (l.cityId == cityId) l,
  ];
}

class CatalogRepository {
  CatalogRepository(this._bundle);

  final AssetBundle _bundle;

  /// Kota MVP (K-029); kota aktif bawaan sebelum pengguna memotret.
  static const defaultCityId = 'sukabumi';

  Future<Catalog> load() async {
    final json = jsonDecode(
      // Tanpa cache bundle: katalog dimuat sekali oleh catalogProvider.
      await _bundle.loadString('assets/catalog/cities.json', cache: false),
    ) as Map<String, dynamic>;
    final categories = {for (final c in CategoryId.values) c.name: c};
    return Catalog(
      cities: [
        for (final c in (json['cities'] as List).cast<Map<String, dynamic>>())
          // Entri contoh tidak pernah dipakai aplikasi (data/README.md).
          if (c['example'] != true)
            City(
              id: c['id'] as String,
              name: c['name'] as String,
              province: c['province'] as String,
              findingTarget: c['findingTarget'] as int,
              isCurated: c['isCurated'] as bool,
            ),
      ],
      landmarks: [
        for (final l
            in (json['landmarks'] as List).cast<Map<String, dynamic>>())
          if (l['example'] != true)
            Landmark(
              id: l['id'] as String,
              cityId: l['cityId'] as String,
              name: l['name'] as String,
              category: categories[l['category']] ?? CategoryId.other,
              lat: (l['lat'] as num).toDouble(),
              lng: (l['lng'] as num).toDouble(),
              radiusM: l['radiusM'] as int,
              verified: l['verified'] as bool,
            ),
      ],
    );
  }
}
