import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/theme/theme.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ThemeBloc>();

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Game Lovers App",
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          IconButton(
            onPressed: () {
              bloc.add(ChangeThemeEvent());
            },
            icon: Icon(
              bloc.state.isDark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).appBarTheme.titleTextStyle?.color,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
