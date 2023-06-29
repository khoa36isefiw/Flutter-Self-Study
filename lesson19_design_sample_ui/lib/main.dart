import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sample UI'),
          ),
          body: const MyWidget(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Expanded(
        // color: Colors.lightGreen,
        // insert an image from the internet through URL
        child: Image.network(
          'https://i.pinimg.com/originals/c8/33/35/c83335c6cc5eae6b676e9d0095089bf7.jpg',
          alignment: Alignment.center,
          //stretch image
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        bottom: 40, // cách dưới 40px
        left: 20, // cách bên trái 20px
        right: 20, // cách bên phải 20px
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  'Giyuu Dev Flutter',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text('I am learning a new Programming Language.'
                    ' It is Flutter, which is an open source framework '
                    'by Google for building beautiful, natively compiled,'
                    ' multi-platform applications from a single codebase.'),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
