import 'package:flutter/material.dart';

import 'app/presenter/pages/home/home.dart';
import 'core/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Game Lovers App",
      theme: ThemeConstants.light,
      home: const HomePage(),
    );
  }
}
