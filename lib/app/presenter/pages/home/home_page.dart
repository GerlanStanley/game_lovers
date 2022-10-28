import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/platforms/platforms.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final PlatformsBloc bloc;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    bloc = context.read<PlatformsBloc>();
    bloc.add(GetAllPlatformsEvent());
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlatformsBloc, PlatformsState>(
      builder: (context, state) {
        Widget body = Container();
        PreferredSizeWidget? tabBar;

        if (state is LoadingPlatformsState) {
          body = const LoadWidget();
        } else if (state is FailurePlatformsState) {
          body = FailureWidget(
            message: state.error,
            onPressed: () => bloc.add(GetAllPlatformsEvent()),
          );
        } else if (state is SuccessPlatformsState) {
          if (state.platforms.isEmpty) {
            body = const EmptyWidget(
              iconData: Icons.videogame_asset_outlined,
              title: "Sem plataformas",
              subtitle: "Não encontramos nenhuma plataforma na base de dados",
            );
          }

          tabController = TabController(
            vsync: this,
            length: state.platforms.length,
          );

          body = Container();
          tabBar = TabBar(
            isScrollable: true,
            controller: tabController,
            tabs: state.platforms
                .map((element) => Tab(
                      text: element.name,
                    ))
                .toList(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Game Lovers App"),
            bottom: tabBar,
          ),
          body: body,
        );
      },
    );
  }
}
