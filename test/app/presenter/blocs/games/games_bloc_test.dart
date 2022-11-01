import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/dtos/dtos.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/app/presenter/blocs/games/games.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'games_bloc_test.mocks.dart';

@GenerateMocks([IGetAllGamesUseCase])
void main() {
  late MockIGetAllGamesUseCase useCase;
  late GamesBloc bloc;
  late GetAllGamesInputDto input;

  setUp(() {
    useCase = MockIGetAllGamesUseCase();
    bloc = GamesBloc(useCase);
    input = const GetAllGamesInputDto(platformId: 1, limit: 30, offset: 0);
  });

  tearDown(() {
    bloc.close();
  });

  blocTest(
    "Quando o useCase retornar um sucesso o "
    "bloc deve iniciar carregando e terminar com sucesso",
    build: () {
      when(useCase.call(input: input)).thenAnswer(
        (_) async => const Right<Failure, List<GameEntity>>([]),
      );
      return bloc;
    },
    act: (GamesBloc bloc) {
      bloc.add(const GetAllGamesEvent(platformId: 1));
    },
    expect: () => [
      isA<LoadingGamesState>(),
      isA<SuccessGamesState>(),
    ],
  );

  blocTest(
    "Quando o useCase retornar uma falha o "
    "bloc deve iniciar carregando e terminar com falha",
    build: () {
      when(useCase.call(input: input)).thenAnswer(
        (_) async => Left<Failure, List<GameEntity>>(
          Failure(message: ""),
        ),
      );
      return bloc;
    },
    act: (GamesBloc bloc) {
      bloc.add(const GetAllGamesEvent(platformId: 1));
    },
    expect: () => [
      isA<LoadingGamesState>(),
      isA<FailureGamesState>(),
    ],
  );
}
