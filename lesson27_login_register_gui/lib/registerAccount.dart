import 'package:flutter/material.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/register.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Register Account'),
          elevation: 0, // màu đậm nhạt của AppBar ~ 0 là như transparent
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 30,
              ),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(
                  fontSize: 33,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
              child: Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  children: [
                    // input Field Name
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        // when text input is not clicked into
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        // when text input is clicked into
                        // --> change color of Border Input Field to Colors.Black
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Name",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // input Field Email
                    _buildInpuFieldColumn('Email', false),
                    const SizedBox(
                      height: 30,
                    ),
                    _buildInpuFieldColumn('Password', true),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 33,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // by floating button, but we need add a container to zoom this button
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: FloatingActionButton(
                            backgroundColor: const Color(0xff4c505b),
                            onPressed: () {},
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
                          ),
                        ),
                        // use circle Avatar if we want to zoom this button only use radius: 'number of Size'
                        const CircleAvatar(
                          backgroundColor: Color(0xff4c505b),
                          radius: 30,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration
                                  .underline, // underline for this text
                            ),
                          ),
                          style: ButtonStyle(),
                        ),
                      ],
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

// function for text field - 2 parameter at here
  TextField _buildInpuFieldColumn(String fieldName, bool hide) {
    return TextField(
      // color of Text
      style: const TextStyle(
        color: Colors.deepOrange,
      ),
      // hidden for password
      obscureText: hide, // is used for password
      decoration: InputDecoration(
        // hintText: 'Email',
        hintText: fieldName,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        // border color is white when this input text field is not clicked
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),

        // change to another color when input text field is clicked
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
