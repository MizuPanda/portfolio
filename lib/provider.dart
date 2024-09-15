import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  void providerDispose() {
    _scrollController.dispose();
  }

  final double _projectHeightMultiplier = 230/836;
  final double _experienceHeightMultiplier = 740/836;

  void scrollToItem(int index, double height) {
    // Here you would calculate the position to scroll based on the index
    // For example, you can use positions like: 0.0, 500.0, 1000.0 for each section
    double position = 0; // This is just a placeholder
    
    switch (index) {
      case 1:
      position = _projectHeightMultiplier*height;
      break;
      case 2:
      position = _experienceHeightMultiplier*height;
    }
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

  notifyListeners();
  }
}