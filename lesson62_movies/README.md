# lesson62_movies
Make Movies Page with Carousel Slider

### Screenshot
[<img src="assets/screenshot/img_movie_in_2.jpg" width="250">](assets/screenshot/img_movie_in_2.jpg)
[<img src="assets/screenshot/img_movie_in_1.jpg" width="250">](assets/screenshot/img_movie_in_1.jpg)
[<img src="assets/screenshot/img_movie_in_3.jpg" width="250">](assets/screenshot/img_movie_in_3.jpg)
[<img src="assets/screenshot/img_movie_in_4.jpg" width="250">](assets/screenshot/img_movie_in_4.jpg)

### Note Source Code
- You must to add some packages to dependencies:
    ```
        carousel_slider: ^4.2.1 # make beautiful image slide
        smooth_page_indicator: ^1.1.0   # Make effects for slider
    ```
- I use library AnimatedSmoothIndicator to make Indicator. This function is defined Indicator
```
  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _currentActiveIndex,   
        count: _movies.length,  // get length of list _movies
        
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
```
