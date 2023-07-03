import 'dart:core';

import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier {
  // gửi thông báo đến khi có sự thay đổi
  final List<int> _favoriteItems = []; // list lưu trữ các danh sách màu

  // getter
  List<int> get items => _favoriteItems;

  void add(int itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners(); // thông báo có sự thay đổi
  }

  void remove(int itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }
}
