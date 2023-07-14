import 'package:flutter/material.dart';
import 'package:lesson30_food_delivery/pages/MyErrorPage.dart';
import 'package:lesson30_food_delivery/pages/StartPage.dart';

import 'pages/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const SafeArea(
        child: Scaffold(
          body: StartPage(),
        ),
      ),
      routes: {
        'start_order': (context) => HomePage(),
      },
      onUnknownRoute: (settings) {
        // Handle unknown routes by showing an error page or redirecting to a default page.
        return MaterialPageRoute(builder: (context) => const MyErrorPage());
      },
    ),
  );
}
