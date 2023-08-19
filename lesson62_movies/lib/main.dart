import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoivesPage(),
    ),
  );
}

class MoivesPage extends StatefulWidget {
  const MoivesPage({super.key});

  @override
  State<MoivesPage> createState() => _MoivesPageState();
}

class _MoivesPageState extends State<MoivesPage> {
  CarouselController _carouselController = new CarouselController();
  int _currentActiveIndex = 0;

  final List<dynamic> _movies = [
    {
      'title': 'Blade of Demon Destruction',
      'image':
          'https://m.media-amazon.com/images/M/MV5BYTIxNjk3YjItYmYzMC00ZTdmLTk0NGUtZmNlZTA0NWFkZDMwXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_.jpg',
      'description': 'Kimetsu No Yaiba',
      'rating': '4.6',
      'time': '24h',
      'action': 'watch',
    },
    {
      'title': 'Mugen Train',
      'image':
          'https://m.media-amazon.com/images/M/MV5BODI2NjdlYWItMTE1ZC00YzI2LTlhZGQtNzE3NzA4MWM0ODYzXkEyXkFqcGdeQXVyNjU1OTg4OTM@._V1_.jpg',
      'description': 'Kimetsu No Yaiba',
      'rating': '4.9',
      'time': '2h',
      'action': 'watch',
    },
    {
      'title': 'Entertainment District Arc',
      'image':
          'https://www.animenewsnetwork.com/images/encyc/A24043-3208319059.1631044735.jpg',
      'description': 'Kimetsu No Yaiba',
      'rating': '4.75',
      'time': '12h',
      'action': 'watch',
    },
    {
      'title': 'Swordsmith Village Arc',
      'image': 'https://flxt.tmsimg.com/assets/p24300587_i_v9_aa.jpg',
      'description': 'Kimetsu No Yaiba',
      'rating': '4.8',
      'time': '11h',
      'action': 'watch',
    },
    {
      'title': 'Rengoku Kyoujurou',
      'image':
          'https://i.pinimg.com/564x/a8/36/7d/a8367d406369e4e9d677c5a2759ec09a.jpg',
      'description': 'Flame Hashira',
      'rating': '4.95',
      'time': '2h',
      'action': 'watch',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            //get image from _movies
            Image.network(
              _movies[_currentActiveIndex]['image'],
              fit: BoxFit.cover,
            ),
            // make it in center
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  //Set carousel height contains image and informations of movie
                  height: 500,
                  aspectRatio: 16 / 9, // height: 16, width: 9
                  //The fraction of the viewport that each page should occupy.
                  // which means each page fills 70% of the carousel.
                  viewportFraction: 0.7, // if don't use -> default is 0.8

                  //Determines if current page should be larger than the side images,
                  // creating a feeling of depth in the carousel.
                  enlargeCenterPage: true, // easy to understand
                  // this line will make the center image bigger than the left and right

                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentActiveIndex = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                //The widgets to be shown in the carousel of default constructor
                items: _movies.map(
                  //get element in _movies
                  (movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 320,
                                  margin: const EdgeInsets.only(top: 30),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(
                                    // get image from list _movies
                                    movie['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // title
                                Text(
                                  // get title from list _movies
                                  movie['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //make description
                                const SizedBox(height: 20),
                                Text(
                                  movie['description'],
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 1000),
                                  opacity: _currentActiveIndex ==
                                          _movies.indexOf(movie)
                                      ? 1.0
                                      : 0.0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _makeReviews(
                                          movie,
                                          Colors.amber.shade600,
                                          Icons.star,
                                          'rating',
                                        ),
                                        _makeReviews(
                                          movie,
                                          Colors.grey.shade600,
                                          Icons.alarm,
                                          'time',
                                        ),
                                        _makeReviews(
                                          movie,
                                          Colors.grey.shade600,
                                          Icons.play_circle_filled,
                                          'action',
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            // make Indicator
            // Add the PageIndicator widget here

            // Positioned(
            //   bottom: 30,
            //   left: 0,
            //   right: 0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: _movies.map((movie) {
            //       //This line takes the index of the current
            //       //movie in the _movies list and stores
            //       //it in the index variable.
            //       // We need this index variable to determine
            //       //the current position of the element in the list.
            //       int index =
            //           _movies.indexOf(movie); // get current index of movie
            //       // get 5 elements from the list
            //       return Container(
            //         width: 8.0,
            //         height: 8.0,
            //         margin: const EdgeInsets.symmetric(horizontal: 4.0),
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: _currentActiveIndex == index
            //               ? Colors.green
            //               : Colors.deepOrange,
            //         ),
            //       );
            //     }).toList(),
            //   ),
            // ),

            // make Indicator
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(),
                ],
              ),
            ),

            // make 2 buttons Next and Previous
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: previousImage, // previous Image
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  // next button
                  ElevatedButton(
                    onPressed: nextImage, // move to next Image
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // move to the next Image/ behind of its
  nextImage() {
    _carouselController.nextPage();
  }

  // move to the previous Image/ front of its
  previousImage() {
    _carouselController.previousPage();
  }

  Row _makeReviews(movie, Color color, IconData icon, String index) {
    return Row(
      children: [
        Icon(
          icon,
          // Icons.star,
          color: color,
          // color: Colors.yellow,
          size: 20,
        ),
        // rating
        const SizedBox(width: 5),
        Text(
          // movie['rating'],
          movie[index],
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _currentActiveIndex,
        count: _movies.length,
        effect: WormEffect(
          dotWidth: 16,
          dotHeight: 16,
          activeDotColor: Colors.deepOrangeAccent,
          dotColor: Colors.grey.shade800,
        ), // this animation is default

        // Move to another image with
        // a similar when the user press on these dots
        onDotClicked: (index) {
          _carouselController.animateToPage(index);
        },
      );
}
