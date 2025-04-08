import 'package:cineverse/core/cache/cache_entry.dart';
import 'package:cineverse/objectbox.g.dart';

class CacheManager {
  final Store store;

  CacheManager(this.store);

  Box<CacheEntry> get _box => store.box<CacheEntry>();

  /// Save or update cache
  void setCache(String key, String value, {int ttlSeconds = 30}) {
    final existing =
        _box.query(CacheEntry_.key.equals(key)).build().findFirst();

    final entry = CacheEntry(
      key: key,
      value: value,
      cachedAt: DateTime.now(),
      ttlSeconds: ttlSeconds,
    );

    // Update existing entry or add a new one
    if (existing != null) {
      entry.id = existing.id;
    }

    // Put the cache entry in the database
    _box.put(entry);
  }

  /// Return valid cache entry if not expired
  CacheEntry? getCacheEntry(String key) {
    final entry = _box.query(CacheEntry_.key.equals(key)).build().findFirst();
    if (entry != null && isCacheValid(entry)) {
      return entry;
    } else {
      removeCache(key);
    }
    return null;
  }

  /// Return expired cache if any
  CacheEntry? getExpiredEntry(String key) {
    final entry = _box.query(CacheEntry_.key.equals(key)).build().findFirst();
    if (entry != null && !isCacheValid(entry)) {
      return entry;
    }
    return null;
  }

  void removeCache(String key) {
    final entry = _box.query(CacheEntry_.key.equals(key)).build().findFirst();
    if (entry != null) {
      _box.remove(entry.id);
    }
  }

  void clearCache() {
    _box.removeAll();
  }

  bool isCacheValid(CacheEntry entry) {
    final now = DateTime.now();
    final diff = now.difference(entry.cachedAt).inSeconds;
    return diff <= entry.ttlSeconds;
  }
}
