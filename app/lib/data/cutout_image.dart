import 'dart:io';

import 'package:flutter/painting.dart';

/// [ImageProvider] untuk URI gambar temuan (`cutoutUrl`, `thumbUrl`):
/// `asset:` (data contoh), `file://` (belum tersinkron), `https://`.
ImageProvider cutoutImage(String uri) {
  if (uri.startsWith('asset:')) {
    return AssetImage(uri.substring(6));
  }
  if (uri.startsWith('file://')) {
    return FileImage(File(Uri.parse(uri).toFilePath()));
  }
  return NetworkImage(uri);
}
