import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../repositories/repositories.dart';

import 'use_cases.dart';

class SaveIsDarkUseCaseImpl implements ISaveIsDarkUseCase {
  final IIsDarkRepository _repository;

  SaveIsDarkUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, bool>> call({required bool value}) {
    return _repository.save(value: value);
  }
}
