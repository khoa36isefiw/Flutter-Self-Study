import 'package:Storage/pages/project.dart';
import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TeamFolderPageState();
  }
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  double avaibleScrennWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    avaibleScrennWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            alignment: Alignment.bottomCenter,
            height: 170,
            color: Colors.blue.shade800,
            child: Row(
              // this mainAxisAlignment is for all items in this container
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  // căn lề chữ cho đều nhau
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Giyuu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Hashira Team ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '柱 (はしら',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // icon search
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_outlined,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    //space for 2 icons
                    const SizedBox(
                      width: 16,
                    ),

                    // icon notification
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                        color: Colors.white,
                      ),
                    ),
                    //space for 2 icons
                    const SizedBox(
                      width: 16,
                    ),
                    // icon question
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.question_mark),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Storage\t",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "\t9.01/10GB",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Upgrade',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                // call buildFileChart function at here
                buildFileChart('Source', Colors.blue, 0.3),
                const SizedBox(
                  width: 2,
                ),
                buildFileChart('Docs', Colors.orange, .25),
                const SizedBox(
                  width: 2,
                ),
                buildFileChart('Images', Colors.green, .20),
                const SizedBox(
                  width: 2,
                ),
                buildFileChart('', Colors.grey, .23),
              ],
            ),
          ),
          // add divider - vạch phân cách
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 20,
            color: Colors.blueGrey,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView(
                // scrollDirection: Axis.horizontal, // Thiết lập chiều cuộn ngang
                children: [
                  const Text(
                    'Recently Updated',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // Add ScrollBar following the Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // items will be scrolled
                      children: [
                        // your widgets here
                        buildFileColumn(
                            // 'https://cdnb.artstation.com/p/assets/images/images/020/519/407/large/himanshu-manuja-giyuu-digital-painting-himanshu-manuja.jpg?1568095007',
                            'img_giyuu2',
                            'Giyuu ',
                            'Tomioka'),
                        SizedBox(
                          width: avaibleScrennWidth * .03,
                        ),
                        buildFileColumn(
                            // 'https://www.looper.com/img/gallery/rengokus-powers-in-demon-slayer-explained/intro-1634845481.jpg',
                            'img_rengoku',
                            'Kyojuro ',
                            'Rengoku'),
                        SizedBox(
                          width: avaibleScrennWidth * .03,
                        ),
                        buildFileColumn(
                            // 'https://cdnb.artstation.com/p/assets/images/images/020/519/407/large/himanshu-manuja-giyuu-digital-painting-himanshu-manuja.jpg?1568095007',
                            'giyuu',
                            'Đụt ',
                            'Trụ'),
                        buildFileColumn(
                            // 'https://cdnb.artstation.com/p/assets/images/images/020/519/407/large/himanshu-manuja-giyuu-digital-painting-himanshu-manuja.jpg?1568095007',
                            'img_inosuke',
                            'Inosuke ',
                            'Hashibira'),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 60,
                    color: Colors.red,
                  ),
                  const Row(
                    // căn lề cho chữ
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Projects ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Create New',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  buildProjectRow('Chatbox'),
                  buildProjectRow('Time Note'),
                  buildProjectRow('Stratergy'),
                  buildProjectRow('Breath'),
                ],
              ),
            ),
          ),
        ],
      ),
      //add floating button in the
      floatingActionButton: Container(
        // use container to add shadow behind the floating button
        decoration: const BoxDecoration(
          shape: BoxShape.circle, // hình dạng nó là một circle
          boxShadow: [
            BoxShadow(
              color: Colors.white, // color of the shadow
              spreadRadius: 7, // độ mờ lan rộng từ trung tâm ra
              blurRadius: 1, // độ đậm nhạc của bóng
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

// bottom navigation bar in the bottom screen
      bottomNavigationBar: BottomNavigationBar(
        // call back function
        onTap: (index) {
          // when the button is tap
          setState(() {
            //set selectedIndex
            selectedIndex = index;
          });
        },
        // set current index button is selected
        currentIndex: selectedIndex, // that makes we can switch two buttons
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // list navigation bar items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Folder',
          ),
        ],
      ),
    );
  }

  Widget buildProjectRow(String folderName) {
    return GestureDetector(
      // open new screen when click into folderName
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                ProjectPage(folderName: folderName),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        // add box decoration for this container
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.folder,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  folderName,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildFileColumn(
      String imageUrl, String firstNameActor, String lastNameActor) {
    return Column(
      children: [
        Container(
          width: avaibleScrennWidth * .40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(5),
          height: 140,
          // child: Image.network(
          //   imageUrl,
          // ),
          child: Image.asset(
            'assets/images/${imageUrl}.png',
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
            text: firstNameActor,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: lastNameActor,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // this is  function will be called in above
  // with some parameters
  Column buildFileChart(String title, Color color, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: avaibleScrennWidth * width,
          height: 4,
          //color: Colors.blue,
          color: color,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          // 'Sources',
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
