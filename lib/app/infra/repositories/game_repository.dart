import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';

import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

import '../data_sources/data_sources.dart';

class GameRepositoryImpl implements IGameRepository {
  final IRemoteGameDataSource _dataSource;

  GameRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<GameEntity>>> getAll({
    required GetAllGamesInputDto input,
  }) async {
    try {
      var result = await _dataSource.getAll(input: input);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
