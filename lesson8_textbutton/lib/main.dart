import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: disableButton(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// some property basic when we use widget button
//1. Click
//2. Size
//3. Padding
//4. Margin
//5. Shape
//6. Shadow
//7. Border
//8. Icon
//9. Disable

// this Widget uses for ENABLE button
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin --> need put it into container

      // padding the space between it 20 pixel
      margin: const EdgeInsets.all(100),
      child: TextButton.icon(
        // event handling at here
        onPressed: () {
          // print('Text Button is Clicked!');

          // 2 ways show toast message

          // ------- Method 1----------
          // show toast message for User by ScaffoldMessenger
          var snackBar = const SnackBar(
            content: Text('Text Button is Clicked!'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          // ------- Method 2----------
          // Toast Message by Lib
          // Fluttertoast.showToast(
          //   msg: 'Text Button is Clicked!',
          //   toastLength: Toast.LENGTH_SHORT,
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.black,
          //   textColor: Colors.brown,
          //   fontSize: 16.0,
          // );
        },

        // set color for button
        style: TextButton.styleFrom(
          foregroundColor: Colors.brown,
          backgroundColor: Colors.green,

          // Size for button  following this format: width:200 - height: 80
          //minimumSize: const Size(200, 80),

          //padding button --> padding the content of this
          padding: const EdgeInsets.all(25.0),

          // shape - border radius

          // Input radius value
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          // add shadow for this button
          elevation: 60, // độ rộng của shadow

          // withOpacity là độ đậm nhạt của bóng shadow
          shadowColor: Colors.blue.withOpacity(1),

          // border for text button
          side: const BorderSide(width: 3, color: Colors.deepOrange),
        ),

        //icon: add a icon beside  text in the button

        icon: const Icon(
          Icons.ac_unit_sharp,
          size: 20,
          color: Colors.yellow,
        ),
        // set text for button is here
        // nếu xài Icon ở đây thì child ở bên dưới phải đổi thành label
        label: const Text(
          'Text Button',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}

// this Widget is used to stand for disable a button
class disableButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: TextButton(
        onPressed: null,
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.white,
        ),
        child: const Text(
          'Disable Button',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
