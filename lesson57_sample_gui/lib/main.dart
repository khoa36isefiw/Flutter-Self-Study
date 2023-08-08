import 'package:flutter/material.dart';
import 'package:lesson57_sample_gui/pages/bouncing/bouncing_widget.dart';
import 'package:lesson57_sample_gui/pages/box/animated_container.dart';
import 'package:lesson57_sample_gui/pages/drop_down_menu/sample_dropdown_menu.dart';
import 'package:lesson57_sample_gui/pages/navigation_bar/bottom_navigation_bar.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: DesignButtonNavigationBar(),
    ),
  );
}
