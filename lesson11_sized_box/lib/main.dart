import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: MyWidget(),
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
// dùng khi ta biết trước width and height của nó
// thì dùng sizedBox
    return Center(
      child: SizedBox.expand(
        // content trong sized box này thì sẽ hường theo width vs height
        // đã đc định nghĩa
        // width: double.infinity,
        // height: double.infinity,

        // nếu sizedBox.expand thì width and height
        //dượcd định nghĩa là double.infinity
        child: ElevatedButton(
          onPressed: () {
            // toast message
            var snackBar = const SnackBar(
                content: Text('Toast Message In Flutter with Source Code:' +
                    'var snackBar = const SnackBar('
                        '  content: Text(Something is Here!),'
                        ' );'
                        ' ScaffoldMessenger.of(context).showSnackBar(snackBar);'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text(
            'Flutter',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
