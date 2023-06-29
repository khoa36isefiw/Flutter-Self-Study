import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  final String folderName;
  const ProjectPage({required this.folderName, super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProjectPageStare();
  }
}

class _ProjectPageStare extends State<ProjectPage> {
  int selectedIndex = 0;
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            height: 170,
            color: Colors.grey.shade200,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start, // căn lề chữ
                  children: [
                    Text(
                      'Chat Box',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Sát Quỷ Đoàn',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                // add icon and box decoration for this
                Row(
                  children: [
                    //icon search
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_outlined,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    // icon share
                    Container(
                      // add box decoration for this Icon Button
                      // This box will stayed at back of the Icon
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share_outlined,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            padding: const EdgeInsets.only(
                left: 25, top: 25), // height of the container
            child: ListView(
              scrollDirection:
                  Axis.horizontal, // scroll bar kéo theo chiều ngang
              children: [
                buildAvatar('Giyuu', 'giyuu'),
                buildAvatar('Inosuke', 'img_inosuke'),
                buildAvatar('Rengoku', 'img_rengoku'),
                buildAvatar('Zenitsu', 'img_zenitsu'),
                buildAvatar('Tanjiro', 'img_tanjiro'),
                buildAvatar('Tengen', 'img_tengen'),
                buildAvatar('Shinobu', 'img_shinobu'),
              ],
            ),
          ),
          // vạch phân cách - separate
          const Divider(
            height: 20,
            color: Colors.deepOrangeAccent,
          ),
          // const Padding(
          //   padding: EdgeInsets.all(25),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'File',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       Text(
          //         'Create New',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.blue,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(25),
          //   child: Container(
          //     height: 65,
          //     margin: EdgeInsets.only(bottom: 8),
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     decoration: BoxDecoration(
          //       color: Colors.grey.shade300,
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     child: Column(
          //       children: [
          //         buildFolderRow('Assets', true),
          //         buildFolderRow('Assets', true),
          //         buildFolderRow('Assets', true),
          //         buildFolderRow('Assets', true),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stratergy",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Create new",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                buildFolderRow('Task', true),
                buildFolderRow('Meeting', false),
                buildFolderRow('Training', false),
                buildFolderRow('Place', false),
                buildFolderRow('Đụt', false),
                buildFolderRow('Giyuu', false),
                buildFolderRow('Kimetsu No Yaiba', false),
              ],
            ),
          ),
        ],
      ),
      // bottom navigation bar in the bottom screen

      // hide the label for the icon

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // hide the label of icon is clicked
        // hide the label of icon don't click into it
        showUnselectedLabels: false,

        onTap: (index) {
          setState(() {
            selectedIndex = index; // the current index is clicked
          });
        },
        // set the position of the button is clicked!
        currentIndex: selectedIndex, // set the current index is?
        items: const [
          // bottomNav-1
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Time2',
          ),
          // bottomNav-2
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Package',
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.green,
              spreadRadius: 7, // độ mờ không có thì không có bóng mờ
              blurRadius: 44,
            ),
          ],
        ),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container buildFolderRow(String folderName, bool showAlert) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      //the box behind the Icon
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        // can chinh cho Row và Icon
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // this Row is only for Icon and IconButton
            children: [
              Stack(
                children: [
                  const Icon(
                    Icons.folder,
                    color: Colors.blue,
                  ),
                  if (showAlert)
                    Positioned(
                      right: -1,
                      top: 2,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 3.5, // size of the circle
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                // 'Assets',
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
          )
        ],
      ),
    );
  }

  Widget buildAvatar(String name, String imgName) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            // increment the radius of the image
            radius: 30,
            backgroundImage: Image.asset('assets/images/$imgName.png').image,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            // 'Đụt',
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
