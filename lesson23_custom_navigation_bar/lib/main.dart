import 'package:flutter/material.dart';
import 'package:lesson23_custom_navigation_bar/pages/tab_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.orange.shade100,
          indicatorColor: Colors.blue.shade500,
        ),
      ),
      home: const SafeArea(
        child: Scaffold(
          body: TabPage(),
        ),
      ),
    );
  }
}
