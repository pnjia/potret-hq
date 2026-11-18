#version 460 core
// Probe backend renderer (prototipe K-012). Digambar sekali ke gambar 1x1.
//
// Kanal merah = penanda varian shader yang dipilih engine saat runtime.
// Penanda diambil dari makro yang terbukti didefinisikan impellerc Flutter
// 3.50 per runtime stage (dicek dengan mengompilasi shader ini):
//   SKIA_GRAPHICS_BACKEND      -> varian SkSL (renderer Skia)
//   IMPELLER_TARGET_OPENGLES   -> varian GLES / GLES3 (Impeller OpenGLES)
//   selain itu                 -> varian Impeller lain (Vulkan di Android,
//                                 Metal di iOS)
// Kanal hijau/biru = warna tekstur uTex di uv (0.5, 0.25). uTex dibuat dengan
// Picture.toImage: setengah atas merah, setengah bawah biru. Bila hasilnya
// biru, sumbu y tekstur terbalik di backend ini dan PageCurl harus membaliknya.

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform sampler2D uTex;

out vec4 fragColor;

void main() {
  float tag = 0.0;
#if defined(SKIA_GRAPHICS_BACKEND)
  tag = 1.0;
#elif defined(IMPELLER_TARGET_OPENGLES)
  tag = 0.2;
#else
  tag = 0.6;
#endif
  vec4 s = texture(uTex, vec2(0.5, 0.25));
  fragColor = vec4(tag, s.r, s.b, 1.0);
}
