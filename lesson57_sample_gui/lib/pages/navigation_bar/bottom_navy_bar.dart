import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class SampleButtomNavyBar extends StatefulWidget {
  const SampleButtomNavyBar({super.key});

  @override
  State<SampleButtomNavyBar> createState() => _SampleButtomNavyBarState();
}

class _SampleButtomNavyBarState extends State<SampleButtomNavyBar> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // scroll to left and right to see another slide
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildPage(
            color: Colors.red.shade200,
            icon: Icons.apps,
            title: 'Home',
          ),
          _buildPage(
            color: Colors.pink,
            icon: Icons.person,
            title: 'Profile',
          ),
          _buildPage(
            color: Colors.orange,
            icon: Icons.message_outlined,
            title: 'Messages',
          ),
          _buildPage(
            color: Colors.blue,
            icon: Icons.settings,
            title: 'Settings',
          ),
        ],
      ),
      // bottom of page
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const Text('Users'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.message),
            title: const Text('Messages'),
            activeColor: Colors.orange,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: Colors.purple,
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 3000),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }

  Container _buildPage({IconData? icon, String? title, Color? color}) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              // Icons.apps,
              size: 200,
              color: Colors.white,
            ),
            Text(
              title!,
              // 'Home',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
