import '../../domain/entities/entities.dart';

class CoverMapper {
  static List<CoverEntity> fromList(List list) {
    return list.map((element) => fromJson(element)).toList();
  }

  static CoverEntity fromJson(Map json) {
    return CoverEntity(
      id: json["id"],
      imageId: json["image_id"],
      url: json["url"],
    );
  }
}
