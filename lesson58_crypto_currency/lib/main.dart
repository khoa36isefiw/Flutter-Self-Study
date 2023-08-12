import 'package:flutter/material.dart';
import 'package:lesson58_crypto_currency/intro_page.dart';
import 'package:lesson58_crypto_currency/stock/line_chart.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LineChartSample(),
    ),
  );
}
