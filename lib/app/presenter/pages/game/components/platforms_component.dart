import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';

class PlatformsComponent extends StatelessWidget {
  final GameEntity game;

  const PlatformsComponent({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Platforms: ",
            style: Theme.of(context).textTheme.headline1,
          ),
          TextSpan(
            text: game.platforms.join(", "),
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}
