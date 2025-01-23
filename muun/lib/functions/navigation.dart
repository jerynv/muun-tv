import 'package:flutter/material.dart';
import 'package:hse_apps/pages/pages/home.dart';

class Navigation {
  List<bool> isSelected_nav = [false, false, true, false, false];
  bool _isNavbar = true;

  bool getNavbar(int index) {
    return isSelected_nav[index];
  }

  void setNavbar(int index) {
    isSelected_nav = [false, false, false, false, false];
    isSelected_nav[index] = true;
  }

//arrow navigation
  void handleNavbarDPad(int direction) {
    if (_isNavbar) {
      if (direction == 0) {
        debugPrint('up');
      } else if (direction == 1) {
        debugPrint('down');
      }
    }
  }
}
