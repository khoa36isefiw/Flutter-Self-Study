import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // add image - method_1
      // width: MediaQuery.of(context).size.width,  // giá trị chiều rộng của màn hình
      // child: Image(
      //   image: AssetImage('assets/images/login.png'),
      //   fit: BoxFit.fill,
      // ),

      // add image -
      // image for the whole screen
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login GUI'), // title
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent.shade200,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.only(
                top: 95,
                left: 80,
              ),
              child: Container(
                child: const Text(
                  'Welcome\nBack',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.38,
                ),
                // padding: EdgeInsets.symmetric(
                //   vertical: (MediaQuery.of(context).size.height * 0.30),
                // ),
                child: Column(
                  // make all child in this column stay at 'start'
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        left: 35,
                        right: 35,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              // background color for inputText
                              fillColor: Colors.green.shade100,
                              filled: true, // must have this property

                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              // add border for this input Text
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // set the content padding for the input Text
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // input password
                          TextField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.green.shade100,

                              filled: true,
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // set the content padding for the input Text
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 30, // increase size for this button
                                ),
                                backgroundColor: const Color(0xff4c505b),
                              ),
                              const CircleAvatar(
                                // increase size for this button
                                radius: 30, // zoom this icon
                                backgroundColor: Color(0xff4c505b),
                                child: Icon(
                                  Icons.question_mark_outlined,
                                  color: Colors.white,
                                  size: 30, // size of icon
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  //this route 'register' is define in main.dart
                                  Navigator.pushNamed(context, 'register');
                                  // move to UI register account
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4c505b),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'forgotPassword');
                                },
                                child: const Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff4c505b),
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/image/login.png'),
//         ),
//       ),
