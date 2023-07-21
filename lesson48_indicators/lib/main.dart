import 'package:flutter/material.dart';

import 'helpers/ColorSystem.dart';
import 'helpers/Strings.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Indicators(),
    ),
  );
}

class Indicators extends StatefulWidget {
  const Indicators({super.key});

  @override
  State<Indicators> createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    // use to manage the switching between pages in a widget
    // For example: I use PageView
    _pageController = PageController(initialPage: 0);
    //the parent widget initial state initialization handler is also called.
    super.initState();
  }

// call when widget is destroyed
// to release resources and remove connections
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
            ),
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // update to new state when the page is switched
          PageView(
            onPageChanged: (int page) {
              setState(() {
                // when switching to new state
                // --> update the currentIndex
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              // makePage
              _makePageIndicators(
                reverse: false,
                image: 'img_scenery_1.jpeg',
                title: 'Japan',
                content: Strings.stepOneContent,
              ),
              _makePageIndicators(
                reverse: true,
                image: 'img_scenery_2.jpeg',
                title: 'Japan',
                content: Strings.stepTwoContent,
              ),
              _makePageIndicators(
                reverse: false,
                image: 'img_scenery_3.jpeg',
                title: 'Japan',
                content: Strings.stepThreeContent,
              ),
              _makePageIndicators(
                reverse: false,
                image: 'img_scenery_4.jpeg',
                title: 'Japan',
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          // create indicators
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicators(),
            ),
          ),
        ],
      ),
    );
  }

  // create GUI for indicators
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      // duration for animation
      duration: Duration(microseconds: 300),
      height: 6,
      // when animation is triggered. It has a width of 30
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: ColorSystem.secoundry,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      // add indicators
      if (currentIndex == i) {
        // active the indicator
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget _makePageIndicators({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // if reverse == true
          !reverse
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      // make border radius for image
                      child: ClipRRect(
                        // RR stand for: Rounded-Rectangular
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          // 'assets/images/img_scenery_1.jpeg',
                          'assets/images/$image',
                          fit: BoxFit.cover,
                          width: 400,
                          height: 400,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                )

              /// thay thế bằng size Box, ẩn đi hình ảnh này
              : SizedBox(),

          Text(
            title,
            // 'Japan',
            style: TextStyle(
              color: ColorSystem.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            content,
            // 'Be part of the agriculture and gives your team the  power you need to do your best',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorSystem.gray,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          // if reverse == false
          reverse // reverse == false thì hiển thị hình ảnh này  có border Radius 30
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      // child: Image.asset('assets/images/$image'),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('assets/images/$image'),
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
