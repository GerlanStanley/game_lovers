import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers/app/presenter/pages/game/game.dart';
import 'package:game_lovers/app/presenter/widgets/widgets.dart';
import 'package:integration_test/integration_test.dart';

import 'package:game_lovers/app/presenter/pages/home/components/components.dart';

import 'package:game_lovers/main.dart' as app;

void main() {
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
    "Clicar em um item do grid e abrir nova tela",
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
}
