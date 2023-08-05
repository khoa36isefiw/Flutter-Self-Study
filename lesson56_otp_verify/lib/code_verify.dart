import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPValidation extends StatefulWidget {
  const OTPValidation({super.key});

  @override
  State<OTPValidation> createState() => _OTPValidationState();
}

class _OTPValidationState extends State<OTPValidation> {
  late FToast fToast;

  bool _isResend = false;
  bool _isVerified = false;
  bool _isLoading = false;
  String _code = '';
  //to manage the countdown.
  late Timer _timer;
  int _start = 60;
  int _currentIndex = 0;

  void resendCode() {
    setState(() {
      _isResend = true;
    });

    // count down to resend code - only 1 mins
    // each 60 seconds we can click on resendCode
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      //When the countdown is from 60 to 0 then will be restarted resendCode
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResend = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  // verify code
  verify() {
    setState(() {
      _isLoading = true; // start loading
    });

    //to repeat an action after each defined interval.
    // interval here is 4 miliSeconds
    const oneSecond = Duration(seconds: 4);
    _timer = new Timer.periodic(oneSecond, (timer) {
      setState(() {
        //stop showing loading status
        _isLoading = false;
        //determines that the token has been successfully verified.
        _isVerified = true;
      });
    });
  }

  // design Notification Message
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally
    //instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);

    //
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex++;
        if (_currentIndex == 5) {
          _currentIndex = 0;
        }
      });
    });
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Resend OTP Code Successfully!"),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   width: 300,
              //   height: 300,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.grey.shade200,
              //     // borderRadius: BorderRadius.circular(50),
              //     image: DecorationImage(
              //       image: AssetImage(
              //         'assets/images/img_rengoku_back.jpeg',
              //       ),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Container(
                width: 300,
                height: 300,
                // rotate Image
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(
                    0.25,
                  ), // Rotate by 90 degrees (0.25 x 360)
                  child: Transform.rotate(
                    angle: 40, // Rotate by 45 degrees (in radians)
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/images/img_rengoku_back.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Please enter 6-digit code sent\n+84 098-765-1234',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 18,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              FadeInDown(
                delay: Duration(milliseconds: 600),
                duration: Duration(milliseconds: 500),
                // child: VerificationCode(
                //   textStyle: TextStyle(fontSize: 20, color: Colors.black),
                //   onCompleted: (value) {},
                //   onEditing: (value) {},
                //   length: 4,
                //   // type for text input
                //   keyboardType: TextInputType.number,
                // ),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6, // number of codes

                  onChanged: (value) {
                    _code = value;
                  },
                  onCompleted: (value) {
                    _code = value;
                  },
                  // only number is accepted
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t receive OTP Code?',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 1),
                  TextButton(
                    onPressed: () {
                      print('Resend Button: ');

                      print(_isResend);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text(
                      //       'Resend OTP Code Successfully!',
                      //     ),
                      //   ),
                      // );
                      // _showToast();
                      // },
                      // child: const Text(
                      //   'Resend',
                      //   style: TextStyle(
                      //     color: Colors.blue,
                      //     fontSize: 16,
                      //   ),
                      // ),

                      //  _isResend is true then
                      // mean: sent back the previous code and the timeout has not expired,
                      if (_isResend) {
                        // display text: Try again in .. seconds
                        return;
                      }
                      //  _isResend is false then
                      // do action: resendCode
                      resendCode();
                      // show message that resends Code successfully
                      _showToast();
                    },
                    child: Text(
                      _isResend
                          ? "Try again in " + _start.toString() // is true
                          : "Resend", // is false
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // make button Verify Code and Loading
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    // bottom: BorderSide(
                    //   color: Colors.black,
                    // ),
                    // top: BorderSide(
                    //   color: Colors.black,
                    // ),
                    // left: BorderSide(
                    //   color: Colors.black,
                    // ),
                    // right: BorderSide(
                    //   color: Colors.black,
                    // ),
                    color: Colors.black,
                  ),
                ),
                child: FadeInDown(
                  // time for animation display button
                  delay: Duration(microseconds: 800),
                  duration: Duration(milliseconds: 500),
                  child: MaterialButton(
                    onPressed: _code.length < 6
                        ? () => {}
                        : () {
                            verify();
                          },
                    color: Colors.orange.shade400,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: _isLoading
                        ? Container(
                            width: 20,
                            height: 20,
                            // action loading in 4 seconds
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 10,
                              color: Colors.black,
                            ),
                          )
                        : _isVerified
                            // true --> it means that the loading state is active
                            ? Icon(Icons.check_circle,
                                color: Colors.white, size: 30)
                            : Text(
                                'Verify',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
