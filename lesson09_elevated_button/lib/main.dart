import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          //set background color for all screen
          backgroundColor: Colors.blue,
          body: disableElevatedButton(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //set background color for container
        color: Colors.yellow,
        margin: const EdgeInsets.only(top: 20),

        // thêm icon vào
        child: ElevatedButton.icon(
          onPressed: () {
            var snackBar = const SnackBar(
              content: Text('Elevated Button is Clicked!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,

            // set size
            // minimumSize: Size(240, 10),

            // padding
            padding: const EdgeInsets.all(20),
            // margin --> phải bỏ nó vào trong container

            //shape --> add border radius
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            // độ rộng của bóng
            elevation: 30,
            // bóng của button
            shadowColor: Colors.yellow.withOpacity(0.9),

            // border cho button
            side: const BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),

          // icon
          icon: const Icon(
            Icons.access_time_sharp,
            color: Colors.blue,
          ),

          // note: khi xài button.icon thì phải thay đổi chỗ Text child --> label
          label: const Text(
            'Elevated Button',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class disableElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //set background color for container
        color: Colors.yellow,
        margin: const EdgeInsets.only(top: 20),

        // thêm icon vào
        child: ElevatedButton.icon(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: Colors.grey,
            disabledForegroundColor: Colors.pink,

            // border radius for disable button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            // padding for disable button
            padding: const EdgeInsets.all(20),

            // add border for disable button
            side: const BorderSide(color: Colors.green, width: 4),
          ),

          // icon
          icon: const Icon(
            Icons.access_time_sharp,
            color: Colors.blue,
          ),

          // note: khi xài button.icon thì phải thay đổi chỗ Text child --> label
          label: const Text(
            'Elevated Button Disable',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
