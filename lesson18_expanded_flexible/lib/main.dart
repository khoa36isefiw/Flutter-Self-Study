import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Expanded and Flexible'),
          ),
          body: const MyWidgetFlexible(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidgetExpanded extends StatelessWidget {
  const MyWidgetExpanded({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}

class MyWidgetFlexible extends StatelessWidget {
  const MyWidgetFlexible({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          // khi xài loose thì set height cho Flexible thì nó sẽ bị ảnh hưởng
          fit: FlexFit.loose, // thì sẽ overflow

          // if we set FIT OF FLEXIBLE like Expanded:
          //fit: FlexFit.tight,   // không ảnh hưởng khi set height
          child: Container(
            height: 100, // sẽ ảnh hưởng tới container khi set nếu dùng loose
            color: Colors.orange,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
