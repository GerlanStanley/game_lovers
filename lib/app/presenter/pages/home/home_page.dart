import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../blocs/games/games.dart';
import '../../blocs/platforms/platforms.dart';
import '../../widgets/widgets.dart';
import 'components/components.dart';

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
    return BlocConsumer<PlatformsBloc, PlatformsState>(
      listener: (context, state) {
        if (state is SuccessPlatformsState) {
          tabController = TabController(
            vsync: this,
            length: state.platforms.length,
          );
          tabController?.addListener(() {
            setState(() {});
          });
        }
      },
      builder: (context, state) {
        Widget body = Container();
        Widget? tabBar;

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
              title: "No platform",
              subtitle: "We didn't find any platform in the database",
            );
          }

          tabBar = TabBarComponent(
            tabController: tabController!,
            platforms: state.platforms,
          );

          body = Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 24),
                child: Text(
                  "Best rating",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: state.platforms
                      .map(
                        (element) => Provider<GamesBloc>(
                          create: (context) => GamesBloc(context.read()),
                          child: TabViewGamesComponent(platformId: element.id),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        }

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SafeArea(child: AppBarComponent()),
              tabBar ?? Container(),
              Expanded(child: body),
            ],
          ),
        );
      },
    );
  }
}
