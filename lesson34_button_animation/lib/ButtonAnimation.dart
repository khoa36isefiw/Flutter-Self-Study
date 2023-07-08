import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  final Color primaryColor;
  final Color darkPrimaryColor;
  const ButtonAnimation(this.darkPrimaryColor, this.primaryColor, {super.key});

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  // zoom
  late AnimationController _scaleAnimationController;
  late AnimationController _fadeAnimationController;

// store 3 var above
  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  double buttonWidth = 200; // width a button is defined
  double scale = 3;
  // state complete?
  bool animationComplete = false;
  //opacity of the button color.
  // độ mờ của màu sắc của nút
  double barColorOpacity = 0.6;
  // the start state of the animation.
  bool animationStart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      // animation vertical
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimationController = AnimationController(
      vsync: this,
      // zoom in - zoom out only 5 seconds
      duration: const Duration(milliseconds: 5000),
    );

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = Tween<double>(
      begin: 50.0,
      end: 0.0,
    ).animate(_fadeAnimationController);

    // zoom in/ zoom out
    _scaleAnimation = Tween<double>(
      begin: 1.0, // start
      end: 3.05, // end
    ).animate(_scaleAnimationController)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            // đảo ngược  animation
            // reverse --> decrease
            // forward --> increase
            _scaleAnimationController.reverse();
            _fadeAnimationController.forward();
            _animationController.forward();
          }
        },
      );

    _animation = Tween<double>(begin: 0.0, end: buttonWidth)
        .animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            animationComplete = true;
            // if status completed  --> barColor change

            barColorOpacity = 0.5;
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // free resource
    _animationController.dispose();
    _scaleAnimationController.dispose();
    _fadeAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: InkWell(
              splashColor: Colors.blue[800],
              onTap: () {
                // thực hiện zoom in - zoom out
                _scaleAnimationController.forward();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        child: animationComplete == false
                            ? const Text(
                                'Download',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            : const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _fadeAnimationController,
                      builder: (context, child) => Container(
                        width: _fadeAnimation.value,
                        height: 50,
                        decoration: BoxDecoration(
                          color: widget.darkPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Positioned(
            top: 0,
            left: 0,
            width: _animation.value,
            height: 50,
            child: AnimatedOpacity(
              duration: const Duration(
                milliseconds: 200,
              ),
              opacity: barColorOpacity,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
