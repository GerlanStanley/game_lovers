import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/dtos/dtos.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/app/infra/repositories/repositories.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'game_repository_test.mocks.dart';

@GenerateMocks([IRemoteGameDataSource])
void main() {
  late MockIRemoteGameDataSource dataSource;
  late IGameRepository repository;
  late GetAllGamesInputDto input;

  setUp(() {
    dataSource = MockIRemoteGameDataSource();
    repository = GameRepositoryImpl(dataSource);
    input = GetAllGamesInputDto(platformId: 1, limit: 20, offset: 0);
  });

  test("Deve retornar uma List<GameEntity>", () async {
    when(dataSource.getAll(input: anyNamed("input")))
        .thenAnswer((_) async => []);

    var result = await repository.getAll(input: input);

    expect(result.fold(id, id), isA<List<GameEntity>>());
  });

  test(
    "Deve retornar um ParseDtoFailure quando lançar ParseDtoFailure",
    () async {
      when(dataSource.getAll(input: anyNamed("input")))
          .thenThrow(Failure(message: ""));

      var result = await repository.getAll(input: input);

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
