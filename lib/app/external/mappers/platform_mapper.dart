import '../../domain/entities/entities.dart';

class PlatformMapper {
  static List<PlatformEntity> fromList(List list) {
    return list.map((element) => fromJson(element)).toList();
  }

  static PlatformEntity fromJson(Map json) {
    return PlatformEntity(
      id: json['id'],
      name: json['name'],
    );
  }
}
