import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier{
  int currentThemeIndex = 0;
  ThemeMode currentThemeMode = ThemeMode.light;
  final List<ThemeMode> _themeModes = [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system,
  ];
}

// Provides change notification to its listeners.
class PageState extends ChangeNotifier{
  int currentPage = 0;
  changePage(index){
    currentPage = index;
    notifyListeners();
  }
}