import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/app/infra/repositories/repositories.dart';
import 'package:game_lovers/core/failures/failures.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'is_dark_repository_impl_test.mocks.dart';

@GenerateMocks([ILocalIsDarkDataSource])
void main() {
  late MockILocalIsDarkDataSource dataSource;
  late IsDarkRepositoryImpl repository;

  setUp(() {
    dataSource = MockILocalIsDarkDataSource();
    repository = IsDarkRepositoryImpl(dataSource);
  });

  group("Get", () {
    test("Deve retornar um booleano", () {
      when(dataSource.get()).thenReturn(true);

      var result = repository.get();

      expect(result.fold(id, id), true);
    });

    test(
      "Deve retornar um Failure quando houver alguma exceção",
      () async {
        when(dataSource.get()).thenThrow(Exception());

        var result = repository.get();

        expect(result.fold(id, id), isA<Failure>());
      },
    );
  });

  group("Save", () {
    test("Deve retornar true quando inserir o registro", () async {
      when(dataSource.save(value: anyNamed("value")))
          .thenAnswer((_) async => true);

      var result = await repository.save(value: true);

      expect(result.fold(id, id), true);
    });

    test(
      "Deve retornar false quando não conseguir inserir o registro",
      () async {
        when(dataSource.save(value: anyNamed("value")))
            .thenThrow((_) => Exception());

        var result = await repository.save(value: true);

        expect(result.fold(id, id), isA<Failure>());
      },
    );
  });
}
