# lesson56_otp_verify
Create Verify OTP Code GUI

### Screenshot
- Main GUI <br>
[<img src="assets/screenshot/img_verify_gui.jpg" width="250">](assets/screenshot/img_verify_gui.jpg)

- Resend Code OTP  Successfully <br>
[<img src="assets/screenshot/img_verify_resendCode.jpg" width="250">](assets/screenshot/img_verify_resendCode.jpg)

- Verify and Loading <br>
[<img src="assets/screenshot/img_verify_loading.jpg" width="250">](assets/screenshot/img_verify_loading.jpg)

- Verify Code Successfully <br>
[<img src="assets/screenshot/img_verify_successfully.jpg" width="250">](assets/screenshot/img_verify_successfully.jpg)

### Note Source Code 
- Create button: there is white above the button and another color at the bottom

```
 Container(
    padding: EdgeInsets.only(top: 3, left: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.black),
    ),
    child: MaterialButton(
      onPressed: () {},
      color: Colors.blueAccent.shade400,
      minWidth:
          MediaQuery.of(context).size.width * 0.8, // another size
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        'Verify',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  ),
```
