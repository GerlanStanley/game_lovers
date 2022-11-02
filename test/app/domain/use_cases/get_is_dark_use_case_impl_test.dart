import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'get_is_dark_use_case_impl_test.mocks.dart';

@GenerateMocks([IIsDarkRepository])
void main() {
  late MockIIsDarkRepository repository;
  late GetIsDarkUseCaseImpl useCase;

  setUp(() {
    repository = MockIIsDarkRepository();
    useCase = GetIsDarkUseCaseImpl(repository);
  });

  test(
    "Deve retornar um Right(bool) quando o repository "
    "retornar um Right(bool)",
    () {
      when(repository.get()).thenReturn(const Right<Failure, bool>(true));

      var result = useCase();

      expect(result.fold(id, id), isA<bool>());
    },
  );

  test(
    "Deve retornar um Left(Failure) quando o repository "
    "retornar um Left(Failure)",
    () {
      when(repository.get())
          .thenReturn(Left<Failure, bool>(Failure(message: "")));

      var result = useCase();

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
