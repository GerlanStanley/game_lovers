import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

abstract class IIsDarkRepository {
  Either<Failure, bool> get();
  Future<Either<Failure, bool>> save({required bool value});
}
