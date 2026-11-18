#version 460 core
// PageCurl (prototipe K-012): model silinder satu lintasan.
//
// Bagian halaman yang melewati sumbu (searah uNormal) digulung pada silinder
// berjari-jari uRadius yang sumbunya melewati uAxis. Untuk setiap piksel layar
// dicari lapisan teratas: punggung lipatan (z = 2R), sisi silinder atas
// (punggung), sisi silinder bawah (muka), muka halaman yang masih datar, atau
// halaman di bawahnya (uUnder). Maksimal tiga sampel tekstur per piksel.
//
// Semua koordinat dalam piksel logis halaman (FlutterFragCoord, asal di kiri
// atas). uFlipY = 1 bila hasil probe di perangkat menunjukkan tekstur dari
// Picture.toImage terbaca terbalik (lihat renderer_probe.frag).

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec2 uAxis;
uniform vec2 uNormal;
uniform float uRadius;
uniform float uFlipY;
uniform vec3 uPaper;
uniform sampler2D uFront;
uniform sampler2D uUnder;

out vec4 fragColor;

const float PI = 3.14159265;
// Seberapa tembus pandang isi halaman di punggung kertas.
const float GHOST = 0.10;

// SkSL tidak menerima sampler sebagai parameter, jadi ada dua fungsi.
vec2 toUv(vec2 p) {
  vec2 uv = p / uSize;
  uv.y = mix(uv.y, 1.0 - uv.y, uFlipY);
  return uv;
}

vec4 front(vec2 p) {
  return texture(uFront, toUv(p));
}

vec4 under(vec2 p) {
  return texture(uUnder, toUv(p));
}

float inside(vec2 q) {
  vec2 s = step(vec2(0.0), q) * step(q, uSize);
  return s.x * s.y;
}

vec4 backSide(vec2 q, float shade) {
  vec3 ghost = front(q).rgb;
  return vec4(mix(uPaper, ghost, GHOST) * shade, 1.0);
}

void main() {
  vec2 p = FlutterFragCoord().xy;
  float r = max(uRadius, 0.001);
  float d = dot(p - uAxis, uNormal);
  vec4 color;

  if (d > r) {
    // Halaman bawah, dengan bayangan lembut di dekat lengkungan.
    vec4 u = under(p);
    float shadow = 1.0 - 0.30 * (1.0 - smoothstep(0.0, r * 1.5, d - r));
    color = vec4(u.rgb * shadow, u.a);
  } else if (d >= 0.0) {
    float a = asin(clamp(d / r, 0.0, 1.0));
    // Sisi atas silinder (punggung kertas) di sudut pi - a; sisi bawah
    // (muka halaman) di sudut a.
    float t2 = PI - a;
    vec2 q2 = p + (r * t2 - d) * uNormal;
    vec2 q1 = p + (r * a - d) * uNormal;
    if (inside(q2) > 0.5) {
      color = backSide(q2, 1.0 - 0.22 * sin(t2));
    } else if (inside(q1) > 0.5) {
      vec4 f = front(q1);
      color = vec4(f.rgb * (1.0 - 0.38 * sin(a)), f.a);
    } else {
      vec4 u = under(p);
      color = vec4(u.rgb * 0.72, u.a);
    }
  } else {
    // Punggung lipatan yang sudah rebah di atas, atau muka halaman datar.
    vec2 qb = p + (PI * r - 2.0 * d) * uNormal;
    if (inside(qb) > 0.5) {
      color = backSide(qb, 0.97);
    } else {
      vec4 f = front(p);
      float lift = 1.0 - 0.18 * smoothstep(-r, 0.0, d);
      color = vec4(f.rgb * lift, f.a);
    }
  }
  fragColor = color;
}
