import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/games/games.dart';

import 'components.dart';

class GridViewComponent extends StatelessWidget {
  final int platformId;

  const GridViewComponent({
    Key? key,
    required this.platformId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<GamesBloc>();
    var list = bloc.state.games;

    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          //
          bloc.add(GetAllGamesEvent(platformId: platformId));
        }
        return false;
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.6,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          var game = list[index];
          return GameItemComponent(game: game);
        },
      ),
    );
  }
}
