import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers/core/constants/constants.dart';
import 'package:integration_test/integration_test.dart';

import 'package:game_lovers/app/presenter/pages/game/game.dart';
import 'package:game_lovers/app/presenter/pages/home/components/components.dart';

import 'package:game_lovers/main.dart' as app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Alternar entre tabs e carregar lista",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final tabPlatformComponent = find.byKey(const Key("tab_platform_1"));
      await tester.tap(tabPlatformComponent);

      await tester.pumpAndSettle();

      expect(find.byType(GridViewComponent), findsOneWidget);
    },
  );

  testWidgets(
    "Clicar em um item do grid e abrir tela do jogo",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final gameItemComponent = find.byKey(
        const Key("game_item_component_0"),
      );
      await tester.tap(gameItemComponent);

      await tester.pumpAndSettle();

      expect(find.byType(GamePage), findsOneWidget);
    },
  );

  testWidgets(
    "Clicar no botão de tema e alternar para o novo tema",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      var scaffold = find.byType(Scaffold).evaluate().single.widget as Scaffold;
      final backgroundColor = scaffold.backgroundColor;

      await tester.tap(find.byKey(const Key("theme_button")));

      await tester.pumpAndSettle();

      scaffold = find.byType(Scaffold).evaluate().single.widget as Scaffold;
      final newBackgroundColor = scaffold.backgroundColor;

      expect(
        newBackgroundColor,
        backgroundColor == ColorsConstantsLight.background
            ? ColorsConstantsDark.background
            : ColorsConstantsLight.background,
      );
    },
  );

  testWidgets(
    "Scroll até o final da lista e aguardar carregar mais itens",
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final gridFinder = find.byType(GridView);
      final itemFinder = find.byKey(const ValueKey("game_item_component_30"));

      await tester.dragUntilVisible(
        itemFinder,
        gridFinder,
        const Offset(0, -500),
      );

      await tester.pumpAndSettle();

      var gridView = find.byType(GridView).evaluate().single.widget as GridView;

      expect(gridView.semanticChildCount, greaterThan(30));
    },
  );
}
