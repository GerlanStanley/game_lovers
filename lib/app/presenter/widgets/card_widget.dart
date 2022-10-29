import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Function()? onTap;
  final BorderRadius borderRadius;
  final bool disableDecoration;
  final Color backgroundColor;
  final Border border;
  final bool shadowTop;
  final double elevation;

  const CardWidget({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(0),
    this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.disableDecoration = false,
    this.backgroundColor = Colors.white,
    this.border = const Border(),
    this.shadowTop = false,
    this.elevation = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: disableDecoration ? Colors.transparent : backgroundColor,
        borderRadius: borderRadius,
        border: border,
        boxShadow: disableDecoration
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, shadowTop ? -elevation : elevation),
                )
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(padding: padding, child: child),
        ),
      ),
    );
  }
}
