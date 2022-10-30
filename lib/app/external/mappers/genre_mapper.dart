import 'package:drift/drift.dart';

import '../../domain/entities/entities.dart';

class GenreMapper {
  static List<GenreEntity> fromList(List list) {
    return list.map((element) => fromJson(element)).toList();
  }

  static GenreEntity fromJson(Map json) {
    return GenreEntity(
      id: json["id"],
      name: json["name"],
    );
  }

  static List<GenreEntity> fromListTypedResult(List<TypedResult> list) {
    return list.map((element) => fromTypedResult(element)).toList();
  }

  static GenreEntity fromTypedResult(TypedResult result) {
    return GenreEntity(
      id: int.parse(result.rawData.data["genres.id"]),
      name: result.rawData.data["genres.name"],
    );
  }
}
