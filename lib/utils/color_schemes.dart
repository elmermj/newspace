import 'package:flutter/material.dart';

ColorScheme lightScheme() {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF000000),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF675B5F),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    background: Color(0xFFFFF8F8),
    onBackground: Color(0xFF1D1B1B),
    surface: Color(0xFFFFF8F8),
    onSurface: Color(0xFF1D1B1B),
  );
}

ColorScheme darkScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF705861),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF53474B),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    background: Color(0xFF151313),
    onBackground: Color(0xFFE8E1E1),
    surface: Color(0xFF151313),
    onSurface: Color(0xFFE8E1E1),
  );
}