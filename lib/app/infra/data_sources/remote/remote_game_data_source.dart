import '../../../domain/dtos/dtos.dart';
import '../../../domain/entities/entities.dart';

abstract class IRemoteGameDataSource {
  Future<List<GameEntity>> getAll({
    required GetAllGamesInputDto input,
  });
}
