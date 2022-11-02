import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/dtos/dtos.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/app/infra/drivers/drivers.dart';
import 'package:game_lovers/app/infra/repositories/repositories.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'game_repository_impl_test.mocks.dart';

@GenerateMocks([IRemoteGameDataSource, ILocalGameDataSource, IInternetDriver])
void main() {
  late MockIRemoteGameDataSource remoteDataSource;
  late MockILocalGameDataSource localDataSource;
  late MockIInternetDriver internetDriver;
  late IGameRepository repository;
  late GetAllGamesInputDto input;

  setUp(() {
    remoteDataSource = MockIRemoteGameDataSource();
    localDataSource = MockILocalGameDataSource();
    internetDriver = MockIInternetDriver();
    repository = GameRepositoryImpl(
      remoteDataSource,
      localDataSource,
      internetDriver,
    );
    input = const GetAllGamesInputDto(platformId: 1, limit: 20, offset: 0);
  });

  test(
    "Deve chamar remoteDataSource quando tiver com internet "
    "e retornar uma List<GameEntity>",
    () async {
      when(internetDriver.isConnected()).thenAnswer((_) async => true);
      when(remoteDataSource.getAll(input: anyNamed("input")))
          .thenAnswer((_) async => []);
      when(localDataSource.saveAll(games: [])).thenAnswer((_) async => true);

      var result = await repository.getAll(input: input);

      expect(result.fold(id, id), isA<List<GameEntity>>());
    },
  );

  test(
    "Deve chamar localDataSource quando tiver sem internet "
    "e retornar uma List<GameEntity>",
    () async {
      when(internetDriver.isConnected()).thenAnswer((_) async => false);
      when(localDataSource.getAll(input: anyNamed("input")))
          .thenAnswer((_) async => []);

      var result = await repository.getAll(input: input);

      expect(result.fold(id, id), isA<List<GameEntity>>());
    },
  );

  test(
    "Deve retornar um ParseDtoFailure quando lançar ParseDtoFailure",
    () async {
      when(internetDriver.isConnected()).thenAnswer((_) async => true);
      when(remoteDataSource.getAll(input: anyNamed("input")))
          .thenThrow(Failure(message: ""));

      var result = await repository.getAll(input: input);

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
