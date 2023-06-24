import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Rich Text',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.amber,
        ),
      ),
    ),
    home: const SafeArea(
      child: Scaffold(
        body: MyHomePage(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          // array contains many piece text
          text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
            TextSpan(text: 'Hello'),
            TextSpan(
              text: 'Bold',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextSpan(text: 'World!!'),
          ])),
    );
  }
}
