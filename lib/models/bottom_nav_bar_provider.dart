import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  void changePage(int index) {
    _selectedPage = index;
    notifyListeners();
  }
}
