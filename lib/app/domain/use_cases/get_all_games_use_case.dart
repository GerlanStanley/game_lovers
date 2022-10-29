import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract class IGetAllGamesUseCase {
  Future<Either<Failure, List<GameEntity>>> call({
    required GetAllGamesInputDto input,
  });
}
