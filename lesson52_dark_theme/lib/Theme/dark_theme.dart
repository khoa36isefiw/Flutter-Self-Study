import 'package:flutter/material.dart';

import 'app_color.dart';

// change color light to dark
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: AppColor.bodyColorDark,
  scaffoldBackgroundColor: AppColor.bodyColorDark,
  hintColor: AppColor.textColorDark,
  primaryColorLight: AppColor.buttonBackgroundColorDark,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.black,
  ),
);
