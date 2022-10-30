import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

import '../data_sources/data_sources.dart';

class PlatformRepositoryImpl implements IPlatformRepository {
  final IRemotePlatformDataSource _remoteDataSource;
  final ILocalPlatformDataSource _localDataSource;

  PlatformRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<PlatformEntity>>> getAll() async {
    try {
      //var result = await _remoteDataSource.getAll();
      //await _localDataSource.saveAll(platforms: result);

      var result = await _localDataSource.getAll();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
