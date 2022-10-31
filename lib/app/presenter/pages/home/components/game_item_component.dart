import 'package:blur/blur.dart';
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
    var borderRadius = const BorderRadius.all(Radius.circular(20));
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
                ? CachedNetworkImageWidget(
                    image: "${ApiConstants.apiUrlImagePrefix}"
                        "${game.cover!.imageId}.jpg",
                    fit: BoxFit.cover,
                    borderRadius: borderRadius,
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      game.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Rating: ${game.rating.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ).frosted(
                  blur: 2.5,
                  frostColor: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(12),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
