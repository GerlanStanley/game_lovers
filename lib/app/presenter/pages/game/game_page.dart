import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';

import '../../blocs/theme/theme.dart';

import 'components/components.dart';

class GamePage extends StatelessWidget {
  final GameEntity game;

  const GamePage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      backgroundColor: themeBloc.state.isDark
          ? Theme.of(context).backgroundColor
          : Theme.of(context).cardColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "game${game.id}",
                  child: ImageComponent(game: game),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                  decoration: BoxDecoration(
                    color: themeBloc.state.isDark
                        ? Theme.of(context).backgroundColor
                        : Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            game.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 20),
                          SummaryComponent(game: game),
                          const SizedBox(height: 20),
                          GenresComponent(game: game),
                          const SizedBox(height: 20),
                          PlatformsComponent(game: game),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            top: true,
            child: Container(
              margin: const EdgeInsets.only(left: 8, top: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ).frosted(
                blur: 2.5,
                frostColor: Colors.black12,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
