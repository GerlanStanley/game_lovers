import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers/app/domain/dtos/dtos.dart';
import 'package:mocktail/mocktail.dart';

import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/app/infra/repositories/repositories.dart';
import 'package:game_lovers/core/failures/failures.dart';

class MockGameDataSource extends Mock implements IGameDataSource {}

void main() {
  late IGameDataSource dataSource;
  late IGameRepository repository;
  late GetAllGamesInputDto input;

  setUp(() {
    dataSource = MockGameDataSource();
    repository = GameRepositoryImpl(dataSource);
    input = GetAllGamesInputDto(limit: 20, offset: 0);
    registerFallbackValue(input);
  });

  test("Deve retornar uma List<GameEntity>", () async {
    when(
      () => dataSource.getAll(input: any(named: "input")),
    ).thenAnswer((_) async => []);

    var result = await repository.getAll(input: input);

    expect(result.fold(id, id), isA<List<GameEntity>>());
  });

  test(
    "Deve retornar um ParseDtoFailure quando lançar ParseDtoFailure",
    () async {
      when(
        () => dataSource.getAll(input: any(named: "input")),
      ).thenThrow(Failure(message: ""));

      var result = await repository.getAll(input: input);

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
