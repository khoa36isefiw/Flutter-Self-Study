import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

//animated_button: ^0.2.0
class AnimatedButtonsExample extends StatefulWidget {
  const AnimatedButtonsExample({Key? key}) : super(key: key);

  @override
  _AnimatedButtonsExampleState createState() => _AnimatedButtonsExampleState();
}

class _AnimatedButtonsExampleState extends State<AnimatedButtonsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        title: Text(
          'Animated Buttons',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedButton(
              color: Colors.deepOrange,
              child: Text(
                'Animated button',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
              duration: 20,
              height: 70,
              shadowDegree: ShadowDegree.dark,
            ),
            const SizedBox(height: 30),
            AnimatedButton(
              color: Colors.yellowAccent,
              onPressed: () {},
              height: 100,
              child: Center(
                child: Text(
                  'Circle',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              shape: BoxShape.circle,
            ),
          ],
        ),
      ),
    );
  }
}
