import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../entities/entities.dart';
import '../repositories/repositories.dart';

import 'use_cases.dart';

class GetAllPlatformsUseCaseImpl implements IGetAllPlatformsUseCase {
  final IPlatformRepository _repository;

  GetAllPlatformsUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, List<PlatformEntity>>> call() async {
    return _repository.getAll();
  }
}
