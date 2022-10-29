import '../../domain/entities/entities.dart';

import 'mappers.dart';

class GameMapper {
  static List<GameEntity> fromList(List list) {
    return list.map((element) => fromJson(element)).toList();
  }

  static GameEntity fromJson(Map json) {
    return GameEntity(
      id: json["id"],
      name: json["name"],
      summary: json["summary"],
      cover: json.containsKey("cover")
          ? CoverMapper.fromJson(json["cover"])
          : null,
      genres: json.containsKey("genres")
          ? GenreMapper.fromList(json["genres"])
          : [],
      platforms: PlatformMapper.fromList(json["platforms"]),
    );
  }
}
