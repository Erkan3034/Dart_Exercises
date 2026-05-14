// theme/zodiac_colors.dart - This file is part of the theme module
import 'package:flutter/material.dart';

class ZodiacColors {
  static const Map<String, Color> primaryColors = {
    'koc': Color(0xFFFF6B6B),
    'boga': Color(0xFF4ECDC4),
    'ikizler': Color(0xFFFFE66D),
    'yengec': Color(0xFFFF8C42),
    'aslan': Color(0xFFFFD93D),
    'basak': Color(0xFF95E1D3),
    'terazi': Color(0xFFA8E6CF),
    'akrep': Color(0xFF8B5CF6),
    'yay': Color(0xFF9B59B6),
    'oglak': Color(0xFF2C3E50),
    'kova': Color(0xFF3498DB),
    'balik': Color(0xFF1ABC9C),
  };

  static const Map<String, Color> accentColors = {
    'koc': Color(0xFFFF8E8E),
    'boga': Color(0xFF66E5DB),
    'ikizler': Color(0xFFFFF099),
    'yengec': Color(0xFFFFAA6B),
    'aslan': Color(0xFFFFE699),
    'basak': Color(0xFFB8F3E8),
    'terazi': Color(0xFFC4F7E0),
    'akrep': Color(0xFFA78BFA),
    'yay': Color(0xFFBB86FC),
    'oglak': Color(0xFF546E7A),
    'kova': Color(0xFF64B5F6),
    'balik': Color(0xFF4ECDC4),
  };

  static Color getPrimaryColor(String zodiacName) {
    return primaryColors[zodiacName] ?? Color(0xFFFFB6C1);
  }

  static Color getAccentColor(String zodiacName) {
    return accentColors[zodiacName] ?? Color(0xFFFFD1DC);
  }

  static LinearGradient getGradient(String zodiacName) {
    final primary = getPrimaryColor(zodiacName);
    final accent = getAccentColor(zodiacName);
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [primary, accent],
    );
  }
}
