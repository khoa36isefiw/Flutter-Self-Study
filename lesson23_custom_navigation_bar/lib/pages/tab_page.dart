import 'package:flutter/material.dart';
import 'package:lesson23_custom_navigation_bar/pages/dashboard_page.dart';
import 'package:lesson23_custom_navigation_bar/pages/search_page.dart';
import 'package:lesson23_custom_navigation_bar/pages/settings_page.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int currentSelectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //When the value of currentSelectedTab variable changes,
      //IndexedStack will automatically display
      //the page corresponding to the new index.
      body: IndexedStack(
        index: currentSelectedTab,
        children: const <Widget>[
          // call some functions when we click into this tab
          DashBoardPage(),
          SearchPage(),
          SettingsPage(),
        ],
      ),
      //  Navigation Bar
      bottomNavigationBar: NavigationBar(
        //specify which NavigationDestination is selected
        selectedIndex: currentSelectedTab,
        onDestinationSelected: (int index) {
          setState(() {
            currentSelectedTab = index;
          });
        },
        // time end animation when the icon is chose
        animationDuration: const Duration(seconds: 3),

        // only show the label when user clicks into it
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // we have an Array contains 3 child in this
        // choose some one will update 'index' of it to onDestinationSelected
        destinations: const [
          // list items in bottom navigation bar
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Dashboard',
            selectedIcon: Icon(Icons.home_filled),
            tooltip: 'Navigate to the Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
