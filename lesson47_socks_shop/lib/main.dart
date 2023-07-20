import 'package:flutter/material.dart';
import 'package:lesson47_socks_shop/ViewSocks.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocksShop(),
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    ),
  );
}

class SocksShop extends StatelessWidget {
  const SocksShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              padding: EdgeInsets.only(left: 25, right: 25, top: 60),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 250, 182, 1),
                    Color.fromRGBO(255, 239, 78, 1)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu,
                    size: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //free space divided in 4:3 ratio between two child widgets
                      Expanded(
                        // flex 4: In this container, it occupies 4
                        flex: 4,
                        child: Text(
                          'Best Online\nSocks Collection',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        // occupies 3
                        flex: 3,
                        child:
                            Image.asset('assets/images/img_header-socks.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 20,
                ),
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.grey,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    suffixIcon: Icon(
                      Icons.search_rounded,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Text(
                    'Choose \na category',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                          width: 100, // set the width to 200
                          height: 35, // set the height to 50
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(74, 244, 114, 149),
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Adult',
                              style: TextStyle(
                                color: Color.fromRGBO(251, 53, 105, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(97, 90, 90, 0.1),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Children',
                          style: TextStyle(
                            color: Color.fromRGBO(97, 90, 90, 0.6),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  _makeSocksCard(
                    context: context,
                    startColor: const Color.fromRGBO(203, 251, 255, 1),
                    endColor: const Color.fromRGBO(81, 223, 234, 1),
                    image: 'img_socks_1.webp',
                  ),
                  _makeSocksCard(
                    context: context,
                    startColor: const Color.fromRGBO(251, 121, 155, 1),
                    endColor: const Color.fromRGBO(244, 110, 146, 1),
                    image: 'img_happy_socks.webp',
                  ),
                  _makeSocksCard(
                    context: context,
                    startColor: Color.fromARGB(255, 121, 229, 251),
                    endColor: Color.fromRGBO(130, 224, 188, 0.02),
                    image: 'img_cat_ears.webp',
                  ),
                  _makeSocksCard(
                    context: context,
                    startColor: Color.fromRGBO(121, 251, 162, 1),
                    endColor: Color.fromRGBO(110, 244, 168, 1),
                    image: 'img_socks_2-removebg-preview.png',
                  ),
                  _makeSocksCard(
                    context: context,
                    startColor: Color.fromRGBO(121, 153, 251, 1),
                    endColor: Color.fromRGBO(128, 151, 220, 1),
                    image: 'img_socks_men-removebg-preview.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeSocksCard({context, startColor, endColor, image}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: ViewSocks(),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
            gradient: LinearGradient(
              colors: [
                // Color.fromRGBO(203, 251, 255, 1),
                // Color.fromRGBO(81, 223, 234, 1),
                startColor, endColor,
              ],
              begin: Alignment.topLeft,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(5, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
              child: Image.asset('assets/images/$image'),
              // child: Image.asset('assets/images/img_socks_1.webp'),
            ),
          ),
        ),
      ),
    );
  }
}
