import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import 'components.dart';

class TabBarComponent extends StatelessWidget {
  final TabController tabController;
  final List<PlatformEntity> platforms;

  const TabBarComponent({
    Key? key,
    required this.tabController,
    required this.platforms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < platforms.length; i++)
              TabPlatformComponent(
                platform: platforms[i],
                selected: i == tabController.index,
                index: i,
                onTap: () {
                  tabController.animateTo(i);
                },
              )
          ],
        ),
      ),
    );
  }
}
