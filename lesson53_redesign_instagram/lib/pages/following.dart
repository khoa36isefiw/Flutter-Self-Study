import 'package:flutter/material.dart';

import '../models/user.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  bool isMenuVisible = false; // for icon more
  final List<User> _user = [
    User(
      'Rengoku Kyoujurou',
      '@kyoujuro',
      'assets/images/img_rengoku_back.jpeg',
      false,
    ),
    User(
      'Kocho Shinobu',
      '@shinobu',
      'assets/images/img_shinobu.png',
      false,
    ),
    User(
      'Tomioka Giyuu',
      '@giyuu',
      'assets/images/img_giyuu1.png',
      false,
    ),
    User(
      'Rengoku Kyoujurou',
      '@flameHashira',
      'assets/images/img_rengoku_ruc_chay.jpeg',
      false,
    ),
  ];

  List<User> _selectedUsers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: _user.length,
          itemBuilder: (context, index) => _makeUserComponent(
            usr: _user[index],
          ),
        ),
      ),
    );
  }

  Container _makeUserComponent({required User usr}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    usr.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    usr.name,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    usr.userName,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(
                      0xffeeeeee,
                    ),
                  ),
                  color: usr.isFollow ? Colors.blue.shade300 : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  // color: Colors.green,
                ),
                child: MaterialButton(
                  onPressed: () {
                    // update new state when user clicks on
                    setState(() {
                      usr.isFollow = !usr.isFollow;
                    });
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    usr.isFollow ? 'Following' : 'Follow',
                    style: TextStyle(
                      color: usr.isFollow ? Colors.black : Colors.blue,
                    ),
                  ),
                ),
              ),
              // Icon(
              //   Icons.more_vert_rounded,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       isMenuVisible = true;
              //     });
              //   },
              //   child: Icon(
              //     Icons.more_vert_rounded,
              //   ),
              // ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert_rounded),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Message'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Report'),
                  ),
                  // Add more PopupMenuItem as needed
                ],
                onSelected: (value) {
                  // Handle the selected option based on its value
                  switch (value) {
                    case 1:
                      // Do something for Option Message
                      break;
                    case 2:
                      // Do something for Option Report
                      break;
                    // Handle more cases as needed
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
