import 'package:drift/drift.dart';

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

  static CoverEntity fromTypedResult(TypedResult result) {
    return CoverEntity(
      id: int.parse(result.rawData.data["covers.id"]),
      imageId: result.rawData.data["covers.image_id"],
      url: result.rawData.data["covers.url"],
    );
  }
}
