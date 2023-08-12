import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lesson58_crypto_currency/stock/line_chart.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/animation.dart';

import 'Animations/FadeAnimation.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;
  late AnimationController _colorController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;
  late Animation<Color?> _colorAnimation;

  // make color Animation

  final ColorTween _colorTween = ColorTween(
    begin: Colors.amber.shade600,
    end: Colors.red,
  );

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
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            // if this animation finishes -> will run another animation
            _widthController.forward();
          }
        },
      );

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
          //redirect to Login Page
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: LineChartSample(),
            ),
          );
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
              child: LineChartSample(),
            ),
          );
        }
      });

    // make color animation
    _colorController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _colorController.repeat(reverse: true);
    _colorAnimation = _colorTween.animate(_colorController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161621),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 64, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FadeInDown(
                  child: Container(
                    // width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_crypto.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                FadeInLeft(
                  child: Text(
                    'Crypto Pay Currency App',
                    style: TextStyle(
                      color: Colors.yellow.shade700,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeInLeft(
                  child: const Text(
                    'Grow your portfolio by receiving rewards up to 15.5% on your crypto assets',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
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
                              color: Colors.amber.withOpacity(.4),
                              // color: Colors.grey.withOpacity(.4),
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
                                              // color: Colors.amber[600],
                                              color: _colorAnimation.value,
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
                const SizedBox(height: 45),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
