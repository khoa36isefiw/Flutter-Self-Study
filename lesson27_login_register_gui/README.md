# lesson27_login_register_gui
Design some basic GUI functions like: Login, Register, Forgot Password Account
## Image for this topic
- Login: <br> 
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/843d7e39-7fd2-4c75-9d48-2e7bd724f35f" alt="Alt text" width="400" height="800">

- Register Account: <br>
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/72ec21c9-8389-487c-911e-d207dc15f69b" alt="Alt text" width="400" height="800">

- Forgot Password: <br>
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/92c24491-8821-4bbf-b97d-08df2e66acb5" alt="Alt text" width="400" height="800">

- Verify OTP: <br>
<img src="https://github.com/khoa36isefiw/Flutter-Self-Study/assets/97817877/160f023e-eef5-4441-9d99-6b2653d146fe" alt="Alt text" width="400" height="800">

## Note source code
This source defines path 

```
routes: {
  'register': (context) => const RegisterAccount(),
  'login': (context) => const MyLogin(),
  'forgotPassword': (context) => const ForgotPassword(),
  'verifyPassword': (context) => const VerifyPassword(),
},
```
- Use some defined paths for some buttons or events that we have defined to redirect to some functions in app
  -   For example: I use the defined path to navigate to the Register Account GUI
    ```
    TextButton(
      onPressed: () {
        //this route 'register' is defined in main.dart
        Navigator.pushNamed(context, 'register');
        // move to UI Register Account
      },
      child: const Text(
        'Sign Up',
        // style for Text
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff4c505b),
          decoration: TextDecoration.underline,
        ),
      ),
    ),
    ```
  -   Redirect to Forgot Password:
  ```
    TextButton(
      onPressed: () {
        Navigator.pushNamed(
            context, 'forgotPassword');
      },
      child: const Text(
        'Forgot Password',
        //... style for Text at here
      ),
    ),
  ```
- Add a button
  - Case 1: I use Floating Action Button  <br>
  
    ```
    FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.arrow_forward_rounded,
        size: 30, // increase size of icon for this button
      ),
      backgroundColor: const Color(0xff4c505b),
    ),
    ```
    - But I have a problem. I want to increase the size of this button, not icon.
    - I put it into a Container. In this Container I created SizedBox to define width and height.
      
    ```
    Container(
      // move the button to center of screen
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
    ```
- Add an Image:
  - For the whole screen: through BoxDecoration
```
decoration: const BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/login.png'),
    fit: BoxFit.cover,
  ),
),
```
  - In a Circle: through CircleAvatar
  ```
      child: const CircleAvatar(
        // backgroundImage: NetworkImage(
        //   'https://i.pinimg.com/originals/9e/a7/c3/9ea7c37566fa5d5ec0bb87e6d50a6e20.gif',
        // ),
        backgroundImage:
            AssetImage('assets/images/img_rengoku.gif'),
        radius: 150,
      ),
  ```
