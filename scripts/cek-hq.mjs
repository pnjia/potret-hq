#!/usr/bin/env node
// Pemeriksaan HQ potret. Sukarela, bukan syarat commit (K-015).
// Pakai: node scripts/cek-hq.mjs
// Memeriksa: tautan dan path di Markdown, skema JSON di data/, frontmatter agen dan perintah,
// ID keputusan (K-) dan pertanyaan (Q-), sinonim glosarium, sisa istilah repo referensi,
// panjang CLAUDE.md dan STATUS.md. Tanpa dependensi.

import { readFileSync, readdirSync, existsSync, statSync } from "node:fs";
import { join, dirname, relative, resolve, basename } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const errors = [];
const warnings = [];
const err = (f, m) => errors.push(`${f}: ${m}`);
const warn = (f, m) => warnings.push(`${f}: ${m}`);
const rel = (p) => relative(ROOT, p).split("\\").join("/");
const read = (p) => readFileSync(p, "utf8");

// ---------- kumpulkan file ----------
const SKIP_DIRS = new Set([".git", "node_modules", "app", "supabase", "build", ".dart_tool"]);
function walk(dir, out = []) {
  for (const name of readdirSync(dir)) {
    if (SKIP_DIRS.has(name)) continue;
    const p = join(dir, name);
    if (statSync(p).isDirectory()) walk(p, out);
    else out.push(p);
  }
  return out;
}
const files = walk(ROOT);
const mdFiles = files.filter((f) => f.endsWith(".md"));

// File yang merujuk repo lain atau berupa snapshot: tidak dicek path backtick / istilah.
const ANALYSIS = "LAPORAN-ANALISIS.md";
const SNAPSHOT = (r) =>
  r.startsWith("docs/riset/2") || r === "docs/keputusan.md" || r === "docs/produk/spesifikasi-sistem-v1.md";

// ---------- 1. tautan Markdown dan path dalam backtick ----------
const PLACEHOLDER = /[<>*{}]|YYYY|NNN|XXX|\.\.\./;
const PATH_PREFIX = /^(\.claude|docs|data|templates|scripts)\/[^\s]*$/;
const ROOT_FILES = new Set(["CLAUDE.md", "README.md", "STATUS.md", "LAPORAN-ANALISIS.md", ".gitignore"]);

for (const f of mdFiles) {
  const r = rel(f);
  const text = read(f);
  const noCode = text.replace(/```[\s\S]*?```/g, "");
  // [teks](path)
  for (const m of noCode.matchAll(/\[[^\]]*\]\(([^)\s]+)\)/g)) {
    const target = m[1];
    if (/^(https?:|mailto:|#)/.test(target)) continue;
    const clean = decodeURIComponent(target.split("#")[0]);
    if (!clean) continue;
    if (!existsSync(resolve(dirname(f), clean))) err(r, `tautan rusak: ${target}`);
  }
  if (r === ANALYSIS) continue; // laporan merujuk path di repo referensi
  // `path`
  for (const m of noCode.matchAll(/`([^`\n]+)`/g)) {
    const t = m[1].trim().replace(/[.,;:]$/, "");
    if (PLACEHOLDER.test(t)) continue;
    const isRoot = ROOT_FILES.has(t);
    if (!isRoot && !PATH_PREFIX.test(t)) continue;
    if (t.includes(" ")) continue;
    const p = resolve(ROOT, t.replace(/:\d+$/, ""));
    if (!existsSync(p)) err(r, `path tidak ada: ${t}`);
  }
}

// ---------- 2. JSON + skema (validator subset draft 2020-12) ----------
function typeOf(v) {
  if (v === null) return "null";
  if (Array.isArray(v)) return "array";
  if (Number.isInteger(v)) return "integer";
  return typeof v;
}
function typeOk(v, t) {
  const actual = typeOf(v);
  return t === actual || (t === "number" && actual === "integer");
}
function validate(schema, value, root, path, out) {
  if (schema.$ref) {
    const ref = schema.$ref.replace(/^#\//, "").split("/");
    let s = root;
    for (const k of ref) s = s?.[k];
    if (!s) return out.push(`${path}: $ref tidak ditemukan ${schema.$ref}`);
    return validate(s, value, root, path, out);
  }
  if (schema.type) {
    const types = Array.isArray(schema.type) ? schema.type : [schema.type];
    if (!types.some((t) => typeOk(value, t))) return out.push(`${path}: tipe ${typeOf(value)}, harus ${types.join("|")}`);
  }
  if (schema.enum && !schema.enum.includes(value)) out.push(`${path}: nilai ${JSON.stringify(value)} tidak ada di enum`);
  if (typeof value === "string") {
    if (schema.pattern && !new RegExp(schema.pattern).test(value)) out.push(`${path}: "${value}" tidak cocok pola ${schema.pattern}`);
    if (schema.minLength && value.length < schema.minLength) out.push(`${path}: terlalu pendek`);
  }
  if (typeof value === "number") {
    if (schema.minimum !== undefined && value < schema.minimum) out.push(`${path}: < ${schema.minimum}`);
    if (schema.maximum !== undefined && value > schema.maximum) out.push(`${path}: > ${schema.maximum}`);
  }
  if (Array.isArray(value)) {
    if (schema.minItems && value.length < schema.minItems) out.push(`${path}: minimal ${schema.minItems} item`);
    if (schema.items) value.forEach((v, i) => validate(schema.items, v, root, `${path}[${i}]`, out));
  }
  if (typeOf(value) === "object") {
    const props = schema.properties || {};
    for (const k of schema.required || []) if (!(k in value)) out.push(`${path}: field wajib "${k}" tidak ada`);
    if (schema.minProperties && Object.keys(value).length < schema.minProperties) out.push(`${path}: minimal ${schema.minProperties} field`);
    for (const [k, v] of Object.entries(value)) {
      if (props[k]) validate(props[k], v, root, `${path}.${k}`, out);
      else if (schema.additionalProperties === false) out.push(`${path}: field tidak dikenal "${k}"`);
      else if (typeof schema.additionalProperties === "object") validate(schema.additionalProperties, v, root, `${path}.${k}`, out);
    }
  }
  return out;
}

const dataDir = join(ROOT, "data");
const jsonData = {};
for (const f of files.filter((f) => f.endsWith(".json"))) {
  const r = rel(f);
  let obj;
  try {
    obj = JSON.parse(read(f));
  } catch (e) {
    err(r, `JSON tidak valid: ${e.message}`);
    continue;
  }
  if (!r.startsWith("data/") || r.startsWith("data/schema/")) continue;
  jsonData[basename(r, ".json")] = obj;
  if (!obj.$schema) {
    err(r, "tidak punya key $schema yang menunjuk ke data/schema/");
    continue;
  }
  const sp = resolve(dirname(f), obj.$schema);
  if (!existsSync(sp)) {
    err(r, `skema tidak ditemukan: ${obj.$schema}`);
    continue;
  }
  const schema = JSON.parse(read(sp));
  for (const m of validate(schema, obj, schema, "$", [])) err(r, m);
}
for (const s of readdirSync(join(dataDir, "schema")).filter((n) => n.endsWith(".schema.json"))) {
  const name = s.replace(".schema.json", "");
  if (!jsonData[name]) warn(`data/schema/${s}`, `tidak ada data/${name}.json`);
}
// cek silang
if (jsonData.cities) {
  const ids = new Set((jsonData.cities.cities || []).map((c) => c.id));
  for (const l of jsonData.cities.landmarks || []) {
    if (!ids.has(l.cityId)) err("data/cities.json", `landmark ${l.id}: cityId "${l.cityId}" tidak ada di cities`);
    if (l.verified && (l.facts || []).some((x) => !x.source)) err("data/cities.json", `landmark ${l.id}: verified=true tetapi ada fakta tanpa sumber`);
    if (l.example) warn("data/cities.json", `landmark ${l.id} masih entri contoh`);
  }
}
if (jsonData.categories) {
  const catIds = new Set((jsonData.categories.categories || []).map((c) => c.id));
  const labelOwner = new Map();
  for (const c of jsonData.categories.categories || [])
    for (const l of c.mlkitLabels || []) {
      if (labelOwner.has(l.text)) err("data/categories.json", `label "${l.text}" dipetakan ke ${labelOwner.get(l.text)} dan ${c.id}`);
      labelOwner.set(l.text, c.id);
    }
  for (const l of jsonData.cities?.landmarks || [])
    if (!catIds.has(l.category)) err("data/cities.json", `landmark ${l.id}: kategori "${l.category}" tidak ada di data/categories.json`);
}
// file aset yang dirujuk data/ harus ada di app/
const appDir = join(ROOT, "app");
const assetRefs = [
  ...(jsonData.sounds?.sounds || []).map((x) => ["sounds", x.id, x.file]),
  ...["ornaments", "tapePatterns", "paperStyles"].flatMap((k) =>
    (jsonData.decorations?.[k] || []).map((x) => ["decorations", `${k}/${x.id}`, x.file])),
];
for (const [name, id, file] of assetRefs)
  if (existsSync(appDir) && !existsSync(join(appDir, file))) err(`data/${name}.json`, `${id}: file tidak ada: app/${file}`);
if (jsonData.cameras && existsSync(appDir)) {
  // K-034/K-044: kamera gratis lengkap; kamera terkunci yang tampil cukup ilustrasi etalase.
  for (const c of jsonData.cameras.cameras || []) {
    const listed = c.isListed !== false;
    const need = c.isFree ? ["overlay", "layout", "lut", "shelfImage"] : listed ? ["shelfImage"] : [];
    for (const k of need)
      if (c[k] && !existsSync(join(appDir, c[k]))) err("data/cameras.json", `${c.id}.${k}: file tidak ada: app/${c[k]}`);
    if (c.isFree && !existsSync(join(appDir, c.shutterSound)))
      warn("data/cameras.json", `${c.id}: suara rana belum ada (kartu Rekam suara)`);
  }
}
if (jsonData.decorations) {
  const d = jsonData.decorations;
  const r = "data/decorations.json";
  for (const k of ["ornaments", "tapePatterns", "paperStyles", "decorationSets"]) {
    const ids = (d[k] || []).map((x) => x.id);
    if (new Set(ids).size !== ids.length) err(r, `${k}: id ganda`);
  }
  // Jumlah dari K-031: 12 hiasan dalam 3 set, 6 motif selotip, 4 kertas latar (id K-037).
  if ((d.ornaments || []).length !== 12) err(r, `ornaments: ${(d.ornaments || []).length} hiasan, K-031 menetapkan 12`);
  if ((d.tapePatterns || []).length !== 6) err(r, `tapePatterns: ${(d.tapePatterns || []).length} motif, K-031 menetapkan 6`);
  const papers = (d.paperStyles || []).map((x) => x.id).sort().join(",");
  if (papers !== "dotted,grid,lined,plain") err(r, `paperStyles harus plain/lined/dotted/grid (K-037), sekarang ${papers}`);
  const ornamentIds = new Set((d.ornaments || []).map((x) => x.id));
  const used = new Map();
  for (const set of d.decorationSets || []) {
    if (set.ornamentIds.length !== 4) err(r, `set ${set.id}: ${set.ornamentIds.length} hiasan, harus 4`);
    for (const o of set.ornamentIds) {
      if (!ornamentIds.has(o)) err(r, `set ${set.id}: hiasan "${o}" tidak ada di ornaments`);
      if (used.has(o)) err(r, `hiasan "${o}" ada di set ${used.get(o)} dan ${set.id}`);
      used.set(o, set.id);
    }
  }
  for (const o of ornamentIds) if (!used.has(o)) warn(r, `hiasan "${o}" tidak masuk set mana pun`);
}
for (const [name, obj] of Object.entries(jsonData)) {
  if (obj.meta?.status === "placeholder") warn(`data/${name}.json`, "masih PLACEHOLDER");
  for (const c of obj.cameras || []) if (c.example) warn(`data/${name}.json`, `kamera ${c.id} masih entri contoh`);
}

// ---------- 3. frontmatter agen dan perintah ----------
const KNOWN_TOOLS = new Set(["Read", "Grep", "Glob", "Edit", "Write", "Bash", "WebSearch", "WebFetch", "Agent", "NotebookEdit", "TodoWrite"]);
function frontmatter(text) {
  const m = text.match(/^---\n([\s\S]*?)\n---\n/);
  if (!m) return null;
  const fm = {};
  for (const line of m[1].split("\n")) {
    const mm = line.match(/^([a-zA-Z-]+):\s*(.*)$/);
    if (mm) fm[mm[1]] = mm[2].replace(/^"(.*)"$/, "$1");
  }
  return fm;
}
const agentsDir = join(ROOT, ".claude/agents");
const agentNames = [];
for (const n of existsSync(agentsDir) ? readdirSync(agentsDir).filter((x) => x.endsWith(".md")) : []) {
  const r = `.claude/agents/${n}`;
  const fm = frontmatter(read(join(agentsDir, n)));
  if (!fm) { err(r, "frontmatter YAML tidak ada"); continue; }
  if (fm.name !== n.replace(/\.md$/, "")) err(r, `name "${fm.name}" tidak sama dengan nama file`);
  if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(fm.name || "")) err(r, "name harus huruf kecil dan tanda hubung");
  if (!fm.description || fm.description.length < 40) err(r, "description kosong atau terlalu pendek");
  if (fm.tools) for (const t of fm.tools.split(",").map((s) => s.trim())) if (!KNOWN_TOOLS.has(t)) warn(r, `tool tidak dikenal: ${t}`);
  agentNames.push(fm.name);
}
const cmdDir = join(ROOT, ".claude/commands");
for (const n of existsSync(cmdDir) ? readdirSync(cmdDir).filter((x) => x.endsWith(".md")) : []) {
  const fm = frontmatter(read(join(cmdDir, n)));
  if (!fm || !fm.description) err(`.claude/commands/${n}`, "frontmatter description tidak ada");
}
// agen yang disebut di CLAUDE.md harus ada
const claude = read(join(ROOT, "CLAUDE.md"));
for (const m of claude.matchAll(/\|\s*`([a-z]+(?:-[a-z]+)+)`\s*\|/g)) {
  if (!agentNames.includes(m[1])) err("CLAUDE.md", `agen \`${m[1]}\` tidak ada di .claude/agents/`);
}
for (const a of agentNames) if (!claude.includes(`\`${a}\``)) warn("CLAUDE.md", `agen ${a} tidak tercantum di tabel sub-agen`);

// ---------- 4. ID keputusan dan pertanyaan ----------
const kText = read(join(ROOT, "docs/keputusan.md"));
const kIds = [...kText.matchAll(/^### (K-\d{3})\b/gm)].map((m) => m[1]);
new Set(kIds).size !== kIds.length && err("docs/keputusan.md", "ada nomor K- ganda");
kIds.forEach((id, i) => { if (Number(id.slice(2)) !== i + 1) err("docs/keputusan.md", `urutan nomor loncat di ${id}`); });
const qText = read(join(ROOT, "docs/pertanyaan.md"));
const qIds = [...qText.matchAll(/^\| (Q-\d{3}) \|/gm)].map((m) => m[1]);
new Set(qIds).size !== qIds.length && err("docs/pertanyaan.md", "ada nomor Q- ganda");
for (const f of mdFiles.concat(files.filter((f) => f.endsWith(".json")))) {
  const r = rel(f);
  if (r === ANALYSIS) continue;
  const t = read(f);
  for (const m of t.matchAll(/\bK-(\d{3})\b/g)) if (!kIds.includes(`K-${m[1]}`)) err(r, `merujuk K-${m[1]} yang tidak ada`);
  for (const m of t.matchAll(/\bQ-(\d{3})\b/g)) if (!qIds.includes(`Q-${m[1]}`)) err(r, `merujuk Q-${m[1]} yang tidak ada`);
}
// keputusan yang digantikan: entri baru menulis "Menggantikan: K-XXX" (boleh beberapa, dipisah koma)
const replaced = [];
for (const block of kText.split(/^(?=### K-\d{3})/m)) {
  const id = block.match(/^### (K-\d{3})/)?.[1];
  const line = block.match(/Menggantikan\*{0,2}:\s*([^\n]+)/);
  if (id && line) for (const old of line[1].match(/K-\d{3}/g) || []) replaced.push([old, id]);
}
const replacedBy = new Map(replaced);
for (const f of mdFiles) {
  const r = rel(f);
  if (r === ANALYSIS || SNAPSHOT(r) || r === "docs/pertanyaan.md") continue;
  read(f).split("\n").forEach((line, i) => {
    for (const m of line.matchAll(/\bK-(\d{3})\b/g)) {
      const k = `K-${m[1]}`;
      if (replacedBy.has(k) && !line.includes(replacedBy.get(k)))
        warn(`${r}:${i + 1}`, `merujuk ${k} yang sudah digantikan ${replacedBy.get(k)}`);
    }
  });
}

// ---------- 5. sinonim glosarium dan sisa istilah referensi ----------
const glos = read(join(ROOT, "docs/produk/glosarium.md"));
const synSection = glos.split("## 5.")[1] || "";
const synonyms = [];
for (const m of synSection.matchAll(/^\| ([^|]+) \| ([^|]+) \|$/gm)) {
  if (m[1].trim() === "Pakai" || m[1].startsWith("---")) continue;
  for (const s of m[2].split(",").map((x) => x.trim()).filter(Boolean)) synonyms.push([s, m[1].trim()]);
}
const REF_RESIDUE = [
  [/\binzta-(?!hq\b)[a-z]+/i, "nama agen/skill repo referensi"],
  [/\bG[0-3]\b/, "kode persetujuan repo referensi"],
  [/Diperiksa PJ|\bverifier\b|\bLOLOS\b|\bREVISI\b|\bRND\b/, "istilah persetujuan repo referensi"],
];
for (const f of mdFiles) {
  const r = rel(f);
  if (r === ANALYSIS || SNAPSHOT(r)) continue;
  const lines = read(f).split("\n");
  lines.forEach((line, i) => {
    for (const [re, what] of REF_RESIDUE) if (re.test(line)) err(`${r}:${i + 1}`, `sisa ${what}: "${line.trim().slice(0, 80)}"`);
    if (/gerbang/i.test(line) && !/gerbang usia|tanpa gerbang|tidak ada gerbang|bukan gerbang/i.test(line))
      warn(`${r}:${i + 1}`, `kata "gerbang" (HQ ini tanpa gerbang, K-015)`);
    if (r !== "docs/produk/glosarium.md")
      for (const [s, use] of synonyms)
        if (new RegExp(`(^|[^\\p{L}])${s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")}([^\\p{L}]|$)`, "iu").test(line))
          warn(`${r}:${i + 1}`, `sinonim "${s}", pakai "${use}"`);
  });
}

// ---------- 6. panjang file peta dan status ----------
const claudeLines = claude.split("\n").length - (claude.endsWith("\n") ? 1 : 0);
if (claudeLines > 150) err("CLAUDE.md", `${claudeLines} baris (batas 150)`);
const status = read(join(ROOT, "STATUS.md"));
const statusLines = status.split("\n").length - (status.endsWith("\n") ? 1 : 0);
if (statusLines > 70) warn("STATUS.md", `${statusLines} baris (target ±60); riwayat cukup di git log`);

// ---------- laporan ----------
console.log(`cek-hq: ${mdFiles.length} Markdown, ${Object.keys(jsonData).length} data JSON, ${agentNames.length} agen, ${kIds.length} keputusan, ${qIds.length} pertanyaan`);
console.log(`CLAUDE.md ${claudeLines} baris · STATUS.md ${statusLines} baris`);
if (replaced.length) console.log(`Keputusan yang digantikan: ${replaced.map(([o, n]) => `${o} → ${n}`).join(", ")}`);
for (const w of warnings) console.log(`PERINGATAN ${w}`);
for (const e of errors) console.log(`ERROR      ${e}`);
console.log(errors.length ? `\n${errors.length} error, ${warnings.length} peringatan` : `\nOK · 0 error, ${warnings.length} peringatan`);
process.exit(errors.length ? 1 : 0);
