import 'package:flutter/material.dart';

import 'Animations/FadeAnimation.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Carousel(),
    ),
  );
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<List<String>> products = [
    // list of list products
    // list form of string lists
    //dạng danh sách các danh sách chuỗi.
    [
      //Each sublist contains three strings
      'assets/images/img_macbook_3.jpeg', // image
      'Macbook Pro M2', // Product's name
      '1999\$', // price
    ],
    [
      'assets/images/img_macbook_18.jpeg',
      'Macbook Pro M2',
      '2099\$',
    ],
    [
      'assets/images/img_shirt_1.webp',
      'Shirt made by Rengoku',
      '1199\$',
    ],
    [
      'assets/images/img_shoes_3.webp',
      'Shoes made by Unknown',
      '699\$',
    ],
    [
      'assets/images/img_shoes_2.webp',
      'Shoes made by Orange',
      '699\$',
    ],
  ];

//The index of the current product is displayed.
  int currentIndex = 0;

//use to switch between products

// Start region
// swipe to left
  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

// swipe to right
  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  // End region

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            // catch the event of users interact with Application
            GestureDetector(
              //catch the event when the user swipes across the screen.
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _preve();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: FadeAnimation(
                0.8,
                Container(
                  width: double.infinity,
                  height: 550,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        // get Image from Lists are defined
                        products[currentIndex][0],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.shade700.withOpacity(0.9),
                          Colors.grey.withOpacity(.0),
                        ],
                        begin: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FadeAnimation(
                          1,
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 90,
                            ),
                            width: 90,
                            child: Row(
                              children: _buildIndicator(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -40),
                child: FadeAnimation(
                  1,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1.3,
                          Text(
                            products[currentIndex][1],
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            FadeAnimation(
                              1.3,
                              Text(
                                products[currentIndex][2],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.yellow.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade800,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade800,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade800,
                            ),
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow.shade800,
                            ),
                            Icon(
                              Icons.star_half,
                              size: 30,
                              color: Colors.yellow.shade800,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "(4.2/70 reviews)",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: FadeAnimation(
                              1.7,
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade800,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    // isACTIVE = TRUE --> index is chose --> change color to red
    // enable --> color is white
    return Expanded(
      child: Container(
        height: 4,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.red[800] : Colors.white,
        ),
      ),
    );
  }

// create a list of Indicator
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
