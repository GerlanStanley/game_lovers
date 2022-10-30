import 'package:drift/drift.dart';

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
      rating: json["rating"].toDouble(),
      cover: json.containsKey("cover")
          ? CoverMapper.fromJson(json["cover"])
          : null,
      genres: json.containsKey("genres")
          ? GenreMapper.fromList(json["genres"])
          : [],
      platforms: PlatformMapper.fromListJson(json["platforms"]),
    );
  }

  static GameEntity fromTypedResult({
    required TypedResult game,
    required List<TypedResult> platforms,
    required List<TypedResult> genres,
  }) {
    return GameEntity(
      id: int.parse(game.rawData.data["games.id"]),
      name: game.rawData.data["games.name"],
      summary: game.rawData.data["games.summary"],
      rating: game.rawData.data["games.rating"].toDouble(),
      cover: game.rawData.data["covers.id"] != null
          ? CoverMapper.fromTypedResult(game)
          : null,
      genres: GenreMapper.fromListTypedResult(genres),
      platforms: PlatformMapper.fromListTypedResult(platforms),
    );
  }
}
