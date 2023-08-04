import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PasswordValidation(),
    ),
  );
}

//!@#\$%\^&\*()\-_=+\[\]{};:\'",.<>\/?\\|]

class PasswordValidation extends StatefulWidget {
  const PasswordValidation({super.key});

  @override
  State<PasswordValidation> createState() => _PasswordValidationState();
}

class _PasswordValidationState extends State<PasswordValidation> {
  bool _isVisible = false;
  bool _isPassword8Char = false;
  bool _has1Number = false;

  // function listen event
  onChangePassword(String value) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPassword8Char = false;
      _has1Number = false;
      if (value.length > 8) {
        _isPassword8Char = true;
      }
      if (numericRegex.hasMatch(value)) {
        _has1Number = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Create Your Account',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set a Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Please create a secure password including the following criteria below:',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                // listen user input
                onChanged: (password) => onChangePassword(password),
                // depend on _isVisible will active when user click on icon button
                obscureText: !_isVisible, //hide
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              // condition
              SizedBox(
                height: 30,
              ),
              _makeCriteria(8, 'characters', _isPassword8Char),
              SizedBox(
                height: 10,
              ),
              _makeCriteria(1, 'number', _has1Number),
              SizedBox(
                height: 30,
              ),
              // button create account
              MaterialButton(
                onPressed: () {},
                height: 40,
                minWidth: double.infinity,
                color: Colors.black,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _makeCriteria(number, text, condition) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(microseconds: 300),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: condition ? Colors.green : Colors.transparent,
            border: condition
                ? Border.all(color: Colors.transparent)
                : Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              size: 15,
              // color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10),
        Text('Contains at least $number $text'),
      ],
    );
  }
}
