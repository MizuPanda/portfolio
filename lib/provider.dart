import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();

  void scrollToItem(int index) {
    // Here you would calculate the position to scroll based on the index
    // For example, you can use positions like: 0.0, 500.0, 1000.0 for each section
    double position = 0; // This is just a placeholder
    switch (index) {
      case 1:
      position = 230;
      break;
      case 2:
      position = 232;
    }
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

  notifyListeners();
  }
}