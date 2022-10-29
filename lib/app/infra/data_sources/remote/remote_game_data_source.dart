import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';

abstract class IGameDataSource {
  Future<List<GameEntity>> getAll({
    required GetAllGamesInputDto input,
  });
}
