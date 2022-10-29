import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return BlocConsumer<GamesBloc, GamesState>(
      listener: (context, state) {
        if (state is LoadingGamesState && state.games.isNotEmpty) {
          Fluttertoast.showToast(
            msg: "Loading more",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingGamesState && state.games.isEmpty) {
          return const LoadWidget();
        } else if (state is FailureGamesState && state.games.isEmpty) {
          return FailureWidget(
            message: state.error,
            onPressed: () => bloc.add(GetAllGamesEvent(
              platformId: widget.platformId,
            )),
          );
        } else if (state is SuccessGamesState && state.games.isEmpty) {
          return const EmptyWidget(
            iconData: Icons.videogame_asset_outlined,
            title: "No game",
            subtitle: "We couldn't find any games in the database",
          );
        }

        return GridViewComponent(platformId: widget.platformId);
      },
    );
  }
}
