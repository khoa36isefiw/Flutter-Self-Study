import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        body: MyWidget(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.blueGrey,
      child: Padding(
        // padding: EdgeInsets.all(30.0), // 30.0 at here means 30.0 pixel

        // In addition we can use LTRB is Left, Top, Right and Bottom
        // padding: EdgeInsets.fromLTRB(
        //  30.0, 50.0, 100.0, 70.0), // 30.0 at here means 30.0 pixel

        // Besides that, we also can use .only (right: 30.x, left: 10.0) --> Example
        // padding: EdgeInsets.only(left: 30.0, right: 100.0, top: 200.0),

        // Another method is we can use symmetric. It based on Width and Height
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 175.0),

        child: Text(
          'HelloWorld!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
