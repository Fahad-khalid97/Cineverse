class CacheManager {
  final cache = {};

  void setCache(String key, String value) {
    cache[key] = value;
  }

  String getCache(String key) {
    return cache[key];
  }

  void clearCache() {
    cache.clear();
  }

  void removeCache(String key) {
    cache.remove(key);
  }

  void removeAllCache() {
    cache.clear();
  }

  bool isCacheValid(DateTime cachedAt) {
    final now = DateTime.now();
    final difference = now.difference(cachedAt);
    // 30-second validity period as required
    return difference.inSeconds <= 30;
  }
}
