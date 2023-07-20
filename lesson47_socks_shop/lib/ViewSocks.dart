import 'package:flutter/material.dart';

import 'Animations/FadeAnimation.dart';

class ViewSocks extends StatelessWidget {
  const ViewSocks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 3,
            child: Container(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(142, 211, 211, 1),
                    Color.fromRGBO(42, 222, 222, 1),
                  ],
                  begin: Alignment.topLeft,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(30, -30),
                child: FadeAnimation(
                  0.5,
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/img_socks_cat.webp'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              // add event for this button
              onPressed: () {
                // return the home page
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 1.45,
            child: FadeAnimation(
              1.2,
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        1.3,
                        Text(
                          'Ranger Sport',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1.4,
                        const Text(
                          'Happy Cat Socks',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1.5,
                        Text(
                          'Happy cat socks are a type of socks that feature a design with a cat or cats that are depicted as being happy or cheerful. They can come in various colors and styles, and may feature cartoonish or realistic depictions of cats. Happy cat socks are popular among cat lovers and those who enjoy wearing fun and quirky socks. They can be found in various clothing and accessory stores, as well as online retailers.',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          FadeAnimation(
                            1.2,
                            Container(
                              padding: const EdgeInsets.all(2),
                              width: 40,
                              height: 40,
                              // make circle outside
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: Colors.red,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),

                              // circle inside
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          // make another options choose color
                          FadeAnimation(
                            1.3,
                            Container(
                              width: 25,
                              height: 25,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.3,
                            Container(
                              width: 25,
                              height: 25,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.3,
                            Container(
                              width: 25,
                              height: 25,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'More Options',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _makeOptions(
                              color: Color.fromRGBO(137, 212, 57, 1),
                              image: 'ic_socks-icon.png',
                              title: 'Happy Cat',
                              subTitle: '30,602',
                            ),
                            _makeOptions(
                              color: Color.fromRGBO(57, 160, 212, 1),
                              image: 'ic_socks-icon-left.png',
                              title: 'Happy Senko',
                              subTitle: '20,000',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // create button pay
                      FadeAnimation(
                        1.5,
                        Container(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                          ),
                          margin: const EdgeInsets.only(
                            bottom: 40,
                          ),
                          height: 60,
                          decoration: BoxDecoration(
                            // create shadow for button
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 10,
                                offset: Offset(0, 10),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(251, 121, 155, 1),
                                Color.fromRGBO(251, 53, 105, 1),
                              ],
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    '\$14.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '54',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Pay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FadeAnimation _makeOptions({color, image, title, subTitle}) {
    return FadeAnimation(
      1.4,
      AspectRatio(
        aspectRatio: 4 / 2,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.only(
            right: 10,
          ),
          decoration: BoxDecoration(
            // color: Colors.blueAccent,
            // make border style
            border: Border.all(
              width: 1,
              color: Colors.green.shade300,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image
              Container(
                padding: const EdgeInsets.all(10),
                width: 50,
                decoration: BoxDecoration(
                  // color: const Color.fromRGBO(137, 212, 57, 1),
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('assets/images/$image'),
                // child: Image.asset('assets/images/ic_socks-icon.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              // information
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    // 'Happy Cat',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    // '30,602',
                    subTitle,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
