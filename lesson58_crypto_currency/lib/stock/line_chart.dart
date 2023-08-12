import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LineChartSample extends StatefulWidget {
  const LineChartSample({super.key});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  bool _isLoaded = false;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // make _isLoaded true after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // create a button Icon with notifications
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.blueGrey,
                ),
              ),
              // make position for circle notifcations
              const Positioned(
                top: 8,
                right: 8,
                // make notifications
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                  // number of notifications
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.notifications,
          //     color: Colors.blueGrey,
          //   ),
          // ),
          // Stack(
          //   children: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         Icons.notifications,
          //         color: Colors.blueGrey,
          //       ),
          //     ),
          //     Positioned(
          //       top: 8,
          //       right: 8,
          //       child: Container(
          //         width: 12,
          //         height: 12,
          //         decoration: const BoxDecoration(
          //           color: Colors.red,
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.blueGrey,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu_outlined,
            color: Colors.blueGrey,
          ),
        ),
      ),
      //https://pub.dev/packages/salomon_bottom_bar
      // update dependencies: flutter pub upgrade --major-versions
      backgroundColor: const Color(0xff161621),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.deepPurple,
        margin: const EdgeInsets.only(bottom: 30, top: 10, right: 20, left: 20),

        // index value received from the onTap
        // callback to the _currentIndex variable.
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            selectedColor: Colors.white, // color of Icon when it is selected
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.explore_outlined),
            title: const Text('Likes'),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.data_usage),
            title: const Text('Search'),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Profile'),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // return a list contains one SliverToBoxAdapter
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          FadeInUp(
                            duration: const Duration(microseconds: 1000),
                            child: Text(
                              'Balance',
                              style: TextStyle(
                                color: Colors.blueGrey.shade300,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1000),
                            child: const Text(
                              '\$ 36,580.00',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        child: LineChart(
                          _makeChart(),
                          curve: Curves.linear,
                          duration: Duration(microseconds: 1000),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // create 2 button Payment with Transfer
                FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        color: const Color(0xff02d39a).withOpacity(0.7),
                        child: const Row(
                          children: [
                            Icon(
                              Iconsax.wallet,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Payment',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xff02d39a),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        color: Colors.transparent,
                        highlightColor:
                            const Color(0xff02d39a).withOpacity(0.4),
                        splashColor: const Color(0xff02d39a).withOpacity(0.4),
                        child: const Row(
                          children: [
                            Icon(
                              Iconsax.arrow_3,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Transfer',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //recent transactions
                const SizedBox(height: 40),
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                      color: Colors.blueAccent.shade400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // create Transaction history
                Column(
                  children: [
                    _makeTransfer(
                      totalTransfer: '1,800',
                      time: '12:34 PM',
                      dateTime: '1/10',
                    ),
                    _makeTransfer(
                      totalTransfer: '200',
                      time: '08:15 AM',
                      dateTime: '3/18',
                    ),
                    _makeTransfer(
                      totalTransfer: '900',
                      time: '21:26 PM',
                      dateTime: '4/20',
                    ),
                    _makeTransfer(
                      totalTransfer: '50',
                      time: '10:48 AM',
                      dateTime: '5/21',
                    ),
                    _makeTransfer(
                      totalTransfer: '150',
                      time: '17:49 PM',
                      dateTime: '7/27',
                    ),
                  ],
                ),
                // _makeTransfer(totalTransfer: '1,800', time: '12:00 PM'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData _makeChart() {
    return LineChartData(
      // make border for LineChart - outside of these Lines Chart
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: Colors.red,
        ),
      ),
      // crate grid - small squares inside of LineChart
      gridData: FlGridData(
        show: true, // display many squares
        //determine the distance between horizontal grid lines
        horizontalInterval: 1.6, // these lines horizontal
        //function used to create horizontal grid lines
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // Dash array value in which 3 refers to size of the dashes
            // and 3 refers to the offset gap between the dashes.
            dashArray: const [3, 3],
            color: const Color(0xff37434d).withOpacity(0.2),
            //grid line width
            strokeWidth: 2,
          );
        },
        //Determine whether to draw a vertical grid line or not
        drawVerticalLine: false, // make line horizontal axis
      ),
      ///// Holds data for showing titles on each side of charts.
      ///  /// [show] determines showing or hiding all titles,
      titlesData: FlTitlesData(
        // Determines whether the title is visible or not.
        show: true, // display MAR, MAY, JUN, 1K, 2K, 3K
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false, // not display on top of Line
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false, // not display on right of Line
          ),
        ),
        // display/show the title on the bottom
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize:
                22, //determines the maximum space that your titles need,
            showTitles: true, // display/show the title on the bottom
            interval: 1, //Spacing between titles
            //used to create the headings below
            getTitlesWidget: (value, meta) {
              // value: position of title
              const style = TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              );
              Widget text; //represent the title at that position
              switch (value.toInt()) {
                case 2:
                  text = const Text('MAR', style: style);
                  break;
                case 5:
                  text = const Text('MAY', style: style);
                  break;
                case 8:
                  text = const Text('JUN', style: style);
                  break;
                default:
                  text = const Text('', style: style);
                  break;
              }

              //use to display the bottom title
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: text,
              );
            },
          ),
        ),
        // display/show the title on the left side
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 25,
            getTitlesWidget: (value, meta) {
              const style = TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
              String text;
              switch (value.toInt()) {
                case 1:
                  // text = const Text('10K', style: style);
                  text = '1K';
                  break;
                case 2:
                  // text = const Text('30K', style: style);
                  text = '2K';

                  break;
                case 3:
                  // text = const Text('50K', style: style);
                  text = '3K';

                  break;
                default:
                  text = '';
                  // text = const Text('', style: style);
                  break;
              }

              return Text(
                text,
                style: style,
                textAlign: TextAlign.left,
              );
            },
          ),
        ),
      ),
      //The x-axis has a value from 0 to 11
      minX: 0,
      maxX: 11,
      //The y-axis has a value from 0 to 6
      minY: 0,
      maxY: 6,

      // list of points on the line chart
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded
              // if _isLoaded is true => Then we have axis-Y is Nominated
              ? [
                  const FlSpot(0, 3), // x: 0, y: 3
                  const FlSpot(2.4, 2),
                  const FlSpot(4.4, 3),
                  const FlSpot(6.4, 3.1),
                  const FlSpot(8, 4),
                  const FlSpot(9.5, 4),
                  const FlSpot(11, 5),
                ]
              // _isLoaded is False => Then all axis-Y are '0'
              : [
                  const FlSpot(0, 0),
                  const FlSpot(2.4, 0),
                  const FlSpot(4.4, 0),
                  const FlSpot(6.4, 0),
                  const FlSpot(8, 0),
                  const FlSpot(9.5, 0),
                  const FlSpot(11, 0)
                ],
          //determine if the histogram line is curved
          isCurved: true,
          // color: gradientColors,
          // color: Colors.white,

          // make Color Gradient for line chart
          gradient: const LinearGradient(
            colors: [
              Color(0xff23b6e6),
              Color(0xff02d39a),
            ],
          ),
          // width of line chart vertical bars
          barWidth: 2,
          // peak point
          dotData: const FlDotData(
            show: true, // các chấm trên đường biểu đồ
          ),
          belowBarData: BarAreaData(
            show: true,
            // gradientFrom: Offset(0, 0),
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }

// need add date time for this
  SingleChildScrollView _makeTransfer({totalTransfer, time, dateTime}) {
    return SingleChildScrollView(
      // animation
      child: FadeInUp(
        from: 50,
        duration: const Duration(microseconds: 1200),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueGrey.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Iconsax.arrow_3,
                color: Colors.blueGrey,
              ),
              const SizedBox(width: 10),
              const Text(
                'Transfer',
                style: TextStyle(
                  color: Colors.blueGrey,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              // total money that transfered
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                '\$ ' + totalTransfer + '.00',
                // '\$ 1800.00',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              // time transfer money
              Text(
                time,
                // '21:00 PM',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              // date transfer money
              Text(
                dateTime,
                // '21/7',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  iconsax: ^0.0.8
// fl_chart: ^0.40.2
// animate_do: ^3.0.2
