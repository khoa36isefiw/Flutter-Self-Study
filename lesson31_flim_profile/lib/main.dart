import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlimProfile(),
    ),
  );
}

class FlimProfile extends StatefulWidget {
  const FlimProfile({super.key});

  @override
  State<FlimProfile> createState() => _FlimProfileState();
}

class _FlimProfileState extends State<FlimProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          // create a list to scroll in many styles
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // thiết lặp chiều cao của SliverAppBar khi được kéo
                expandedHeight: 450,
                backgroundColor: Colors.black,

                // use to display image and title
                //  được sử dụng để hiển thị nội dung linh hoạt (ví dụ: hình ảnh, tiêu đề, nút)
                flexibleSpace: FlexibleSpaceBar(
                  /// The background widget pin in place until it reaches the min extent.
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/img_rengoku_ruc_chay.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // this container is for color
                    // create a fading effect from black at the bottom
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.2),
                          ],
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Rengoku Kyoujurou',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '7 Videos',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  '700k Subscribes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //chứa một danh sách các widget có thể cuộn.
              // contains a list of widget can scroll
              SliverList(
                //cung cấp danh sách các widget con bên trong SliverList
                //xây dựng danh sách các widget con từ danh sách cố định.
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Rengoku Kyoujurou is a tall young man with bright blonde hair with red streaks, black eyebrows, and golden eyes. As a Pillar, Kyoujurou is very enthusiastic about his duties. He is very polite, kind, cheerful, and has always prided himself on his extraordinary level of swordsmanship resulting from his hard training.',
                            style: TextStyle(
                              color: Colors.grey,
                              height: 1.4,
                            ),
                            // căn đều 2 bên
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Born',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'May, 10th, Japan',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Nationality',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Japanese',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Videos',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 200,
                            // child: makeVideo(),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                makeVideo(
                                    image: 'assets/images/img_rengoku.png'),
                                makeVideo(
                                    image:
                                        'assets/images/img_rengoku_last_smile.jpg'),
                                makeVideo(
                                    image:
                                        'assets/images/img_rengoku_with_bong_ro.jpeg'),
                                makeVideo(
                                    image:
                                        'assets/images/img_rengoku_fire.jpeg'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // button follow

          //làm cho nó che phủ toàn bộ không gian của cha
          // nằm trên cùng
          Positioned.fill(
            bottom: 50,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(30),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.yellow[700],
                ),
                // use Align width will full screen
                //default text is center
                child: const Align(
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            // image: AssetImage('assets/images/img_rengoku.png'),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: const Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
