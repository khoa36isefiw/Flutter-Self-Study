import 'package:flutter/material.dart';

import 'ButtonAnimation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ButtonAnimation(Color.fromRGBO(57, 92, 249, 1),
                  Color.fromRGBO(44, 78, 233, 1)),
              const SizedBox(
                height: 20,
              ),
              ButtonAnimation(Colors.yellow[700]!, Colors.yellow[800]!),
              const SizedBox(
                height: 20,
              ),
              ButtonAnimation(Colors.green[400]!, Colors.green[600]!),
              const SizedBox(
                height: 20,
              ),
              ButtonAnimation(Colors.red[700]!, Colors.red[800]!),
            ],
          ),
        ),
      ),
    );
  }
}
