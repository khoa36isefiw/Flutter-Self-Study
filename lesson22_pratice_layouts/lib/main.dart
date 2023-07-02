import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // there are 3 wdgets

    // each Widget defines a function
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            // child-1
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Ma Pi Leng Mountain Pass ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Ha Giang Province',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Widget buttonSection = Row(
      // this line will adjust the center of the icons in the row
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // khoảng cách bằng nhau
      children: [
        _buildButtonColumn(Icons.call, 'CALL'),
        _buildButtonColumn(Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Icons.share, 'SHARE'),
      ],
    );

    Widget contentSection = const Padding(
      padding: EdgeInsets.all(25),
      child: Text(
        'Ma Pi Leng Pass is a high mountain pass at an elevation of 1.500m'
        '(4,921ft) above the sea level. It’s a part of the Dong Van Karst'
        ' Plateau, lies on the Happiness Road, which connects Ha Giang City,'
        ' Dong Van and Meo Vac. Happiness Road is about 200km long and was'
        ' built by thousands of youth volunteers from 16 ethnic groups of 8'
        ' Vietnam Northern provinces. It took 6 years (1959-1965) to complete'
        ' the construction and especially, the 20-km pass Ma Pi Leng was built'
        ' by suicide troops volunteers who had to hang themselves on rock'
        ' cliffs and move every centimeter to finish the dangerous 11-month'
        ' building process.',
        softWrap: true,
        textAlign: TextAlign.justify, // căn lề chữ đều 2 bên
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Building Layout'),
          ),
          body: ListView(
            // like column
            children: [
              Image.asset(
                // add Image
                ('assets/images/img_pi_leng.png'),
                fit: BoxFit.cover,
                width: 600,
                height: 250,
              ),
              titleSection, // define in Widget title
              buttonSection,
              contentSection,
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

Column _buildButtonColumn(IconData icon, String iconName) {
  return Column(
    // mainAxisSize: MainAxisSize.min,
    // mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.center,

    // add icon throught parameter
    children: [
      Icon(
        //Icons.near_me,
        icon,
        color: Colors.blue,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          // 'ROUTE',
          iconName,
          style: TextStyle(
            color: Colors.blue.shade500,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
