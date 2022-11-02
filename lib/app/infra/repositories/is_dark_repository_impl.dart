import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';

import '../../domain/repositories/repositories.dart';

import '../data_sources/data_sources.dart';

class IsDarkRepositoryImpl extends IIsDarkRepository {
  final ILocalIsDarkDataSource _dataSource;

  IsDarkRepositoryImpl(this._dataSource);

  @override
  Either<Failure, bool> get() {
    try {
      var response = _dataSource.get();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> save({required bool value}) async {
    try {
      var response = await _dataSource.save(value: value);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}