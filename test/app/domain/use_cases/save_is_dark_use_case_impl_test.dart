import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'save_is_dark_use_case_impl_test.mocks.dart';

@GenerateMocks([IIsDarkRepository])
void main() {
  late MockIIsDarkRepository repository;
  late SaveIsDarkUseCaseImpl useCase;

  setUp(() {
    repository = MockIIsDarkRepository();
    useCase = SaveIsDarkUseCaseImpl(repository);
  });

  test(
    "Deve retornar um Right(bool) quando o repository "
    "retornar um Right(bool)",
    () async {
      when(repository.save(value: anyNamed("value")))
          .thenAnswer((_) async => const Right<Failure, bool>(true));

      var result = await useCase(value: true);

      expect(result.fold(id, id), isA<bool>());
    },
  );

  test(
    "Deve retornar um Left(Failure) quando o repository "
    "retornar um Left(Failure)",
    () async {
      when(repository.save(value: anyNamed("value")))
          .thenAnswer((_) async => Left<Failure, bool>(Failure(message: "")));

      var result = await useCase(value: true);

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
