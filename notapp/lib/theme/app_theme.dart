import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Sabitler.anaRenk,
      scaffoldBackgroundColor: Sabitler.acikGri,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: Sabitler.anaRenk,
        foregroundColor: Sabitler.beyaz,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: Sabitler.baslikFontSize,
          fontWeight: FontWeight.bold,
          color: Sabitler.beyaz,
        ),
      ),
      
      // Text Themes
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: Sabitler.baslikFontSize,
          fontWeight: FontWeight.bold,
          color: Sabitler.koyu,
        ),
        titleMedium: TextStyle(
          fontSize: Sabitler.subtitleFontSize,
          fontWeight: FontWeight.w600,
          color: Sabitler.koyu,
        ),
        bodyMedium: TextStyle(
          fontSize: Sabitler.bodyFontSize,
          color: Sabitler.koyu,
        ),
        bodySmall: TextStyle(
          fontSize: Sabitler.smallFontSize,
          color: Color(0xFF757575),
        ),
      ),
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Sabitler.beyaz,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Sabitler.paddingMedium,
          vertical: Sabitler.paddingSmall,
        ),
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide(color: Sabitler.gri),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide(color: Sabitler.gri),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide(color: Sabitler.anaRenk, width: 2),
        ),
        hintStyle: TextStyle(
          color: Color(0xFFBDBDBD),
          fontSize: Sabitler.bodyFontSize,
        ),
      ),
      
      // Dropdown
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Sabitler.beyaz,
          border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius,
            borderSide: BorderSide(color: Sabitler.gri),
          ),
        ),
      ),
      
      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Sabitler.anaRenk,
          foregroundColor: Sabitler.beyaz,
          padding: EdgeInsets.symmetric(
            horizontal: Sabitler.paddingMedium,
            vertical: Sabitler.paddingSmall,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: Sabitler.borderRadius,
          ),
          elevation: 2,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        elevation: Sabitler.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: Sabitler.borderRadius,
        ),
        color: Sabitler.beyaz,
      ),
      
      // FloatingActionButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Sabitler.anaRenk,
        foregroundColor: Sabitler.beyaz,
        elevation: 4,
      ),
    );
  }
}
