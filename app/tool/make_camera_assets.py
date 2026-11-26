#!/usr/bin/env python3
"""Membuat aset 4 kamera gratis (K-034): layout.json, overlay.png, lut.png.

Langkah (dari app/):
    node tool/render_camera_art.cjs      # bodi + ilustrasi etalase (Chromium)
    python3 tool/make_camera_assets.py   # layout, lubang jendela bidik, LUT

Butuh numpy dan Pillow.

overlay.png
    Bodi kamera layar penuh, 1170x2532 (3x dari kanvas acuan 390x844).
    Jendela bidik transparan; pratinjau kamera digambar di bawahnya.
    Tombol (tutup, lampu kilat, penghitung, Timer, Zoom, Balik, temuan
    terakhir, rana, Ganti kamera) TIDAK ada di gambar: aplikasi menggambarnya
    sebagai widget asli di posisi layout.json supaya bisa diakses.

layout.json
    Posisi dalam kanvas acuan 390x844. Untuk layar yang lebih tinggi atau
    lebih pendek, hanya pita `stretchBand` (sisi jendela bidik yang lurus)
    yang diregang ke atas/bawah; bagian atas dan bawah bodi tidak berubah.

lut.png
    LUT 3D 64^3 dalam gambar 512x512: 8x8 petak 64x64. Petak ke-b (baris
    b // 8, kolom b % 8) = biru b; di dalam petak x = merah, y = hijau.
    Butir (grain) bukan bagian LUT; kekuatannya ada di layout.json `effect`.
"""

from __future__ import annotations

import json
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw

APP = Path(__file__).resolve().parent.parent
ASSETS = APP / "assets" / "cameras"
BUILD = APP / "build" / "camera_art"
SCALE = 3


def rect(x, y, w, h):
    return {"x": x, "y": y, "width": w, "height": h}


# Diukur dari mockup v5 (artboard V5Kamera, V5KameraKotakPos, V5KameraKoran,
# V5KameraPagi). Tombol 48 px; Timer/Zoom/Balik 64 px termasuk label.
LAYOUTS = {
    "saku-35": {
        "stretchBand": {"top": 250, "bottom": 450},
        "viewfinder": {**rect(30, 124, 330, 440), "radius": 10},
        "controls": {
            "close": rect(22, 54, 48, 48),
            "flash": rect(262, 54, 48, 48),
            "counter": rect(318, 54, 52, 48),
            "timer": rect(26, 588, 64, 69),
            "zoom": rect(94, 588, 64, 69),
            "flip": rect(300, 588, 64, 69),
            "lastResult": rect(28, 692, 68, 68),
            "shutter": rect(147, 678, 96, 96),
            "switchCamera": rect(294, 686, 80, 89),
        },
        "style": {
            "button": {"shape": "roundedRect", "radius": 8, "fill": "#DDE0E4", "border": "#121212", "borderWidth": 2, "icon": "#121212"},
            "label": {"text": "#121212", "background": "#C9CCD1"},
            "counter": {"fill": "#121212", "border": "#121212", "text": "#D4F25C"},
            "shutter": {"ring": "#3048FF", "ringWidth": 6, "fill": "#EEF0F2", "outline": "#121212"},
        },
        "effect": {"name": "CCD hangat", "grain": 0.10},
    },
    "kotak-pos": {
        "stretchBand": {"top": 260, "bottom": 460},
        "viewfinder": {**rect(42, 168, 306, 398), "radius": 18},
        "controls": {
            "close": rect(24, 92, 48, 48),
            "flash": rect(264, 92, 48, 48),
            "counter": rect(318, 92, 52, 48),
            "timer": rect(24, 594, 64, 73),
            "zoom": rect(92, 594, 64, 73),
            "flip": rect(302, 594, 64, 73),
            "lastResult": rect(24, 692, 68, 68),
            "shutter": rect(145, 676, 100, 100),
            "switchCamera": rect(296, 686, 80, 89),
        },
        "style": {
            "button": {"shape": "circle", "radius": 0, "fill": "#1E1B18", "border": None, "borderWidth": 0, "icon": "#FFFFFF"},
            "label": {"text": "#121212", "background": "#FF7A2F"},
            "counter": {"fill": "#121212", "border": "#1E1B18", "text": "#D4F25C"},
            "shutter": {"ring": "#1E1B18", "ringWidth": 8, "fill": "#3048FF", "outline": "#FFFFFF"},
        },
        "effect": {"name": "Warna pop cerah", "grain": 0.0},
    },
    "koran": {
        "stretchBand": {"top": 240, "bottom": 440},
        "viewfinder": {**rect(28, 128, 334, 436), "radius": 2},
        "controls": {
            "close": rect(24, 56, 48, 48),
            "flash": rect(260, 56, 48, 48),
            "counter": rect(316, 56, 52, 48),
            "timer": rect(26, 584, 64, 69),
            "zoom": rect(94, 584, 64, 69),
            "flip": rect(300, 584, 64, 69),
            "lastResult": rect(32, 712, 68, 68),
            "shutter": rect(149, 698, 92, 92),
            "switchCamera": rect(292, 694, 80, 89),
        },
        "style": {
            "button": {"shape": "roundedRect", "radius": 3, "fill": "#2A2A30", "border": "#E9E5DA", "borderWidth": 2, "icon": "#FFFFFF"},
            "label": {"text": "#FFFFFF", "background": "#1E1E22"},
            "counter": {"fill": "#121212", "border": "#E9E5DA", "text": "#D4F25C"},
            "shutter": {"ring": "#F3F1EA", "ringWidth": 10, "fill": "#3048FF", "outline": "#121212"},
        },
        "effect": {"name": "Hitam-putih kasar", "grain": 0.35},
    },
    "pagi": {
        "stretchBand": {"top": 230, "bottom": 400},
        "viewfinder": {**rect(32, 138, 326, 428), "radius": 28},
        "controls": {
            "close": rect(24, 52, 48, 48),
            "flash": rect(258, 52, 48, 48),
            "counter": rect(318, 52, 52, 48),
            "timer": rect(28, 590, 64, 69),
            "zoom": rect(96, 590, 64, 69),
            "flip": rect(298, 590, 64, 69),
            "lastResult": rect(26, 694, 68, 68),
            "shutter": rect(146, 679, 98, 98),
            "switchCamera": rect(290, 688, 80, 89),
        },
        "style": {
            "button": {"shape": "circle", "radius": 0, "fill": "#F3EBD3", "border": "#121212", "borderWidth": 2, "icon": "#121212"},
            "label": {"text": "#121212", "background": "#9FE0C3"},
            "counter": {"fill": "#121212", "border": "#121212", "text": "#D4F25C"},
            "shutter": {"ring": "#F3EBD3", "ringWidth": 6, "fill": "#FFD84D", "outline": "#121212"},
        },
        "effect": {"name": "Pastel pudar", "grain": 0.06},
    },
}

# ------------------------------------------------------------------ LUT

N = 64


def _identity() -> np.ndarray:
    """Grid (N, N, N, 3) berindeks [b, g, r] berisi warna masukan 0..1."""
    v = np.linspace(0.0, 1.0, N)
    b, g, r = np.meshgrid(v, v, v, indexing="ij")
    return np.stack([r, g, b], axis=-1)


def _luma(c):
    return c[..., 0] * 0.2126 + c[..., 1] * 0.7152 + c[..., 2] * 0.0722


def _saturate(c, amount):
    y = _luma(c)[..., None]
    return y + (c - y) * amount


def _contrast(c, amount, pivot=0.5):
    return (c - pivot) * amount + pivot


def _s_curve(x, strength):
    """Kurva S halus; strength 0 = linear."""
    s = x * x * (3 - 2 * x)
    return x + (s - x) * strength


def _lift(c, black, white=1.0):
    return black + c * (white - black)


def lut_saku_35(c):
    # CCD hangat: white balance hangat, kontras lembut, hitam sedikit terangkat,
    # hijau sedikit ke kuning seperti kamera saku digital awal.
    c = c * np.array([1.06, 1.0, 0.88])
    c[..., 1] += (c[..., 0] - c[..., 1]) * 0.05
    c = _s_curve(np.clip(c, 0, 1), 0.35)
    c = _saturate(c, 1.08)
    return _lift(c, 0.035, 0.985)


def lut_kotak_pos(c):
    # Warna pop cerah: saturasi dan kontras tinggi, sedikit hangat.
    c = _saturate(c, 1.38)
    c = _s_curve(np.clip(c, 0, 1), 0.7)
    c = c * np.array([1.03, 1.0, 0.97])
    return _lift(c, 0.0, 1.0)


def lut_koran(c):
    # Hitam-putih kasar: luminans dengan kontras keras, hitam pekat, kertas
    # sedikit hangat. Butir dari shader (effect.grain).
    y = _luma(c)
    y = _contrast(y, 1.45, 0.48)
    y = _s_curve(np.clip(y, 0, 1), 0.6)
    y = np.clip(y, 0, 1)
    paper = np.array([0.965, 0.955, 0.93])
    return y[..., None] * paper


def lut_pagi(c):
    # Pastel pudar: kontras rendah, bayangan terangkat ke hijau mint, sorotan
    # krem, saturasi turun.
    c = _saturate(c, 0.72)
    c = _contrast(c, 0.78)
    y = _luma(np.clip(c, 0, 1))[..., None]
    shadow = np.array([0.62, 0.80, 0.74])  # mint
    high = np.array([0.98, 0.95, 0.86])  # krem
    c = c * 0.86 + (shadow * (1 - y) + high * y) * 0.14
    return _lift(c, 0.10, 0.97)


LUTS = {
    "saku-35": lut_saku_35,
    "kotak-pos": lut_kotak_pos,
    "koran": lut_koran,
    "pagi": lut_pagi,
}


def lut_image(fn) -> Image.Image:
    grid = np.clip(fn(_identity()), 0, 1)  # [b, g, r, 3]
    img = np.zeros((8 * N, 8 * N, 3), dtype=np.float64)
    for b in range(N):
        row, col = divmod(b, 8)
        img[row * N:(row + 1) * N, col * N:(col + 1) * N] = grid[b]
    return Image.fromarray((img * 255 + 0.5).astype(np.uint8), "RGB")


def apply_lut(img: Image.Image, lut: Image.Image) -> Image.Image:
    """Penerapan LUT tetangga terdekat (untuk pratinjau saja)."""
    a = np.asarray(img.convert("RGB")).astype(np.int32) * (N - 1) // 255
    l = np.asarray(lut)
    r, g, b = a[..., 0], a[..., 1], a[..., 2]
    ys = (b // 8) * N + g
    xs = (b % 8) * N + r
    return Image.fromarray(l[ys, xs].astype(np.uint8), "RGB")


# ------------------------------------------------------------------ overlay


def punch_viewfinder(body: Image.Image, vf: dict) -> Image.Image:
    """Membuat jendela bidik transparan (persegi membulat, antialias 4x)."""
    w, h = body.size
    ss = 4
    mask = Image.new("L", (w * ss, h * ss), 255)
    d = ImageDraw.Draw(mask)
    x0, y0 = vf["x"] * SCALE * ss, vf["y"] * SCALE * ss
    x1, y1 = x0 + vf["width"] * SCALE * ss, y0 + vf["height"] * SCALE * ss
    d.rounded_rectangle([x0, y0, x1 - 1, y1 - 1], radius=vf["radius"] * SCALE * ss, fill=0)
    mask = mask.resize((w, h), Image.LANCZOS)
    out = body.convert("RGBA")
    out.putalpha(mask)
    return out


def make_sample(path: Path) -> None:
    """Gambar uji pratinjau LUT: langit, tanah, stiker contoh, rampa abu-abu,
    dan spektrum warna."""
    import colorsys

    w, h = 360, 480
    img = np.zeros((h, w, 3), dtype=np.uint8)
    t = np.linspace(0, 1, 300)[:, None]
    img[:300] = np.stack([120 + 100 * t, 170 + 60 * t, 230 - 10 * t], -1).astype(np.uint8)
    img[300:] = (150, 140, 120)
    ramp = np.linspace(0, 255, w).astype(np.uint8)
    img[420:450] = np.stack([ramp] * 3, -1)
    hues = np.array([colorsys.hsv_to_rgb(x / w, 0.75, 0.9) for x in range(w)]) * 255
    img[450:480] = hues.astype(np.uint8)
    out = Image.fromarray(img, "RGB")
    for name, (x, y, width) in {
        "church": (20, 60, 200),
        "angkot": (170, 250, 180),
        "mochi": (20, 300, 140),
        "warung-sign": (200, 40, 140),
    }.items():
        sticker = Image.open(APP / "assets" / "demo" / f"{name}.png").convert("RGBA")
        sticker = sticker.resize((width, round(sticker.height * width / sticker.width)))
        out.paste(sticker, (x, y), sticker)
    path.parent.mkdir(parents=True, exist_ok=True)
    out.save(path)


def main() -> None:
    previews = []
    sample = BUILD / "sample.png"
    make_sample(sample)
    for cam, layout in LAYOUTS.items():
        dst = ASSETS / cam
        dst.mkdir(parents=True, exist_ok=True)
        doc = {"reference": {"width": 390, "height": 844}, **layout}
        (dst / "layout.json").write_text(json.dumps(doc, ensure_ascii=False, indent=2) + "\n")

        body = Image.open(BUILD / f"{cam}-body.png")
        assert body.size == (390 * SCALE, 844 * SCALE), body.size
        overlay = punch_viewfinder(body, layout["viewfinder"])
        overlay.save(dst / "overlay.png", optimize=True)

        lut = lut_image(LUTS[cam])
        lut.save(dst / "lut.png", optimize=True)
        if sample.exists():
            previews.append(apply_lut(Image.open(sample), lut))
        print(f"assets/cameras/{cam}/ layout.json overlay.png lut.png")

    if previews:
        w, h = previews[0].size
        sheet = Image.new("RGB", (w * (len(previews) + 1), h), "white")
        sheet.paste(Image.open(sample).convert("RGB"), (0, 0))
        for i, p in enumerate(previews, 1):
            sheet.paste(p, (w * i, 0))
        sheet.save(BUILD / "lut-preview.png")
        print("build/camera_art/lut-preview.png")


if __name__ == "__main__":
    main()
