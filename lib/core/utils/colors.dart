import 'package:flutter/material.dart';

const ColorScheme lightColorScheme = ColorScheme.light(
  primary: Color(0xFF2196F3), // Blue for primary actions (e.g., buttons)
  onPrimary: Colors.white, // Text color on primary
  secondary: Color(0xFF4CAF50), // Green for secondary actions or highlights
  onSecondary: Colors.white, // Text color on secondary
  background: Color(0xFFFFFFFF), // Background color
  onBackground: Color(0xFF000000), // Text color on background
  surface: Color(0xFFF1F1F1), // Card background or surfaces
  onSurface: Color(0xFF000000), // Text color on surfaces
  error: Color(0xFFD32F2F), // Red for errors
  onError: Colors.white, // Text color on error surfaces
);

const ColorScheme darkColorScheme = ColorScheme.dark(
  primary: Color(0xFFBBDEFB), // Light blue for primary actions
  onPrimary: Color(0xFF0D47A1), // Dark blue for contrast
  secondary: Color(0xFFC8E6C9), // Light green for secondary actions
  onSecondary: Color(0xFF388E3C), // Dark green for contrast
  background: Color(0xFF121212), // Dark background
  onBackground: Color(0xFFFFFFFF), // White text on dark background
  surface: Color(0xFF1E1E1E), // Dark surface for cards or dialogs
  onSurface: Color(0xFF1E1E1E), // White text on dark surfaces
  error: Color(0xFFEF5350), // Light red for errors
  onError: Color(0xFF000000), // Black text on error surfaces
);
