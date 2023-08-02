import 'package:flutter/material.dart';
import 'package:lesson52_dark_theme/Theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'Theme/theme_model.dart';
import 'login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // provide an object ThemeModel all app
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        //listen for changes on the object
        builder: (context, ThemeModel themNotifier, child) {
          return MaterialApp(
            home: LoginPage(),
            theme: themNotifier.isDark ? AppTheme.dark : AppTheme.light,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    ),
  );
}
