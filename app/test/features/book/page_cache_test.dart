import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:potret/features/book/state/page_cache.dart';

class _Tex {
  _Tex(this.index);
  final int index;
  bool disposed = false;
}

void main() {
  test('LruCache menggusur yang paling lama dan memanggil onEvict', () {
    final evicted = <int>[];
    final c = LruCache<int, String>(
      capacity: 2,
      onEvict: (k, _) => evicted.add(k),
    )
      ..put(1, 'a')
      ..put(2, 'b');
    expect(c.get(1), 'a'); // 1 jadi yang terbaru
    c.put(3, 'c');
    expect(evicted, [2]);
    expect(c.keys, [1, 3]);
    c.retainWhere((k) => k == 3);
    expect(evicted, [2, 1]);
    expect(c.length, 1);
  });

  test('pageWindow berurutan sesuai prioritas dan terpotong di tepi', () {
    expect(pageWindow(5, 20), [5, 6, 4, 7, 3]);
    expect(pageWindow(0, 20), [0, 1, 2]);
    expect(pageWindow(19, 20), [19, 18, 17]);
  });

  test('PageStore tidak pernah menyimpan lebih dari 2*radius+1 halaman', () async {
    final all = <_Tex>[];
    var maxCached = 0;
    late PageStore<_Tex> store;
    store = PageStore<_Tex>(
      pageCount: 20,
      load: (i) async {
        final t = _Tex(i);
        all.add(t);
        return t;
      },
      dispose: (t) {
        expect(t.disposed, isFalse, reason: 'dispose ganda');
        t.disposed = true;
      },
      onLoaded: (_, _) {
        if (store.cachedCount > maxCached) maxCached = store.cachedCount;
      },
    );
    expect(store.capacity, 5);

    // Balik maju sampai akhir lalu mundur, tunggu muat setiap langkah.
    final path = [for (var i = 0; i < 20; i++) i, for (var i = 18; i >= 0; i--) i];
    for (final i in path) {
      store.focus(i);
      await store.obtain(i);
      await pumpEventQueue();
      expect(store.cachedCount, lessThanOrEqualTo(store.capacity));
      maxCached = store.cachedCount > maxCached ? store.cachedCount : maxCached;
      for (final k in store.cachedIndices) {
        expect((k - i).abs(), lessThanOrEqualTo(2));
      }
    }
    expect(maxCached, lessThanOrEqualTo(5));
    // Yang tidak lagi di cache sudah di-dispose (tekstur dilepas).
    final live = all.where((t) => !t.disposed).length;
    expect(live, store.cachedCount);

    store.disposeAll();
    expect(all.every((t) => t.disposed), isTrue);
  });

  test('PageStore ditahan saat PageCurl berjalan, kecuali obtain()', () async {
    final loaded = <int>[];
    final store = PageStore<_Tex>(
      pageCount: 20,
      load: (i) async {
        loaded.add(i);
        return _Tex(i);
      },
      dispose: (t) => t.disposed = true,
    )..paused = true;
    store.focus(3);
    await pumpEventQueue();
    expect(loaded, isEmpty);
    await store.obtain(4);
    expect(loaded, [4]);
    store.paused = false;
    await pumpEventQueue();
    expect(loaded.toSet(), {4, 3, 2, 5, 1});
  });

  test('gambar yang selesai dimuat di luar jendela langsung dilepas', () async {
    final pending = <int, Completer<_Tex>>{};
    final store = PageStore<_Tex>(
      pageCount: 20,
      load: (i) => (pending[i] = Completer<_Tex>()).future,
      dispose: (t) => t.disposed = true,
    )..focus(0);
    // Halaman 0 sedang dimuat; pengguna lompat jauh.
    store.focus(15);
    final t0 = _Tex(0);
    pending[0]!.complete(t0);
    await pumpEventQueue();
    expect(t0.disposed, isTrue);
    expect(store.cachedIndices, isNot(contains(0)));
  });

  test('disposeAll menggagalkan penunggu yang belum selesai', () async {
    final store = PageStore<_Tex>(
      pageCount: 20,
      load: (i) => Completer<_Tex>().future, // tidak pernah selesai
      dispose: (t) => t.disposed = true,
    );
    final waiting = store.obtain(7);
    store.disposeAll();
    await expectLater(waiting, throwsStateError);
  });
}
