import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/dtos/dtos.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/failures/failures.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'get_all_games_use_case_impl_test.mocks.dart';

@GenerateMocks([IGameRepository])
void main() {
  late MockIGameRepository repository;
  late GetAllGamesUseCaseImpl useCase;

  setUp(() {
    repository = MockIGameRepository();
    useCase = GetAllGamesUseCaseImpl(repository);
  });

  test(
    "Deve retornar um Right(List<GameEntity>) quando o repository "
    "retornar um Right(List<GameEntity>)",
    () async {
      var input = GetAllGamesInputDto(platformId: 1, limit: 20, offset: 0);
      when(repository.getAll(input: anyNamed("input"))).thenAnswer((_) async {
        List<GameEntity> games = [];
        for (int i = 0; i < 3; i++) {
          games.add(GameEntity(
            id: faker.randomGenerator.integer(10000),
            name: faker.vehicle.model(),
            summary: faker.lorem.sentence(),
            cover: CoverEntity(
              id: faker.randomGenerator.integer(10000),
              imageId: faker.image.image(),
              url: faker.internet.httpsUrl(),
            ),
            genres: [
              GenreEntity(
                id: faker.randomGenerator.integer(10000),
                name: faker.vehicle.model(),
              ),
            ],
            platforms: [
              PlatformEntity(
                id: faker.randomGenerator.integer(10000),
                name: faker.vehicle.model(),
              ),
            ],
          ));
        }

        return Right<Failure, List<GameEntity>>(games);
      });

      var result = await useCase(input: input);

      expect(result.fold(id, id), isA<List<GameEntity>>());
    },
  );

  test(
    "Deve retornar um Left(GetAllGamesPlatformFailure) "
    "quando o platformId for menor que 1",
    () async {
      var input = GetAllGamesInputDto(platformId: 0, limit: 20, offset: 0);

      var result = await useCase(input: input);

      expect(result.fold(id, id), isA<GetAllGamesPlatformFailure>());
    },
  );

  test(
    "Deve retornar um Left(GetAllGamesLimitFailure) "
    "quando o limit for menor que 1",
    () async {
      var input = GetAllGamesInputDto(platformId: 1, limit: 0, offset: 0);

      var result = await useCase(input: input);

      expect(result.fold(id, id), isA<GetAllGamesLimitFailure>());
    },
  );

  test(
    "Deve retornar um Left(GetAllGamesLimitFailure) "
    "quando o limit for maior que 500",
    () async {
      var input = GetAllGamesInputDto(platformId: 1, limit: 501, offset: 0);

      var result = await useCase(input: input);

      expect(result.fold(id, id), isA<GetAllGamesLimitFailure>());
    },
  );

  test(
    "Deve retornar um Left(GetAllGamesOffsetFailure) "
    "quando o limit for menor que 0",
    () async {
      var input = GetAllGamesInputDto(platformId: 1, limit: 10, offset: -1);

      var result = await useCase(input: input);

      expect(result.fold(id, id), isA<GetAllGamesOffsetFailure>());
    },
  );

  test(
    "Deve retornar um Left(Failure) quando o repository "
    "retornar um Left(Failure)",
    () async {
      var input = GetAllGamesInputDto(platformId: 1, limit: 20, offset: 0);

      when(repository.getAll(input: anyNamed('input'))).thenAnswer((_) async {
        return Left<Failure, List<GameEntity>>(
          Failure(message: ""),
        );
      });

      var result = await useCase(input: input);

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
