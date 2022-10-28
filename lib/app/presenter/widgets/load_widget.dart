import 'package:flutter/material.dart';

class LoadWidget extends StatefulWidget {
  final double? size;
  final Color? color;
  final EdgeInsets? margin;

  const LoadWidget({
    Key? key,
    this.size,
    this.color,
    this.margin,
  }) : super(key: key);

  @override
  State<LoadWidget> createState() => _LoadWidgetState();
}

class _LoadWidgetState extends State<LoadWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.size,
        height: widget.size,
        margin: widget.margin,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.color ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
