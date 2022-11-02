import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:game_lovers/app/domain/use_cases/use_cases.dart';
import 'package:game_lovers/app/presenter/blocs/theme/theme.dart';
import 'package:game_lovers/core/failures/failures.dart';

import 'theme_bloc_test.mocks.dart';

@GenerateMocks([IGetIsDarkUseCase, ISaveIsDarkUseCase])
void main() {
  late MockIGetIsDarkUseCase getUseCase;
  late MockISaveIsDarkUseCase saveUseCase;
  late ThemeBloc bloc;

  setUp(() {
    getUseCase = MockIGetIsDarkUseCase();
    saveUseCase = MockISaveIsDarkUseCase();
    bloc = ThemeBloc(getUseCase, saveUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  group("OnInitial", () {
    blocTest(
      "Quando o useCase retornar um sucesso o "
      "bloc deve emitir um ThemeState com o booleano retornado",
      build: () {
        when(getUseCase.call()).thenReturn(const Right<Failure, bool>(true));
        return bloc;
      },
      act: (ThemeBloc bloc) {
        bloc.add(InitialThemeEvent());
      },
      expect: () => [
        isA<ThemeState>().having((value) => value.isDark, "isDark", true),
      ],
    );

    blocTest(
      "Quando o useCase retornar uma falha o "
      "bloc deve emitir um ThemeState com o booleano false",
      build: () {
        when(getUseCase.call())
            .thenReturn(Left<Failure, bool>(Failure(message: "")));
        return bloc;
      },
      act: (ThemeBloc bloc) {
        bloc.add(InitialThemeEvent());
      },
      expect: () => [
        isA<ThemeState>().having((value) => value.isDark, "isDark", false),
      ],
    );
  });

  group("OnChange", () {
    blocTest(
      "Deve emitir um ThemeState com o booleano passado",
      build: () {
        when(saveUseCase.call(value: anyNamed("value"))).thenAnswer((_) async =>
          const Right<Failure, bool>(true),
        );
        return bloc;
      },
      act: (ThemeBloc bloc) {
        bloc.add(ChangeThemeEvent());
        bloc.add(ChangeThemeEvent());
      },
      expect: () => [
        isA<ThemeState>().having((value) => value.isDark, "isDark", true),
        isA<ThemeState>().having((value) => value.isDark, "isDark", false),
      ],
    );
  });
}
