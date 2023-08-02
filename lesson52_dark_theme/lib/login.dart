import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Theme/theme_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //listen for changes on a ThemeModel object
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              themeNotifier.isDark ? "Dark Mode" : "Light Mode",
              style: TextStyle(
                color: themeNotifier.isDark ? Colors.white : Colors.black,
              ),
            ),
            leading: Icon(
              Icons.ac_unit_outlined,
              // check if isDark then changes the color for this icon
              color: themeNotifier.isDark ? Colors.white : Colors.grey.shade900,
            ),
            actions: [
              IconButton(
                onPressed: () => {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true,
                },
                icon: Icon(
                  themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                  color: themeNotifier.isDark
                      ? Colors.white
                      : Colors.grey.shade900,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: size.height * 0.2,
                top: size.height * 0.05,
              ),
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello\nWelcome Back',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: size.width * 0.1,
                          // check isDark chang color to white
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/img_google.png'),
                            width: 40,
                          ),
                          SizedBox(width: 40),
                          Image(
                            image: AssetImage('assets/images/img_facebook.png'),
                            width: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      // make input form
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email or Phone number',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // make for password text field
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const TextField(
                          // hide text
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  // bottom for login
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          // make color for each Egde of button
                          border: Border(
                            // BorderSide of this Container
                            bottom: BorderSide(
                              // color: Theme.of(context).primaryColorLight,
                              color: Colors.deepOrange,
                            ),
                            top: BorderSide(
                              // color: Theme.of(context).primaryColorLight,
                              color: Colors.deepOrange,
                            ),
                            right: BorderSide(
                              // color: Theme.of(context).primaryColorLight,
                              color: Colors.deepOrange,
                            ),
                            left: BorderSide(
                              color: Colors.deepOrange,
                              // color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        child: MaterialButton(
                          height: 60,
                          minWidth: double.infinity,
                          onPressed: () {},
                          color: Colors.greenAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
