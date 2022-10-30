import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

import '../../../domain/entities/entities.dart';

class GamePage extends StatelessWidget {
  final GameEntity game;

  const GamePage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            game.cover != null
                ? Image.network(
                    "${ApiConstants.apiUrlImagePrefix}"
                    "${game.cover!.imageId}.jpg",
                    fit: BoxFit.cover,
                  )
                : Container(),
            const SizedBox(height: 20),
            Text(game.name),
            const SizedBox(height: 20),
            game.genres.isNotEmpty
                ? Text("Genres: ${game.genres.join(", ")}")
                : Container(),
            const SizedBox(height: 20),
            Text("Platforms: ${game.platforms.join(", ")}"),
            const SizedBox(height: 20),
            game.summary != null ? Text(game.summary!) : Container(),
          ],
        ),
      ),
    );
  }
}
