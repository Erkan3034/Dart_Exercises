import 'package:flutter/material.dart';

class TodoConstants {
  // Renkler - Yeşil tema
  static const MaterialColor primaryColor = Colors.green;
  static const Color accentColor = Color(0xFF66BB6A); // Açık yeşil
  static const Color darkGreen = Color(0xFF2E7D32); // Koyu yeşil
  static const Color backgroundColor = Color(0xFFF1F8E9); // Çok açık yeşil
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF212121);
  static const Color lightText = Color(0xFF757575);
  
  // Görev Durumu Renkleri
  static const Color completedColor = Color(0xFFA5D6A7); // Açık yeşil (tamamlanmış)
  static const Color pendingColor = Color(0xFFFFF9C4); // Sarı (beklemede)
  static const Color deleteColor = Color(0xFFEF5350); // Kırmızı (silme)
  
  // Boyutlar
  static const double paddingLarge = 24.0;
  static const double paddingMedium = 16.0;
  static const double paddingSmall = 8.0;
  static const double borderRadiusValue = 12.0;
  static const double cardElevation = 3.0;
  
  // Metin Stilleri
  static const String appTitle = 'My Todo App';
  static const String emptyMessage = 'Henüz görev yok!';
  static const String emptySubtitle = 'Yeni görev eklemek için + butonuna basın';
  static const double baslikFontSize = 24.0;
  static const double subtitleFontSize = 16.0;
  static const double bodyFontSize = 15.0;
  static const double smallFontSize = 12.0;
  
  // Border Radius
  static BorderRadius borderRadius = BorderRadius.circular(borderRadiusValue);
  
  // Metinler
  static const String createTaskTitle = 'Yeni Görev Oluştur';
  static const String taskHint = 'Görevinizi yazınız...';
  static const String saveButton = 'Kaydet';
  static const String cancelButton = 'İptal';
  static const String tasksLabel = 'Görevlerim';
}
