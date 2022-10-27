import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../entities/entities.dart';

abstract class IGetAllPlatformsUseCase {
  Future<Either<Failure, List<PlatformEntity>>> call();
}