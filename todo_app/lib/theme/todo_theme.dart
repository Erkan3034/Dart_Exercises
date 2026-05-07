import 'package:flutter/material.dart';
import 'package:todo_app/constants/todo_constants.dart';

class TodoTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: TodoConstants.primaryColor,
      primaryColor: TodoConstants.primaryColor,
      scaffoldBackgroundColor: TodoConstants.backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: TodoConstants.primaryColor,
        foregroundColor: TodoConstants.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: TodoConstants.baslikFontSize,
          fontWeight: FontWeight.bold,
          color: TodoConstants.white,
        ),
      ),
      
      // Text Themes
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: TodoConstants.baslikFontSize,
          fontWeight: FontWeight.bold,
          color: TodoConstants.darkText,
        ),
        titleMedium: TextStyle(
          fontSize: TodoConstants.subtitleFontSize,
          fontWeight: FontWeight.w600,
          color: TodoConstants.darkText,
        ),
        bodyMedium: TextStyle(
          fontSize: TodoConstants.bodyFontSize,
          color: TodoConstants.darkText,
        ),
        bodySmall: TextStyle(
          fontSize: TodoConstants.smallFontSize,
          color: TodoConstants.lightText,
        ),
      ),
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: TodoConstants.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: TodoConstants.paddingMedium,
          vertical: TodoConstants.paddingSmall,
        ),
        border: OutlineInputBorder(
          borderRadius: TodoConstants.borderRadius,
          borderSide: BorderSide(color: TodoConstants.accentColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: TodoConstants.borderRadius,
          borderSide: BorderSide(color: TodoConstants.accentColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: TodoConstants.borderRadius,
          borderSide: BorderSide(color: TodoConstants.darkGreen, width: 2),
        ),
        hintStyle: TextStyle(
          color: Color(0xFFBDBDBD),
          fontSize: TodoConstants.bodyFontSize,
        ),
      ),
      
      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: TodoConstants.primaryColor,
          foregroundColor: TodoConstants.white,
          padding: EdgeInsets.symmetric(
            horizontal: TodoConstants.paddingMedium,
            vertical: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: TodoConstants.borderRadius,
          ),
          elevation: 2,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        elevation: TodoConstants.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: TodoConstants.borderRadius,
        ),
        color: TodoConstants.white,
      ),
      
      // FloatingActionButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: TodoConstants.primaryColor,
        foregroundColor: TodoConstants.white,
        elevation: 4,
      ),
      
      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: TodoConstants.accentColor.withOpacity(0.15),
        titleTextStyle: TextStyle(
          fontSize: TodoConstants.subtitleFontSize,
          fontWeight: FontWeight.bold,
          color: TodoConstants.darkGreen,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: TodoConstants.borderRadius,
        ),
      ),
    );
  }
}
