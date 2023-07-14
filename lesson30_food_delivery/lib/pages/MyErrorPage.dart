import 'package:flutter/material.dart';

class MyErrorPage extends StatelessWidget {
  const MyErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text(
          'Page not found.',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
