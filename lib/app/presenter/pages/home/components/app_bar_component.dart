import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Text(
        "Game Lovers App",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
    );
  }
}
