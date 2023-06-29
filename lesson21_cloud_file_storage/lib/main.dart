import 'package:Storage/pages/team_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CloudFileManagerGUI());
}

class CloudFileManagerGUI extends StatelessWidget {
  const CloudFileManagerGUI({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cloud File",
      home: TeamFolderPage(),
    );
  }
}
