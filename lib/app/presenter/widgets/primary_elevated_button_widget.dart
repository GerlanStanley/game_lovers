import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class PrimaryElevatedButtonWidget extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onPressed;
  final double height;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const PrimaryElevatedButtonWidget({
    Key? key,
    this.text,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.height = 60,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return ColorsConstantsLight.primaryButtonBackgroundDisabled;
              }
              return ColorsConstantsLight.primaryButtonBackground;
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return 0;
              } else if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused)) {
                return 2;
              }
              return 4;
            },
          ),
          padding: MaterialStateProperty.resolveWith<EdgeInsets>(
            (Set<MaterialState> states) {
              return padding;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> states) {
              return RoundedRectangleBorder(
                borderRadius: borderRadius,
              );
            },
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            leading ?? Container(),
            Center(
              child: text != null
                  ? Text(
                      text!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsConstantsLight.primaryButtonText,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : child ?? Container(),
            ),
            trailing ?? Container()
          ],
        ),
      ),
    );
  }
}
