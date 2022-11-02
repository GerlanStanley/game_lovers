import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/app/infra/drivers/drivers.dart';
import 'package:game_lovers/app/infra/repositories/repositories.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'platform_repository_impl_test.mocks.dart';

@GenerateMocks([
  IRemotePlatformDataSource,
  ILocalPlatformDataSource,
  IInternetDriver,
])
void main() {
  late MockIRemotePlatformDataSource remoteDataSource;
  late MockILocalPlatformDataSource localDataSource;
  late MockIInternetDriver internetDriver;
  late IPlatformRepository repository;

  setUp(() {
    remoteDataSource = MockIRemotePlatformDataSource();
    localDataSource = MockILocalPlatformDataSource();
    internetDriver = MockIInternetDriver();
    repository = PlatformRepositoryImpl(
      remoteDataSource,
      localDataSource,
      internetDriver,
    );
  });

  test(
    "Deve chamar remoteDataSource quando tiver com internet "
    "e retornar um List<PlatformEntity>",
    () async {
      when(internetDriver.isConnected()).thenAnswer((_) async => true);
      when(remoteDataSource.getAll()).thenAnswer((_) async => []);
      when(localDataSource.saveAll(platforms: []))
          .thenAnswer((_) async => true);

      var result = await repository.getAll();

      expect(result.fold(id, id), isA<List<PlatformEntity>>());
    },
  );

  test(
    "Deve chamar localDataSource quando tiver sem internet "
    "e retornar um List<PlatformEntity>",
    () async {
      when(internetDriver.isConnected()).thenAnswer((_) async => false);
      when(localDataSource.getAll()).thenAnswer((_) async => []);

      var result = await repository.getAll();

      expect(result.fold(id, id), isA<List<PlatformEntity>>());
    },
  );

  test(
    "Deve retornar um ParseDtoFailure quando lançar ParseDtoFailure",
    () async {
      when(internetDriver.isConnected()).thenAnswer((_) async => true);
      when(remoteDataSource.getAll()).thenThrow(Failure(message: ""));

      var result = await repository.getAll();

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
