import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/failures/failures.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/core/failures/failures.dart';

class MockPlatformRepository extends Mock implements IPlatformRepository {}

void main() {
  late IPlatformRepository repository;
  late GetAllPlatformsUseCaseImpl useCase;

  setUp(() {
    repository = MockPlatformRepository();
    useCase = GetAllPlatformsUseCaseImpl(repository);
  });

  test(
    "Deve retornar um Right(List<PlatformEntity>) quando o repository "
    "retornar um Right(List<PlatformEntity>)",
    () async {
      when(() => repository.getAll()).thenAnswer((_) async {
        List<PlatformEntity> platforms = [];
        for (int i = 0; i < 3; i++) {
          platforms.add(PlatformEntity(
            id: faker.randomGenerator.integer(10000),
            name: faker.vehicle.model(),
          ));
        }

        return Right<Failure, List<PlatformEntity>>(platforms);
      });

      var result = await useCase();

      expect(result.fold(id, id), isA<List<PlatformEntity>>());
    },
  );

  test(
    "Deve retornar um Left(Failure) quando o repository "
    "retornar um Left(Failure)",
    () async {
      when(() => repository.getAll()).thenAnswer((_) async {
        return Left<Failure, List<PlatformEntity>>(
          Failure(message: ""),
        );
      });

      var result = await useCase();

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
