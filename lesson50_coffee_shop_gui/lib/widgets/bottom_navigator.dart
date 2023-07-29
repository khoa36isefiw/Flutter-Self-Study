import 'package:flutter/material.dart';

class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        backgroundColor: Colors.black,
        items: [
          //Home
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: index == 0
                  ? Colors.orange
                  : Colors.grey.shade600.withOpacity(0.6),
            ),
            label: 'Home',
          ),
          //Shop
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopify,
              color: index == 1
                  ? Colors.orange
                  : Colors.grey.shade600.withOpacity(0.6),
            ),
            label: 'Shop',
          ),
          //Favorite
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopify,
              color: index == 2
                  ? Colors.orange
                  : Colors.grey.shade600.withOpacity(0.6),
            ),
            label: 'Favorite',
          ),
          // notifcation
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_add,
              color: index == 3
                  ? Colors.orange
                  : Colors.grey.shade600.withOpacity(0.6),
            ),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
