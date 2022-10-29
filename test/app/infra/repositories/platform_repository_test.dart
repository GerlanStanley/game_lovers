import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/repositories/repositories.dart';
import 'package:game_lovers/app/infra/data_sources/data_sources.dart';
import 'package:game_lovers/app/infra/repositories/repositories.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'platform_repository_test.mocks.dart';

@GenerateMocks([IRemotePlatformDataSource])
void main() {
  late MockIRemotePlatformDataSource dataSource;
  late IPlatformRepository repository;

  setUp(() {
    dataSource = MockIRemotePlatformDataSource();
    repository = PlatformRepositoryImpl(dataSource);
  });

  test("Deve retornar uma List<PlatformEntity>", () async {
    when(dataSource.getAll()).thenAnswer((_) async => []);

    var result = await repository.getAll();

    expect(result.fold(id, id), isA<List<PlatformEntity>>());
  });

  test(
    "Deve retornar um ParseDtoFailure quando lançar ParseDtoFailure",
    () async {
      when(dataSource.getAll()).thenThrow(Failure(message: ""));

      var result = await repository.getAll();

      expect(result.fold(id, id), isA<Failure>());
    },
  );
}
