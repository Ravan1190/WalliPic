import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier{
  int currentThemeIndex = 0;
  ThemeMode currentThemeMode = ThemeMode.light;
  final List<ThemeMode> _themeModes = [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system,
  ];
  void getTheme() async {
    currentThemeIndex = await PrefManager().getThemeIndex();
    currentThemeMode = _themeModes[currentThemeIndex];
    currentAccentIndex = await PrefManager().getAccentIndex();
    currentAccent = accentColors[currentAccentIndex];
    notifyListeners();
  }
}

// Provides change notification to its listeners.
class PageState extends ChangeNotifier{
  int currentPage = 0;
  changePage(index){
    currentPage = index;
    notifyListeners();
  }
}