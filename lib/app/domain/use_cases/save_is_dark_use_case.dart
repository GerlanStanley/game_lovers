import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

abstract class ISaveIsDarkUseCase {
  Future<Either<Failure, bool>> call({required bool value});
}
