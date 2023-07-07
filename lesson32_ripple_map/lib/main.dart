import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RippleMap(),
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
    ),
  );
}

class RippleMap extends StatefulWidget {
  const RippleMap({super.key});

  @override
  State<RippleMap> createState() => _RippleMapState();
}

class _RippleMapState extends State<RippleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Background image full screen
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_sai_gon_at_night.jpeg'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),

            // linear color
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter, // at the bottom
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeItem(
                              insertImage: 'img_vietnam.jpeg',
                              content: 'Hoàng Sa',
                              distance: '100 '),
                          makeItem(
                              insertImage: 'img_quoc_ky_vn.webp',
                              content: 'Trường Sa',
                              distance: '100 '),
                          makeItem(
                              insertImage: 'img_vn.jpeg',
                              content: 'belong to',
                              distance: '100'),
                          makeItem(
                              insertImage: 'img_hs_tr_vn.jpeg',
                              content: 'Viet Nam',
                              distance: '100'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          makePoint(
              top: 300.0,
              left: 200.0,
              image: 'assets/images/img_earth_at_night.jpg'),
          makePoint(
              top: 60.0,
              left: 0.0,
              image: 'assets/images/img_landmark_81.webp'),
          makePoint(
              top: 400.0,
              left: 180.0,
              image: 'assets/images/img_view_landmark.jpeg'),
        ],
      ),
    );
  }

// define makePoint function
  Widget makePoint({top, left, image}) {
    return Positioned(
      top: top,
      left: left,
      //creates a sparkle effect around its child widget.
      // hiệu ứng lấp lánh
      child: AvatarGlow(
        //bán kính của hiệu ứng sáng lấp lánh.
        //radius of glitter effect.
        endRadius: 40,
        curve: Curves.bounceInOut,
        animate: true,
        //This is the pause between iterations of the glitter effect.
        repeatPauseDuration: const Duration(milliseconds: 500),
        //This is the color of the glitter effect.
        glowColor: Colors.deepOrange.shade700,
        child: Container(
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green.shade700,
          ),
        ),
      ),
    );
  }

  Widget makeItem({insertImage, content, distance}) {
    return AspectRatio(
      //fixed aspect ratio
      // tỷ lệ khung hình
      aspectRatio: 1.9 / 2, // approximately 2
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.grey[900],
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/$insertImage'),
                      // image: AssetImage(insertImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black26,
                  ),
                  child: Text(
                    distance,
                    // '2.1 mi',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              // 'Golden Rate',
              content,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              // position of icon
              // if don't use alignment -->
              // Alignment.center is default if we use Align
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star_outline,
                color: Colors.yellow[700],
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
