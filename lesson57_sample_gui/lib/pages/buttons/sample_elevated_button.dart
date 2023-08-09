import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleElevatedButton extends StatelessWidget {
  // ? may get null value
  final Color? color;
  final Widget? child;
  final Function? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const SimpleElevatedButton(
      {this.child,
      this.color,
      this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get the current theme from the context in Flutter.
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        // ?? means: if color is null then backgroundColor
        //  is currentTheme.primaryColor
        backgroundColor: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: child,
    );
  }
}
