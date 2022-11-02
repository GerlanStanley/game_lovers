import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers/app/domain/entities/entities.dart';
import 'package:game_lovers/app/presenter/blocs/theme/theme.dart';
import 'package:mocktail/mocktail.dart';

import 'package:game_lovers/app/presenter/blocs/games/games.dart';
import 'package:game_lovers/app/presenter/pages/home/components/components.dart';
import 'package:game_lovers/app/presenter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MockGamesBloc extends MockBloc<GamesEvent, GamesState>
    implements GamesBloc {}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

void main() {
  late MockGamesBloc bloc;
  late MockThemeBloc themeBloc;

  setUp(() {
    bloc = MockGamesBloc();
    themeBloc = MockThemeBloc();
    when(() => themeBloc.state).thenAnswer((_) => ThemeState(isDark: false));
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets(
    "Deve exibir o widget LoadWidget quando "
    "o estado do bloc for LoadingGamesState",
    (WidgetTester tester) async {
      when(() => bloc.state)
          .thenAnswer((_) => const LoadingGamesState(games: []));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<GamesBloc>(create: (context) => bloc),
            Provider<ThemeBloc>(create: (context) => themeBloc),
          ],
          child: const MaterialApp(home: TabViewGamesComponent(platformId: 1)),
        ),
      );

      final loadWidget = find.byType(LoadWidget);
      final failureWidget = find.byType(FailureWidget);
      final emptyWidget = find.byType(EmptyWidget);
      final gridViewComponent = find.byType(GridViewComponent);

      await tester.pump();

      expect(loadWidget, findsOneWidget);
      expect(failureWidget, findsNothing);
      expect(emptyWidget, findsNothing);
      expect(gridViewComponent, findsNothing);
    },
  );

  testWidgets(
    "Deve exibir o widget FailureWidget quando "
    "o estado do bloc for FailurePlatformsState",
    (WidgetTester tester) async {
      when(() => bloc.state)
          .thenAnswer((_) => const FailureGamesState(error: "", games: []));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<GamesBloc>(create: (context) => bloc),
            Provider<ThemeBloc>(create: (context) => themeBloc),
          ],
          child: const MaterialApp(home: TabViewGamesComponent(platformId: 1)),
        ),
      );

      final loadWidget = find.byType(LoadWidget);
      final failureWidget = find.byType(FailureWidget);
      final emptyWidget = find.byType(EmptyWidget);
      final gridViewComponent = find.byType(GridViewComponent);

      await tester.pump();

      expect(loadWidget, findsNothing);
      expect(failureWidget, findsOneWidget);
      expect(emptyWidget, findsNothing);
      expect(gridViewComponent, findsNothing);
    },
  );

  testWidgets(
    "Deve exibir o widget TabBarComponent quando "
    "o estado do bloc for SuccessPlatformsState e a lista for vazia",
    (WidgetTester tester) async {
      when(() => bloc.state).thenAnswer(
        (_) => const SuccessGamesState(
          games: [],
          loadLast: true,
        ),
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<GamesBloc>(create: (context) => bloc),
            Provider<ThemeBloc>(create: (context) => themeBloc),
          ],
          child: const MaterialApp(home: TabViewGamesComponent(platformId: 1)),
        ),
      );

      final loadWidget = find.byType(LoadWidget);
      final failureWidget = find.byType(FailureWidget);
      final emptyWidget = find.byType(EmptyWidget);
      final gridViewComponent = find.byType(GridViewComponent);

      await tester.pump();

      expect(loadWidget, findsNothing);
      expect(failureWidget, findsNothing);
      expect(emptyWidget, findsOneWidget);
      expect(gridViewComponent, findsNothing);
    },
  );

  testWidgets(
    "Deve exibir o widget TabBarComponent quando "
    "o estado do bloc for SuccessPlatformsState e a lista não for vazia",
    (WidgetTester tester) async {
      when(() => bloc.state).thenAnswer(
        (_) => SuccessGamesState(
          games: [
            GameEntity(
              id: 1,
              name: "",
              summary: "",
              rating: 1,
              cover: null,
              platforms: [],
              genres: [],
            ),
          ],
          loadLast: true,
        ),
      );

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<GamesBloc>(create: (context) => bloc),
            Provider<ThemeBloc>(create: (context) => themeBloc),
          ],
          child: const MaterialApp(home: TabViewGamesComponent(platformId: 1)),
        ),
      );

      final loadWidget = find.byType(LoadWidget);
      final failureWidget = find.byType(FailureWidget);
      final emptyWidget = find.byType(EmptyWidget);
      final gridViewComponent = find.byType(GridViewComponent);

      await tester.pump();

      expect(loadWidget, findsNothing);
      expect(failureWidget, findsNothing);
      expect(emptyWidget, findsNothing);
      expect(gridViewComponent, findsOneWidget);
    },
  );
}
