import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Animations/FadeAnimation.dart';
import 'Shoes.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePageRengokuMall(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePageRengokuMall extends StatefulWidget {
  const HomePageRengokuMall({super.key});

  @override
  State<HomePageRengokuMall> createState() => _HomePageRengokuMallState();
}

class _HomePageRengokuMallState extends State<HomePageRengokuMall> {
  List<String> categories = [
    "All",
    "Shoes",
    "Shirts",
    "Watch",
    "Macbook",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Rengoku\'s mall',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        actions: const <Widget>[
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Container(
                height: 50,
                // list Category
                child: ListView(
                  // scroll to left and right
                  scrollDirection: Axis.horizontal,
                  children: [
                    _makeCategory(
                        timeAnimation: 1.0, itemName: 'All', textSize: 17.0),
                    _makeCategory(
                        timeAnimation: 1.1, itemName: 'Shoes', textSize: 17.0),
                    _makeCategory(
                        timeAnimation: 1.2, itemName: 'Shirts', textSize: 17.0),
                    _makeCategory(
                        timeAnimation: 1.3,
                        itemName: 'Football',
                        textSize: 17.0),
                    _makeCategory(
                        timeAnimation: 1.4, itemName: 'Soccer', textSize: 17.0),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _makeItem(
                  image: 'assets/images/img_shoes_1.jpeg',
                  context: context,
                  numberAnimation: 1.5,
                  tag: 'red'),
              _makeItem(
                  image: 'assets/images/img_shoes_2.webp',
                  context: context,
                  numberAnimation: 1.6,
                  tag: 'orange'),
              _makeItem(
                  image: 'assets/images/img_shoes_3.webp',
                  context: context,
                  numberAnimation: 1.7,
                  tag: 'pink'),
              _makeItem(
                  image: 'assets/images/img_shoes_4.webp',
                  context: context,
                  numberAnimation: 1.8,
                  tag: 'deepOrange'),
            ],
          ),
        ),
      ),
    );
  }

  FadeAnimation _makeItem({numberAnimation, tag, image, context}) {
    return FadeAnimation(
      // 1.5,
      numberAnimation,
      Hero(
        // tag: '',
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Shoes(
                  image: image,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                // image: AssetImage('assets/images/$image'),
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeAnimation(
                            1,
                            const Text(
                              'Sneakers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            1,
                            const Text(
                              'Nike',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeAnimation(
                      1.2,
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FadeAnimation(
                  1.2,
                  const Text(
                    "100\$",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AspectRatio _makeCategory({timeAnimation, itemName, textSize}) {
    return AspectRatio(
      aspectRatio: 2.2 / 1,
      child: FadeAnimation(
        // 1,
        timeAnimation,
        Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          // contains categories
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              // 'All',
              itemName,
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
