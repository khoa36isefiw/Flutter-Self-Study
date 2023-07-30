import 'package:flutter/material.dart';

import '../data/resource_list.dart';

class Details extends StatefulWidget {
  final int index;
  const Details(this.index, {super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // size of coffee: small, medium, large
  var s = false;
  var m = false;
  var l = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: images[widget.index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 50,
                            left: 20,
                            right: 20,
                          ),
                          alignment: Alignment.topLeft,
                          width: double.infinity,
                          // back and favorite icon
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _makeIconHeader(
                                Icons.arrow_back_ios_outlined,
                                Colors.white,
                                true,
                                false,
                              ),
                              _makeIconHeader(Icons.favorite_rounded,
                                  Colors.grey, false, true),
                            ],
                          ),
                        ),
                      ),
                      // create details description
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 30,
                            right: 30,
                            left: 30,
                          ),
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // display name of coffee
                                      Text(
                                        names[widget.index],
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // display sub description
                                      const SizedBox(height: 5),
                                      Text(
                                        with_[widget.index],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // make rating and number of rating
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_border_outlined,
                                            color: Colors.yellow,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            s
                                                ? ratting[widget.index]
                                                    .toString()
                                                : m
                                                    ? mediumRating[widget.index]
                                                        .toString()
                                                    : largeRating[widget.index]
                                                        .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            s
                                                ? prefix[widget.index]
                                                : m
                                                    ? prefixMedium[widget.index]
                                                    : prefixLarge[widget.index],
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      _makeIconDetails(
                                        iconImage: 'ic_coffee-bean.png',
                                        detailMaterial: 'Coffee',
                                        color: Colors.orange.shade700,
                                      ),
                                      _makeIconDetails(
                                        iconImage: 'ic_milk.png',
                                        detailMaterial: 'Milk',
                                        color: Colors.orange.shade700,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 40,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        s
                                            ? 'Small Roasted'
                                            : m
                                                ? 'Medium Roasted'
                                                : 'Large Roasted',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 30),
                height: double.infinity,
                width: double.infinity,
                // color: Colors.blue,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "A cappuccino is the perfect balance of espresso, steamed milk. This coffee is all about the structure.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Size',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                _makeSizeButton(
                                  sizeS: true,
                                  sizeL: false,
                                  sizeM: false,
                                  coffeeSize: 'S',
                                  color2: Colors.orange,
                                  color1: Colors.black,
                                ),
                                _makeSizeButton(
                                  sizeS: false,
                                  sizeM: true,
                                  sizeL: false,
                                  coffeeSize: 'M',
                                  color1: Colors.orange,
                                  color2: Colors.black,
                                ),
                                _makeSizeButton(
                                  sizeS: false,
                                  sizeM: false,
                                  sizeL: true,
                                  coffeeSize: 'L',
                                  color1: Colors.orange,
                                  color2: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // contains char $ and price
                              Row(
                                // make Price of coffee
                                children: [
                                  const Text(
                                    '\$',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  // get Price
                                  const SizedBox(width: 10),
                                  Text(
                                    s
                                        ? prices[widget.index]
                                        : m
                                            ? prices[widget.index]
                                            : prices[widget.index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: const Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _makeSizeButton(
      {sizeS = true, sizeL = true, sizeM = true, coffeeSize, color1, color2}) {
    return InkWell(
      onTap: () {
        // s = true;
        // l = false;
        // m = false;
        s = sizeS;
        l = sizeL;
        m = sizeM;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 110,
        height: 40,
        decoration: BoxDecoration(
          color: s ? Colors.black : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border(
            right: BorderSide(
              // color: s ? Colors.orange : Colors.black,
              color: s ? color1 : color2,
            ),
            left: BorderSide(
              // color: s ? Colors.orange : Colors.black,
              color: s ? color1 : color2,
            ),
            bottom: BorderSide(
              // color: s ? Colors.orange : Colors.black,
              color: s ? color1 : color2,
            ),
            top: BorderSide(
              // color: s ? Colors.orange : Colors.black,
              color: s ? color1 : color2,
            ),
          ),
        ),
        child: Center(
          child: Text(
            // 'S',
            coffeeSize,
            style: TextStyle(
              color: s ? Colors.orange : Colors.white.withOpacity(.8),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Container _makeIconDetails({iconImage, detailMaterial, color}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),

      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(15),
      ),
      // contains: icon and text
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(
                'assets/images/$iconImage',
                // 'assets/images/ic_coffee-bean.png',
              ),
              fit: BoxFit.cover,
            ),
            Text(
              // 'Coffeee',
              detailMaterial,
              style: TextStyle(
                // color: Colors.white,
                color: color,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeIconHeader(
      IconData icon, Color color, bool returnPreviousPage, bool isActive) {
    // set event for icon when it clicked on
    bool _isPressed = false;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: returnPreviousPage
          ? () {
              Navigator.of(context).pop();
            }
          : null,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
        child: Icon(
          // Icons.arrow_back_ios_outlined,
          icon,
          color: color,
          // color: Colors.white,
        ),
      ),
    );
  }
}
