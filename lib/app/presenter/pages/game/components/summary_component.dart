import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';

class SummaryComponent extends StatelessWidget {
  final GameEntity game;

  const SummaryComponent({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return game.summary != null
        ? Text(
            game.summary!,
            style: Theme.of(context).textTheme.bodyText1,
          )
        : Container();
  }
}
