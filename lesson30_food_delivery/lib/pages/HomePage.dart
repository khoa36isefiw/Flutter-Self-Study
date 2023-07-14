import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    "Pizza",
    "Burgers",
    "Kebab",
    "Desert",
    "Salad",
    "Drinks",
  ];
  // List<dynamic> foods = [
  //   {
  //     "image": "assets/images/img_orange_juice.jpeg",
  //     "title": "Orange Juice",
  //     "price": "\$2",
  //     "isFavorite": false,
  //   },
  //   {
  //     "image": "assets/images/img_pizza_2.jpeg",
  //     "title": "Vegaterian Pizza",
  //     "price": "\$15",
  //     "isFavorite": false,
  //   },
  //   {
  //     "image": "assets/images/img_pizza_3.jpeg",
  //     "title": "Vegaterian Pizza",
  //     "price": "\$20",
  //     "isFavorite": false,
  //   }
  // ];
  List<dynamic> foods = [
    {
      "image": "assets/images/img_orange_juice.jpeg",
      "title": "Orange Juice",
      "price": "\$2",
      "isFavorite": false,
      "category": "Drinks" // add category to the product
    },
    {
      "image": "assets/images/img_pizza_2.jpeg",
      "title": "Vegaterian Pizza",
      "price": "\$15",
      "isFavorite": false,
      "category": "Pizza" // add category to the product
    },
    {
      "image": "assets/images/img_pizza_3.jpeg",
      "title": "Vegaterian Pizza",
      "price": "\$20",
      "isFavorite": false,
      "category": "Pizza" // add category to the product
    },
    {
      "image": "assets/images/img_rio.jpeg",
      "title": "Rio",
      "price": "\$4",
      "isFavorite": false,
      "category": "Drinks" // add category to the product
    },
    {
      "image": "assets/images/img_kebab_1.png",
      "title": "Doner Kebab",
      "price": "\$8",
      "isFavorite": false,
      "category": "Kebab" // add category to the product
    },
    {
      "image": "assets/images/img_kabab_2.webp",
      "title": "Giyuu Kebab",
      "price": "\$7.98",
      "isFavorite": false,
      "category": "Kebab" // add category to the product
    },
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: Icon(null),
        elevation: 0,
        // title: const Text(
        //   'Go Back',
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Food Delivery',
                    style: TextStyle(
                        color: Colors.grey[80],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Category to slide left and right
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      // list category
                      itemBuilder: (context, index) =>
                          makeCategory(title: categories[index], index: index),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Free Delivery',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: foods.length,
            //       itemBuilder: (context, index) => makeItem(
            //         image: foods[index]["image"],
            //         isFavorite: foods[index]["isFavorite"],
            //         index: index,
            //         price: foods[index]["price"],
            //         title: foods[index]["title"],
            //       ),
            //     ),
            //     // child: ListView(
            //     //   scrollDirection: Axis.horizontal,
            //     //   children: <Widget>[
            //     //     FadeAnimation(1.4, makeItem(image: 'assets/images/one.jpg')),
            //     //     FadeAnimation(1.5, makeItem(image: 'assets/images/two.jpg')),
            //     //     FadeAnimation(1.6, makeItem(image: 'assets/images/three.jpg')),
            //     //   ],
            //     // ),
            //   ),
            // ),
            // display image: contain + icon + title + price
            // filter: food and drinks
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // get products by category
                  itemCount: foods
                      .where((food) =>
                          food["category"] == categories[selectedCategory])
                      .length,
                  itemBuilder: (context, index) => makeItem(
                    image: foods
                        .where((food) =>
                            food["category"] == categories[selectedCategory])
                        .toList()[index]["image"],
                    isFavorite: foods
                        .where((food) =>
                            food["category"] == categories[selectedCategory])
                        .toList()[index]["isFavorite"],
                    index: index,
                    price: foods
                        .where((food) =>
                            food["category"] == categories[selectedCategory])
                        .toList()[index]["price"],
                    title: foods
                        .where((food) =>
                            food["category"] == categories[selectedCategory])
                        .toList()[index]["title"],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({title, index}) {
    // listen the event that user interact
    return GestureDetector(
      onTap: () {
        // when user click into this button
        setState(() {
          selectedCategory = index;
        });
      },
      child: AnimatedContainer(
        width: 120,
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 10),
        // selected --> change to yellow color
        // else --> grey
        decoration: BoxDecoration(
          color:
              selectedCategory == index ? Colors.yellow[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color:
                    selectedCategory == index ? Colors.black : Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, isFavorite, index, title, price}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: const [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // update new state --> add favorite
                      setState(() {
                        foods[index]["isFavorite"] =
                            !foods[index]["isFavorite"];
                      });
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1.5,
                            color: isFavorite ? Colors.red : Colors.transparent,
                          ),
                        ),
                        child: isFavorite
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite, color: Colors.white),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        // "\$ 15.00",
                        price,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        // "Vegetarian Pizza",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
