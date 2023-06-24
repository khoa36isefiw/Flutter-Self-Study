import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Column in Flutter'),
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
    return Container(
      color: Colors.blue,
      child: Column(
        // phạm vi column này chỉ nằm trong content thui
        mainAxisSize: MainAxisSize.max,
        // children is an Array
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        // căn chỉnh theo trục ngang
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ElevatedButton.icon(
            onPressed: () {
              var snackBar = const SnackBar(
                content: Text(
                  'This is called ElevatedButton',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.lightGreenAccent,
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            label: const Text('Favorite'),
            icon: const Icon(Icons.favorite),
            // edit another color
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.blue,
            ),
          ),

          // child-2
          Container(
            width: 200,
            child: ElevatedButton.icon(
              onPressed: () {
                var snackBar = const SnackBar(
                  content: Text(
                    'This is called ElevatedButton',
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              label: const Text('Code'),
              icon: const Icon(Icons.code_sharp),
              // edit another color
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
            ),
          ),

          // child 3
          ElevatedButton.icon(
            onPressed: () {
              var snackBar = const SnackBar(
                content: Text(
                  'This is called ElevatedButton',
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            label: const Text('Snow'),
            icon: const Icon(Icons.snowshoeing),
            // edit another color
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
