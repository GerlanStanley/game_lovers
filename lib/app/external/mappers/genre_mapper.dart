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
}
