import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'get_all_platforms_use_case_impl_test.mocks.dart';

@GenerateMocks([IPlatformRepository])

void main() {
  late MockIPlatformRepository repository;
  late GetAllPlatformsUseCaseImpl useCase;

  setUp(() {
    repository = MockIPlatformRepository();
    useCase = GetAllPlatformsUseCaseImpl(repository);
  });

  test(
    "Deve retornar um Right(List<PlatformEntity>) quando o repository "
    "retornar um Right(List<PlatformEntity>)",
    () async {
      when(repository.getAll()).thenAnswer((_) async {
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
      when(repository.getAll()).thenAnswer((_) async {
        return Left<Failure, List<PlatformEntity>>(
          Failure(message: ""),
        );
      });

      var result = await useCase();

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
