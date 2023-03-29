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

  // To change theme mode
  changeThemeMode(index) {
    currentThemeMode = _themeModes[index];
    currentThemeIndex = index;
    notifyListeners();
    PrefManager().saveThemeIndex(index);
  }

  // change to dark
  ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: currentAccent,
    );
  }

  // change to light
  ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: currentAccent,
    );
}

// Provides change notification to its listeners.
class PageState extends ChangeNotifier{
  int currentPage = 0;
  changePage(index){
    currentPage = index;
    notifyListeners();
  }
}