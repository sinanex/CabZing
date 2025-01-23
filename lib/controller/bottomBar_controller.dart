import 'package:flutter/material.dart';

class BottombarController extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
