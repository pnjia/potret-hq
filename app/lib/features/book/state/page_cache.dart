import 'dart:async';
import 'dart:collection';

/// Cache LRU berkapasitas tetap. Entri yang tergusur diserahkan ke [onEvict]
/// (untuk `ui.Image`: `dispose()` supaya tekstur GPU dilepas).
class LruCache<K, V> {
  LruCache({required this.capacity, this.onEvict})
      : assert(capacity > 0, 'kapasitas harus > 0');

  final int capacity;
  final void Function(K key, V value)? onEvict;
  final LinkedHashMap<K, V> _map = LinkedHashMap<K, V>();

  int get length => _map.length;
  Iterable<K> get keys => _map.keys;
  Iterable<V> get values => _map.values;
  bool containsKey(K key) => _map.containsKey(key);

  /// Mengambil entri dan menjadikannya yang paling baru dipakai.
  V? get(K key) {
    final v = _map.remove(key);
    if (v == null) return null;
    _map[key] = v;
    return v;
  }

  /// Mengambil entri tanpa mengubah urutan LRU.
  V? peek(K key) => _map[key];

  void put(K key, V value) {
    final old = _map.remove(key);
    if (old != null && !identical(old, value)) onEvict?.call(key, old);
    _map[key] = value;
    while (_map.length > capacity) {
      final k = _map.keys.first;
      final v = _map.remove(k) as V;
      onEvict?.call(k, v);
    }
  }

  /// Menggusur semua entri yang tidak lolos [keep].
  void retainWhere(bool Function(K key) keep) {
    for (final k in _map.keys.where((k) => !keep(k)).toList()) {
      onEvict?.call(k, _map.remove(k) as V);
    }
  }

  void clear() => retainWhere((_) => false);
}

/// Indeks halaman di sekitar [current] dalam urutan prioritas muat:
/// halaman sekarang, berikutnya, sebelumnya, lalu yang lebih jauh.
List<int> pageWindow(int current, int pageCount, {int radius = 2}) {
  final result = <int>[];
  void add(int i) {
    if (i >= 0 && i < pageCount && !result.contains(i)) result.add(i);
  }

  add(current);
  for (var d = 1; d <= radius; d++) {
    add(current + d);
    add(current - d);
  }
  return result;
}

/// Penyimpan gambar halaman dengan lazy load (K-004).
///
/// - Hanya halaman dalam jendela `current ± radius` yang disimpan; kapasitas
///   cache = `2 * radius + 1`, jadi jumlah tekstur halaman penuh di memori
///   tidak pernah melebihi batas itu (RAM 4 GB di Hot 11 Play).
/// - Muat satu per satu sesuai prioritas, supaya kerja raster tidak menumpuk.
/// - [paused] menahan antrean selama `PageCurl` berjalan, supaya render
///   halaman baru tidak berebut thread raster dengan animasi.
class PageStore<V extends Object> {
  PageStore({
    required this.pageCount,
    required this.load,
    required this.dispose,
    this.radius = 2,
    this.onLoaded,
  }) : _cache = LruCache<int, V>(
          capacity: 2 * radius + 1,
          onEvict: (_, v) => dispose(v),
        );

  final int pageCount;
  final int radius;
  final Future<V> Function(int index) load;
  final void Function(V value) dispose;

  /// Dipanggil setiap gambar selesai dimuat, dengan lama muat (ms).
  final void Function(int index, double ms)? onLoaded;

  final LruCache<int, V> _cache;
  final Map<int, Completer<V>> _waiters = {};
  final List<int> _queue = [];
  int? _loading;
  int _current = 0;
  bool _paused = false;
  bool _disposed = false;

  int get capacity => _cache.capacity;
  int get cachedCount => _cache.length;
  Iterable<int> get cachedIndices => _cache.keys;
  bool get isPaused => _paused;

  V? peek(int index) => _cache.peek(index);

  set paused(bool value) {
    _paused = value;
    if (!value) _pump();
  }

  /// Memindah jendela ke [current]: gusur yang di luar jendela, antrekan yang
  /// belum ada.
  void focus(int current) {
    if (_disposed) return;
    _current = current;
    final window = pageWindow(current, pageCount, radius: radius);
    _cache.retainWhere(window.contains);
    _queue
      ..clear()
      ..addAll(
        window.where((i) => !_cache.containsKey(i) && i != _loading),
      );
    _pump();
  }

  /// Gambar halaman [index]; dimuat (dengan prioritas tertinggi) bila belum ada.
  Future<V> obtain(int index) {
    final hit = _cache.get(index);
    if (hit != null) return Future.value(hit);
    final c = _waiters.putIfAbsent(index, Completer<V>.new);
    if (index != _loading) {
      _queue
        ..remove(index)
        ..insert(0, index);
      _pump(force: true);
    }
    return c.future;
  }

  bool _inWindow(int i) => (i - _current).abs() <= radius;

  void _pump({bool force = false}) {
    if (_disposed || _loading != null || _queue.isEmpty) return;
    if (_paused && !force) return;
    final index = _queue.removeAt(0);
    _loading = index;
    final sw = Stopwatch()..start();
    load(index).then(
      (value) {
        _loading = null;
        onLoaded?.call(index, sw.elapsedMicroseconds / 1000);
        final waiter = _waiters.remove(index);
        if (_disposed || (!_inWindow(index) && waiter == null)) {
          dispose(value);
        } else {
          _cache.put(index, value);
          waiter?.complete(value);
        }
        _pump();
      },
      onError: (Object e, StackTrace st) {
        _loading = null;
        _waiters.remove(index)?.completeError(e, st);
        _pump();
      },
    );
  }

  /// Melepas semua gambar. Penunggu [obtain] yang belum selesai digagalkan
  /// dengan [StateError], supaya tidak menggantung.
  void disposeAll() {
    _disposed = true;
    _queue.clear();
    _cache.clear();
    for (final c in _waiters.values) {
      c.completeError(StateError('PageStore sudah dibuang'));
    }
    _waiters.clear();
  }
}
