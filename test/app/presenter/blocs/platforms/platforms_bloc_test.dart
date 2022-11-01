import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/presenter/blocs/platforms/platforms.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'platforms_bloc_test.mocks.dart';

@GenerateMocks([IGetAllPlatformsUseCase])
void main() {
  late MockIGetAllPlatformsUseCase useCase;
  late PlatformsBloc bloc;

  setUp(() {
    useCase = MockIGetAllPlatformsUseCase();
    bloc = PlatformsBloc(useCase);
  });

  tearDown(() {
    bloc.close();
  });

  blocTest(
    "Quando o useCase retornar um sucesso o "
    "bloc deve iniciar carregando e terminar com sucesso",
    build: () {
      when(useCase.call()).thenAnswer(
        (_) async => const Right<Failure, List<PlatformEntity>>([]),
      );
      return bloc;
    },
    act: (PlatformsBloc bloc) {
      bloc.add(GetAllPlatformsEvent());
    },
    expect: () => [
      isA<LoadingPlatformsState>(),
      isA<SuccessPlatformsState>(),
    ],
  );

  blocTest(
    "Quando o useCase retornar uma falha o "
    "bloc deve iniciar carregando e terminar com falha",
    build: () {
      when(useCase.call()).thenAnswer(
        (_) async => Left<Failure, List<PlatformEntity>>(
          Failure(message: ""),
        ),
      );
      return bloc;
    },
    act: (PlatformsBloc bloc) {
      bloc.add(GetAllPlatformsEvent());
    },
    expect: () => [
      isA<LoadingPlatformsState>(),
      isA<FailurePlatformsState>(),
    ],
  );
}
