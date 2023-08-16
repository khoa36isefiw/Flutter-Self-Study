import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StockPages(),
    ),
  );
}

class StockPages extends StatefulWidget {
  const StockPages({super.key});

  @override
  State<StockPages> createState() => _StockPagesState();
}

class _StockPagesState extends State<StockPages> {
  final List<FlSpot> _dailySpots = [
    // 31 days
    const FlSpot(0, 20.0),
    const FlSpot(1, 20.0),
    const FlSpot(2, 30.0),
    const FlSpot(3, 10.0),
    const FlSpot(4, 40.0),
    const FlSpot(5, 60.0),
    const FlSpot(6, 40.0),
    const FlSpot(7, 80.0),
    const FlSpot(8, 60.0),
    const FlSpot(9, 70.0),
    const FlSpot(10, 50.0),
    const FlSpot(11, 150.0),
    const FlSpot(12, 70.0),
    const FlSpot(13, 80.0),
    const FlSpot(14, 60.0),
    const FlSpot(15, 70.0),
    const FlSpot(16, 60.0),
    const FlSpot(17, 80.0),
    const FlSpot(18, 110.0),
    const FlSpot(19, 130.0),
    const FlSpot(20, 100.0),
    const FlSpot(21, 130.0),
    const FlSpot(22, 160.0),
    const FlSpot(23, 190.0),
    const FlSpot(24, 150.0),
    const FlSpot(25, 170.0),
    const FlSpot(26, 180.0),
    const FlSpot(27, 140.0),
    const FlSpot(28, 150.0),
    const FlSpot(29, 150.0),
    const FlSpot(30, 130.0)
  ];

  final List<FlSpot> _monthSpots = [
    //12 months
    const FlSpot(0, 110.0),
    const FlSpot(1, 110.0),
    const FlSpot(2, 130.0),
    const FlSpot(3, 100.0),
    const FlSpot(4, 130.0),
    const FlSpot(5, 160.0),
    const FlSpot(6, 190.0),
    const FlSpot(7, 150.0),
    const FlSpot(8, 170.0),
    const FlSpot(9, 180.0),
    const FlSpot(10, 140.0),
    const FlSpot(11, 150.0),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E1117),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        leading: IconButton(
          // return previous page
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        //make title
        title: const Text(
          'Stocks',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              from: 30,
              child: Text(
                '\$ 3,658.12',
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              from: 30,
              child: const Text(
                '+4.25%',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 100),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              from: 60,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                // make Line Chart
                child: LineChart(
                  mainData(),
                  swapAnimationCurve: Curves.easeInOutCirc,
                  swapAnimationDuration: const Duration(milliseconds: 1000),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _makeDetailStocks(index: 0, stockFollow: 'D'),
                  _makeDetailStocks(index: 1, stockFollow: 'M'),
                  _makeDetailStocks(index: 2, stockFollow: 'Y'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _makeDetailStocks({index, stockFollow}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // when click into each Button D, M, Y
          // display chart similarly defined
          _currentIndex = index;
          // _currentIndex = 0;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          // make color for this container
          borderRadius: BorderRadius.circular(15),
          color: _currentIndex == index
              // blue if clicked into
              ? Colors.blue.withOpacity(0.4)
              : const Color(0xff161b22).withOpacity(0.0),
        ),
        // text for container
        child: Text(
          stockFollow,
          // 'D',
          style: TextStyle(
            color: _currentIndex == index ? Colors.white : Colors.blueGrey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Charts Data
  List<Color> gradientColors = [
    const Color(0xffe68823),
    const Color(0xffe68823),
  ];

  LineChartData mainData() {
    return LineChartData(
      // show border outside for line chart
      borderData: FlBorderData(
        show: true, // show border if it is true
        border: Border.all(
          // color for Border
          color: Colors.green,
        ),
      ),
      // show grid (squares) in border
      gridData: FlGridData(
        show: true,
        horizontalInterval: 14,
        drawHorizontalLine: true,
      ),
      // show title for 4 side top - right - bottom - left
      titlesData: FlTitlesData(
        show: true, // need set true if want to show title
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: false, // don't title of bottom
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 2:
                return 'FEB';
              case 3:
                return 'MAR';
              case 4:
                return 'APR';
              case 5:
                return 'MAY';
              case 6:
                return 'JUN';
              case 7:
                return 'JUL';
              case 8:
                return 'AUG';
              case 9:
                return 'SEP';
              case 10:
                return 'OCT';
              case 11:
                return 'NOV';
              case 12:
                return 'DEC';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false, // don't show left title
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
        ),
      ),
      minX: 0,
      // X-axis stretch when Choose D, M, Y
      maxX: _currentIndex == 0
          // daily: 31
          // month: 12
          ? _dailySpots.length - 1.toDouble() // = 30 - daily chart
          // != 0
          : _currentIndex == 1
              ? _monthSpots.length - 1.toDouble() // 11 - Month chart
              : _currentIndex == 2 // year chart
                  ? _dailySpots.length - 20.toDouble() // 11
                  : _dailySpots.length.toDouble(), // 31
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Colors.black,
                    Colors.black,
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                // show money of the high and low peak of chart when it is touched
                '\$${touchedSpot.y.round()}.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _currentIndex == 0
              ? _dailySpots
              : _currentIndex == 1
                  ? _monthSpots
                  : _dailySpots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: const Offset(0, 0),
            gradientTo: const Offset(0, 1),
            colors: [
              const Color(0xffe68823).withOpacity(0.1),
              const Color(0xffe68823).withOpacity(0),
            ],
          ),
        )
      ],
    );
  }
}
