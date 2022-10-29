import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../dtos/dtos.dart';
import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';

import 'use_cases.dart';

class GetAllGamesUseCaseImpl implements IGetAllGamesUseCase {
  final IGameRepository _repository;

  GetAllGamesUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, List<GameEntity>>> call({
    required GetAllGamesInputDto input,
  }) async {
    if (input.platformId < 1) {
      return Left(GetAllGamesPlatformFailure(
        message: "Minimum value you can set for platformId is 1",
      ));
    }

    if (input.limit < 1) {
      return Left(GetAllGamesLimitFailure(
        message: "Minimum value you can set for limit is 1",
      ));
    }

    if (input.limit > 500) {
      return Left(GetAllGamesLimitFailure(
        message: "Maximum value you can set for limit is 500",
      ));
    }

    if (input.offset < 0) {
      return Left(GetAllGamesOffsetFailure(
        message: "Minimum value you can set for offset is 0",
      ));
    }

    return _repository.getAll(input: input);
  }
}
