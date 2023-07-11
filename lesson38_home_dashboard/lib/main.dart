import 'package:flutter/material.dart';

import 'model/GridDashboard.dart';
//inspiration: https://dribbble.com/shots/4475014-Home-screen
// Design Home Dashboard by GridView

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDashboard(),
    ),
  );
}

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff392850),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rengoku\'s Family',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/img_notification.png',
                    width: 25,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                )
              ],
            ),
            GridDashboard(),
          ],
        ),
      ),
    );
  }
}
