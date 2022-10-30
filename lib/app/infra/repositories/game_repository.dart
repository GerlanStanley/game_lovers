import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

import '../data_sources/data_sources.dart';

class GameRepositoryImpl implements IGameRepository {
  final IRemoteGameDataSource _remoteDataSource;
  final ILocalGameDataSource _localDataSource;

  GameRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<GameEntity>>> getAll({
    required GetAllGamesInputDto input,
  }) async {
    try {
      //var result = await _remoteDataSource.getAll(input: input);
      //await _localDataSource.saveAll(games: result);

      var result = await _localDataSource.getAll(input: input);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
