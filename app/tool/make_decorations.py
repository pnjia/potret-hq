#!/usr/bin/env python3
"""Membuat SVG hiasan, motif selotip, dan kertas latar (K-031, K-037).

Semua aset buatan sendiri (lisensi `own`), tercatat di data/decorations.json.
Bentuk mengikuti mockup v5 (artboard V5EditSampulHiasan, V5EditKeterangan,
V5EditGayaHalaman).

SVG dibuat sederhana supaya bisa dirender `flutter_svg`/`vector_graphics`:
hanya path, rect, circle, line, g, transform, clipPath, dan fill/stroke opacity.
Tanpa <text> (teks diubah menjadi path dari font yang dibundel), tanpa
<filter>, <pattern>, CSS, atau gambar tertanam. Grain dan bayangan
ditambahkan aplikasi, bukan di SVG.

Pemakaian (dari app/):
    python3 tool/make_decorations.py

Butuh fontTools (`pip install fonttools`).
"""

from __future__ import annotations

import math
import os
from pathlib import Path

from fontTools.pens.svgPathPen import SVGPathPen
from fontTools.pens.transformPen import TransformPen
from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont

APP = Path(__file__).resolve().parent.parent
OUT = APP / "assets" / "decorations"
FONTS = APP / "assets" / "fonts"

# Warna token (data/design-tokens.json) dan warna ilustrasi buatan sendiri.
INK = "#121212"
INK2 = "#5B5B66"
COBALT = "#3048FF"
LIME = "#D4F25C"
LIME_DARK = "#C2DE4A"
PAPER_BOOK = "#F6F5F1"
TAPE = "#EBE8DC"
STAMP_RED = "#B42318"
BUILDING = "#FF8A5B"
TICKET_CREAM = "#F2E4A9"
TICKET_CREAM_DARK = "#E6D48C"
HOLE = "#2B2B30"
RULE_BLUE = "#B9C4F0"
RULE_GRID = "#D3D9EE"
DOT = "#B4B4BE"
MARGIN_RED = "#E8A3A0"

# ---------------------------------------------------------------- teks → path

_font_cache: dict[tuple, TTFont] = {}


def _font(name: str, axes: dict[str, float] | None) -> TTFont:
    key = (name, tuple(sorted((axes or {}).items())))
    if key not in _font_cache:
        font = TTFont(FONTS / name)
        if axes:
            font = instantiateVariableFont(font, axes)
        _font_cache[key] = font
    return _font_cache[key]


def text_path(
    text: str,
    x: float,
    y: float,
    size: float,
    *,
    font: str = "Anybody-Variable.ttf",
    axes: dict[str, float] | None = None,
    spacing: float = 0.0,
    anchor: str = "start",
) -> str:
    """Path `d` untuk [text] dengan garis dasar di (x, y)."""
    f = _font(font, axes)
    cmap = f.getBestCmap()
    glyphs = f.getGlyphSet()
    scale = size / f["head"].unitsPerEm
    names = [cmap.get(ord(ch)) or ".notdef" for ch in text]
    width = sum(f["hmtx"][n][0] * scale for n in names) + spacing * (len(names) - 1)
    if anchor == "middle":
        x -= width / 2
    elif anchor == "end":
        x -= width
    pen = SVGPathPen(glyphs)
    cursor = x
    for n in names:
        tp = TransformPen(pen, (scale, 0, 0, -scale, cursor, y))
        glyphs[n].draw(tp)
        cursor += f["hmtx"][n][0] * scale + spacing
    return pen.getCommands()


def text_on_arc(
    text: str,
    cx: float,
    cy: float,
    r: float,
    size: float,
    *,
    top: bool,
    axes: dict[str, float],
    spacing: float,
) -> str:
    """Huruf demi huruf di busur lingkaran (atas: searah jarum jam)."""
    f = _font("Anybody-Variable.ttf", axes)
    cmap = f.getBestCmap()
    glyphs = f.getGlyphSet()
    scale = size / f["head"].unitsPerEm
    names = [cmap.get(ord(ch)) or ".notdef" for ch in text]
    widths = [f["hmtx"][n][0] * scale for n in names]
    total = sum(widths) + spacing * (len(names) - 1)
    sweep = total / r
    angle = -math.pi / 2 - sweep / 2 if top else math.pi / 2 + sweep / 2
    pen = SVGPathPen(glyphs)
    cap = size * 0.36  # setengah tinggi huruf kapital, kira-kira
    for n, w in zip(names, widths):
        half = (w / 2) / r
        angle += half if top else -half
        px, py = cx + r * math.cos(angle), cy + r * math.sin(angle)
        rot = angle + math.pi / 2 if top else angle - math.pi / 2
        c, s = math.cos(rot), math.sin(rot)
        # Glyph: titik tengah alas di (-w/2, +cap) relatif ke pusat huruf.
        ox, oy = -w / 2, cap
        tx = px + c * ox - s * oy
        ty = py + s * ox + c * oy
        tp = TransformPen(pen, (c * scale, s * scale, s * scale, -c * scale, tx, ty))
        glyphs[n].draw(tp)
        angle += half if top else -half
        angle += (spacing / r) if top else -(spacing / r)
    return pen.getCommands()


ANYBODY_TICKET = {"wdth": 55, "wght": 900}
ANYBODY_SERIAL = {"wdth": 75, "wght": 800}
JAKARTA_BOLD = {"wght": 700}

# ---------------------------------------------------------------- bentuk umum

TAPE_BODY = (
    "M3 2 L97 0 L95 5 L99 9 L95 14 L99 19 L95 24 L98 30 "
    "L2 28 L5 23 L1 18 L5 13 L1 8 L4 4 Z"
)


def svg(view: tuple[float, float, float, float], body: str, label: str) -> str:
    x, y, w, h = view
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="{x:g} {y:g} {w:g} {h:g}" '
        f'width="{w:g}" height="{h:g}">\n'
        f"<!-- {label}. Kliping Kota, buatan sendiri (lisensi own). -->\n"
        f"{body}\n</svg>\n"
    )


def tape(fill_layers: str, label: str) -> str:
    """Selotip 100×30 dengan ujung bergerigi; motif dipotong ke badan selotip."""
    body = (
        f'<defs><clipPath id="t"><path d="{TAPE_BODY}"/></clipPath></defs>\n'
        f'<path d="{TAPE_BODY}" fill="{TAPE}" fill-opacity="0.86"/>\n'
        f'<g clip-path="url(#t)">{fill_layers}</g>\n'
        '<path d="M6 4 L94 2" stroke="#FFFFFF" stroke-width="1.6" '
        'stroke-linecap="round" stroke-opacity="0.7" fill="none"/>'
    )
    return svg((0, 0, 100, 30), body, label)


# ---------------------------------------------------------------- motif selotip


def tape_plain() -> str:
    return tape("", "Motif selotip Polos")


def tape_striped() -> str:
    # Garis surat udara: Kobalt dan Merah cap berselang.
    stripes = []
    for i, color in enumerate([COBALT, STAMP_RED] * 12):
        k = -30 + i * 9
        stripes.append(
            f'<path d="M{k} 34 L{k + 14} -4 L{k + 18.5} -4 L{k + 4.5} 34 Z" '
            f'fill="{color}" fill-opacity="0.62"/>'
        )
    return tape("".join(stripes), "Motif selotip Garis")


def tape_grid() -> str:
    lines = []
    for x in range(0, 101, 6):
        lines.append(f"M{x + 0.5} 0V30")
    for y in range(0, 31, 6):
        lines.append(f"M0 {y + 0.5}H100")
    return tape(
        f'<path d="{"".join(lines)}" stroke="{COBALT}" stroke-width="0.9" '
        'stroke-opacity="0.55" fill="none"/>',
        "Motif selotip Grid",
    )


def tape_halftone() -> str:
    dots = []
    a = math.radians(28)
    for i in range(-10, 30):
        for j in range(-10, 14):
            x = i * 5 * math.cos(a) - j * 5 * math.sin(a)
            y = i * 5 * math.sin(a) + j * 5 * math.cos(a)
            if -2 <= x <= 102 and -2 <= y <= 32:
                dots.append(f'<circle cx="{x:.2f}" cy="{y:.2f}" r="1.15"/>')
    return tape(
        f'<g fill="{HOLE}" fill-opacity="0.42">{"".join(dots)}</g>',
        "Motif selotip Raster",
    )


def tape_ticket() -> str:
    # Karcis: kertas krem, garis perforasi, dan nomor seri kecil berulang.
    serials = "".join(
        f'<path d="{text_path(f"No. {n:03d}", x, 19, 8, axes=ANYBODY_SERIAL, spacing=0.3)}"/>'
        for n, x in [(14, 8), (15, 41), (16, 74)]
    )
    layers = (
        f'<rect x="0" y="0" width="100" height="30" fill="{TICKET_CREAM}" fill-opacity="0.9"/>'
        f'<path d="M35.5 0V30M68.5 0V30" stroke="{INK}" stroke-width="1" '
        'stroke-dasharray="2 2" stroke-opacity="0.45" fill="none"/>'
        f'<g fill="{INK}" fill-opacity="0.72">{serials}</g>'
    )
    return tape(layers, "Motif selotip Karcis")


def tape_text() -> str:
    words = "".join(
        f'<path d="{text_path("KLIPING KOTA", x, 18.8, 8.5, axes=ANYBODY_TICKET, spacing=0.5)}"/>'
        for x in (7, 55)
    )
    layers = f'<g fill="{COBALT}" fill-opacity="0.85">{words}</g>'
    return tape(layers, "Motif selotip Teks")


# ---------------------------------------------------------------- hiasan


def ornament_ticket_angkot() -> str:
    outline = (
        "M4 0 H80 A6 6 0 0 0 92 0 H116 Q120 0 120 4 V56 Q120 60 116 60 "
        "H92 A6 6 0 0 0 80 60 H4 Q0 60 0 56 V4 Q0 0 4 0 Z"
    )
    stub = "M92 0 H116 Q120 0 120 4 V56 Q120 60 116 60 H92 A6 6 0 0 0 86 54 V6 A6 6 0 0 0 92 0 Z"
    stub_text = text_path("No. 014", 0, 0, 9, axes=ANYBODY_SERIAL, spacing=0.4, anchor="middle")
    body = (
        f'<path d="{outline}" fill="{TICKET_CREAM}"/>\n'
        f'<path d="{stub}" fill="{TICKET_CREAM_DARK}"/>\n'
        f'<path d="M0 46 H80 V50 H0 Z" fill="{COBALT}"/>\n'
        f'<path d="{text_path("KARCIS", 9, 29, 24, axes=ANYBODY_TICKET, spacing=0.4)}" fill="{INK}"/>\n'
        f'<path d="{text_path("ANGKOT KOTA", 10, 40, 8.5, axes={"wdth": 80, "wght": 700}, spacing=0.5)}" fill="{INK}"/>\n'
        f'<path d="M86 8 V52" stroke="{INK}" stroke-width="1.2" stroke-dasharray="2.5 2.5" stroke-opacity="0.55" fill="none"/>\n'
        f'<g transform="translate(103 30) rotate(90)"><path d="{stub_text}" fill="{INK}" transform="translate(0 3)"/></g>'
    )
    return svg((0, 0, 120, 60), body, "Hiasan Karcis angkot")


def ornament_category_tag() -> str:
    outline = (
        "M4 1 H116 Q119 1 119 4 V14 A5 5 0 0 0 119 24 V34 Q119 37 116 37 "
        "H4 Q1 37 1 34 V24 A5 5 0 0 0 1 14 V4 Q1 1 4 1 Z"
    )
    body = (
        f'<path d="{outline}" fill="{BUILDING}"/>\n'
        f'<path d="{outline}" fill="none" stroke="{INK}" stroke-width="2"/>\n'
        f'<path d="M14 19 L21 12 L28 19 M16 17 V27 H26 V17" fill="none" stroke="{INK}" stroke-width="2" stroke-linecap="square"/>\n'
        f'<path d="{text_path("Bangunan", 35, 24.5, 14, font="PlusJakartaSans-Variable.ttf", axes=JAKARTA_BOLD)}" fill="{INK}"/>'
    )
    return svg((0, 0, 120, 38), body, "Hiasan Label kategori")


def ornament_punch_holes() -> str:
    holes = []
    for cy in (14, 46, 78):
        holes.append(
            f'<circle cx="13" cy="{cy}" r="11" fill="#FFFFFF" fill-opacity="0.92"/>'
            f'<circle cx="13" cy="{cy}" r="11" fill="none" stroke="{INK}" stroke-opacity="0.28" stroke-width="1"/>'
            f'<circle cx="13" cy="{cy}" r="6" fill="{HOLE}"/>'
            f'<path d="M8.4 {cy + 1.2} a6 6 0 0 1 9.2 -2.6" stroke="#000000" stroke-opacity="0.5" stroke-width="2" fill="none"/>'
        )
    return svg((0, 0, 26, 92), "\n".join(holes), "Hiasan Lubang pons")


def ornament_post_stamp() -> str:
    # Cap pos umum (tanpa nama kota dan tanpa tanggal); cap kota yang
    # sebenarnya digambar aplikasi (CityStamp).
    wave_d = " ".join(
        "M" + " L".join(
            f"{x:.1f} {34 + i * 17 + 4 * math.sin((x - 122) / 22 * 2 * math.pi):.2f}"
            for x in range(122, 197, 3)
        )
        for i in range(4)
    )
    top = text_on_arc("KLIPING KOTA", 60, 60, 46, 13, top=True, axes=ANYBODY_SERIAL, spacing=1.2)
    bottom = text_on_arc("POS KOTA", 60, 60, 46, 11, top=False, axes=ANYBODY_SERIAL, spacing=1.6)
    body = (
        f'<g fill="none" stroke="{COBALT}" stroke-linecap="round">'
        '<circle cx="60" cy="60" r="55" stroke-width="3.6"/>'
        '<circle cx="60" cy="60" r="37" stroke-width="1.8"/>'
        f'<path d="{wave_d}" stroke-width="3"/>'
        '<path d="M36 54 H84 M36 66 H84" stroke-width="2.4"/></g>\n'
        f'<path d="{top}" fill="{COBALT}"/>\n'
        f'<path d="{bottom}" fill="{COBALT}"/>\n'
        f'<path d="M60 52 L62.4 57 L68 57.6 L63.8 61.2 L65 66.6 L60 63.8 L55 66.6 L56.2 61.2 L52 57.6 L57.6 57 Z" fill="{COBALT}" transform="translate(0 0.4)"/>'
    )
    return svg((0, 0, 200, 120), body, "Hiasan Cap pos")


def ornament_number_label() -> str:
    body = (
        '<path d="M2 0 H108 Q110 0 110 2 V36 Q110 38 108 38 H2 Q0 38 0 36 V2 Q0 0 2 0 Z" fill="#FFFFFF"/>\n'
        f'<path d="M0 2 Q0 0 2 0 H32 V38 H2 Q0 38 0 36 Z" fill="{COBALT}"/>\n'
        f'<path d="M0.5 2 Q0.5 0.5 2 0.5 H108 Q109.5 0.5 109.5 2 V36 Q109.5 37.5 108 37.5 H2 Q0.5 37.5 0.5 36 Z" fill="none" stroke="{COBALT}" stroke-width="1"/>\n'
        f'<path d="M35 4 H106 V34 H35 Z" fill="none" stroke="{COBALT}" stroke-width="1.4"/>\n'
        f'<path d="{text_path("R", 16, 28, 24, axes=ANYBODY_TICKET, anchor="middle")}" fill="#FFFFFF"/>\n'
        f'<path d="{text_path("No. 014", 70.5, 25, 16, axes=ANYBODY_SERIAL, spacing=0.6, anchor="middle")}" fill="{INK}"/>'
    )
    return svg((0, 0, 110, 38), body, "Hiasan Label nomor")


def ornament_crop_marks() -> str:
    body = (
        f'<path d="M0 15 H12 M15 0 V12 M46 15 H58 M43 0 V12 M0 33 H12 M15 36 V48 M46 33 H58 M43 36 V48" '
        f'fill="none" stroke="{COBALT}" stroke-width="2" stroke-linecap="square"/>\n'
        f'<path d="M15 15 H43 V33 H15 Z" fill="none" stroke="{INK2}" stroke-width="1" stroke-dasharray="2 2"/>'
    )
    return svg((0, 0, 58, 48), body, "Hiasan Tanda potong")


def ornament_pen_arrow() -> str:
    body = (
        f'<g fill="none" stroke="{COBALT}" stroke-linecap="round" stroke-linejoin="round">'
        '<path d="M6 52 C30 60 58 54 72 36 C82 22 70 10 61 22 C52 36 84 42 110 18" stroke-width="3.8"/>'
        '<path d="M96 15 L111 17 L106 31" stroke-width="3.8"/>'
        '<path d="M10 58 C22 61 34 61 44 59" stroke-width="2"/></g>'
    )
    return svg((0, 0, 120, 64), body, "Hiasan Panah pulpen")


def ornament_highlighter() -> str:
    body = (
        f'<path d="M6 9 L134 3 L137 23 L3 29 Z" fill="{LIME}"/>\n'
        f'<path d="M10 14 L120 10 L121 16 L11 20 Z" fill="{LIME_DARK}" fill-opacity="0.7"/>\n'
        f'<path d="M118 4 L134 3 L137 23 L128 24 Z" fill="{LIME_DARK}" fill-opacity="0.6"/>'
    )
    return svg((0, 0, 140, 32), body, "Hiasan Coretan stabilo")


def ornament_marker_circle() -> str:
    body = (
        f'<path d="M72 8 C32 3 6 22 10 44 C14 68 70 76 102 60 C122 48 114 18 84 10 C70 6 52 8 38 15" '
        f'fill="none" stroke="{COBALT}" stroke-width="3.4" stroke-linecap="round"/>'
    )
    return svg((0, 0, 120, 80), body, "Hiasan Lingkaran spidol")


# ---------------------------------------------------------------- kertas latar

PAGE_W, PAGE_H = 360, 584  # rasio halaman buku mockup v5 (±0,616)


def paper(lines: str, label: str) -> str:
    body = f'<rect x="0" y="0" width="{PAGE_W}" height="{PAGE_H}" fill="{PAPER_BOOK}"/>\n{lines}'
    return svg((0, 0, PAGE_W, PAGE_H), body, label)


def paper_plain() -> str:
    return paper("", "Kertas latar Polos")


def paper_lined() -> str:
    rows = "".join(f"M0 {y + 0.5}H{PAGE_W}" for y in range(72, PAGE_H - 16, 24))
    return paper(
        f'<path d="{rows}" stroke="{RULE_BLUE}" stroke-width="1" fill="none"/>\n'
        f'<path d="M44.5 0V{PAGE_H}" stroke="{MARGIN_RED}" stroke-width="1.2" fill="none"/>',
        "Kertas latar Garis",
    )


def paper_dotted() -> str:
    dots = "".join(
        f'<circle cx="{x}" cy="{y}" r="1.1"/>'
        for x in range(12, PAGE_W, 16)
        for y in range(12, PAGE_H, 16)
    )
    return paper(f'<g fill="{DOT}">{dots}</g>', "Kertas latar Titik")


def paper_grid() -> str:
    d = "".join(f"M{x + 0.5} 0V{PAGE_H}" for x in range(4, PAGE_W, 16))
    d += "".join(f"M0 {y + 0.5}H{PAGE_W}" for y in range(4, PAGE_H, 16))
    return paper(
        f'<path d="{d}" stroke="{RULE_GRID}" stroke-width="1" fill="none"/>',
        "Kertas latar Grid",
    )


# ---------------------------------------------------------------- tulis

ASSETS = {
    "tapes/plain.svg": tape_plain,
    "tapes/striped.svg": tape_striped,
    "tapes/grid.svg": tape_grid,
    "tapes/halftone.svg": tape_halftone,
    "tapes/ticket.svg": tape_ticket,
    "tapes/text.svg": tape_text,
    "ornaments/ticket-angkot.svg": ornament_ticket_angkot,
    "ornaments/category-tag.svg": ornament_category_tag,
    "ornaments/punch-holes.svg": ornament_punch_holes,
    "ornaments/post-stamp.svg": ornament_post_stamp,
    "ornaments/number-label.svg": ornament_number_label,
    "ornaments/crop-marks.svg": ornament_crop_marks,
    "ornaments/pen-arrow.svg": ornament_pen_arrow,
    "ornaments/highlighter.svg": ornament_highlighter,
    "ornaments/marker-circle.svg": ornament_marker_circle,
    "papers/plain.svg": paper_plain,
    "papers/lined.svg": paper_lined,
    "papers/dotted.svg": paper_dotted,
    "papers/grid.svg": paper_grid,
}


def main() -> None:
    for rel, make in ASSETS.items():
        path = OUT / rel
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(make(), encoding="utf-8")
        print(f"{rel}  {os.path.getsize(path)} B")


if __name__ == "__main__":
    main()
