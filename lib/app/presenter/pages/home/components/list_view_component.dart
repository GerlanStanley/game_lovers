import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/games/games.dart';

class ListViewComponent extends StatelessWidget {
  const ListViewComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<GamesBloc>();
    var list = bloc.state.games;

    return ListView.builder(
      itemCount: list.length + 1,
      itemBuilder: (context, index) {
        if (index == list.length) {
          return Container();
        }

        var game = list[index];

        return Text(game.name);
      },
    );
  }
}
