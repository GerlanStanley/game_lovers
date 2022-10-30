import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

import '../data_sources/data_sources.dart';
import '../drivers/drivers.dart';

class PlatformRepositoryImpl implements IPlatformRepository {
  final IRemotePlatformDataSource _remoteDataSource;
  final ILocalPlatformDataSource _localDataSource;
  final IInternetDriver _internetDriver;

  PlatformRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._internetDriver,
  );

  @override
  Future<Either<Failure, List<PlatformEntity>>> getAll() async {
    try {
      if (await _internetDriver.isConnected()) {
        var result = await _remoteDataSource.getAll();

        await _localDataSource.saveAll(platforms: result);

        return Right(result);
      } else {
        var result = await _localDataSource.getAll();

        return Right(result);
      }

    } on Failure catch (e) {
      return Left(e);
    }
  }
}
