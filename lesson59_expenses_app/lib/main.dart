import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesPage(),
    ),
  );
}

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  late bool _isLoaded = false;
  // create a list contains _services
  List<dynamic> _services = [
    ['Transfer', Iconsax.export_1, Colors.blue],
    ['Top-up', Iconsax.import, Colors.pink],
    ['Bill', Iconsax.wallet_3, Colors.orange],
    ['More', Iconsax.more, Colors.green],
  ];

  // create a list of transaction history
  List<dynamic> _transactions = [
    [
      'Amazon',
      'https://img.icons8.com/office/2x/amazon.png',
      '18:29 PM',
      '\$8.90',
    ],
    [
      'Cash from ATM',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png',
      '13:51 PM',
      '\$200.00',
    ],
    [
      'Netflix',
      'https://img.icons8.com/color/2x/netflix-desktop-app.png',
      '11:22 AM',
      '\$13.99'
    ],
    [
      'App Store',
      'https://img.icons8.com/fluency/2x/apple-app-store.png',
      '06:25 AM',
      '\$4.99',
    ],
    [
      'Cash from ATM',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png',
      '15:50 PM',
      '\$200.00',
    ],
    [
      'Netflix',
      'https://img.icons8.com/color/2x/netflix-desktop-app.png',
      '22:22 PM',
      '\$13.99',
    ],
    [
      'Rengo',
      'https://w0.peakpx.com/wallpaper/919/843/HD-wallpaper-demon-slayer-kyojuro-rengoku-back-view-with-background-of-glittering-stars-and-fire-at-night-anime.jpg',
      '23:12 PM',
      '\$1999.99',
    ],
  ];

  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    // set _isLoaded to true after 2 seconds
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _isLoaded = true;
      });
    });
  }

  void _listenToScrollChange() {
    // Requires the controller to be controlling exactly one scrollable widget.
    if (_scrollController.offset >= 100) {
      setState(() {
        _isLoaded = true;
      });
    } else {
      setState(() {
        _isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E1117),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.58,
            elevation: 0,
            pinned: true,
            stretch: true,
            toolbarHeight: 80,
            backgroundColor: const Color(0xff161b22),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            title: AnimatedOpacity(
              opacity: _isScrolled ? 1.0 : 0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    '\$ 35,998.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 4,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade800,
                    ),
                  ),
                  // make Line Chart
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: AnimatedOpacity(
                opacity: _isScrolled ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: FadeIn(
                  duration: const Duration(milliseconds: 1500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total in November',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 22,
                            ),
                          ),
                          const Text(
                            '1,220.00',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: LineChart(
                          _makeLineChart(),
                          swapAnimationCurve: Curves.linear,
                          swapAnimationDuration:
                              const Duration(milliseconds: 1000),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 4,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // get icon and name of function
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                Container(
                  height: 115,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: _services.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FadeInDown(
                        delay: Duration(milliseconds: index * 1000),
                        duration: Duration(milliseconds: (index + 1) * 200),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    // color: Color(0xff161B22),
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    _services[index][1],
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _services[index][0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$1,145.00",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  // Make today's investment price
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      // get length of _transactions LIST
                      itemCount: _transactions.length,
                      itemBuilder: (context, index) {
                        return FadeInDown(
                          duration: const Duration(milliseconds: 1500),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              // color: Colors.amber,
                              color: const Color(0xff161B22),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.amber),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      // get Image of _transactions List
                                      // in index at position index 1
                                      _transactions[index][1],
                                      width: 50,
                                      height: 50,
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // get investor's name
                                          _transactions[index][0],
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        // get time
                                        Text(
                                          _transactions[index][2],
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade700,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //Get the investor's price
                                Text(
                                  _transactions[index][3],
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade200,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _makeLineChart() {
    return LineChartData(
      // show border outside of the line chart - frame
      borderData: FlBorderData(
        show: true, // TRUE --> display border
        border: Border.all(
          // make border color
          color: Colors.amber.shade800,
        ),
      ),
      gridData: FlGridData(
        show: true, // display many dots line inside of frame of line chart
        //Determines interval between horizontal/vertical lines, left it null to be auto calculated.
        verticalInterval: 1.6,
        // design draw Horizontal Line for Line Chart
        getDrawingHorizontalLine: (value) {
          return FlLine(
            /// Defines dash effect of the line.
            /// It is a circular array of dash offsets and lengths.
            /// For example, the array `[3, 6]` would result in dashes 3 pixels long
            /// followed by blank spaces 6 pixels long.
            dashArray: const [3, 6],
            color:
                Colors.deepOrange.withOpacity(0.5), // make color for dashArray
            strokeWidth: 2, // make width for for each dots of dashArray
          );
        },

        // design draw vertical Line for line chart
        getDrawingVerticalLine: (value) {
          return FlLine(
            dashArray: [5, 10],
            color: Colors.white.withOpacity(0.5),
            strokeWidth: 3,
          );
        },

        // drawVerticalLine: true,
        drawHorizontalLine: true,
      ),
      // make Title Data for each side of border side
      titlesData: FlTitlesData(
        show: true, // show all defined Data titles
        rightTitles: SideTitles(
          showTitles: false, // hide the right title even though it is defined
        ),
        topTitles: SideTitles(
          showTitles: false, // hide the top title
        ),
        bottomTitles: SideTitles(
          showTitles: true, // show/display the bottom Title on the bottom
          reservedSize: 22, // determines how much space they needed,
          interval: 1, // texts are showing with provided
          //determines the text style of them,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          //it gives we an axis value (double value),
          // and you we return a string
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'MAR';
              case 4:
                return 'JUN';
              case 7:
                return 'SEP';
              case 10:
                return 'OCT';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1k';

              case 3:
                return '2k';

              case 5:
                return '3k';

              // case 4:
              //   return '4k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      // range number of value X-Axis and Y-Axis
      minX: 0, // X [0, 11]
      maxX: 11,
      minY: 0, // Y [0, 6]
      maxY: 6,

      // Handles touch behaviors and responses when user touch in it.
      // touch occurs
      lineTouchData: LineTouchData(
        // Used for showing touch indicators
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            // include Fline and flDotData
            return TouchedSpotIndicatorData(
              //Defines style of a line.
              FlLine(
                color: Colors.amber,
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              // This class holds data about drawing spot dots on the drawing
              // bar line
              FlDotData(
                show: true, //  show these dots on line chart
                //used for drawing target.
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Colors.black,
                    Colors.black,
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Colors.amber,
                ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          //have a padding inside the tooltip
          tooltipPadding: const EdgeInsets.all(8),
          //Tooltip shows on top of spots, with [tooltipBgColor] as a background color
          tooltipBgColor: Color(0xff2e3747).withOpacity(0.8),
          //Content of the tooltip will provide using [getTooltipItems] callback, you can override it
          /// and pass your custom data to show in the tooltip.
          getTooltipItems: (touchedSpot) {
            return touchedSpot.map((touchedSpot) {
              return LineTooltipItem(
                // [y] determines cartesian (axis based) vertically position
                // 0 means most bottom point of the chart
                '\$${touchedSpot.y.round()}0.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
        //shows a tooltip popup on top of the spots if
        /// touch occurs (or you can show it manually using,
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          // draws points that the line is going through
          spots: _isLoaded
              ? [
                  //Represents a conceptual position in cartesian (axis-based: X-axis, Y-axis) space.
                  FlSpot(0, 3),
                  FlSpot(2.4, 2),
                  FlSpot(4.4, 3),
                  FlSpot(6.4, 3.1),
                  FlSpot(8, 4),
                  FlSpot(9.5, 4),
                  FlSpot(11, 5),
                ]
              : [
                  FlSpot(0, 0),
                  FlSpot(2.4, 0),
                  FlSpot(4.4, 0),
                  FlSpot(6.4, 0),
                  FlSpot(8, 0),
                  FlSpot(9.5, 0),
                  FlSpot(11, 0)
                ],
          isCurved: true,
          colors: [
            const Color(0xff4e65fe).withOpacity(0.5),
            const Color(0xff4e65fe).withOpacity(0),
          ],
          barWidth: 2, // determines the thickness of drawing line,
          //show/display dot in the maximum and minimum peaks of the graph
          dotData: FlDotData(
            show: true,
          ),
          // used to fill the space below or above the drawn line,
          /// you can fill with a solid color or a linear gradient.
          belowBarData: BarAreaData(
            show: true, // display this area below the line
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            colors: [
              Colors.blue.withOpacity(0.1),
              Colors.blue.withOpacity(0),
            ],
          ),
        ),
        // make another line chart
        LineChartBarData(
          spots: _isLoaded
              ? [
                  FlSpot(0, 4),
                  FlSpot(2.4, 3),
                  FlSpot(4.4, 5),
                  FlSpot(6.4, 3.8),
                  FlSpot(8, 3.8),
                  FlSpot(9.5, 5),
                  FlSpot(11, 5),
                ]
              : [
                  FlSpot(0, 0),
                  FlSpot(2.4, 0),
                  FlSpot(4.4, 0),
                  FlSpot(6.4, 0),
                  FlSpot(8, 0),
                  FlSpot(9.5, 0),
                  FlSpot(11, 0)
                ],

          // makes it curve for drawing
          isCurved: true,
          colors: [
            Colors.amber,
            Color(0xff4e65fe).withOpacity(0),
          ],
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0, 1),
            colors: [
              Colors.amber.withOpacity(0.1),
              Colors.amber.withOpacity(0),
            ],
          ),
        ),
      ],
    );
  }

  // Charts Data
  List<Color> gradientColors = [
    const Color(0xffe68823),
    const Color(0xffe68823),
  ];
}
