import 'package:flutter/material.dart';

import 'colors.dart';
class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;
// Define your light theme
  final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    // Other properties...
  );

// Define your dark theme
  final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    // Other properties...
  );


  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  ThemeData get currentTheme => isDarkMode ? darkTheme : lightTheme;
}
