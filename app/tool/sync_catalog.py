#!/usr/bin/env python3
"""Menyalin katalog dari data/ (sumber tunggal) ke app/assets/catalog/.

Flutter hanya bisa membundel file di dalam app/, jadi katalog kota, landmark,
dan kategori disalin apa adanya. test/data/catalog_repository_test.dart gagal
bila salinan berbeda dari sumbernya.

Pemakaian (dari app/): python3 tool/sync_catalog.py
"""

import shutil
from pathlib import Path

APP = Path(__file__).resolve().parent.parent
FILES = ["cities.json", "categories.json"]

for name in FILES:
    shutil.copyfile(APP.parent / "data" / name, APP / "assets" / "catalog" / name)
    print(f"assets/catalog/{name}")
