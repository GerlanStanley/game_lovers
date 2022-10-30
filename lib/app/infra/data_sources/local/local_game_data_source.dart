import '../../../domain/dtos/dtos.dart';
import '../../../domain/entities/entities.dart';

abstract class ILocalGameDataSource {
  Future<List<GameEntity>> getAll({
    required GetAllGamesInputDto input,
  });

  Future<bool> saveAll({
    required List<GameEntity> games,
  });
}
