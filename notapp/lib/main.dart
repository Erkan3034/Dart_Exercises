import 'package:flutter/material.dart';
import 'package:notapp/theme/app_theme.dart';
import 'package:notapp/widgets/ortalama_hesaplama_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Not Uygulaması',
      theme: AppTheme.lightTheme(),
      home: const OrtalamaHesaplamaPage(),
    );
  }
}
  
