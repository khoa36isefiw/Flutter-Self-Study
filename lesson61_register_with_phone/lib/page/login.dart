import 'dart:async';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 0;

  @override
  void initState() {
    //Timer.periodic is a class used to create a periodic timer.
    // It allows you to perform an action
    //after a certain amount of time and repeat it periodically.
    Timer.periodic(Duration(seconds: 5), (timer) {
      // after 5 seconds increase 1
      setState(() {
        activeIndex++;
// count up to 4 => reset
        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 350,
              width: 350,
              //make border Radius for the whole Child in Stack
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned(
                      // make image in center of Container with height: 350
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        //If the activeIndex matches the index of the image,
                        //its opacity is set to 1 (visible), otherwise,
                        // the opacity is set to 0 (hidden).
                        opacity: activeIndex == 0 ? 1 : 0,
                        // the duration of the opacity animation,
                        duration: Duration(seconds: 4),
                        curve: Curves.linear,
                        // make borderRaius for this image
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/img_rengoku_ruc_chay.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: activeIndex == 1 ? 1 : 0,
                        // duration for hide this image
                        duration: Duration(seconds: 4),
                        curve: Curves.linear,
                        child: Image.asset(
                          'assets/images/img_rengoku_in_fire_9th.jpeg',
                          // height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: activeIndex == 2 ? 1 : 0,
                        // duration for hide this image
                        duration: Duration(seconds: 4),
                        curve: Curves.linear,
                        child: Image.asset(
                          'assets/images/img_inosuke_moon.jpeg',
                          // height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AnimatedOpacity(
                        opacity: activeIndex == 3 ? 1 : 0,
                        // duration for hide this image
                        duration: Duration(seconds: 4),
                        curve: Curves.linear,
                        child: Image.network(
                          'https://i.pinimg.com/564x/dc/95/33/dc953375d20e245b57bef1a38ed86ec6.jpg',
                          // height: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // make textfield when user presson on this ->
            // show label and hintText, but the label needs
            // to line on the border of textField

            // email
            TextField(
              // change color of cursor when use click on this field
              cursorColor: Colors.black,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.symmetric(
                //   vertical: 10,
                //   horizontal: 10,
                // ),
                hintText: 'Username or Email',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                // don't touch into it
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green.shade400,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                // when touch into this textField
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber.shade800,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                // hint Label
                labelText: 'Email',
                // modify labelText when it is pressed on
                // line on borderSide
                floatingLabelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                // modify style for label
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                // make size for this textField
                contentPadding: const EdgeInsets.all(0),
                labelText:
                    'Password', // make label show in border of text field
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                labelStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
                prefixIcon: const Icon(
                  Icons.key,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade200,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // floatingLabelStyle: TextStyle(
                //   color: Colors.black,
                //   fontSize: 18.0,
                // ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            // make button login
            Container(
              padding: const EdgeInsets.only(
                top: 3,
                left: 3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.amber,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: MaterialButton(
                onPressed: () {},
                height: 50,
                color: Colors.amber,
                child: Text(
                  "Login",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // don't have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
