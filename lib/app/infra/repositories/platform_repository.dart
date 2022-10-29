import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

import '../data_sources/data_sources.dart';

class PlatformRepositoryImpl implements IPlatformRepository {
  final IRemotePlatformDataSource _dataSource;

  PlatformRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<PlatformEntity>>> getAll() async {
    try {
      var result = await _dataSource.getAll();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
