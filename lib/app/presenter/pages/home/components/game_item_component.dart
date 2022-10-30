import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

import '../../../../domain/entities/entities.dart';

import '../../../widgets/widgets.dart';
import '../../game/game.dart';

class GameItemComponent extends StatelessWidget {
  final GameEntity game;

  const GameItemComponent({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.all(Radius.circular(8));
    return CardWidget(
      padding: const EdgeInsets.all(0),
      borderRadius: borderRadius,
      backgroundColor: Colors.black38,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GamePage(game: game)),
        );
      },
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            game.cover != null
                ? Image.network(
                    "${ApiConstants.apiUrlImagePrefix}"
                    "${game.cover!.imageId}.jpg",
                    fit: BoxFit.cover,
                  )
                : Container(),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xAA000000),
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Text(
                    game.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
