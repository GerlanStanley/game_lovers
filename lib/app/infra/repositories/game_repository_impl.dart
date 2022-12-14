import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

import '../data_sources/data_sources.dart';
import '../drivers/drivers.dart';

class GameRepositoryImpl implements IGameRepository {
  final IRemoteGameDataSource _remoteDataSource;
  final ILocalGameDataSource _localDataSource;
  final IInternetDriver _internetDriver;

  GameRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._internetDriver,
  );

  @override
  Future<Either<Failure, List<GameEntity>>> getAll({
    required GetAllGamesInputDto input,
  }) async {
    try {
      if (await _internetDriver.isConnected()) {
        var result = await _remoteDataSource.getAll(input: input);

        await _localDataSource.saveAll(games: result);

        return Right(result);
      } else {
        var result = await _localDataSource.getAll(input: input);

        return Right(result);
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
