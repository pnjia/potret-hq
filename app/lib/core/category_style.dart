import 'dart:ui' show Color;

import 'theme/design_tokens.dart';
import 'widgets/app_icon.dart';

/// Id kategori temuan (`Finding.category`, glosarium; daftar di
/// data/categories.json, K-020). Dinamai `CategoryId` karena `Category`
/// bentrok dengan anotasi bawaan Flutter.
enum CategoryId {
  sign,
  food,
  drink,
  vehicle,
  animal,
  plant,
  building,
  object,
  other,
}

/// Rupa satu kategori di UI: warna token, ikon, dan label pendek.
///
/// Label pendek adalah teks UI untuk karcis kategori (mockup v5); nama
/// panjangnya ada di data/categories.json (`name`).
final class CategoryStyle {
  const CategoryStyle(this.color, this.icon, this.label);

  final Color color;
  final AppIconGlyph icon;
  final String label;

  static CategoryStyle of(CategoryId id) => switch (id) {
    CategoryId.sign => const CategoryStyle(
      TokenColors.categorySign,
      AppIconGlyph.sign,
      'Papan nama',
    ),
    CategoryId.food => const CategoryStyle(
      TokenColors.categoryFood,
      AppIconGlyph.food,
      'Makanan',
    ),
    CategoryId.drink => const CategoryStyle(
      TokenColors.categoryDrink,
      AppIconGlyph.drink,
      'Minuman',
    ),
    CategoryId.vehicle => const CategoryStyle(
      TokenColors.categoryVehicle,
      AppIconGlyph.vehicle,
      'Kendaraan',
    ),
    CategoryId.animal => const CategoryStyle(
      TokenColors.categoryAnimal,
      AppIconGlyph.animal,
      'Hewan',
    ),
    CategoryId.plant => const CategoryStyle(
      TokenColors.categoryPlant,
      AppIconGlyph.plant,
      'Tanaman',
    ),
    CategoryId.building => const CategoryStyle(
      TokenColors.categoryBuilding,
      AppIconGlyph.building,
      'Bangunan',
    ),
    CategoryId.object => const CategoryStyle(
      TokenColors.categoryObject,
      AppIconGlyph.object,
      'Barang',
    ),
    CategoryId.other => const CategoryStyle(
      TokenColors.categoryOther,
      AppIconGlyph.other,
      'Lainnya',
    ),
  };
}
