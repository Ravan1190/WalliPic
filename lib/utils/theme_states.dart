import 'package:flutter/material.dart';
import 'package:walli_pic/utils/shared_pref_manager.dart';

class ThemeState extends ChangeNotifier {
  int currentThemeIndex = 0;
  ThemeMode currentThemeMode = ThemeMode.light;
  final List<ThemeMode> _themeModes = [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system,
  ];

  void getTheme() async {
    currentThemeIndex = await SharedPrefManager().getThemeIndex();
    currentThemeMode = _themeModes[currentThemeIndex];
    currentAccentIndex = await SharedPrefManager().getAccentIndex();
    currentAccent = accentColors[currentAccentIndex];
    notifyListeners();
  }

  // To change theme mode
  changeThemeMode(index) {
    currentThemeMode = _themeModes[index];
    currentThemeIndex = index;
    notifyListeners();
    SharedPrefManager().saveThemeIndex(index);
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

  // For Accent colors
  int currentAccentIndex = 0;
  List<Color> accentColors = [
    Colors.amber,
    Colors.purple,
    Colors.cyan,
    Colors.greenAccent,
    Colors.lime,
    Colors.redAccent
  ];
  List<Text> accentTexts = [
    const Text("Amber"),
    const Text("Purple"),
    const Text("Cyan"),
    const Text("Green Accent"),
    const Text("Lime"),
    const Text("Red Accent")
  ];
  Color currentAccent = Colors.amber;

  changeAccent(index) {
    currentAccent = accentColors[index];
    currentAccentIndex = index;
    notifyListeners();
    SharedPrefManager().saveAccentIndex(index);
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