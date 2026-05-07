import 'package:flutter/material.dart';

class Sabitler {
  // Renkler
  static const MaterialColor anaRenk = Colors.indigo;
  static const Color acikGri = Color(0xFFF5F5F5);
  static const Color gri = Color(0xFFE0E0E0);
  static const Color koyu = Color(0xFF212121);
  static const Color beyaz = Color(0xFFFFFFFF);
  
  // Not renkleri
  static const Color notAABB = Color(0xFF4CAF50); // Yeşil
  static const Color notCB = Color(0xFFFFC107); // Turuncu
  static const Color notCC = Color(0xFFFF9800); // Turuncu-Kırmızı
  static const Color notFF = Color(0xFFF44336); // Kırmızı
  
  // Boyutlar
  static const double paddingLarge = 24.0;
  static const double paddingMedium = 16.0;
  static const double paddingSmall = 8.0;
  static const double borderRadiusValue = 16.0;
  static const double cardElevation = 4.0;
  
  // Metin Stilleri
  static const String baslikText = 'Ortalama Hesapla';
  static const double baslikFontSize = 28.0;
  static const double subtitleFontSize = 18.0;
  static const double bodyFontSize = 16.0;
  static const double smallFontSize = 14.0;
  
  // Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(borderRadiusValue);
  
  // Metinler
  static const String dersAdiHint = "Ders Adını Giriniz";
  static const String dersAdiValidasyon = "Ders adını giriniz";
  static const String dersSayisiLabel = "Ders sayısı";
  static const String ortalamaLabel = "Ortalama";
  static const String bosDersListesi = "Henüz ders eklenmemiş";
  
  // Not-Renk Eşleştirmesi
  static Color getNotRengi(double notDegeri) {
    if (notDegeri >= 3.5) return notAABB;
    if (notDegeri >= 2.5) return notCB;
    if (notDegeri >= 2.0) return notCC;
    return notFF;
  }
}