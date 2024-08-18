import 'package:flutter/material.dart';

class CustomColors {
  static const Color gradientBegin = Color(0xFF4196E3);
  static const Color gradientEnd = Color(0xFF373598);

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF4196E3),
      Color(0xFF373598),
    ],
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    stops: [0, 0.8],
  );
}
