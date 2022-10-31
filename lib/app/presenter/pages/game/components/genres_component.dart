import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';

class GenresComponent extends StatelessWidget {
  final GameEntity game;

  const GenresComponent({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return game.genres.isNotEmpty
        ? RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Genres: ",
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextSpan(
                  text: game.genres.join(", "),
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          )
        : Container();
  }
}
