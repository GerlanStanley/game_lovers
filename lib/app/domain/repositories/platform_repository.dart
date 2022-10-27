import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../entities/entities.dart';

abstract class IPlatformRepository {
  Future<Either<Failure, List<PlatformEntity>>> getAll();
}