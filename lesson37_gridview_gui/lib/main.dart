import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GridViewGUI(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class GridViewGUI extends StatefulWidget {
  const GridViewGUI({super.key});

  @override
  State<GridViewGUI> createState() => _GridViewGUIState();
}

class _GridViewGUIState extends State<GridViewGUI> {
  // prepare list Image Item
  final List<String> _listImage = [
    'assets/images/img_macbook_1.webp',
    'assets/images/img_macbook_2.jpeg',
    'assets/images/img_macbook_3.webp',
    'assets/images/img_macbook_4.jpeg',
    'assets/images/img_macbook_5.jpeg',
    'assets/images/img_macbook_6.webp',
    'assets/images/img_macbook_7.jpeg',
    'assets/images/img_macbook_8.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Home'),
        elevation: 0,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 35,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text('0'),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // child-1
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/macbook.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.2),
                      ],
                      begin: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // child1
                      const Text(
                        'Macbook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      // child2
                      Container(
                        height: 50,
                        // margin distance left and right: 40
                        margin: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Shop Now',
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              // child-2
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  // sẽ có 2 item hiểu thị lên trên màn hình
                  crossAxisCount: 2,
                  // tạo 1 spacing theo chiều thẳng đứng là 10
                  crossAxisSpacing: 10,
                  // tạo 1 spacing theo chiều ngang là 10
                  mainAxisSpacing: 10,
                  children: _listImage
                      .map(
                        (item) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Transform.translate(
                              // toạ độ  của container
                              offset: const Offset(60, -55),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 65,
                                  vertical: 63,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.bookmark_border,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
