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
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  color: index == 3
                      ? Colors.orange
                      : Colors.grey.shade600.withOpacity(0.6),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
}
