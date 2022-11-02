import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../repositories/repositories.dart';

import 'use_cases.dart';

class GetIsDarkUseCaseImpl implements IGetIsDarkUseCase {
  final IIsDarkRepository _repository;

  GetIsDarkUseCaseImpl(this._repository);

  @override
  Either<Failure, bool> call() {
    return _repository.get();
  }
}
