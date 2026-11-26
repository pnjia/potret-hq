#!/usr/bin/env node
// Merender bodi kamera dan ilustrasi etalase dari tool/camera_src/ (K-034).
//
// - tool/camera_src/<id>.html  -> build/camera_art/<id>-body.png (1170x2532,
//   3x dari 390x844). tool/make_camera_assets.py lalu melubangi jendela
//   bidiknya menjadi assets/cameras/<id>/overlay.png.
// - tool/camera_src/shelf/<id>.svg -> assets/cameras/<id>/shelf.png
//   (640x440, 4x dari 160x110, latar transparan).
//
// Pemakaian (dari app/): node tool/render_camera_art.cjs
// Butuh Playwright + Chromium.
const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const app = path.resolve(__dirname, '..');
const src = path.join(__dirname, 'camera_src');
const out = path.join(app, 'build', 'camera_art');

(async () => {
  fs.mkdirSync(out, { recursive: true });
  const browser = await chromium.launch();

  for (const file of fs.readdirSync(src).filter((f) => f.endsWith('.html')).sort()) {
    const id = file.replace(/\.html$/, '');
    const page = await browser.newPage({ viewport: { width: 390, height: 844 }, deviceScaleFactor: 3 });
    await page.goto('file://' + path.join(src, file));
    await page.evaluate(() => document.fonts.ready);
    await page.locator('#camera-body').screenshot({ path: path.join(out, `${id}-body.png`) });
    await page.close();
    console.log(`build/camera_art/${id}-body.png`);
  }

  const shelf = path.join(src, 'shelf');
  for (const file of fs.readdirSync(shelf).filter((f) => f.endsWith('.svg')).sort()) {
    const id = file.replace(/\.svg$/, '');
    const page = await browser.newPage({ viewport: { width: 160, height: 110 }, deviceScaleFactor: 4 });
    const svg = fs.readFileSync(path.join(shelf, file), 'utf8');
    await page.setContent(`<html><body style="margin:0;background:transparent">${svg}</body></html>`);
    const dir = path.join(app, 'assets', 'cameras', id);
    fs.mkdirSync(dir, { recursive: true });
    await page.locator('svg').first().screenshot({ path: path.join(dir, 'shelf.png'), omitBackground: true });
    await page.close();
    console.log(`assets/cameras/${id}/shelf.png`);
  }
  await browser.close();
})();
