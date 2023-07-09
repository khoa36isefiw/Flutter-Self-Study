import 'package:flutter/material.dart';
import 'package:lesson35_splash_screen_login/Animations/FadeAnimation.dart';
import 'package:page_transition/page_transition.dart';

import 'Login.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(
      //to synchronize cycles with parent widget
      vsync: this,
      // time of this animation runs
      duration: const Duration(microseconds: 300),
    );

// when user click into this button animation will be activated
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: .8,
    ).animate(_scaleController)
      //status tracking of animation
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // if this animation finishes -> will run another animation
          _widthController.forward();
        }
      });

    _widthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 300.0,
    ).animate(_widthController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _positionController.forward();
          }
        },
      );

    _positionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _positionAnimation = Tween<double>(
      begin: 0,
      end: 215,
    ).animate(_positionController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // update new values
          setState(() {
            hideIcon = true;
          });
          _scale2Controller.forward();
        }
      });

    _scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scale2Animation = Tween<double>(
      begin: 1,
      end: 32,
    ).animate(_scale2Controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //redirect to Login Page
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: LoginPage(),
            ),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    //gán giá trị của nó bằng chiều rộng của màn hình hiện tại.
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(159, 170, 195, 1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_rengoku_ruc_chay.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeAnimation(
                    1,
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                    1.3,
                    const Text(
                      'We promis that you\'ll have the most\nfuss-time with us ever',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  FadeAnimation(
                    1.6, // time
                    AnimatedBuilder(
                      animation: _scaleController, // zoom in - zoom out

                      builder: (context, child) => Transform.scale(
                        // thay đổi kích thước của widget theo giá trị scale của nó
                        scale: _scaleAnimation.value, // scale this animation
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _widthController,
                            builder: (context, child) => Container(
                              width: _widthAnimation.value,
                              // width: 80,
                              height: 80,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.withOpacity(.4),
                              ),
                              child: InkWell(
                                onTap: () {
                                  // bắt đầu kích hoạt animation
                                  _scaleController.forward();
                                },
                                child: Stack(
                                  children: [
                                    AnimatedBuilder(
                                      animation: _positionController,
                                      builder: (context, child) => Positioned(
                                        left: _positionAnimation.value,
                                        child: AnimatedBuilder(
                                          animation: _scale2Controller,
                                          builder: (context, child) =>
                                              Transform.scale(
                                            scale: _scale2Animation.value,
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.amber[600],
                                              ),
                                              child: hideIcon == false
                                                  ? const Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    )
                                                  : Container(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
