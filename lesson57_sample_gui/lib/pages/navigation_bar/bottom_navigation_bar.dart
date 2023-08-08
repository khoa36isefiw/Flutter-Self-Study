import 'package:flutter/material.dart';
import 'package:lesson57_sample_gui/pages/box/animated_container.dart';

class DesignButtonNavigationBar extends StatefulWidget {
  const DesignButtonNavigationBar({super.key});

  @override
  State<DesignButtonNavigationBar> createState() =>
      _DesignButtonNavigationBarState();
}

class _DesignButtonNavigationBarState extends State<DesignButtonNavigationBar> {
  List<Widget> tabs = [
    Center(
      child: Text(
        'Home',
        style: TextStyle(color: Colors.white),
      ),
    ),
    Center(
      child: Text(
        'Search',
        style: TextStyle(color: Colors.white),
      ),
    ),
    Center(
      child: Text(
        'Profile',
        style: TextStyle(color: Colors.white),
      ),
    ),
    Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/img_rengoku_back.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Notification',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    Center(
      child: Text(
        'Add Items',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];
  int currentPage = 0;

  // open this page when selecting the corresponding icon
  setPage(index) {
    setState(() {
      // set currentIden = index of page
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text('Navigation Bar'),
        elevation: 0,
        backgroundColor: Colors.grey.shade800,
      ),
      body: tabs[currentPage],
      // make button Add. If don't set the location bottom for it.
      // It will stay at the bottom right of the screen
      floatingActionButton: FloatingActionButton(
        onPressed: () => setPage(4),
        backgroundColor: Colors.blue.shade400,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ),
      // make the button stay in the centerDocked
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // MAKE BUTTON
      bottomNavigationBar: BottomAppBar(
        // background color for this bottom Nav
        color: Colors.grey.shade900,
        // make shape below icon stay centerDocked
        // if want to make this shape -->  one Icon MUST locate in the Dock
        // shape: CircularNotchedRectangle(),
        shape: const AutomaticNotchedShape(
          // host -> must no be null
          // make borderRadius for the whole bottom Navigation Bar through BorderRaidus.all

          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),

          /// -------- Host always flying above/ front of guest ------------
          // guest  -> may be not null
          // make border Radius for the space below Icon in centerDocked
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(22),
            ),
          ),
        ),

        // in bottom We create a container contains Icons
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: currentPage == 0 ? Colors.white : Colors.grey,
                  size: 30,
                ),
                onPressed: () {
                  setPage(0); // Open the current Index of page is defined
                },
              ),
              // search
              IconButton(
                onPressed: () {
                  setPage(1); // Open the current Index of page is defined
                },
                icon: Icon(
                  Icons.search_outlined,
                  color: currentPage == 1 ? Colors.white : Colors.grey,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 100,
              ),
              // person
              IconButton(
                onPressed: () {
                  setPage(2); // Open the current Index of page is defined
                },
                icon: Icon(
                  Icons.person,
                  color: currentPage == 2 ? Colors.white : Colors.grey,
                  size: 30,
                ),
              ),
              // notifications
              IconButton(
                onPressed: () {
                  setPage(3); // Open the current Index of page is defined
                },
                icon: Icon(
                  Icons.notifications,
                  color: currentPage == 3 ? Colors.white : Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
