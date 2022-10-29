import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/games/games.dart';
import '../../../widgets/widgets.dart';
import 'components.dart';

class TabGamesComponent extends StatefulWidget {
  final int platformId;

  const TabGamesComponent({
    Key? key,
    required this.platformId,
  }) : super(key: key);

  @override
  State<TabGamesComponent> createState() => _TabGamesComponentState();
}

class _TabGamesComponentState extends State<TabGamesComponent> {
  late final GamesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<GamesBloc>();
    bloc.add(GetAllGamesEvent(platformId: widget.platformId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesBloc, GamesState>(
      builder: (context, state) {
        if (state is LoadingGamesState) {
          return const LoadWidget();
        } else if (state is FailureGamesState) {
          return FailureWidget(
            message: state.error,
            onPressed: () => bloc.add(GetAllGamesEvent(
              platformId: widget.platformId,
            )),
          );
        } else if (state is SuccessGamesState) {
          if (state.games.isEmpty) {
            return const EmptyWidget(
              iconData: Icons.videogame_asset_outlined,
              title: "No game",
              subtitle: "We couldn't find any games in the database",
            );
          }

          return const ListViewComponent();
        }

        return Container();
      },
    );
  }
}
