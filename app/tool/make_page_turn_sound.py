#!/usr/bin/env python3
"""Membuat suara buka halaman PLACEHOLDER untuk prototipe K-012.

Suara ini disintesis sendiri (noise berfilter + envelope), bukan rekaman dan
bukan unduhan. Tujuannya hanya mengisi slot suara sampai rekaman foley sendiri
tersedia (K-024). Hanya memakai pustaka standar Python, deterministik (seed
tetap), jadi hasilnya sama setiap dijalankan.

Pakai (dari root repo):
    python3 app/tool/make_page_turn_sound.py
Hasil: app/assets/sounds/page-turn-placeholder.wav (mono, 22.050 Hz, 16-bit).
"""

import math
import os
import random
import struct
import wave

SAMPLE_RATE = 22050
DURATION_S = 0.42
SEED = 20261118

OUT = os.path.join(
    os.path.dirname(os.path.abspath(__file__)),
    "..",
    "assets",
    "sounds",
    "page-turn-placeholder.wav",
)


def envelope(t: float) -> float:
    """Desis kertas: naik cepat, menurun pelan, lalu 'tepukan' kecil di akhir."""
    swish = 0.0
    if t < 0.06:
        swish = t / 0.06
    else:
        swish = math.exp(-(t - 0.06) * 7.0)
    swish *= 0.75
    flap_t = t - 0.30
    flap = 0.0
    if flap_t >= 0:
        flap = 0.9 * math.exp(-flap_t * 55.0)
    return swish + flap


def main() -> None:
    rng = random.Random(SEED)
    n = int(SAMPLE_RATE * DURATION_S)
    samples = []
    lp = 0.0  # low-pass satu kutub
    hp_prev_in = 0.0
    hp_prev_out = 0.0
    for i in range(n):
        t = i / SAMPLE_RATE
        noise = rng.uniform(-1.0, 1.0)
        # Cutoff low-pass menyapu dari terang ke redup: kertas bergeser lalu jatuh.
        cutoff_hz = 5200.0 - 3800.0 * min(t / DURATION_S, 1.0)
        alpha = 1.0 - math.exp(-2.0 * math.pi * cutoff_hz / SAMPLE_RATE)
        lp += alpha * (noise - lp)
        # High-pass ±250 Hz supaya tidak berdengung.
        rc = 1.0 / (2.0 * math.pi * 250.0)
        a_hp = rc / (rc + 1.0 / SAMPLE_RATE)
        hp = a_hp * (hp_prev_out + lp - hp_prev_in)
        hp_prev_in, hp_prev_out = lp, hp
        samples.append(hp * envelope(t))

    # Fade-out 10 ms di ujung supaya tidak ada klik.
    fade = int(0.01 * SAMPLE_RATE)
    for k in range(fade):
        samples[n - fade + k] *= 1.0 - (k + 1) / fade

    peak = max(abs(s) for s in samples) or 1.0
    gain = 0.7 / peak
    frames = b"".join(
        struct.pack("<h", int(max(-1.0, min(1.0, s * gain)) * 32767)) for s in samples
    )

    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with wave.open(OUT, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(SAMPLE_RATE)
        w.writeframes(frames)
    print(f"ditulis: {os.path.normpath(OUT)} ({len(frames) + 44} byte)")


if __name__ == "__main__":
    main()
