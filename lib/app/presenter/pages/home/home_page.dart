import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/platforms/platforms.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlatformsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<PlatformsBloc>();
    bloc.add(GetAllPlatformsEvent());
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

          body = Container();
          tabBar = TabBar(
            tabs: state.platforms
                .map((element) => Tab(
                      text: element.name,
                    ))
                .toList(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            bottom: tabBar,
          ),
          body: body,
        );
      },
    );
  }
}
