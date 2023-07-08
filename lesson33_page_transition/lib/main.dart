import 'dart:async';

import 'package:flutter/material.dart';

import 'dashboard.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      routes: {
        'dashboard': (context) => const Dashboard(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //manage the scrolling behavior of the PageView

  //initial page to be displayed
  //sets the fraction of the viewport occupied by each page.
  late final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1.0);

  //the current image being displayed.
  late String _currentImage = 'img_rengoku_with_bong_ro.jpeg';

  @override
  void initState() {
    super.initState();
    //sets up a timer that fires every 5 seconds
    //and scrolls to the next page in the PageView
    Timer.periodic(const Duration(seconds: 5), (timer) {
      //creates a periodic timer that fires every 5 seconds

      //gets the current page number
      // + 1 --> the index of the next page.
      //
      final nextPage = (_pageController.page!.toInt() + 1) % 4;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInBack,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set of images that can be swiped horizontally to navigate between them.
      body: PageView(
        controller: _pageController, //manages the scrolling behavior
        onPageChanged: (int index) {
          setState(() {
            switch (index) {
              case 0:
                _currentImage = 'img_rengoku_with_bong_ro.jpeg';
                break;
              case 1:
                _currentImage = 'img_rengoku_ruc_chay.jpeg';
                break;
              case 2:
                _currentImage = 'img_giyuu.jpeg';
                break;
              case 3:
                _currentImage = 'img_giyuu_snow.jpeg';
                break;
            }
          });
        },
        children: <Widget>[
          _makePage(image: 'img_rengoku_with_bong_ro.jpeg'),
          _makePage(image: 'img_rengoku_ruc_chay.jpeg'),
          _makePage(image: 'img_giyuu.jpeg'),
          _makePage(image: 'img_giyuu_snow.jpeg'),
        ],
      ),
    );
  }

  Container _makePage({required String image}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/$image'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Training',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '15',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Minutes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Exercises',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              const Align(
                child: Text(
                  'Start the morning with training of Hashira',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(1),
                        blurRadius: 12,
                        spreadRadius: 12,
                      ),
                    ],
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'dashboard');
                    },
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(0.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
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
