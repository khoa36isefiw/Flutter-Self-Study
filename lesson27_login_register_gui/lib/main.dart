import 'package:flutter/material.dart';
import 'package:lesson27_login_register_gui/registerAccount.dart';
import 'package:lesson27_login_register_gui/verifyPassword.dart';

import 'forgotPassword.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SafeArea(
        child: Scaffold(
          body: MyLogin(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'register': (context) => const RegisterAccount(),
        'login': (context) => const MyLogin(),
        'forgotPassword': (context) => const ForgotPassword(),
        'verifyPassword': (context) => const VerifyPassword(),
      },
    );
  }
}
