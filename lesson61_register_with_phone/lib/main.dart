import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lesson61_register_with_phone/page/code_verify.dart';
import 'package:lesson61_register_with_phone/page/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterWithPhoneNumber(),
      // make routes setting
      routes: {
        '/login': (context) => LoginPage(),
        // Other routes...
      },
    ),
  );
}

class RegisterWithPhoneNumber extends StatefulWidget {
  const RegisterWithPhoneNumber({super.key});

  @override
  State<RegisterWithPhoneNumber> createState() =>
      _RegisterWithPhoneNumberState();
}

class _RegisterWithPhoneNumberState extends State<RegisterWithPhoneNumber> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // INSERT IMAGE
              Container(
                width: 280,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/img_rengoku_back.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // make text register
              FadeInUp(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // make text enter OTP
              FadeInDown(
                duration: const Duration(milliseconds: 400),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Text(
                    'Enter your phone number to continue, we will send you OTP to verify',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      wordSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // make input phone number
              // we use library intl_phone_number_input: ^0.7.0+2
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                // this container contains input text field Phone Number
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffeeeeee),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // library for phone number
                      //to select and enter an international phone number
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        // Configure to show the country list at the bottom of the widget
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        // A flag to determine whether nulls should be ignored during validation
                        ignoreBlank: false,
                        ///// Used to configure the auto validation of [FormField] and [Form] widgets.
                        // No auto validation will occur.
                        autoValidateMode: AutovalidateMode.disabled,
                        // Set Style Phone Code of a Country
                        // for example: VietNam phone code: +84
                        selectorTextStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        textFieldController: controller,
                        formatInput: false,
                        // length for phone number
                        maxLength: 10,
                        // Requests a numeric keyboard with additional settings.
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: true,
                        ),
                        cursorColor: Colors.green,
                        // remove the underline default of InternationalPhoneNumberInput
                        inputDecoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          // make hint text
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                      // make a vertical line
                      Positioned(
                        left: 100,
                        top: 10,
                        bottom: 10,
                        child: Container(
                          height: 40,
                          width: 1,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // move to another screen
              const SizedBox(height: 50),
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true; // to start circle loading
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        _isLoading = false; // finish loading cricle and
                        // redirect to OTP Validation
                      });
                      // move to OTPValidation screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPValidation(),
                        ),
                      );
                    });
                  },
                  //The smallest horizontal extent that the button will occupy.
                  minWidth: double.infinity,
                  color: Colors.black,
                  // make border radius
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  child: _isLoading
                      ? Container(
                          width: 20,
                          height: 20,
                          // action waiting circle
                          child: const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Request OTP',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),

              FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aldready have an account?',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        // move to login page
                        // need define '/login' routes
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
