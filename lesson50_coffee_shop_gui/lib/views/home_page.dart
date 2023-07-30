import 'package:flutter/material.dart';
import 'package:lesson50_coffee_shop_gui/data/resource_list.dart';
import 'package:lesson50_coffee_shop_gui/views/details.dart';
import 'package:lesson50_coffee_shop_gui/widgets/bottom_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottom_Navigation(),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _makeDrawer(),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Find the best\ncoffee for you',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // Textbox for search find Coffee
            Container(
              height: 45,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.2),
              ),
              child: TextField(
                // icon
                // enabled: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                  hintText: 'Find your coffee...',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            // list of item to choose
            Container(
              height: 40,
              child: ListView.builder(
                // number of list item wanna display
                itemCount: 5,
                scrollDirection: Axis.horizontal, // direction when users scroll
                itemBuilder: (context, index) {
                  // return GestureDetector(
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      // child: Text(
                      //   names[index],
                      //   style: TextStyle(
                      //     color: category[index]
                      //         ? Colors.orange
                      //         : Colors.white.withOpacity(.4),
                      //     fontSize: 17,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // create a dot below the item if it is chose
                      child: Column(
                        children: [
                          Text(
                            names[index],
                            style: TextStyle(
                              color: category[index]
                                  ? Colors.orange
                                  : Colors.white.withOpacity(.4),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 5,
                            height: 5,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: category[index]
                                  ? Colors.orange
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 9, // loop 9 times
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // move to details page when click on image item
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(index),
                                ),
                              );
                            },
                            child: Card(
                              color: Colors.white.withOpacity(0.3),
                              // border for container
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: const EdgeInsets.only(right: 15),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 160,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      // border for image
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 120,
                                        width: double.infinity,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Image(
                                                image: images[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            // make rating
                                            // set position for this container
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                height: 25,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Add Icon star
                                                    const Icon(
                                                      Icons
                                                          .star_border_outlined,
                                                      color: Colors.orange,
                                                      size: 14,
                                                    ),
                                                    // add Rating for each cofffee
                                                    Text(
                                                      ratting[index].toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        // fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // add name for each coffee
                                    Text(
                                      names[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    // add description
                                    const SizedBox(height: 5),
                                    Text(
                                      with_[index],
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // add price and order button
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '\$',
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              prices[index],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.orange.shade700,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    // region for Recommend some special coffee
                    const Text(
                      'Special for you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    _makeRecommendCoffee(
                      images[1],
                    ),
                    const SizedBox(height: 10),

                    _makeRecommendCoffee(
                      images[8],
                    ),
                    const SizedBox(height: 10),

                    _makeRecommendCoffee(
                      images[4],
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

  Card _makeRecommendCoffee(AssetImage image) {
    return Card(
      color: Colors.white.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: image,
                  // image: AssetImage('assets/images/s1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            // decription
            const Text(
              '5 Coffee Beans You\nMust Try!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _makeDrawer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          elevation: 20,
          color: Colors.white.withOpacity(.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _makeNav(),
                _makeNav(),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            // child: const FlutterLogo(
            //   size: 40,
            // ),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/img_rengoku_back.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _makeCircle(),
        _makeCircle(),
      ],
    );
  }

  Icon _makeCircle() {
    return Icon(
      Icons.circle,
      color: Colors.grey.shade600,
      size: 10,
    );
  }
}
