import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Animations/FadeAnimation.dart';
import 'FindEvent.dart';

// đã hoàn thành giao diện nhưng chưa thêm animation vào
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        'findEvent': (context) => const FindEvent(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 10,
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0,
    ).animate(_scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            PageTransition(
              child: FindEvent(),
              type: PageTransitionType.fade,
            ),
          );
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img_rengoku_ruc_chay.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FadeAnimation(
                1,
                Text(
                  'Find the best location near you for a good night.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.2,
                Text(
                  'Let us find you an event for your interest',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              // const Text(
              //   'Find nearest event',
              //   style: TextStyle(color: Colors.white, fontSize: 17),
              // ),
              FadeAnimation(
                1.4,
                InkWell(
                  onTap: () {
                    // move to FindEvent activity
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const FindEvent()),
                    // );

                    setState(() {
                      hide = true;
                    });
                    _scaleController.forward();
                  },
                  // child: Icon(
                  //   Icons.arrow_forward,
                  //   color: Colors.white,
                  // ),
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.yellow[700],
                        ),
                        child: hide == false
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Find nearest event",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            : Container(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
