//https://www.icegif.com/wp-content/uploads/2022/08/icegif-985.gif
import 'package:flutter/material.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({Key? key}) : super(key: key);

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Verify Password'),
        foregroundColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/img_giyuu.gif'),
                radius: 150,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Please enter the 6 digit code sent to\n giyuu@kimetsu.no.yaiba ',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            // Center(
            //   child: Wrap(
            //     spacing: 10,
            //     runSpacing: 10,
            //     alignment: WrapAlignment.center,
            //     children: List.generate(
            //       6,
            //       (index) => Container(
            //         width: 40,
            //         height: 40,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(5),
            //           border: Border.all(
            //             color: Colors.grey,
            //             width: 1,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildVerifyPasswordRow(),
                _buildVerifyPasswordRow(),
                _buildVerifyPasswordRow(),
                _buildVerifyPasswordRow(),
                _buildVerifyPasswordRow(),
                _buildVerifyPasswordRow(),
              ],
            ),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Resend Code',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: 200,
                height: 60,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildVerifyPasswordRow() {
    return SizedBox(
      // 2 properties to modify the size of Input Text Field
      width: 60,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          textAlign: TextAlign.center,
          maxLength: 1, // only one character
          style: const TextStyle(
            color: Colors.deepOrange, // color of text is inputed
          ),

          // design border for this input text field
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            // when this input text field is clicked
            // make borderRaidus of this input text field

            enabledBorder: OutlineInputBorder(
              // case this field is not clicked
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                // change color of border
                color: Colors.deepOrange,
                width: 1,
              ),
            ),

            // case this field is  clicked
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                // this field is clicked -->
                //Change color of boderSide to another Colors
                color: Colors.blue,
                width: 2,
              ),
            ),
            hintText: '9', // display example for this text input field
            hintStyle: const TextStyle(
              color: Colors.blue, // color of hint text
            ),
            // đổ màu nàu nền cho ô
            // three lines code below are make background color for this input text field
            fillColor: Colors.white,
            filled: true,
            counterText: '',
            // đặt giá trị counterText thành chuỗi rỗng
          ),
        ),
      ),
    );
  }
}
