import '../../domain/entities/entities.dart';

import '../drift/database.dart';

class PlatformMapper {
  static List<PlatformEntity> fromListJson(List list) {
    return list.map((element) => fromJson(element)).toList();
  }

  static PlatformEntity fromJson(Map json) {
    return PlatformEntity(
      id: json["id"],
      name: json["name"],
    );
  }

  static List<PlatformEntity> fromListTable(List<Platform> list) {
    return list.map((element) => fromTable(element)).toList();
  }

  static PlatformEntity fromTable(Platform item) {
    return PlatformEntity(
      id: int.parse(item.id),
      name: item.name,
    );
  }
}
