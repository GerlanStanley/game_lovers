import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

abstract class IGetIsDarkUseCase {
  Either<Failure, bool> call();
}
