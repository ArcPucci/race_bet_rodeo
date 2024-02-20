import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF363636);
  static const Color grey = Color(0xFF969696);
  static const Color grey2 = Color(0xFF989898);
  static const Color grey3 = Color(0xFF808080);
  static const Color whiteAccent = Color(0xFFE8E8E8);
  static const Color whiteAccent2 = Color(0xFFD9D9D9);
  static const Color whiteAccent3 = Color(0xFFEAEAEA);
  static const Color yellow = Color(0xFFE3B719);
  static const Color black3 = Color(0xFF2F2F2F);
  static const Color black4 = Color(0xFF3F3F3F);
  static const Color green = Color(0xFF86CA6F);
  static const Color black2 = Color(0xFF191919);

  static const LinearGradient gradient1 = LinearGradient(
    colors: [
      Color(0xFFFFDB58),
      Colors.white,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradient2 = LinearGradient(
    colors: [
      Colors.white,
      Color(0xFFE3E3E3),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient3 = LinearGradient(
    colors: [
      Colors.black.withOpacity(0),
      Colors.black.withOpacity(0.64),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
