import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract class IGameRepository {
  Future<Either<Failure, List<GameEntity>>> getAll({
    required GetAllGamesInputDto input,
  });
}
