import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';

class TabPlatformComponent extends StatelessWidget {
  final PlatformEntity platform;
  final bool selected;
  final Function() onTap;

  const TabPlatformComponent({
    Key? key,
    required this.platform,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: selected
                  ? Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )
                  : null,
            ),
            child: Text(
              platform.name,
              style: selected
                  ? Theme.of(context).tabBarTheme.labelStyle
                  : Theme.of(context).tabBarTheme.unselectedLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
