import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:game_lovers/app/presenter/blocs/platforms/platforms.dart';
import 'package:game_lovers/app/presenter/pages/home/components/components.dart';
import 'package:game_lovers/app/presenter/pages/home/home.dart';
import 'package:game_lovers/app/presenter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MockPlatformsBloc extends MockBloc<PlatformsEvent, PlatformsState>
    implements PlatformsBloc {}

void main() {
  late MockPlatformsBloc bloc;

  setUp(() {
    bloc = MockPlatformsBloc();
  });

  tearDown(() {
    bloc.close();
  });

  testWidgets(
    "Deve exibir o widget LoadWidget quando "
    "o estado do bloc for LoadingPlatformsState",
    (WidgetTester tester) async {
      when(() => bloc.state).thenAnswer((_) => LoadingPlatformsState());

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<PlatformsBloc>(create: (context) => bloc),
          ],
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      final loadWidget = find.byType(LoadWidget);
      final failureWidget = find.byType(FailureWidget);
      final tabBarComponent = find.byType(TabBarComponent);

      await tester.pump();

      expect(loadWidget, findsOneWidget);
      expect(failureWidget, findsNothing);
      expect(tabBarComponent, findsNothing);
    },
  );

  testWidgets(
    "Deve exibir o widget FailureWidget quando "
    "o estado do bloc for FailurePlatformsState",
    (WidgetTester tester) async {
      when(() => bloc.state)
          .thenAnswer((_) => const FailurePlatformsState(error: ""));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<PlatformsBloc>(create: (context) => bloc),
          ],
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      final loadWidget = find.byType(LoadWidget);
      final failureWidget = find.byType(FailureWidget);
      final tabBarComponent = find.byType(TabBarComponent);

      await tester.pump();

      expect(loadWidget, findsNothing);
      expect(failureWidget, findsOneWidget);
      expect(tabBarComponent, findsNothing);
    },
  );

  testWidgets(
    "Deve exibir o widget EmptyWidget quando "
    "o estado do bloc for SuccessPlatformsState",
    (WidgetTester tester) async {
      when(() => bloc.state)
          .thenAnswer((_) => const SuccessPlatformsState(platforms: []));

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<PlatformsBloc>(create: (context) => bloc),
          ],
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      final loadWidget = find.byType(LoadWidget);
      final failureWidget = find.byType(FailureWidget);
      final tabBarComponent = find.byType(TabBarComponent);

      await tester.pump();

      expect(loadWidget, findsNothing);
      expect(failureWidget, findsNothing);
      expect(tabBarComponent, findsOneWidget);
    },
  );
}
