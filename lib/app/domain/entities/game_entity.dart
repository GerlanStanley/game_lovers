import 'entities.dart';

class GameEntity {
  final int id;
  final String name;
  final String? summary;
  final double rating;
  final CoverEntity? cover;
  final List<GenreEntity> genres;
  final List<PlatformEntity> platforms;

  GameEntity({
    required this.id,
    required this.name,
    required this.summary,
    required this.rating,
    required this.cover,
    required this.genres,
    required this.platforms,
  });
}
