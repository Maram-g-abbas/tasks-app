import 'package:flutter/material.dart';

// Function to get responsive font size
double responsiveFontSize(BuildContext context, double baseSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  return baseSize * (screenWidth / 375);
}

class AppTextStyles {
  static TextStyle headline1(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, 32), // Responsive size
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle headline2(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, 24),
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, 16),
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, 14),
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, 12),
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle button(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, 16),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
