import 'package:objectbox/objectbox.dart';
import 'package:injectable/injectable.dart';

@injectable
@Entity()
class CacheEntry {
  @Id()
  int id = 0;

  @Index()
  String key;

  String value;

  @Property(type: PropertyType.date)
  DateTime cachedAt;

  int ttlSeconds;

  CacheEntry({
    required this.key,
    required this.value,
    DateTime? cachedAt,
    this.ttlSeconds = 30,
  }) : cachedAt = cachedAt ?? DateTime.now();
}
