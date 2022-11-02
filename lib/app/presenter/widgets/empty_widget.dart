import 'package:flutter/material.dart';
import 'package:game_lovers/app/presenter/widgets/widgets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final String subtitle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 100,
              color: Theme.of(context).textTheme.subtitle2?.color,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                title,
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: PrimaryElevatedButtonWidget(
                text: "Touch to reaload",
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
