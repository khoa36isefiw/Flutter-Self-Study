import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/images/forgetpassword.png'),
      //     fit: BoxFit.cover,
      //   ),
      // ),

      // color for this background screen
      color: Colors.grey.shade900,
      child: Scaffold(
        backgroundColor: Colors.transparent, // background color for this screen
        appBar: AppBar(
          title: const Text('Forgot Password'),
          backgroundColor: Colors.transparent, // for this title
          //setting bar lift
          elevation: 0, // nâng độ cao của thanh tiêu đề
        ),
        // can scroll
        body: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    Positioned(
                      // left: MediaQuery.of(context).size.width / 2,
                      top: MediaQuery.of(context).size.height / 5,
                      left: 100,
                      right: 0,
                      // add image to a Circle
                      child: const CircleAvatar(
                        // backgroundImage: NetworkImage(
                        //   'https://i.pinimg.com/originals/9e/a7/c3/9ea7c37566fa5d5ec0bb87e6d50a6e20.gif',
                        // ),
                        backgroundImage:
                            AssetImage('assets/images/img_rengoku.gif'),
                        radius: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                      // make text to center
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Enter the email address with associated\n with your account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Enter Email Address',
                          hintStyle: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Try another way',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          // if button is clicked will redirect user to
                          // verify  Password  with OTP code
                          Navigator.pushNamed(context, 'verifyPassword');
                        },
                        label: const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        // change another color very fast when users click into it

                        // but hold this button the color will spread all
                        //over and change to another defined color
                        splashColor: Colors.deepOrangeAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
